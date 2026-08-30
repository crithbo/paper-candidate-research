#!/usr/bin/env python3
"""Native LLVM bitstream fidelity laboratory.

This is deliberately a trace-level native bitstream parser/writer, not an
external compressor.  It expands application abbreviations into ordered
(block, record-code, values, optional-blob) events and can re-emit that exact
semantic trace using only native LLVM bitstream constructs.
"""

from __future__ import annotations

import argparse
import base64
import hashlib
import json
import math
import pathlib
import sys
from dataclasses import dataclass, field
from typing import Any, Iterable, Optional


END_BLOCK = 0
ENTER_SUBBLOCK = 1
DEFINE_ABBREV = 2
UNABBREV_RECORD = 3
FIRST_APPLICATION_ABBREV = 4
BLOCKINFO_BLOCK_ID = 0
BLOCKINFO_CODE_SETBID = 1

FIXED = 1
VBR = 2
ARRAY = 3
CHAR6 = 4
BLOB = 5


class FormatError(RuntimeError):
    pass


@dataclass(frozen=True)
class AbbrevOp:
    literal: Optional[int] = None
    encoding: Optional[int] = None
    data: Optional[int] = None

    def as_json(self) -> dict[str, int]:
        if self.literal is not None:
            return {"literal": self.literal}
        result = {"encoding": int(self.encoding)}
        if self.data is not None:
            result["data"] = self.data
        return result


@dataclass
class Abbrev:
    ops: list[AbbrevOp]

    def as_json(self) -> list[dict[str, int]]:
        return [op.as_json() for op in self.ops]


@dataclass
class Record:
    code: int
    values: list[int]
    blob: Optional[bytes]
    abbrev_id: int
    start_bit: int
    end_bit: int

    def semantic_json(self) -> dict[str, Any]:
        result: dict[str, Any] = {"record": self.code, "values": self.values}
        if self.blob is not None:
            result["blob_base64"] = base64.b64encode(self.blob).decode("ascii")
        return result


@dataclass
class Define:
    abbrev: Abbrev
    assigned_id: int
    start_bit: int
    end_bit: int
    blockinfo_target: Optional[int] = None


@dataclass
class Block:
    block_id: int
    code_width: int
    items: list[Any]
    inherited_abbrevs: list[Abbrev]
    start_bit: int
    content_start_bit: int
    content_end_bit: int
    declared_words: int

    def semantic_json(self) -> dict[str, Any]:
        return {
            "block": self.block_id,
            "items": [
                item.semantic_json()
                for item in self.items
                if isinstance(item, (Block, Record)) and not (
                    isinstance(item, Block) and item.block_id == BLOCKINFO_BLOCK_ID
                )
            ],
        }


class BitReader:
    def __init__(self, data: bytes, bitpos: int = 0):
        self.data = data
        self.bitpos = bitpos

    def read(self, width: int) -> int:
        if width < 0 or self.bitpos + width > len(self.data) * 8:
            raise FormatError(f"read past end at bit {self.bitpos} width {width}")
        if width == 0:
            return 0
        byte_start = self.bitpos >> 3
        shift = self.bitpos & 7
        byte_count = (shift + width + 7) >> 3
        raw = int.from_bytes(self.data[byte_start:byte_start + byte_count], "little")
        value = (raw >> shift) & ((1 << width) - 1)
        self.bitpos += width
        return value

    def vbr(self, width: int) -> int:
        if width < 2:
            raise FormatError(f"invalid VBR width {width}")
        payload_mask = (1 << (width - 1)) - 1
        continuation = 1 << (width - 1)
        result = 0
        shift = 0
        while True:
            piece = self.read(width)
            result |= (piece & payload_mask) << shift
            if not piece & continuation:
                return result
            shift += width - 1
            if shift >= 64:
                raise FormatError("unterminated or over-wide VBR")

    def align32(self) -> int:
        old = self.bitpos
        self.bitpos = (self.bitpos + 31) & ~31
        return self.bitpos - old


class BitWriter:
    def __init__(self):
        self.buf = bytearray()
        self.cur_value = 0
        self.cur_bit = 0
        self.events: list[dict[str, Any]] = []

    @property
    def bitpos(self) -> int:
        return len(self.buf) * 8 + self.cur_bit

    def emit(self, value: int, width: int) -> None:
        if width <= 0 or value < 0 or value >= (1 << width):
            raise FormatError(f"cannot emit value={value} width={width}")
        remaining = width
        consumed = 0
        while remaining:
            take = min(32 - self.cur_bit, remaining)
            mask = (1 << take) - 1
            self.cur_value |= ((value >> consumed) & mask) << self.cur_bit
            self.cur_bit += take
            consumed += take
            remaining -= take
            if self.cur_bit == 32:
                self.buf.extend(self.cur_value.to_bytes(4, "little"))
                self.cur_value = 0
                self.cur_bit = 0

    def vbr(self, value: int, width: int) -> None:
        if value < 0 or width < 2:
            raise FormatError(f"invalid VBR value={value} width={width}")
        threshold = 1 << (width - 1)
        payload = threshold - 1
        while value >= threshold:
            self.emit((value & payload) | threshold, width)
            value >>= width - 1
        self.emit(value, width)

    def align32(self) -> int:
        old = self.bitpos
        if self.cur_bit:
            self.buf.extend(self.cur_value.to_bytes(4, "little"))
            self.cur_value = 0
            self.cur_bit = 0
        return self.bitpos - old

    def append_aligned(self, data: bytes) -> None:
        if self.cur_bit or len(data) % 4:
            raise FormatError("raw append requires both sides word aligned")
        self.buf.extend(data)

    def bytes(self) -> bytes:
        self.align32()
        return bytes(self.buf)


def decode_char6(value: int) -> int:
    if value < 26:
        return ord("a") + value
    if value < 52:
        return ord("A") + value - 26
    if value < 62:
        return ord("0") + value - 52
    return ord(".") if value == 62 else ord("_")


def encode_char6(value: int) -> int:
    if ord("a") <= value <= ord("z"):
        return value - ord("a")
    if ord("A") <= value <= ord("Z"):
        return value - ord("A") + 26
    if ord("0") <= value <= ord("9"):
        return value - ord("0") + 52
    if value == ord("."):
        return 62
    if value == ord("_"):
        return 63
    raise FormatError(f"value {value} is not Char6 encodable")


def read_abbrev(reader: BitReader) -> Abbrev:
    count = reader.vbr(5)
    if count == 0:
        raise FormatError("empty abbreviation")
    ops: list[AbbrevOp] = []
    for _ in range(count):
        if reader.read(1):
            ops.append(AbbrevOp(literal=reader.vbr(8)))
            continue
        encoding = reader.read(3)
        if encoding not in (FIXED, VBR, ARRAY, CHAR6, BLOB):
            raise FormatError(f"invalid abbreviation encoding {encoding}")
        data = reader.vbr(5) if encoding in (FIXED, VBR) else None
        if encoding in (FIXED, VBR) and data == 0:
            ops.append(AbbrevOp(literal=0))
        else:
            ops.append(AbbrevOp(encoding=encoding, data=data))
    return Abbrev(ops)


def read_scalar(reader: BitReader, op: AbbrevOp) -> int:
    if op.literal is not None:
        return op.literal
    if op.encoding == FIXED:
        return reader.read(int(op.data))
    if op.encoding == VBR:
        return reader.vbr(int(op.data))
    if op.encoding == CHAR6:
        return decode_char6(reader.read(6))
    raise FormatError(f"non-scalar encoding {op.encoding}")


def read_record(reader: BitReader, abbrev_id: int, abbrevs: list[Abbrev]) -> Record:
    start = reader.bitpos
    if abbrev_id == UNABBREV_RECORD:
        code = reader.vbr(6)
        values = [reader.vbr(6) for _ in range(reader.vbr(6))]
        return Record(code, values, None, abbrev_id, start, reader.bitpos)
    index = abbrev_id - FIRST_APPLICATION_ABBREV
    if index < 0 or index >= len(abbrevs):
        raise FormatError(f"invalid abbreviation ID {abbrev_id} at bit {start}")
    ops = abbrevs[index].ops
    if not ops:
        raise FormatError("abbreviation has no record code")
    code = read_scalar(reader, ops[0])
    values: list[int] = []
    blob: Optional[bytes] = None
    i = 1
    while i < len(ops):
        op = ops[i]
        if op.literal is not None or op.encoding in (FIXED, VBR, CHAR6):
            values.append(read_scalar(reader, op))
            i += 1
            continue
        if op.encoding == ARRAY:
            if i + 1 != len(ops) - 1:
                raise FormatError("ARRAY is not followed by one terminal element encoding")
            count = reader.vbr(6)
            element = ops[i + 1]
            values.extend(read_scalar(reader, element) for _ in range(count))
            i += 2
            continue
        if op.encoding == BLOB:
            if i != len(ops) - 1:
                raise FormatError("BLOB is not terminal")
            count = reader.vbr(6)
            reader.align32()
            byte_pos = reader.bitpos // 8
            if byte_pos + count > len(reader.data):
                raise FormatError("blob ends past stream")
            blob = reader.data[byte_pos:byte_pos + count]
            reader.bitpos += ((count + 3) & ~3) * 8
            i += 1
            continue
        raise FormatError(f"unsupported encoding {op.encoding}")
    return Record(code, values, blob, abbrev_id, start, reader.bitpos)


class Parser:
    def __init__(self, data: bytes):
        if data[:4] != b"BC\xc0\xde":
            raise FormatError("only raw LLVM bitcode magic BC C0 DE is accepted")
        self.data = data
        self.reader = BitReader(data, 32)
        self.blockinfo: dict[int, list[Abbrev]] = {}
        self.accounting: list[dict[str, Any]] = []

    def parse(self) -> list[Block]:
        result: list[Block] = []
        while self.reader.bitpos < len(self.data) * 8:
            if all(b == 0 for b in self.data[(self.reader.bitpos + 7) // 8:]):
                break
            code_start = self.reader.bitpos
            code = self.reader.read(2)
            if code != ENTER_SUBBLOCK:
                raise FormatError(f"top-level code {code}, expected ENTER_SUBBLOCK at {code_start}")
            block_id = self.reader.vbr(8)
            result.append(self._parse_entered_block(block_id, 2, (), code_start))
        return result

    def _parse_entered_block(
        self, block_id: int, parent_width: int, path: tuple[int, ...], enter_start: int
    ) -> Block:
        width_start = self.reader.bitpos
        code_width = self.reader.vbr(4)
        pad = self.reader.align32()
        declared_words = self.reader.read(32)
        content_start = self.reader.bitpos
        declared_end = content_start + declared_words * 32
        self.accounting.append({
            "kind": "ENTER_SUBBLOCK_HEADER", "path": list(path + (block_id,)),
            "start_bit": enter_start, "end_bit": content_start,
            "parent_code_bits": parent_width, "code_width_vbr_start": width_start,
            "alignment_bits": pad, "declared_words": declared_words,
        })
        inherited = list(self.blockinfo.get(block_id, []))
        abbrevs = list(inherited)
        items: list[Any] = []
        current_bid: Optional[int] = None
        while True:
            if self.reader.bitpos >= declared_end:
                raise FormatError(
                    f"block {path + (block_id,)} reached declared end without END_BLOCK"
                )
            item_start = self.reader.bitpos
            code = self.reader.read(code_width)
            if code == END_BLOCK:
                pad = self.reader.align32()
                self.accounting.append({
                    "kind": "END_BLOCK", "path": list(path + (block_id,)),
                    "start_bit": item_start, "end_bit": self.reader.bitpos,
                    "alignment_bits": pad,
                })
                break
            if code == ENTER_SUBBLOCK:
                child_id = self.reader.vbr(8)
                items.append(self._parse_entered_block(
                    child_id, code_width, path + (block_id,), item_start
                ))
                continue
            if code == DEFINE_ABBREV:
                abbrev = read_abbrev(self.reader)
                if block_id == BLOCKINFO_BLOCK_ID:
                    if current_bid is None:
                        raise FormatError("BLOCKINFO DEFINE_ABBREV before SETBID")
                    target = self.blockinfo.setdefault(current_bid, [])
                    assigned = FIRST_APPLICATION_ABBREV + len(target)
                    target.append(abbrev)
                    definition = Define(abbrev, assigned, item_start, self.reader.bitpos, current_bid)
                else:
                    assigned = FIRST_APPLICATION_ABBREV + len(abbrevs)
                    abbrevs.append(abbrev)
                    definition = Define(abbrev, assigned, item_start, self.reader.bitpos)
                items.append(definition)
                self.accounting.append({
                    "kind": "DEFINE_ABBREV", "path": list(path + (block_id,)),
                    "start_bit": item_start, "end_bit": self.reader.bitpos,
                    "assigned_id": assigned, "blockinfo_target": definition.blockinfo_target,
                })
                continue
            record = read_record(self.reader, code, abbrevs)
            record.start_bit = item_start
            items.append(record)
            self.accounting.append({
                "kind": "RECORD", "path": list(path + (block_id,)),
                "start_bit": item_start, "end_bit": self.reader.bitpos,
                "record_code": record.code, "abbrev_id": code,
                "blob_bytes": len(record.blob) if record.blob is not None else 0,
            })
            if block_id == BLOCKINFO_BLOCK_ID and record.code == BLOCKINFO_CODE_SETBID:
                if len(record.values) != 1:
                    raise FormatError("BLOCKINFO SETBID must carry exactly one value")
                current_bid = record.values[0]
        content_end = self.reader.bitpos
        if content_end != declared_end:
            raise FormatError(
                f"block {path + (block_id,)} consumed to {content_end}, declared {declared_end}"
            )
        return Block(
            block_id, code_width, items, inherited, enter_start, content_start,
            content_end, declared_words,
        )


def semantic_document(blocks: list[Block]) -> dict[str, Any]:
    trace = [b.semantic_json() for b in blocks if b.block_id != BLOCKINFO_BLOCK_ID]
    encoded = json.dumps(trace, sort_keys=True, separators=(",", ":")).encode("utf-8")
    return {
        "schema": "llvm-expanded-semantic-block-record-trace-v1",
        "canonical_sha256": hashlib.sha256(encoded).hexdigest(),
        "trace": trace,
    }


def emit_abbrev(writer: BitWriter, width: int, abbrev: Abbrev) -> None:
    writer.emit(DEFINE_ABBREV, width)
    writer.vbr(len(abbrev.ops), 5)
    for op in abbrev.ops:
        writer.emit(1 if op.literal is not None else 0, 1)
        if op.literal is not None:
            writer.vbr(op.literal, 8)
            continue
        writer.emit(int(op.encoding), 3)
        if op.encoding in (FIXED, VBR):
            writer.vbr(int(op.data), 5)


def emit_scalar(writer: BitWriter, value: int, op: AbbrevOp) -> None:
    if op.literal is not None:
        if value != op.literal:
            raise FormatError(f"literal mismatch {value} != {op.literal}")
    elif op.encoding == FIXED:
        writer.emit(value, int(op.data))
    elif op.encoding == VBR:
        writer.vbr(value, int(op.data))
    elif op.encoding == CHAR6:
        writer.emit(encode_char6(value), 6)
    else:
        raise FormatError(f"cannot emit scalar encoding {op.encoding}")


def emit_record(writer: BitWriter, width: int, record: Record, abbrev_id: int,
                abbrev: Optional[Abbrev] = None) -> None:
    writer.emit(abbrev_id, width)
    if abbrev_id == UNABBREV_RECORD:
        if record.blob is not None:
            raise FormatError("blob record cannot use UNABBREV_RECORD")
        writer.vbr(record.code, 6)
        writer.vbr(len(record.values), 6)
        for value in record.values:
            writer.vbr(value, 6)
        return
    if abbrev is None:
        raise FormatError("abbreviated record missing abbreviation")
    values = [record.code] + list(record.values)
    value_index = 0
    op_index = 0
    while op_index < len(abbrev.ops):
        op = abbrev.ops[op_index]
        if op.encoding == BLOB:
            if record.blob is None:
                raise FormatError("blob abbreviation applied to non-blob record")
            writer.vbr(len(record.blob), 6)
            writer.align32()
            writer.buf.extend(record.blob)
            while len(writer.buf) & 3:
                writer.buf.append(0)
            op_index += 1
            continue
        if op.encoding == ARRAY:
            if op_index + 1 != len(abbrev.ops) - 1:
                raise FormatError("ARRAY must be followed by one terminal element encoding")
            element = abbrev.ops[op_index + 1]
            count = len(values) - value_index
            writer.vbr(count, 6)
            while value_index < len(values):
                emit_scalar(writer, values[value_index], element)
                value_index += 1
            op_index += 2
            continue
        if value_index >= len(values):
            raise FormatError("abbreviation consumes too many scalars")
        emit_scalar(writer, values[value_index], op)
        value_index += 1
        op_index += 1
    if value_index != len(values):
        raise FormatError("abbreviation did not consume every scalar")


def blob_abbrev(record: Record) -> Abbrev:
    return Abbrev(
        [AbbrevOp(literal=record.code)]
        + [AbbrevOp(encoding=VBR, data=6) for _ in record.values]
        + [AbbrevOp(encoding=BLOB)]
    )


def emit_block(parent: BitWriter, parent_width: int, block: Block) -> None:
    semantic_items = [
        x for x in block.items
        if not isinstance(x, Define)
        and not (isinstance(x, Block) and x.block_id == BLOCKINFO_BLOCK_ID)
    ]
    blob_records = [x for x in semantic_items if isinstance(x, Record) and x.blob is not None]
    definitions: list[Abbrev] = []
    blob_key_to_index: dict[str, int] = {}
    for record in blob_records:
        abbrev = blob_abbrev(record)
        key = json.dumps(abbrev.as_json(), sort_keys=True, separators=(",", ":"))
        if key not in blob_key_to_index:
            blob_key_to_index[key] = len(definitions)
            definitions.append(abbrev)
    code_width = max(2, math.ceil(math.log2(FIRST_APPLICATION_ABBREV + len(definitions))))

    child = BitWriter()
    for abbrev in definitions:
        emit_abbrev(child, code_width, abbrev)
    for item in semantic_items:
        if isinstance(item, Block):
            emit_block(child, code_width, item)
        elif isinstance(item, Record):
            if item.blob is None:
                emit_record(child, code_width, item, UNABBREV_RECORD)
            else:
                key = json.dumps(blob_abbrev(item).as_json(), sort_keys=True, separators=(",", ":"))
                index = blob_key_to_index[key]
                emit_record(
                    child, code_width, item, FIRST_APPLICATION_ABBREV + index,
                    definitions[index],
                )
        else:
            raise FormatError(f"unexpected semantic item {type(item)}")
    child.emit(END_BLOCK, code_width)
    child_bytes = child.bytes()

    parent.emit(ENTER_SUBBLOCK, parent_width)
    parent.vbr(block.block_id, 8)
    parent.vbr(code_width, 4)
    parent.align32()
    parent.emit(len(child_bytes) // 4, 32)
    parent.align32()
    parent.append_aligned(child_bytes)


def reemit_unabbrev(blocks: list[Block]) -> bytes:
    writer = BitWriter()
    writer.buf.extend(b"BC\xc0\xde")
    for block in blocks:
        if block.block_id != BLOCKINFO_BLOCK_ID:
            emit_block(writer, 2, block)
    return writer.bytes()


def emit_block_original(parent: BitWriter, parent_width: int, block: Block) -> None:
    """Re-emit the parsed native grammar, item order, and assignments exactly."""
    child = BitWriter()
    active = list(block.inherited_abbrevs)
    for item in block.items:
        if isinstance(item, Define):
            emit_abbrev(child, block.code_width, item.abbrev)
            if block.block_id != BLOCKINFO_BLOCK_ID:
                expected = FIRST_APPLICATION_ABBREV + len(active)
                if expected != item.assigned_id:
                    raise FormatError(
                        f"definition ID drift: expected {expected}, parsed {item.assigned_id}"
                    )
                active.append(item.abbrev)
        elif isinstance(item, Block):
            emit_block_original(child, block.code_width, item)
        elif isinstance(item, Record):
            abbrev = None
            if item.abbrev_id != UNABBREV_RECORD:
                index = item.abbrev_id - FIRST_APPLICATION_ABBREV
                if index < 0 or index >= len(active):
                    raise FormatError(f"record uses unavailable abbreviation {item.abbrev_id}")
                abbrev = active[index]
            emit_record(child, block.code_width, item, item.abbrev_id, abbrev)
        else:
            raise FormatError(f"unexpected parsed item {type(item)}")
    child.emit(END_BLOCK, block.code_width)
    child_bytes = child.bytes()
    if len(child_bytes) // 4 != block.declared_words:
        raise FormatError(
            f"identity block {block.block_id} size drift: "
            f"{len(child_bytes)//4} != {block.declared_words} words"
        )

    parent.emit(ENTER_SUBBLOCK, parent_width)
    parent.vbr(block.block_id, 8)
    parent.vbr(block.code_width, 4)
    parent.align32()
    parent.emit(len(child_bytes) // 4, 32)
    parent.align32()
    parent.append_aligned(child_bytes)


def reemit_original(blocks: list[Block]) -> bytes:
    writer = BitWriter()
    writer.buf.extend(b"BC\xc0\xde")
    for block in blocks:
        emit_block_original(writer, 2, block)
    return writer.bytes()


def parse_file(path: pathlib.Path) -> tuple[Parser, list[Block]]:
    parser = Parser(path.read_bytes())
    return parser, parser.parse()


def write_json(path: pathlib.Path, value: Any) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(json.dumps(value, indent=2, sort_keys=True) + "\n", encoding="utf-8")


def main(argv: Optional[list[str]] = None) -> int:
    ap = argparse.ArgumentParser()
    sub = ap.add_subparsers(dest="command", required=True)
    expand = sub.add_parser("expand")
    expand.add_argument("input", type=pathlib.Path)
    expand.add_argument("-o", "--output", required=True, type=pathlib.Path)
    expand.add_argument("--accounting", type=pathlib.Path)
    rewrite = sub.add_parser("rewrite-unabbrev")
    rewrite.add_argument("input", type=pathlib.Path)
    rewrite.add_argument("-o", "--output", required=True, type=pathlib.Path)
    identity = sub.add_parser("rewrite-original")
    identity.add_argument("input", type=pathlib.Path)
    identity.add_argument("-o", "--output", required=True, type=pathlib.Path)
    compare = sub.add_parser("compare")
    compare.add_argument("left", type=pathlib.Path)
    compare.add_argument("right", type=pathlib.Path)
    args = ap.parse_args(argv)

    if args.command == "expand":
        parser, blocks = parse_file(args.input)
        document = semantic_document(blocks)
        write_json(args.output, document)
        if args.accounting:
            write_json(args.accounting, {
                "schema": "llvm-native-bit-accounting-v1",
                "file_bytes": len(parser.data),
                "events": parser.accounting,
            })
        print(document["canonical_sha256"])
        return 0
    if args.command == "rewrite-unabbrev":
        _, blocks = parse_file(args.input)
        output = reemit_unabbrev(blocks)
        args.output.parent.mkdir(parents=True, exist_ok=True)
        args.output.write_bytes(output)
        reparsed = Parser(output)
        reparsed_blocks = reparsed.parse()
        before = semantic_document(blocks)["canonical_sha256"]
        after = semantic_document(reparsed_blocks)["canonical_sha256"]
        print(json.dumps({
            "before_trace_sha256": before,
            "after_trace_sha256": after,
            "equal": before == after,
            "input_bytes": args.input.stat().st_size,
            "output_bytes": len(output),
            "output_sha256": hashlib.sha256(output).hexdigest(),
        }, sort_keys=True))
        return 0 if before == after else 2
    if args.command == "rewrite-original":
        _, blocks = parse_file(args.input)
        output = reemit_original(blocks)
        args.output.parent.mkdir(parents=True, exist_ok=True)
        args.output.write_bytes(output)
        original = args.input.read_bytes()
        print(json.dumps({
            "byte_equal": original == output,
            "input_sha256": hashlib.sha256(original).hexdigest(),
            "output_sha256": hashlib.sha256(output).hexdigest(),
            "bytes": len(output),
        }, sort_keys=True))
        return 0 if original == output else 2
    if args.command == "compare":
        _, left = parse_file(args.left)
        _, right = parse_file(args.right)
        left_doc = semantic_document(left)
        right_doc = semantic_document(right)
        equal = left_doc["canonical_sha256"] == right_doc["canonical_sha256"]
        print(json.dumps({
            "equal": equal,
            "left": left_doc["canonical_sha256"],
            "right": right_doc["canonical_sha256"],
        }, sort_keys=True))
        return 0 if equal else 1
    return 2


if __name__ == "__main__":
    sys.exit(main())
