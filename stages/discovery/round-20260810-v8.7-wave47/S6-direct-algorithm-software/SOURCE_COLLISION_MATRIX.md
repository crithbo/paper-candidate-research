# Source and collision matrix — S6 Wave47

Frozen cutoff: `2026-08-10`; sources are official specifications, current upstream source, and original papers where applicable.

| Exact object | Current source/primary evidence | Strongest same-object union | Complete action / finite killer | Classification |
|---|---|---|---|---|
| Fixed AIG to binary AIGER with identical interface/properties/functions | [AIGER format paper/spec](https://fmv.jku.at/papers/Biere-FMV-TR-11-2.pdf); Yosys `0f2bcb94b7dc8310a52abf6eef3a7e1a9f09b552` [`aiger.cc`](https://github.com/YosysHQ/yosys/blob/main/backends/aiger/aiger.cc); ABC `6c51a9238544bce6eb300b7b1c3e5bb4215bec84` | Current Yosys `AigerWriter`/`aig_map`/`mkgate`, ABC/reference AIG writer, default and `-ascii/-symbols/-map/-zinit` union preserving contract | Whole-DAG legal topological labeling that minimizes explicit binary delta bytes; six-AND enumerate/reader-check witness, then finite HWMCC route. | `PROPOSE_STAGE0__SEARCH_BOUNDED_OPEN`. |
| Fixed DRAT proof accepted by native checker | drat-trim `2e3b2dc0ecf938addbd779d42877b6ed69d9a985`, [upstream](https://github.com/marijnheule/drat-trim) | Native proof acceptance plus existing proof-producing action families | No complete same-proof producer/reorder action with unchanged guarantees was frozen. | `DROP`. |
| Fixed HDF5 dataset/chunk layout under current reader contract | HDF5 `57128d33b2fb75bd06dbd08a0555e50e5e7252ac`, [`H5B2`](https://github.com/HDFGroup/hdf5/blob/develop/src/H5B2.c) | Native chunk-index and legal layout/configuration union | Candidate was configuration/layout choice, not a distinct constructor. | `DROP`. |
| Fixed DuckDB table/index semantics | DuckDB `db98709cc2cb41efe5a46bb795f689f5b54f7805`, [ART source](https://github.com/duckdb/duckdb/tree/main/src/execution/index/art) | Current ART construction and reader/query union | No union-external atomic index construction was named. | `DROP`. |

## Current-upstream reality

The retained action distinction depends on the AIGER writer interface, so current Yosys source and all visible writer flags above were checked. The statement is narrow: no checked interface expresses a coupled full-DAG delta-byte schedule. It does not claim that writers lack valid traversal logic, or that no publication has proposed a direct method. Those contrary possibilities are respectively included in the baseline union and passed as `SEARCH_BOUNDED_OPEN` to Stage 0.
