# Unique opportunity family

## libsolv Pool / Repo / Solvable ID-layout constructor

- Exact object: one fixed package repository snapshot, relation graph, solver flags and stock libsolv load/solve/query outputs.
- Native oracle: `.solv` loading plus solve/query equality; every ID-bearing reference must be regenerated consistently.
- Conditional whole action: jointly construct solvables, strings, reldeps and serialized repository records while preserving standard-reader acceptance.
- Current union to close: repository writer/import; Pool string/reldep interning; Repo/Solvable allocation and reuse; `.solv` serialization/loading; solver/query flags, defaults and nondefaults.
- Conditional N2: a target-specific exact/FPT/Pareto algorithm with a formal native load/solve/bytes bound. Frequency ordering, graph relabeling, generic packing, compression, controller logic and postprocessing are excluded.
- Natural finite route: a versioned open distribution repository snapshot; ledger writer CPU/RSS/temp and bytes, load/solve CPU-RSS-latency, query equality.
- Status: no proposal because action-union and direct-subtractor closure are incomplete.
