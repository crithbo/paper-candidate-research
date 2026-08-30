"""Standard-Parquet page constructor and fidelity witness for Stage A.

The writer deliberately supports only flat primitive schemas. It emits ordinary
DataPageV2 pages, a single ZSTD codec per column chunk, and standard ColumnIndex /
OffsetIndex structures. PyArrow and DataFusion are used as unmodified readers.
"""

from __future__ import annotations

import argparse
from dataclasses import dataclass
import datetime as dt
import json
import math
import os
from pathlib import Path
import struct
import statistics
import threading
import time
from typing import Any, Iterable

import pyarrow as pa
import pyarrow.parquet as pq
from datafusion import SessionContext
import thriftpy2
from thriftpy2.protocol.compact import TCompactProtocol
from thriftpy2.transport import TMemoryBuffer
import zstandard as zstd
import psutil


ROOT = Path(__file__).resolve().parents[1]
P = thriftpy2.load(str(ROOT / "assets" / "parquet.thrift"), module_name="stagea_parquet_thrift")


def serialize(obj: Any) -> bytes:
    transport = TMemoryBuffer()
    obj.write(TCompactProtocol(transport))
    return transport.getvalue()


def deserialize(data: bytes, cls: Any) -> Any:
    obj = cls()
    obj.read(TCompactProtocol(TMemoryBuffer(data)))
    return obj


def read_footer(path: Path) -> Any:
    with path.open("rb") as stream:
        stream.seek(-8, os.SEEK_END)
        footer_len = struct.unpack("<I", stream.read(4))[0]
        if stream.read(4) != b"PAR1":
            raise ValueError(f"bad Parquet trailer: {path}")
        stream.seek(-(8 + footer_len), os.SEEK_END)
        return deserialize(stream.read(footer_len), P.FileMetaData)


def inspect_standard_indexes(path: Path) -> dict[str, Any]:
    """Independently reparse standard indexes and every referenced page header."""
    footer = read_footer(path)
    raw = path.read_bytes()
    result = {"columns": 0, "pages": 0, "compressed_pages": 0, "retained_pages": 0, "all_v2": True, "index_lengths_match": True}
    for row_group in footer.row_groups:
        for chunk in row_group.columns:
            if None in (chunk.column_index_offset, chunk.column_index_length, chunk.offset_index_offset, chunk.offset_index_length):
                raise ValueError("missing standard page index offsets")
            column_index = deserialize(raw[chunk.column_index_offset:chunk.column_index_offset + chunk.column_index_length], P.ColumnIndex)
            offset_index = deserialize(raw[chunk.offset_index_offset:chunk.offset_index_offset + chunk.offset_index_length], P.OffsetIndex)
            count = len(offset_index.page_locations)
            result["columns"] += 1
            result["pages"] += count
            result["index_lengths_match"] &= count == len(column_index.null_pages) == len(column_index.min_values) == len(column_index.max_values)
            for location in offset_index.page_locations:
                header = deserialize(raw[location.offset:location.offset + location.compressed_page_size], P.PageHeader)
                result["all_v2"] &= header.type == P.PageType.DATA_PAGE_V2 and header.data_page_header_v2 is not None
                if header.data_page_header_v2.is_compressed:
                    result["compressed_pages"] += 1
                else:
                    result["retained_pages"] += 1
    result["pass"] = bool(result["all_v2"] and result["index_lengths_match"] and result["pages"] > 0)
    return result


def uleb128(value: int) -> bytes:
    out = bytearray()
    while value >= 0x80:
        out.append((value & 0x7F) | 0x80)
        value >>= 7
    out.append(value)
    return bytes(out)


def encode_def_levels(present: list[bool], max_def: int) -> bytes:
    if max_def == 0:
        return b""
    if max_def != 1:
        raise ValueError(f"only flat optional columns are supported, max_def={max_def}")
    out = bytearray()
    start = 0
    while start < len(present):
        value = 1 if present[start] else 0
        end = start + 1
        while end < len(present) and present[end] == present[start]:
            end += 1
        out += uleb128((end - start) << 1)
        out.append(value)
        start = end
    return bytes(out)


def normalized_pylist(array: pa.Array | pa.ChunkedArray) -> list[Any]:
    if isinstance(array, pa.ChunkedArray):
        array = array.combine_chunks()
    kind = array.type
    if pa.types.is_timestamp(kind) or pa.types.is_date64(kind) or pa.types.is_time64(kind) or pa.types.is_duration(kind):
        array = array.cast(pa.int64())
    elif pa.types.is_date32(kind) or pa.types.is_time32(kind):
        array = array.cast(pa.int32())
    elif pa.types.is_dictionary(kind):
        array = array.dictionary_decode()
    return array.to_pylist()


def as_bytes(value: Any) -> bytes:
    if isinstance(value, str):
        return value.encode("utf-8")
    if isinstance(value, (bytes, bytearray, memoryview)):
        return bytes(value)
    raise TypeError(f"cannot encode {type(value)} as BYTE_ARRAY")


def physical_bytes(value: Any, physical: int, type_length: int | None, *, page_value: bool) -> bytes:
    if physical == P.Type.BOOLEAN:
        return b"\x01" if bool(value) else b"\x00"
    if physical == P.Type.INT32:
        return struct.pack("<i", int(value))
    if physical == P.Type.INT64:
        return struct.pack("<q", int(value))
    if physical == P.Type.FLOAT:
        return struct.pack("<f", float(value))
    if physical == P.Type.DOUBLE:
        return struct.pack("<d", float(value))
    if physical == P.Type.BYTE_ARRAY:
        raw = as_bytes(value)
        return (struct.pack("<I", len(raw)) + raw) if page_value else raw
    if physical == P.Type.FIXED_LEN_BYTE_ARRAY:
        raw = as_bytes(value)
        if len(raw) != type_length:
            raise ValueError(f"fixed byte width {len(raw)} != {type_length}")
        return raw
    raise ValueError(f"unsupported physical type: {physical}")


def encode_plain(values: list[Any], physical: int, type_length: int | None) -> bytes:
    if physical == P.Type.BOOLEAN:
        out = bytearray((len(values) + 7) // 8)
        for idx, value in enumerate(values):
            if value:
                out[idx // 8] |= 1 << (idx % 8)
        return bytes(out)
    return b"".join(physical_bytes(v, physical, type_length, page_value=True) for v in values)


def comparable(value: Any, physical: int) -> Any:
    if physical in (P.Type.FLOAT, P.Type.DOUBLE) and math.isnan(float(value)):
        return None
    if physical in (P.Type.BYTE_ARRAY, P.Type.FIXED_LEN_BYTE_ARRAY):
        return as_bytes(value)
    return value


def minmax(values: Iterable[Any], physical: int) -> tuple[Any | None, Any | None]:
    cleaned = [comparable(v, physical) for v in values]
    cleaned = [v for v in cleaned if v is not None]
    return (min(cleaned), max(cleaned)) if cleaned else (None, None)


@dataclass
class PageRecord:
    header_offset: int
    total_size: int
    first_row: int
    min_value: Any | None
    max_value: Any | None
    null_count: int
    retained_uncompressed: bool


@dataclass
class ColumnRecord:
    chunk: Any
    column_index: bytes
    offset_index: bytes
    compressed_size: int
    uncompressed_size: int


def _leaf_schema(footer: Any) -> list[Any]:
    root = footer.schema[0]
    leaves = footer.schema[1:]
    if root.num_children != len(leaves) or any(x.num_children not in (None, 0) for x in leaves):
        raise ValueError("PRECLAIM_FAIL_CLOSED: only flat primitive schemas are supported")
    return leaves


def write_standard_file(
    source: Path,
    output: Path,
    cut_plan: dict[tuple[int, str], list[int]],
    retention_plan: dict[tuple[int, str], list[bool]],
    zstd_level: int = 3,
) -> dict[str, Any]:
    source_footer = read_footer(source)
    leaves = _leaf_schema(source_footer)
    parquet_file = pq.ParquetFile(source)
    if len(leaves) != len(parquet_file.schema_arrow):
        raise ValueError("leaf/Arrow field count mismatch")
    tmp = output.with_suffix(output.suffix + ".tmp")
    compressor = zstd.ZstdCompressor(level=zstd_level)
    row_groups: list[Any] = []
    column_records: list[ColumnRecord] = []
    audit: dict[str, Any] = {"row_groups": [], "retained_pages": 0, "compressed_pages": 0}

    with tmp.open("wb") as sink:
        sink.write(b"PAR1")
        for rg_idx in range(parquet_file.num_row_groups):
            table = parquet_file.read_row_group(rg_idx)
            source_rg = source_footer.row_groups[rg_idx]
            if table.num_rows != source_rg.num_rows:
                raise ValueError("row-group row count mismatch before write")
            rg_columns: list[Any] = []
            rg_compressed = 0
            rg_uncompressed = 0
            rg_start = sink.tell()
            rg_audit = {"row_group": rg_idx, "rows": table.num_rows, "columns": []}
            for col_idx, (field, leaf, src_chunk) in enumerate(zip(table.schema, leaves, source_rg.columns)):
                name = field.name
                if src_chunk.meta_data.path_in_schema != [name]:
                    raise ValueError(f"non-flat path mismatch: {src_chunk.meta_data.path_in_schema} != {[name]}")
                values = normalized_pylist(table.column(col_idx))
                physical = leaf.type
                max_def = 1 if leaf.repetition_type == P.FieldRepetitionType.OPTIONAL else 0
                key = (rg_idx, name)
                cuts = cut_plan.get(key, [len(values)])
                if not cuts or cuts[-1] != len(values) or cuts != sorted(set(cuts)) or cuts[0] <= 0:
                    raise ValueError(f"invalid row-aligned cuts for {key}: {cuts}")
                retention = retention_plan.get(key, [False] * len(cuts))
                if len(retention) != len(cuts):
                    raise ValueError(f"retention/cut length mismatch for {key}")
                chunk_start = sink.tell()
                page_records: list[PageRecord] = []
                previous = 0
                total_compressed = 0
                total_uncompressed = 0
                all_nonnull: list[Any] = []
                for end, retain in zip(cuts, retention):
                    page_values = values[previous:end]
                    present = [v is not None for v in page_values]
                    nonnull = [v for v in page_values if v is not None]
                    all_nonnull.extend(nonnull)
                    definitions = encode_def_levels(present, max_def)
                    raw_values = encode_plain(nonnull, physical, leaf.type_length)
                    stored_values = raw_values if retain else compressor.compress(raw_values)
                    body = definitions + stored_values
                    lo, hi = minmax(nonnull, physical)
                    stats = P.Statistics(
                        max_value=None if hi is None else physical_bytes(hi, physical, leaf.type_length, page_value=False),
                        min_value=None if lo is None else physical_bytes(lo, physical, leaf.type_length, page_value=False),
                        null_count=len(page_values) - len(nonnull),
                        is_max_value_exact=True,
                        is_min_value_exact=True,
                    )
                    page_header = P.PageHeader(
                        type=P.PageType.DATA_PAGE_V2,
                        uncompressed_page_size=len(definitions) + len(raw_values),
                        compressed_page_size=len(body),
                        data_page_header_v2=P.DataPageHeaderV2(
                            num_values=len(page_values),
                            num_nulls=len(page_values) - len(nonnull),
                            num_rows=len(page_values),
                            encoding=P.Encoding.PLAIN,
                            definition_levels_byte_length=len(definitions),
                            repetition_levels_byte_length=0,
                            is_compressed=not retain,
                            statistics=stats,
                        ),
                    )
                    header = serialize(page_header)
                    page_offset = sink.tell()
                    sink.write(header)
                    sink.write(body)
                    total_size = len(header) + len(body)
                    total_compressed += total_size
                    total_uncompressed += len(header) + len(definitions) + len(raw_values)
                    page_records.append(PageRecord(page_offset, total_size, previous, lo, hi, len(page_values) - len(nonnull), retain))
                    audit["retained_pages" if retain else "compressed_pages"] += 1
                    previous = end

                chunk_lo, chunk_hi = minmax(all_nonnull, physical)
                chunk_stats = P.Statistics(
                    max_value=None if chunk_hi is None else physical_bytes(chunk_hi, physical, leaf.type_length, page_value=False),
                    min_value=None if chunk_lo is None else physical_bytes(chunk_lo, physical, leaf.type_length, page_value=False),
                    null_count=sum(v is None for v in values),
                    is_max_value_exact=True,
                    is_min_value_exact=True,
                )
                metadata = P.ColumnMetaData(
                    type=physical,
                    encodings=[P.Encoding.PLAIN, P.Encoding.RLE],
                    path_in_schema=[name],
                    codec=P.CompressionCodec.ZSTD,
                    num_values=len(values),
                    total_uncompressed_size=total_uncompressed,
                    total_compressed_size=total_compressed,
                    data_page_offset=chunk_start,
                    statistics=chunk_stats,
                )
                chunk = P.ColumnChunk(file_offset=chunk_start, meta_data=metadata)
                column_index = serialize(P.ColumnIndex(
                    null_pages=[x.min_value is None for x in page_records],
                    min_values=[b"" if x.min_value is None else physical_bytes(x.min_value, physical, leaf.type_length, page_value=False) for x in page_records],
                    max_values=[b"" if x.max_value is None else physical_bytes(x.max_value, physical, leaf.type_length, page_value=False) for x in page_records],
                    boundary_order=P.BoundaryOrder.UNORDERED,
                    null_counts=[x.null_count for x in page_records],
                ))
                offset_index = serialize(P.OffsetIndex(page_locations=[
                    P.PageLocation(offset=x.header_offset, compressed_page_size=x.total_size, first_row_index=x.first_row)
                    for x in page_records
                ]))
                record = ColumnRecord(chunk, column_index, offset_index, total_compressed, total_uncompressed)
                column_records.append(record)
                rg_columns.append(chunk)
                rg_compressed += total_compressed
                rg_uncompressed += total_uncompressed
                rg_audit["columns"].append({"name": name, "pages": len(page_records), "cuts": cuts, "retained": retention})

            row_groups.append(P.RowGroup(
                columns=rg_columns,
                total_byte_size=rg_uncompressed,
                num_rows=table.num_rows,
                sorting_columns=source_rg.sorting_columns,
                file_offset=rg_start,
                total_compressed_size=rg_compressed,
                ordinal=source_rg.ordinal if source_rg.ordinal is not None else rg_idx,
            ))
            audit["row_groups"].append(rg_audit)

        for record in column_records:
            record.chunk.column_index_offset = sink.tell()
            record.chunk.column_index_length = len(record.column_index)
            sink.write(record.column_index)
        for record in column_records:
            record.chunk.offset_index_offset = sink.tell()
            record.chunk.offset_index_length = len(record.offset_index)
            sink.write(record.offset_index)

        footer = P.FileMetaData(
            version=source_footer.version,
            schema=source_footer.schema,
            num_rows=source_footer.num_rows,
            row_groups=row_groups,
            key_value_metadata=source_footer.key_value_metadata,
            created_by="PARQUET-PAGE-COSEGMENT StageA standard writer; parquet-format 2076361",
            column_orders=source_footer.column_orders,
        )
        footer_bytes = serialize(footer)
        sink.write(footer_bytes)
        sink.write(struct.pack("<I", len(footer_bytes)))
        sink.write(b"PAR1")
        sink.flush()
        os.fsync(sink.fileno())
    os.replace(tmp, output)
    audit["output_bytes"] = output.stat().st_size
    return audit


def _query_scalars(path: Path) -> list[str]:
    ctx = SessionContext()
    ctx.register_parquet("t", str(path))
    batches = ctx.sql("SELECT COUNT(*) AS n, SUM(i64) AS si, SUM(f64) AS sf, COUNT(txt) AS nt FROM t").collect()
    return [str(column[0].as_py()) for column in batches[0].columns]


def witness(output_dir: Path) -> dict[str, Any]:
    output_dir.mkdir(parents=True, exist_ok=True)
    seed = output_dir / "witness_seed.parquet"
    candidate = output_dir / "witness_candidate.parquet"
    schema = pa.schema([
        pa.field("ts", pa.timestamp("us"), nullable=True),
        pa.field("f64", pa.float64(), nullable=True),
        pa.field("i64", pa.int64(), nullable=True),
        pa.field("txt", pa.string(), nullable=True),
    ])
    table = pa.Table.from_arrays([
        pa.array([None if i in (3, 19) else dt.datetime(2026, 1, 1) + dt.timedelta(minutes=i) for i in range(32)], type=pa.timestamp("us")),
        pa.array([None if i in (2, 17) else float((i % 7) * 1.25) for i in range(32)]),
        pa.array([None if i == 11 else i * i - 10 for i in range(32)], type=pa.int64()),
        pa.array([None if i == 7 else ("A" * (i % 5 + 1)) for i in range(32)]),
    ], schema=schema)
    pq.write_table(table, seed, version="2.6", data_page_version="2.0", compression="zstd", use_dictionary=False, write_page_index=True, row_group_size=32)
    cuts = {(0, name): [5, 12, 32] for name in schema.names}
    retention = {(0, name): [False, True, False] for name in schema.names}
    audit = write_standard_file(seed, candidate, cuts, retention)
    index_audit = inspect_standard_indexes(candidate)
    seed_table = pq.read_table(seed)
    candidate_table = pq.read_table(candidate)
    seed_meta = pq.ParquetFile(seed).metadata
    candidate_meta = pq.ParquetFile(candidate).metadata
    checks = {
        "arrow_table_equal": seed_table.equals(candidate_table),
        "schema_equal": seed_table.schema.equals(candidate_table.schema, check_metadata=True),
        "row_group_count_equal": seed_meta.num_row_groups == candidate_meta.num_row_groups,
        "row_group_rows_equal": [seed_meta.row_group(i).num_rows for i in range(seed_meta.num_row_groups)] == [candidate_meta.row_group(i).num_rows for i in range(candidate_meta.num_row_groups)],
        "datafusion_sql_equal": _query_scalars(seed) == _query_scalars(candidate),
        "mixed_retention": audit["retained_pages"] > 0 and audit["compressed_pages"] > 0,
        "nonuniform_three_pages": all(len(c["cuts"]) == 3 and c["cuts"] == [5, 12, 32] for c in audit["row_groups"][0]["columns"]),
        "standard_indexes_and_v2_headers": index_audit["pass"] and index_audit["pages"] == 12,
        "independent_retention_counts": index_audit["retained_pages"] == 4 and index_audit["compressed_pages"] == 8,
    }
    result = {"checks": checks, "all_pass": all(checks.values()), "audit": audit, "index_audit": index_audit, "seed": str(seed), "candidate": str(candidate)}
    (output_dir / "witness_result.json").write_text(json.dumps(result, indent=2, sort_keys=True), encoding="utf-8", newline="\n")
    print(json.dumps(result, indent=2, sort_keys=True))
    if not result["all_pass"]:
        raise SystemExit(2)
    return result


def corpus_audit(corpus_dir: Path, output: Path) -> dict[str, Any]:
    files = sorted(corpus_dir.glob("green_tripdata_*.parquet"))
    if len(files) != 20:
        raise ValueError(f"expected 20 complete files, found {len(files)}")
    records = []
    required = {"lpep_pickup_datetime", "trip_distance", "fare_amount", "total_amount"}
    for path in files:
        pf = pq.ParquetFile(path)
        footer = read_footer(path)
        leaves = _leaf_schema(footer)
        names = pf.schema_arrow.names
        if not required.issubset(names):
            raise ValueError(f"required workload columns missing in {path.name}: {required - set(names)}")
        arrow_rows = pf.metadata.num_rows
        ctx = SessionContext()
        ctx.register_parquet("t", str(path))
        native_rows = ctx.sql("SELECT COUNT(*) AS n FROM t").collect()[0].column(0)[0].as_py()
        records.append({
            "file": path.name,
            "bytes": path.stat().st_size,
            "rows": arrow_rows,
            "datafusion_rows": native_rows,
            "row_groups": pf.num_row_groups,
            "row_group_rows": [pf.metadata.row_group(i).num_rows for i in range(pf.num_row_groups)],
            "columns": names,
            "physical_types": [P.Type._VALUES_TO_NAMES[x.type] for x in leaves],
            "flat_primitive": len(leaves) == len(names),
            "reader_count_equal": arrow_rows == native_rows,
        })
    result = {
        "file_count": len(records),
        "all_flat_primitive": all(x["flat_primitive"] for x in records),
        "all_reader_counts_equal": all(x["reader_count_equal"] for x in records),
        "records": records,
    }
    result["pass"] = result["file_count"] == 20 and result["all_flat_primitive"] and result["all_reader_counts_equal"]
    output.parent.mkdir(parents=True, exist_ok=True)
    output.write_text(json.dumps(result, indent=2, sort_keys=True), encoding="utf-8", newline="\n")
    print(json.dumps(result, indent=2, sort_keys=True))
    if not result["pass"]:
        raise SystemExit(3)
    return result


ELIGIBLE = ("lpep_pickup_datetime", "trip_distance", "fare_amount")


def native_boundary_file(source: Path, output: Path, *, row_limit: int | None = None, page_bytes: int | None = None, cdc: tuple[int, int, int] | None = None) -> None:
    pf = pq.ParquetFile(source)
    options: dict[str, Any] = dict(
        version="2.6", data_page_version="2.0", compression="zstd", use_dictionary=False,
        write_page_index=True, write_batch_size=512,
    )
    if row_limit is not None:
        options["max_rows_per_page"] = row_limit
        options["data_page_size"] = page_bytes
    if cdc is not None:
        options["use_content_defined_chunking"] = {
            "min_chunk_size": cdc[0], "max_chunk_size": cdc[1], "norm_level": cdc[2]
        }
        options["data_page_size"] = cdc[1]
    with pq.ParquetWriter(output, pf.schema_arrow, **options) as writer:
        for rg in range(pf.num_row_groups):
            table = pf.read_row_group(rg)
            writer.write_table(table, row_group_size=table.num_rows)


def extract_cuts(path: Path) -> dict[tuple[int, str], list[int]]:
    footer = read_footer(path)
    raw = path.read_bytes()
    plan: dict[tuple[int, str], list[int]] = {}
    for rg_idx, row_group in enumerate(footer.row_groups):
        for chunk in row_group.columns:
            if chunk.offset_index_offset is None or chunk.offset_index_length is None:
                raise ValueError(f"native writer omitted OffsetIndex: {path}")
            index = deserialize(raw[chunk.offset_index_offset:chunk.offset_index_offset + chunk.offset_index_length], P.OffsetIndex)
            starts = [x.first_row_index for x in index.page_locations]
            if not starts or starts[0] != 0:
                raise ValueError(f"bad native page starts: {path}")
            plan[(rg_idx, chunk.meta_data.path_in_schema[0])] = starts[1:] + [row_group.num_rows]
    return plan


def workload_intervals(path: Path, train: bool) -> dict[str, list[tuple[Any, Any]]]:
    year, month = map(int, path.stem.split("_")[-1].split("-"))
    days = [2, 9, 16, 23] if train else [5, 12, 19, 26]
    epoch = dt.datetime(1970, 1, 1)
    timestamp_ranges = []
    for day in days:
        lo = dt.datetime(year, month, day)
        hi = lo + dt.timedelta(days=1)
        timestamp_ranges.append((int((lo - epoch).total_seconds() * 1_000_000), int((hi - epoch).total_seconds() * 1_000_000)))
    return {
        "lpep_pickup_datetime": timestamp_ranges,
        "trip_distance": [(1.0, 3.0), (3.0, 5.0), (5.0, 10.0)] if train else [(0.5, 2.0), (4.0, 8.0), (10.0, 20.0)],
        "fare_amount": [(10.0, 25.0), (25.0, 50.0)] if train else [(5.0, 15.0), (20.0, 40.0), (50.0, 100.0)],
    }


def page_access_count(values: list[Any], start: int, end: int, intervals: list[tuple[Any, Any]]) -> int:
    lo, hi = minmax((x for x in values[start:end] if x is not None), P.Type.INT64 if values and isinstance(next((x for x in values if x is not None), 0), int) else P.Type.DOUBLE)
    if lo is None:
        return 0
    return sum(not (hi < qlo or lo >= qhi) for qlo, qhi in intervals)


def partition_dp(values: list[Any], intervals: list[tuple[Any, Any]], pages: int, quantum: int = 512) -> tuple[float, list[int]]:
    n = len(values)
    positions = list(range(0, n, quantum))
    if positions[-1] != n:
        positions.append(n)
    m = len(positions)
    infinity = float("inf")
    dp = [[infinity] * m for _ in range(pages + 1)]
    prev = [[-1] * m for _ in range(pages + 1)]
    dp[0][0] = 0.0
    for k in range(1, pages + 1):
        for j in range(1, m):
            for i in range(max(0, j - 16), j):
                width = positions[j] - positions[i]
                if width < quantum and positions[j] != n:
                    continue
                if dp[k - 1][i] == infinity:
                    continue
                access = page_access_count(values, positions[i], positions[j], intervals)
                cost = dp[k - 1][i] + width * access / max(1, len(intervals)) + 32.0
                if cost < dp[k][j]:
                    dp[k][j], prev[k][j] = cost, i
    if dp[pages][-1] == infinity:
        raise ValueError(f"no legal partition n={n} pages={pages}")
    cuts = []
    j = m - 1
    for k in range(pages, 0, -1):
        cuts.append(positions[j])
        j = prev[k][j]
    cuts.reverse()
    return dp[pages][-1], cuts


def candidate_plan(table: pa.Table, path: Path, base: dict[tuple[int, str], list[int]]) -> tuple[dict[tuple[int, str], list[int]], dict[str, Any]]:
    plan = {key: list(value) for key, value in base.items()}
    intervals = workload_intervals(path, True)
    by_col: dict[str, list[tuple[int, float, list[int]]]] = {}
    n = table.num_rows
    target_each = max(2, math.ceil(n / 4096))
    for name in ELIGIBLE:
        values = normalized_pylist(table.column(name))
        choices = []
        for k in range(max(2, target_each - 2), target_each + 3):
            score, cuts = partition_dp(values, intervals[name], k)
            choices.append((k, score, cuts))
        by_col[name] = choices
    target_total = target_each * len(ELIGIBLE)
    best = None
    for a in by_col[ELIGIBLE[0]]:
        for b in by_col[ELIGIBLE[1]]:
            for c in by_col[ELIGIBLE[2]]:
                if a[0] + b[0] + c[0] != target_total:
                    continue
                item = (a[1] + b[1] + c[1], (a, b, c))
                if best is None or item[0] < best[0]:
                    best = item
    if best is None:
        raise ValueError("global page-budget DP has no feasible allocation")
    for name, choice in zip(ELIGIBLE, best[1]):
        plan[(0, name)] = choice[2]
    return plan, {"target_pages": target_total, "objective": best[0], "allocation": {name: choice[0] for name, choice in zip(ELIGIBLE, best[1])}}


def retention_for(table: pa.Table, footer: Any, cuts: dict[tuple[int, str], list[int]], path: Path, mode: str, *, score_only: bool = False) -> tuple[dict[tuple[int, str], list[bool]], dict[str, Any]]:
    intervals = workload_intervals(path, True)
    leaves = _leaf_schema(footer)
    result: dict[tuple[int, str], list[bool]] = {}
    audit = {"retained": 0, "pages": 0}
    for col_idx, (field, leaf) in enumerate(zip(table.schema, leaves)):
        values = normalized_pylist(table.column(col_idx))
        key = (0, field.name)
        if mode == "always_compressed" or (score_only and field.name not in ELIGIBLE) or (mode == "workload_conditioned" and field.name not in intervals):
            flags = [False] * len(cuts[key])
            result[key] = flags
            audit["pages"] += len(flags)
            continue
        previous = 0
        flags = []
        for end in cuts[key]:
            page = values[previous:end]
            present = [x is not None for x in page]
            nonnull = [x for x in page if x is not None]
            definitions = encode_def_levels(present, 1 if leaf.repetition_type == P.FieldRepetitionType.OPTIONAL else 0)
            raw = encode_plain(nonnull, leaf.type, leaf.type_length)
            compressed = zstd.ZstdCompressor(level=3).compress(raw)
            if mode == "threshold_0_9":
                retain = len(compressed) >= 0.9 * (len(definitions) + len(raw))
            elif mode == "workload_conditioned":
                access_fraction = page_access_count(values, previous, end, intervals[field.name]) / len(intervals[field.name])
                retain = access_fraction >= 0.5 and len(compressed) >= 0.85 * max(1, len(raw))
            else:
                retain = False
            flags.append(retain)
            audit["retained"] += int(retain)
            audit["pages"] += 1
            previous = end
        result[key] = flags
    return result, audit


def predicted_score(table: pa.Table, path: Path, cuts: dict[tuple[int, str], list[int]], retention: dict[tuple[int, str], list[bool]]) -> float:
    intervals = workload_intervals(path, True)
    total = 0.0
    for name in ELIGIBLE:
        values = normalized_pylist(table.column(name))
        previous = 0
        for end, retained in zip(cuts[(0, name)], retention[(0, name)]):
            access = page_access_count(values, previous, end, intervals[name])
            total += (end - previous) * access / len(intervals[name]) * (1.0 if retained else 1.08) + 32.0
            previous = end
    return total


def heldout_sql(path: Path) -> list[str]:
    year, month = map(int, path.stem.split("_")[-1].split("-"))
    sql = []
    for day in (5, 12, 19, 26):
        lo = f"{year:04d}-{month:02d}-{day:02d} 00:00:00"
        hi_date = dt.datetime(year, month, day) + dt.timedelta(days=1)
        hi = hi_date.strftime("%Y-%m-%d %H:%M:%S")
        sql.append(f"SELECT COUNT(*), SUM(total_amount), AVG(trip_distance) FROM t WHERE lpep_pickup_datetime >= TIMESTAMP '{lo}' AND lpep_pickup_datetime < TIMESTAMP '{hi}'")
    for lo, hi in ((0.5, 2.0), (4.0, 8.0), (10.0, 20.0)):
        sql.append(f"SELECT COUNT(*), SUM(total_amount), AVG(trip_distance) FROM t WHERE trip_distance >= {lo} AND trip_distance < {hi}")
    for lo, hi in ((5.0, 15.0), (20.0, 40.0), (50.0, 100.0)):
        sql.append(f"SELECT COUNT(*), SUM(total_amount), AVG(trip_distance) FROM t WHERE fare_amount >= {lo} AND fare_amount < {hi}")
    return sql


def measure_queries(path: Path, queries: list[str]) -> dict[str, Any]:
    config = None
    try:
        from datafusion import SessionConfig
        config = SessionConfig().set("datafusion.execution.parquet.enable_page_index", "true").set("datafusion.execution.parquet.pushdown_filters", "true").set("datafusion.execution.target_partitions", "1")
    except Exception:
        config = None
    ctx = SessionContext(config) if config is not None else SessionContext()
    ctx.register_parquet("t", str(path))
    process = psutil.Process()
    samples = []
    results = []
    for query in queries:
        for _ in range(2):
            ctx.sql(query).collect()
        query_samples = []
        expected = None
        for _ in range(9):
            stop = threading.Event()
            peak = [process.memory_info().rss]
            def sampler() -> None:
                while not stop.wait(0.002):
                    peak[0] = max(peak[0], process.memory_info().rss)
            thread = threading.Thread(target=sampler, daemon=True)
            thread.start()
            cpu0, wall0 = time.process_time_ns(), time.perf_counter_ns()
            batch = ctx.sql(query).collect()[0]
            wall, cpu = time.perf_counter_ns() - wall0, time.process_time_ns() - cpu0
            stop.set(); thread.join()
            scalar = []
            for column in batch.columns:
                value = column[0].as_py()
                if isinstance(value, float):
                    scalar.append("NaN" if math.isnan(value) else format(value, ".12g"))
                else:
                    scalar.append(str(value))
            if expected is None:
                expected = scalar
            elif scalar != expected:
                raise ValueError("nondeterministic SQL result")
            query_samples.append({"wall_ns": wall, "cpu_ns": cpu, "peak_rss_bytes": peak[0]})
            samples.append(wall)
        results.append({"sql": query, "result": expected, "samples": query_samples, "median_wall_ns": statistics.median(x["wall_ns"] for x in query_samples)})
    return {"queries": results, "p50_wall_ns": statistics.median(samples), "p90_wall_ns": statistics.quantiles(samples, n=10, method="inclusive")[8], "peak_rss_bytes": max(x["peak_rss_bytes"] for q in results for x in q["samples"])}


def full_probe(corpus_dir: Path, output_dir: Path) -> dict[str, Any]:
    output_dir.mkdir(parents=True, exist_ok=True)
    files = sorted(corpus_dir.glob("green_tripdata_*.parquet"))
    all_results = []
    started_cpu, started_wall = time.process_time_ns(), time.perf_counter_ns()
    for file_index, source in enumerate(files):
        file_dir = output_dir / source.stem
        oracle_dir = file_dir / "boundary_oracles"
        oracle_dir.mkdir(parents=True, exist_ok=True)
        table = pq.read_table(source)
        footer = read_footer(source)
        planning0 = time.perf_counter_ns()
        cells = []
        for row_limit in (1024, 4096, 16384, 65536):
            for page_bytes in (65536, 262144, 1048576):
                cell_id = f"fixed-r{row_limit}-b{page_bytes}"
                target = oracle_dir / f"{cell_id}.parquet"
                if not target.exists():
                    native_boundary_file(source, target, row_limit=row_limit, page_bytes=page_bytes)
                cells.append((cell_id, extract_cuts(target)))
        for minimum, maximum, norm in ((65536, 262144, 0), (262144, 1048576, 1), (262144, 2097152, 2)):
            cell_id = f"cdc-{minimum}-{maximum}-n{norm}"
            target = oracle_dir / f"{cell_id}.parquet"
            if not target.exists():
                native_boundary_file(source, target, cdc=(minimum, maximum, norm))
            cells.append((cell_id, extract_cuts(target)))
        scored = []
        for cell_id, cuts in cells:
            for mode in ("always_compressed", "threshold_0_9"):
                retention, _ = retention_for(table, footer, cuts, source, mode, score_only=True)
                scored.append((predicted_score(table, source, cuts, retention), cell_id, mode, cuts, retention))
        scored.sort(key=lambda x: (x[0], x[1], x[2]))
        union_score, union_cell, union_mode, union_cuts, union_retention = scored[0]
        union_retention, _ = retention_for(table, footer, union_cuts, source, union_mode)
        candidate_cuts, candidate_dp = candidate_plan(table, source, union_cuts)
        candidate_retention, candidate_retention_audit = retention_for(table, footer, candidate_cuts, source, "workload_conditioned")
        candidate_score = predicted_score(table, source, candidate_cuts, candidate_retention)
        planning_ns = time.perf_counter_ns() - planning0
        union_out, candidate_out = file_dir / "strongest_union.parquet", file_dir / "candidate.parquet"
        u0c, u0w = time.process_time_ns(), time.perf_counter_ns()
        union_audit = write_standard_file(source, union_out, union_cuts, union_retention)
        union_write = {"cpu_ns": time.process_time_ns()-u0c, "wall_ns": time.perf_counter_ns()-u0w}
        c0c, c0w = time.process_time_ns(), time.perf_counter_ns()
        candidate_audit = write_standard_file(source, candidate_out, candidate_cuts, candidate_retention)
        candidate_write = {"cpu_ns": time.process_time_ns()-c0c, "wall_ns": time.perf_counter_ns()-c0w}
        source_table = pq.read_table(source)
        union_table = pq.read_table(union_out)
        candidate_table = pq.read_table(candidate_out)
        equivalence = {
            "union_table": source_table.equals(union_table),
            "candidate_table": source_table.equals(candidate_table),
            "union_schema": source_table.schema.equals(union_table.schema, check_metadata=True),
            "candidate_schema": source_table.schema.equals(candidate_table.schema, check_metadata=True),
            "union_indexes": inspect_standard_indexes(union_out)["pass"],
            "candidate_indexes": inspect_standard_indexes(candidate_out)["pass"],
        }
        if not all(equivalence.values()):
            raise ValueError(f"equivalence killer in {source.name}: {equivalence}")
        queries = heldout_sql(source)
        union_query = measure_queries(union_out, queries)
        candidate_query = measure_queries(candidate_out, queries)
        if [q["result"] for q in union_query["queries"]] != [q["result"] for q in candidate_query["queries"]]:
            raise ValueError(f"SQL equivalence killer in {source.name}")
        all_union_cuts = {key: set() for key in candidate_cuts}
        for _, cuts in cells:
            for key, ends in cuts.items():
                all_union_cuts[key].update(ends)
        actions = useful = outside = 0
        intervals = workload_intervals(source, True)
        for name in ELIGIBLE:
            values = normalized_pylist(table.column(name))
            cuts = candidate_cuts[(0, name)]
            previous = 0
            for idx, end in enumerate(cuts):
                actions += 2
                if end not in all_union_cuts[(0, name)]:
                    outside += 1
                    if idx > 0:
                        left_start = cuts[idx-2] if idx >= 2 else 0
                        split_cost = page_access_count(values, left_start, previous, intervals[name]) * (previous-left_start) + page_access_count(values, previous, end, intervals[name]) * (end-previous)
                        merged_cost = page_access_count(values, left_start, end, intervals[name]) * (end-left_start)
                        useful += int(merged_cost > split_cost + 32)
                if candidate_retention[(0, name)][idx] and not union_retention[(0, name)][min(idx, len(union_retention[(0, name)])-1)]:
                    outside += 1
                    useful += 1
                previous = end
        p50_improvement = 1 - candidate_query["p50_wall_ns"] / union_query["p50_wall_ns"]
        p90_improvement = 1 - candidate_query["p90_wall_ns"] / union_query["p90_wall_ns"]
        result = {
            "file": source.name, "rows": table.num_rows, "grid_cells": len(scored),
            "union_cell": union_cell, "union_representation": union_mode, "union_predicted_score": union_score,
            "candidate_predicted_score": candidate_score, "candidate_dp": candidate_dp,
            "planning_wall_ns": planning_ns, "union_write": union_write, "candidate_write": candidate_write,
            "union_bytes": union_out.stat().st_size, "candidate_bytes": candidate_out.stat().st_size,
            "size_ratio": candidate_out.stat().st_size / union_out.stat().st_size,
            "equivalence": equivalence, "union_query": union_query, "candidate_query": candidate_query,
            "p50_improvement": p50_improvement, "p90_improvement": p90_improvement,
            "actions": actions, "outside_actions": outside, "useful_outside_actions": useful,
            "candidate_retention": candidate_retention_audit,
            "union_audit": {"pages": union_audit["retained_pages"] + union_audit["compressed_pages"]},
            "candidate_audit": {"pages": candidate_audit["retained_pages"] + candidate_audit["compressed_pages"]},
        }
        (file_dir / "result.json").write_text(json.dumps(result, indent=2, sort_keys=True), encoding="utf-8", newline="\n")
        all_results.append(result)
        print(f"FILE {file_index+1}/20 {source.name} p50={p50_improvement:.4f} p90={p90_improvement:.4f} size={result['size_ratio']:.4f} outside={outside}/{actions}", flush=True)
    useful_rate = sum(x["useful_outside_actions"] for x in all_results) / max(1, sum(x["actions"] for x in all_results))
    summary = {
        "files": all_results,
        "file_count": len(all_results),
        "grid_cells_per_file": 30,
        "useful_retained_residual_action_rate": useful_rate,
        "files_p50_improvement_ge_10pct": sum(x["p50_improvement"] >= 0.10 for x in all_results),
        "files_size_le_1_05": sum(x["size_ratio"] <= 1.05 for x in all_results),
        "files_p90_not_erased": sum(x["p90_improvement"] >= 0 for x in all_results),
        "all_equivalent": all(all(x["equivalence"].values()) for x in all_results),
        "total_cpu_ns": time.process_time_ns() - started_cpu,
        "total_wall_ns": time.perf_counter_ns() - started_wall,
    }
    summary["threshold_pass"] = bool(summary["useful_retained_residual_action_rate"] >= 0.10 and summary["files_p50_improvement_ge_10pct"] >= 12 and summary["files_size_le_1_05"] == 20 and summary["files_p90_not_erased"] == 20 and summary["all_equivalent"])
    (output_dir / "probe_summary.json").write_text(json.dumps(summary, indent=2, sort_keys=True), encoding="utf-8", newline="\n")
    print(json.dumps({k: v for k, v in summary.items() if k != "files"}, indent=2, sort_keys=True))
    return summary


def main() -> None:
    parser = argparse.ArgumentParser()
    sub = parser.add_subparsers(dest="command", required=True)
    witness_parser = sub.add_parser("witness")
    witness_parser.add_argument("--output-dir", type=Path, required=True)
    audit_parser = sub.add_parser("corpus-audit")
    audit_parser.add_argument("--corpus-dir", type=Path, required=True)
    audit_parser.add_argument("--output", type=Path, required=True)
    probe_parser = sub.add_parser("probe")
    probe_parser.add_argument("--corpus-dir", type=Path, required=True)
    probe_parser.add_argument("--output-dir", type=Path, required=True)
    args = parser.parse_args()
    started = time.perf_counter_ns()
    if args.command == "witness":
        witness(args.output_dir)
    elif args.command == "corpus-audit":
        corpus_audit(args.corpus_dir, args.output)
    elif args.command == "probe":
        full_probe(args.corpus_dir, args.output_dir)
    print(f"elapsed_ns={time.perf_counter_ns() - started}")


if __name__ == "__main__":
    main()
