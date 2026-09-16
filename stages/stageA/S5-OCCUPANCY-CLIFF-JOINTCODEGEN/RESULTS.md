# S5-OCCUPANCY-CLIFF-JOINTCODEGEN Stage A Results

## Verdict-bearing summary

- Probe execution: `SUCCESS`
- Deterministic replay: `VERIFIED`
- Evidence classification: `ANALYTICAL_SOFTWARE_MIR_EXCERPT_MODEL`
- Probe support: `NOT_FALSIFIED` only for the weak proposition that a deterministic bounded frontier search can return a modeled non-dominated ordering.
- Core occupancy-cliff support: **not obtained**. Both cases remain at normalized tier 8 with zero modeled spills for every method.
- Stage A minimum evidence: **not met**. There is no natural workload, executable current LLVM baseline, verifier-legal candidate MIR, real allocator result, or AMD GPU result.
- Recommendation: `REVISE_ONCE`.

## Frozen inputs

Both public regression inputs were read from LLVM commit `1f112d62e1fa2c4f1a04887abd72da1ed61cf791`, and both upstream RUN lines use `-mtriple=amdgpu11.00`. The first input is a rendered scheduling-region prefix (78 parsed instructions); the second is a complete 56-line upstream regression source (26 parsed instructions). Neither is a natural-workload corpus.

## Quantitative result

| Case | Method | Tier | Peak (SGPR/VGPR/AGPR) | Spill units | Cycle proxy | Search expansions | Host search time |
|---|---|---:|---:|---:|---:|---:|---:|
| `ilp-metric-spills-prefix` | input-order staged proxy | 8 | 8/1/0 | 0 | 126 | n/a | 0.0062 ms |
| | pressure-list proxy | 8 | 8/2/0 | 0 | 120 | n/a | 18.5085 ms |
| | tier-frontier candidate | 8 | 9/2/0 | 0 | 93 | 1,759 | 161.4911 ms |
| | offline beam ceiling (8x) | 8 | 9/2/0 | 0 | 91 | 31,230 | 2,953.2984 ms |
| `no-unclustered-regions` | input-order staged proxy | 8 | 5/0/0 | 0 | 31 | n/a | 0.0044 ms |
| | pressure-list proxy | 8 | 3/0/0 | 0 | 31 | n/a | 4.3547 ms |
| | tier-frontier candidate | 8 | 3/0/0 | 0 | 30 | 849 | 43.0650 ms |
| | offline beam ceiling (8x) | 8 | 3/0/0 | 0 | 29 | 8,270 | 436.9974 ms |

The candidate lowered the dependency-latency cycle proxy from 126 to 93 (26.2%) in the larger excerpt and from 31 to 30 (3.2%) in the smaller case. Those are model outputs, not compiler cycles or kernel runtime. It was one and two proxy cycles above the loose ceiling, respectively. The intended mechanism metric did not activate: tier delta was zero and spill delta was zero in both cases.

## Counterexample interpretation

The run is a counterexample to treating these excerpts plus this coarse liveness model as a sufficient Stage A cliff witness. Although the upstream tests discuss occupancy and spills, the parser ignores physical registers, aliases, regmasks, subregister semantics, live-ins, scheduling hazards, allocator interference, and forward definitions absent from the partial excerpt. Consequently, its normalized pressure never reaches a cliff.

This is **not** evidence that the LLVM/AMDGPU research hypothesis is false. The local environment cannot run `llc`, `FileCheck`, `llvm-calc-occupancy`, GCNSchedStrategy, or greedy RA, so the decisive same-object comparison was not executed.

## Replay validation

The complete probe was replayed twice. After removing only measured `elapsed_ms` fields, both outputs were byte-equivalent as canonical JSON:

- replay 1 projection SHA-256: `77d5c089e284b455f19cb08737e8c3e9743658f8347a59671afcf64bf255c61f`
- replay 2 projection SHA-256: `77d5c089e284b455f19cb08737e8c3e9743658f8347a59671afcf64bf255c61f`
- verification status: `VERIFIED`

The primary result JSON SHA-256 is `7fb162056f63fe0ab8877bad7b5e53754e93d84bf8878b04ad0aa09f177a312f`.

## Evidence ceiling

| Layer | Available evidence | Permitted interpretation |
|---|---|---|
| Analytical | SSA-DAG, normalized live-unit and latency model | deterministic model behavior only |
| Trace | none | no trace claim |
| Software | Python implementation and public MIR excerpts | replayable static-model probe |
| GPU | none | no kernel-time, occupancy-counter, or speedup claim |
| Hardware | none | no architectural or silicon claim |

## Bounded Stage A revision request

To adjudicate the original killer without entering Stage B, provide a candidate-local immutable LLVM AMDGPU tool bundle built at commit `1f112d62e1fa2c4f1a04887abd72da1ed61cf791`, including `llc`, `FileCheck`, and `llvm-calc-occupancy`, plus a manifest of 8–16 complete public natural-kernel-derived MIR regions for `amdgpu11.00`. Budget: at most 4 GiB disk, 4 CPU-hours, no exclusive hardware, and no AMD GPU requirement. Rollback is deletion of that candidate-local bundle. Failure consequence: the actual current baseline, legal-candidate verification, and natural cliff witness remain untestable, so Stage A cannot PASS.

