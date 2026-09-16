from __future__ import annotations

import ctypes
import hashlib
import json
import os
from pathlib import Path
import random
import re
import struct
import subprocess
import threading
import time
from typing import Iterable, Sequence


class ProcessFailure(RuntimeError):
    pass


class _FILETIME(ctypes.Structure):
    _fields_ = [("low", ctypes.c_uint32), ("high", ctypes.c_uint32)]


class _PROCESS_MEMORY_COUNTERS(ctypes.Structure):
    _fields_ = [
        ("cb", ctypes.c_uint32),
        ("PageFaultCount", ctypes.c_uint32),
        ("PeakWorkingSetSize", ctypes.c_size_t),
        ("WorkingSetSize", ctypes.c_size_t),
        ("QuotaPeakPagedPoolUsage", ctypes.c_size_t),
        ("QuotaPagedPoolUsage", ctypes.c_size_t),
        ("QuotaPeakNonPagedPoolUsage", ctypes.c_size_t),
        ("QuotaNonPagedPoolUsage", ctypes.c_size_t),
        ("PagefileUsage", ctypes.c_size_t),
        ("PeakPagefileUsage", ctypes.c_size_t),
    ]


def _filetime_seconds(value: _FILETIME) -> float:
    return ((value.high << 32) | value.low) / 10_000_000.0


def current_process_peak_rss_bytes() -> int:
    """Return the OS-reported lifetime PeakWorkingSetSize for this process."""
    if os.name != "nt":
        return 0
    counters = _PROCESS_MEMORY_COUNTERS()
    counters.cb = ctypes.sizeof(counters)
    get_current_process = ctypes.windll.kernel32.GetCurrentProcess
    get_current_process.restype = ctypes.c_void_p
    get_process_memory_info = ctypes.windll.psapi.GetProcessMemoryInfo
    get_process_memory_info.argtypes = [
        ctypes.c_void_p,
        ctypes.POINTER(_PROCESS_MEMORY_COUNTERS),
        ctypes.c_uint32,
    ]
    get_process_memory_info.restype = ctypes.c_int
    handle = get_current_process()
    if not get_process_memory_info(handle, ctypes.byref(counters), counters.cb):
        raise ProcessFailure("GetProcessMemoryInfo failed for the Python driver")
    return int(counters.PeakWorkingSetSize)


def run_monitored(
    command: Sequence[str],
    cwd: Path,
    *,
    input_bytes: bytes | None = None,
    timeout: float = 300.0,
    env: dict[str, str] | None = None,
    check: bool = True,
) -> dict:
    started_wall = time.perf_counter()
    process = subprocess.Popen(
        list(map(str, command)),
        cwd=str(cwd),
        stdin=subprocess.PIPE if input_bytes is not None else subprocess.DEVNULL,
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE,
        env=env,
    )
    result: dict[str, bytes] = {}

    def communicate() -> None:
        out, err = process.communicate(input=input_bytes)
        result["stdout"] = out
        result["stderr"] = err

    worker = threading.Thread(target=communicate, daemon=True)
    worker.start()
    peak_rss = 0
    timed_out = False
    psapi = ctypes.windll.psapi if os.name == "nt" else None
    while worker.is_alive():
        if os.name == "nt":
            counters = _PROCESS_MEMORY_COUNTERS()
            counters.cb = ctypes.sizeof(counters)
            if psapi.GetProcessMemoryInfo(int(process._handle), ctypes.byref(counters), counters.cb):
                peak_rss = max(peak_rss, int(counters.PeakWorkingSetSize))
        if time.perf_counter() - started_wall > timeout:
            timed_out = True
            if os.name == "nt":
                subprocess.run(
                    ["taskkill.exe", "/PID", str(process.pid), "/T", "/F"],
                    stdout=subprocess.DEVNULL,
                    stderr=subprocess.DEVNULL,
                    check=False,
                )
            else:
                process.kill()
            break
        time.sleep(0.02)
    worker.join(timeout=15)
    if worker.is_alive():
        if os.name == "nt":
            subprocess.run(
                ["taskkill.exe", "/PID", str(process.pid), "/T", "/F"],
                stdout=subprocess.DEVNULL,
                stderr=subprocess.DEVNULL,
                check=False,
            )
        else:
            process.kill()
        worker.join(timeout=15)
    if worker.is_alive():
        raise ProcessFailure(f"process tree retained I/O handles after hard timeout: {command}")

    cpu_seconds = None
    if os.name == "nt":
        creation = _FILETIME()
        exit_time = _FILETIME()
        kernel = _FILETIME()
        user = _FILETIME()
        if ctypes.windll.kernel32.GetProcessTimes(
            int(process._handle),
            ctypes.byref(creation),
            ctypes.byref(exit_time),
            ctypes.byref(kernel),
            ctypes.byref(user),
        ):
            cpu_seconds = _filetime_seconds(kernel) + _filetime_seconds(user)

    record = {
        "command": list(map(str, command)),
        "cwd": str(cwd),
        "exit_code": int(process.returncode),
        "timed_out": timed_out,
        "wall_seconds": time.perf_counter() - started_wall,
        "child_cpu_seconds": cpu_seconds,
        "peak_rss_bytes": peak_rss,
        "stdout": result.get("stdout", b""),
        "stderr": result.get("stderr", b""),
    }
    if check and (process.returncode != 0 or timed_out):
        tail = record["stderr"].decode("utf-8", "replace")[-4000:]
        raise ProcessFailure(
            f"command failed exit={process.returncode} timeout={timed_out}: {command}\n{tail}"
        )
    return record


def git_run(
    git: Path,
    repo: Path,
    args: Sequence[str],
    *,
    input_bytes: bytes | None = None,
    timeout: float = 300.0,
    check: bool = True,
) -> dict:
    env = os.environ.copy()
    env["GIT_TERMINAL_PROMPT"] = "0"
    env["GCM_INTERACTIVE"] = "Never"
    env["GIT_CONFIG_NOSYSTEM"] = "1"
    return run_monitored(
        [str(git), *args], repo, input_bytes=input_bytes, timeout=timeout, env=env, check=check
    )


def git_text(git: Path, repo: Path, args: Sequence[str], *, timeout: float = 300.0) -> str:
    return git_run(git, repo, args, timeout=timeout)["stdout"].decode("utf-8", "replace")


def sha256_bytes(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest().upper()


def sha256_file(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as handle:
        for chunk in iter(lambda: handle.read(1024 * 1024), b""):
            digest.update(chunk)
    return digest.hexdigest().upper()


def directory_bytes(path: Path) -> int:
    total = 0
    for item in path.rglob("*"):
        if item.is_file():
            total += item.stat().st_size
    return total


def write_json(path: Path, value: object) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    temp = path.with_suffix(path.suffix + ".tmp")
    temp.write_text(json.dumps(value, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    temp.replace(path)


def read_batch_objects(git: Path, repo: Path, object_ids: Sequence[str]) -> dict[str, dict]:
    batch = run_monitored(
        [str(git), "cat-file", "--batch"],
        repo,
        input_bytes=("\n".join(object_ids) + "\n").encode("ascii"),
        timeout=300,
    )
    stream = memoryview(batch["stdout"])
    cursor = 0
    result: dict[str, dict] = {}
    for requested in object_ids:
        newline = batch["stdout"].find(b"\n", cursor)
        if newline < 0:
            raise ProcessFailure(f"cat-file missing header for {requested}")
        header = bytes(stream[cursor:newline]).decode("ascii", "replace").strip()
        cursor = newline + 1
        parts = header.split()
        if len(parts) != 3 or parts[1] == "missing":
            raise ProcessFailure(f"cat-file missing/corrupt header for {requested}: {header}")
        oid, object_type, size_text = parts
        size = int(size_text)
        content = bytes(stream[cursor : cursor + size])
        cursor += size
        trailer = bytes(stream[cursor : cursor + 1])
        cursor += 1
        if len(content) != size or trailer != b"\n":
            raise ProcessFailure(f"cat-file short read for {requested}")
        result[requested] = {"oid": oid, "type": object_type, "size": size, "content": content}
    if cursor != len(batch["stdout"]):
        raise ProcessFailure(f"cat-file trailing bytes: {len(batch['stdout']) - cursor}")
    return result


def batch_access_timing(git: Path, repo: Path, object_ids: Sequence[str]) -> dict:
    process = subprocess.Popen(
        [str(git), "cat-file", "--batch"],
        cwd=str(repo),
        stdin=subprocess.PIPE,
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE,
    )
    assert process.stdin and process.stdout

    def one_pass() -> tuple[float, int]:
        started = time.perf_counter()
        total = 0
        for oid in object_ids:
            process.stdin.write((oid + "\n").encode("ascii"))
            process.stdin.flush()
            header = process.stdout.readline().decode("ascii", "replace").strip()
            parts = header.split()
            if len(parts) != 3:
                raise ProcessFailure(f"bad access header {header}")
            size = int(parts[2])
            data = process.stdout.read(size)
            trailer = process.stdout.read(1)
            if len(data) != size or trailer != b"\n":
                raise ProcessFailure("short access read")
            total += size
        return time.perf_counter() - started, total

    cold_seconds, cold_bytes = one_pass()
    warm_seconds, warm_bytes = one_pass()
    process.stdin.close()
    process.terminate()
    process.wait(timeout=10)
    return {
        "object_count": len(object_ids),
        "cold_process_seconds": cold_seconds,
        "warm_same_process_seconds": warm_seconds,
        "cold_bytes": cold_bytes,
        "warm_bytes": warm_bytes,
    }


def encode_pack_object_header(type_code: int, size: int) -> bytes:
    first = ((type_code & 7) << 4) | (size & 0x0F)
    size >>= 4
    output = bytearray()
    while size:
        output.append(first | 0x80)
        first = size & 0x7F
        size >>= 7
    output.append(first)
    return bytes(output)


def _encode_delta_size(size: int) -> bytes:
    output = bytearray()
    while True:
        byte = size & 0x7F
        size >>= 7
        if size:
            byte |= 0x80
        output.append(byte)
        if not size:
            break
    return bytes(output)


def _copy_instruction(offset: int, size: int) -> bytes:
    if size == 0x10000:
        encoded_size = 0
    else:
        encoded_size = size
    opcode = 0x80
    payload = bytearray()
    for index in range(4):
        byte = (offset >> (8 * index)) & 0xFF
        if byte:
            opcode |= 1 << index
            payload.append(byte)
    for index in range(3):
        byte = (encoded_size >> (8 * index)) & 0xFF
        if byte:
            opcode |= 1 << (4 + index)
            payload.append(byte)
    return bytes([opcode]) + bytes(payload)


def make_delta(base: bytes, target: bytes, block: int = 16) -> bytes:
    """Legacy Git-format control codec; retained only for the frozen non-claim run."""
    index: dict[bytes, list[int]] = {}
    if len(base) >= block:
        for offset in range(0, len(base) - block + 1, block):
            key = base[offset : offset + block]
            positions = index.setdefault(key, [])
            if len(positions) < 4:
                positions.append(offset)

    instructions = bytearray()
    literal = bytearray()

    def flush_literal() -> None:
        nonlocal literal
        start = 0
        while start < len(literal):
            take = min(127, len(literal) - start)
            instructions.append(take)
            instructions.extend(literal[start : start + take])
            start += take
        literal = bytearray()

    cursor = 0
    while cursor < len(target):
        best_offset = -1
        best_length = 0
        if cursor + block <= len(target):
            key = target[cursor : cursor + block]
            for base_offset in index.get(key, []):
                length = block
                while (
                    cursor + length < len(target)
                    and base_offset + length < len(base)
                    and target[cursor + length] == base[base_offset + length]
                ):
                    length += 1
                if length > best_length:
                    best_offset, best_length = base_offset, length
        if best_length >= block:
            flush_literal()
            consumed = 0
            while consumed < best_length:
                take = min(0x10000, best_length - consumed)
                instructions.extend(_copy_instruction(best_offset + consumed, take))
                consumed += take
            cursor += best_length
        else:
            literal.append(target[cursor])
            cursor += 1
            if len(literal) == 127:
                flush_literal()
    flush_literal()
    return _encode_delta_size(len(base)) + _encode_delta_size(len(target)) + bytes(instructions)


_GIT_RABIN_TABLES: tuple[tuple[int, ...], tuple[int, ...]] | None = None
_GIT_ZLIB: ctypes.CDLL | None = None


def _git_2_55_zlib() -> ctypes.CDLL:
    global _GIT_ZLIB
    if _GIT_ZLIB is not None:
        return _GIT_ZLIB
    library_path = (
        Path(__file__).resolve().parents[1]
        / "tools"
        / "mingit-2.55.0"
        / "mingw64"
        / "bin"
        / "zlib1.dll"
    )
    library = ctypes.CDLL(str(library_path))
    library.zlibVersion.restype = ctypes.c_char_p
    library.compressBound.argtypes = [ctypes.c_ulong]
    library.compressBound.restype = ctypes.c_ulong
    library.compress2.argtypes = [
        ctypes.c_void_p,
        ctypes.POINTER(ctypes.c_ulong),
        ctypes.c_void_p,
        ctypes.c_ulong,
        ctypes.c_int,
    ]
    library.compress2.restype = ctypes.c_int
    version = library.zlibVersion().decode("ascii")
    if version != "1.3.2":
        raise ProcessFailure(f"Git zlib freeze mismatch: {version}")
    _GIT_ZLIB = library
    return library


def git_native_zlib_version() -> str:
    return _git_2_55_zlib().zlibVersion().decode("ascii")


def git_native_zlib_compress(data: bytes, level: int = 6) -> bytes:
    """Compress with the exact zlib1.dll shipped in the frozen Git 2.55 toolchain."""
    library = _git_2_55_zlib()
    source = ctypes.create_string_buffer(data, len(data)) if data else ctypes.create_string_buffer(1)
    bound = int(library.compressBound(len(data)))
    destination = ctypes.create_string_buffer(bound)
    destination_length = ctypes.c_ulong(bound)
    result = library.compress2(
        destination,
        ctypes.byref(destination_length),
        source,
        len(data),
        level,
    )
    if result != 0:
        raise ProcessFailure(f"Git zlib compress2 failed: {result}")
    return destination.raw[: destination_length.value]


def _git_2_55_rabin_tables() -> tuple[tuple[int, ...], tuple[int, ...]]:
    """Load the exact tables from the frozen, hash-locked Git v2.55.0 source."""
    global _GIT_RABIN_TABLES
    if _GIT_RABIN_TABLES is not None:
        return _GIT_RABIN_TABLES
    source = (
        Path(__file__).resolve().parents[1]
        / "tools"
        / "git-source-v2.55.0"
        / "diff-delta.c"
    )
    text = source.read_text(encoding="utf-8")
    tables: list[tuple[int, ...]] = []
    for name in ("T", "U"):
        match = re.search(
            rf"static const unsigned int {name}\[256\] = \{{(.*?)\n\}};",
            text,
            re.DOTALL,
        )
        if not match:
            raise ProcessFailure(f"missing Git 2.55 Rabin table {name}: {source}")
        values = tuple(int(value, 16) for value in re.findall(r"0x[0-9a-fA-F]+", match.group(1)))
        if len(values) != 256:
            raise ProcessFailure(f"Git 2.55 Rabin table {name} has {len(values)} entries")
        tables.append(values)
    _GIT_RABIN_TABLES = (tables[0], tables[1])
    return _GIT_RABIN_TABLES


def make_git_2_55_delta(base: bytes, target: bytes) -> bytes:
    """Semantic port of Git v2.55.0 diff-delta.c:create_delta().

    The opcode stream, Rabin window, bucket order/culling, backward extension,
    and 64-KiB copy splitting follow Git commit
    e9019fcafe0040228b8631c30f97ae1adb61bcdc.  The frozen source tables are
    parsed rather than regenerated, making source drift fail closed.
    """
    if not base or not target:
        raise ValueError("Git create_delta requires non-empty base and target")
    T, U = _git_2_55_rabin_tables()
    rabin_window = 16
    rabin_shift = 23
    hash_limit = 64

    entry_count = (len(base) - 1) // rabin_window
    hsize_target = entry_count // 4
    shift = 4
    while (1 << shift) < hsize_target:
        shift += 1
    hsize = 1 << shift
    hmask = hsize - 1
    buckets: list[list[list[int]]] = [[] for _ in range(hsize)]
    previous_value = 0xFFFFFFFF
    previous_entry: list[int] | None = None
    data_offset = entry_count * rabin_window - rabin_window
    retained_count = entry_count
    while data_offset >= 0:
        value = 0
        for index in range(1, rabin_window + 1):
            value = ((((value << 8) | base[data_offset + index]) & 0xFFFFFFFF)
                     ^ T[value >> rabin_shift]) & 0xFFFFFFFF
        if value == previous_value:
            if previous_entry is None:
                raise ProcessFailure("Git delta index duplicate without prior entry")
            previous_entry[0] = data_offset + rabin_window
            retained_count -= 1
        else:
            previous_value = value
            previous_entry = [data_offset + rabin_window, value]
            buckets[value & hmask].insert(0, previous_entry)
        data_offset -= rabin_window

    for bucket_index, bucket in enumerate(buckets):
        count = len(bucket)
        if count <= hash_limit:
            continue
        retained_count -= count - hash_limit
        deleted: set[int] = set()
        cursor = 0
        accumulator = 0
        while cursor < count:
            accumulator += count - hash_limit
            if accumulator > 0:
                while accumulator > 0:
                    cursor += 1
                    accumulator -= hash_limit
                if cursor >= count:
                    raise ProcessFailure("Git delta index culling invariant failed")
                deleted.add(cursor)
            cursor += 1
        buckets[bucket_index] = [entry for index, entry in enumerate(bucket) if index not in deleted]
        if len(buckets[bucket_index]) != hash_limit:
            raise ProcessFailure("Git delta index did not retain HASH_LIMIT entries")
    if sum(map(len, buckets)) != retained_count:
        raise ProcessFailure("Git delta index retained-entry accounting mismatch")

    output = bytearray(max(8192, len(target) * 2 + 64))
    outpos = 0

    def emit(value: int) -> None:
        nonlocal outpos, output
        if outpos >= len(output):
            output.extend(b"\0" * max(8192, len(output) // 2))
        output[outpos] = value & 0xFF
        outpos += 1

    for size in (len(base), len(target)):
        value = size
        while value >= 0x80:
            emit(value | 0x80)
            value >>= 7
        emit(value)

    data = 0
    outpos += 1
    value = 0
    initial_count = 0
    while initial_count < rabin_window and data < len(target):
        emit(target[data])
        value = ((((value << 8) | target[data]) & 0xFFFFFFFF)
                 ^ T[value >> rabin_shift]) & 0xFFFFFFFF
        initial_count += 1
        data += 1
    insertion_count = initial_count
    match_offset = 0
    match_size = 0

    while data < len(target):
        if match_size < 4096:
            value ^= U[target[data - rabin_window]]
            value = ((((value << 8) | target[data]) & 0xFFFFFFFF)
                     ^ T[value >> rabin_shift]) & 0xFFFFFFFF
            for reference_offset, entry_value in buckets[value & hmask]:
                if entry_value != value:
                    continue
                reference_size = min(len(base) - reference_offset, len(target) - data)
                if reference_size <= match_size:
                    break
                length = 0
                while (
                    length < reference_size
                    and target[data + length] == base[reference_offset + length]
                ):
                    length += 1
                if match_size < length:
                    match_size = length
                    match_offset = reference_offset
                    if match_size >= 4096:
                        break

        if match_size < 4:
            if insertion_count == 0:
                outpos += 1
            emit(target[data])
            data += 1
            insertion_count += 1
            if insertion_count == 0x7F:
                output[outpos - insertion_count - 1] = insertion_count
                insertion_count = 0
            match_size = 0
        else:
            if insertion_count:
                while (
                    match_offset
                    and base[match_offset - 1] == target[data - 1]
                ):
                    match_size += 1
                    match_offset -= 1
                    data -= 1
                    outpos -= 1
                    insertion_count -= 1
                    if insertion_count:
                        continue
                    outpos -= 1
                    insertion_count = -1
                    break
                output[outpos - insertion_count - 1] = insertion_count & 0xFF
                insertion_count = 0

            left = 0 if match_size < 0x10000 else match_size - 0x10000
            match_size -= left
            opcode_position = outpos
            emit(0)
            opcode = 0x80
            for index in range(4):
                byte = (match_offset >> (8 * index)) & 0xFF
                if byte:
                    emit(byte)
                    opcode |= 1 << index
            for index in range(2):
                byte = (match_size >> (8 * index)) & 0xFF
                if byte:
                    emit(byte)
                    opcode |= 1 << (4 + index)
            output[opcode_position] = opcode
            data += match_size
            match_offset += match_size
            match_size = left
            if match_offset > 0xFFFFFFFF:
                match_size = 0
            if match_size < 4096:
                value = 0
                for index in range(-rabin_window, 0):
                    value = ((((value << 8) | target[data + index]) & 0xFFFFFFFF)
                             ^ T[value >> rabin_shift]) & 0xFFFFFFFF

    if insertion_count:
        output[outpos - insertion_count - 1] = insertion_count & 0xFF
    return bytes(output[:outpos])


def custom_pack_bytes(
    ordered_oids: Sequence[str],
    objects: dict[str, dict],
    parents: dict[str, str | None],
    *,
    compression_level: int = 6,
) -> tuple[bytes, dict[str, dict]]:
    header = b"PACK" + struct.pack(">II", 2, len(ordered_oids))
    body = bytearray()
    offsets: dict[str, int] = {}
    entries: dict[str, dict] = {}
    type_codes = {"commit": 1, "tree": 2, "blob": 3, "tag": 4}
    for oid in ordered_oids:
        obj = objects[oid]
        parent = parents.get(oid)
        offset = len(header) + len(body)
        offsets[oid] = offset
        if parent is None:
            raw = obj["content"]
            entry_header = encode_pack_object_header(type_codes[obj["type"]], len(raw))
            base_header = b""
        else:
            raw = make_git_2_55_delta(objects[parent]["content"], obj["content"])
            entry_header = encode_pack_object_header(7, len(raw))
            base_header = bytes.fromhex(parent)
        compressed = git_native_zlib_compress(raw, compression_level)
        body.extend(entry_header)
        body.extend(base_header)
        body.extend(compressed)
        entries[oid] = {
            "offset": offset,
            "entry_bytes": len(entry_header) + len(base_header) + len(compressed),
            "parent": parent,
            "representation_bytes": len(raw),
        }
    pack_without_checksum = header + bytes(body)
    checksum = hashlib.sha1(pack_without_checksum).digest()
    return pack_without_checksum + checksum, entries


def reconstruction_span(entries: dict[str, dict]) -> dict:
    total = 0
    maximum = 0
    edge_count = 0
    for oid, entry in entries.items():
        parent = entry.get("parent")
        if parent:
            span = abs(entry["offset"] - entries[parent]["offset"])
            total += span
            maximum = max(maximum, span)
            edge_count += 1
    return {
        "edge_count": edge_count,
        "total_parent_child_offset_span_bytes": total,
        "mean_parent_child_offset_span_bytes": total / edge_count if edge_count else 0,
        "maximum_parent_child_offset_span_bytes": maximum,
    }


def deterministic_sample(values: Iterable[str], count: int, seed_text: str) -> list[str]:
    values = sorted(set(values))
    randomizer = random.Random(int(hashlib.sha256(seed_text.encode()).hexdigest()[:16], 16))
    randomizer.shuffle(values)
    return values[: min(count, len(values))]
