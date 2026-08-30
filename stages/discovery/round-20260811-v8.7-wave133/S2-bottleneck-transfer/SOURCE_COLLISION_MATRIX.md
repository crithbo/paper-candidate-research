# N3 natural bottleneck-migration source / confound matrix

**Assignment:** `DISCOVERY-S2-20260811-V8.7-WAVE133-NATURAL-BOTTLENECK-MIGRATION-N3-BREADTH` · **cutoff:** 2026-08-11.

| Family | First-party natural carrier | Proposed stable N3 regularity | Current explanation / confounds | Full-cost + finite killer | Final |
|---|---|---|---|---|---|
| LAMMPS | [LAMMPS upstream (`bench/`, examples)](https://github.com/lammps/lammps) | force acceleration → neighbor/communication residual increases by geometry/rebuild structure | potential, precision, package, rank/topology, neighbor configuration, hardware | trajectory+neighbor+compute+comm+I/O; blocked 20–50 case mixed-effect/held-out falsifier | `NOT_ADMITTED_UNFROZEN` |
| GROMACS | [GROMACS releases/evidence](https://gitlab.com/gromacs/gromacs/-/releases), [official performance issue data](https://gitlab.com/gromacs/gromacs/-/issues/4965) | GPU compute acceleration → PME/comm/queue crossover law | runtime queue settings, GPU/runtime, ranks, PME decomposition, binding | trajectory+compute+PME+comm+queue+I/O; stratified 20–50 systems crossover falsifier | `NOT_ADMITTED_UNFROZEN` |
| LLVM | [LLVM test suite](https://github.com/llvm/llvm-test-suite), [LLVM upstream](https://github.com/llvm/llvm-project) | compute reduction → IR/index/materialization residual predicted by module structure | compiler version/pass pipeline/target/LTO/debug/cache warmth | compile+materialize+link+diagnostics; cold/warm two-version held-out suite falsifier | `NOT_ADMITTED_UNFROZEN` |
| MLPerf Inference | [MLPerf Inference reference suite](https://github.com/mlcommons/inference) | accelerator compute reduction → staging/verification relation by model/batch/sequence structure | backend/harness/scenario/preprocess/host/quantization/accuracy mode | preprocessing+transfer+compute+output/accuracy; stratified compliant-scenario falsifier | `NOT_ADMITTED_UNFROZEN` |
| PostgreSQL | [PostgreSQL upstream](https://github.com/postgres/postgres) | execution reduction → catalog/WAL/checksum residual law | plan/version/storage/cache and workload construction | raw corpus/trace schema unclosed | `NOT_ADMITTED_UNFROZEN` |
| OpenFOAM | [OpenFOAM upstream](https://github.com/OpenFOAM/OpenFOAM-dev) | solver acceleration → halo/I/O residual law | solver/mesh/decomposition/backend | raw corpus/trace schema unclosed | `NOT_ADMITTED_UNFROZEN` |

## N3 boundary

All proposals are characterization hypotheses, not established results. No single trace, release, hardware configuration or issue anecdote is treated as a stable rule. The strongest baselines are current official packages/profilers and the listed confounds. No controller, cache policy, benchmark wrapper or cross-object comparison is promoted as a mechanism. This package is cross-lane deduplicated against prior S2 end-to-end, parser, allocation, metadata, data-movement and checkpoint families.
