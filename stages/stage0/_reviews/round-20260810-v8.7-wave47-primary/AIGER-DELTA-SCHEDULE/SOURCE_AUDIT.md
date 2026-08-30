# AIGER-DELTA-SCHEDULE Source and Collision Audit

- Mode: `PRIMARY`
- Cutoff: 2026-08-10
- Status: `SEARCH_BOUNDED_CLOSED_FOR_STAGE0__NO_DIRECT_FATAL_FOUND`
- Scope statement: this is a bounded Stage-0 search, not a claim that no related work exists anywhere.

## Frozen package integrity

| File | Expected SHA-256 | Independently observed | Result |
|---|---|---|---|
| `TOPIC_BRIEF_AIGER_DELTA_SCHEDULE.md` | `179A41BFF132986FC37FC6E4FB71764B9F39A36CE7ACB7A4032B7370D344EC2A` | same | PASS |
| `handoff.yaml` | `50AB1097AC9F981C644D559BFD3765A1507F66796AC85C46B90F68D54158EEE1` | same | PASS |
| `HASH_MANIFEST.sha256` self | `16EF94DC69CCB0F6A3C26DD2919C5CE27E9E00342B4A6966FFD26EA0D5147439` | same | PASS |

## Authoritative format and corpus sources

1. Armin Biere, [The AIGER And-Inverter Graph (AIG) Format](https://fmv.jku.at/papers/Biere-FMV-TR-07-1.pdf), FMV Technical Report 07/1, plus the [official AIGER page](https://fmv.jku.at/aiger/). Read for consecutive identifiers, topological AND legality, ordered fanins, delta equations, and 7-bit variable-length encoding.
2. [HWMCC 2025 official site](https://hwmcc.github.io/2025/). Read for the AIGER 1.9 bit-level contract and the public benchmark/artifact route.

## Current upstream reality check

### AIGER reference implementation

- Observed current commit: `039ec1a2cc37d3093ac35c4b6df65336b346f409`.
- Checked `aiger.c`: `aiger_write_binary` uses `aiger_reencode`; re-encoding assigns fixed interface identifiers and recursively labels reachable ANDs from ordered roots, sorts fanins, then writes the two deltas.
- Checked `aigtoaig.c`: mode/ascii/strip/truncate-style actions exist; no whole-DAG variable-byte objective was found. Object-changing actions are excluded from equal-guarantee baselines.
- Finding: current reference traversal/canonicalization is a mandatory baseline, not direct absorption.

### Yosys

- Frozen commit: `0f2bcb94b7dc8310a52abf6eef3a7e1a9f09b552`.
- Checked `backends/aiger/aiger.cc`, observed blob `1320937a096ffd70a30f2f9755ba9667546d7905`.
- `mkgate` assigns incremental IDs; `bit2aig` recursively constructs gates; the writer emits standard binary deltas.
- Checked option surface: `-ascii`, `-zinit`, `-miter`, `-symbols`, `-no-sort`, `-map`, `-vmap`, `-no-startoffset`, `-ywmap`, and interface filters.
- Correction to Discovery: `-no-sort` was omitted there. It controls interface ordering behavior, not a global AND byte-cost planner. Under the frozen interface contract, every legal setting must nevertheless be included in the native union.

### ABC

- Frozen commit: `6c51a9238544bce6eb300b7b1c3e5bb4215bec84`.
- Checked `src/base/io/io.c`, `src/base/io/ioWriteAiger.c` (observed blob `cad335d4f48183a2dfc0244e55c0fb73a55e2cda`), and `src/aig/gia/giaAiger.c`.
- `write_aiger` exposes `-s`, `-c`, `-u`, `-v`. Standard output iterates the internal AIG/GIA order and emits deltas.
- `-u` invokes isomorphic canonicalization and must be included whenever it preserves the frozen object/interface contract.
- `-c` writes `aig2`, so it is an alternate-format negative control rather than an equal-guarantee baseline.
- Finding: no checked standard path optimizes the frozen whole-DAG variable-byte objective.

## Original-paper collision search

| Source | Exact-object overlap | Method/claim overlap | Disposition |
|---|---|---|---|
| Kabiljo et al., [Compressing Graphs and Indexes with Recursive Graph Bisection](https://www.kdd.org/kdd2016/papers/files/rpp0883-dhulipalaAemb.pdf), KDD 2016 | graph ordering, but not AIGER/topological fixed-object | compression-friendly order via recursive bisection | strongest methodological subtractor; adapt as fair heuristic |
| Gagrani et al., [Neural Topological Ordering for Computation Graphs](https://proceedings.neurips.cc/paper_files/paper/2022/hash/6ef586bdf0af0b609b1d0386a3ce0e4b-Abstract-Conference.html), NeurIPS 2022 | topological DAG order, different graph semantics | peak-memory objective and learned ordering | adjacent action space; not direct |
| Mishchenko, Chatterjee, Brayton, [DAG-aware AIG rewriting](https://doi.org/10.1145/1146909.1147048), DAC 2006 | AIG domain, but graph changes | area/depth rewriting | object-changing subtractor, not fair same-object baseline |

Queries covered combinations of `AIGER`, `binary AIGER`, `topological order`, `gate/node ordering`, `renumbering`, `delta`, `variable-length`, `compression`, `precedence`, and `edge span/logarithmic arrangement`. No primary paper found in this bounded search covers all of: fixed AIG, fixed standard reader/format, legal topological AND numbering, the exact variable-byte objective, and an equal-or-stronger algorithmic guarantee.

## Complete finite comparator catalog

- Native: AIGER reference no-op/reencode/root DFS; Yosys pinned same-object option surface; ABC pinned standard default plus `-u` where legal.
- Same-information algorithms: stable Kahn/DFS, threshold-aware ready-set greedy, precedence-feasible recursive-bisection adaptation.
- Ceiling: exhaustive/ILP on small DAGs only.
- Excluded from primary parity: AIG rewriting; interface reorder; `aig2`; gzip/bzip/external codec; changed graph, properties, reader, or object.

This finite catalog prevents both a weak-default comparison and an invalid “universal union” absorption argument.

## Collision conclusion and uncertainty

- Direct fatal: not found in checked current source or original papers.
- Current-source absorption: not found after adding Yosys `-no-sort` and ABC `-u`.
- Remaining uncertainty: `SEARCH_BOUNDED_OPEN` beyond Stage-0 scope, especially older logic-synthesis serialization work not indexed under AIGER terminology. This lowers novelty confidence but does not establish absence or scientific STOP.
- Transport note: any failed raw network/source retrieval was treated only as a retrieval limitation. Absence was not inferred from transport; cited findings rely on successfully accessed official/current sources.
