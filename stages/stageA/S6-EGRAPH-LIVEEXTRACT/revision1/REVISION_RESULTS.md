# S6-EGRAPH-LIVEEXTRACT Stage A Revision 1 Results

## Material Passport

- Origin skill: `academic-research-suite / experiment-agent`
- Modes: `plan → run → validate`
- Date/cutoff: 2026-08-09
- Verification status: `VERIFIED`
- Frozen contract SHA-256: `da677333b52750b7dab196b867ca6754550ab1a6fd1f40610028676c571cdc89`
- Natural source SHA-256: `8301352a6b70d0d79bd0eeecfdff39081e3f565b000ccabc8ba5ca63653b05d8`
- Decision consequence: `STOP_RECOMMENDED`

## Atomic-gate result

The public Diospyros `simple_vec_add_root_7` compiler e-graph passed source integrity, naturalness, multiple-extraction, acyclicity-projection, target-operation cost, output-size, same-object, and exact-control checks. Its deterministic acyclic projection contains 16 reachable e-classes, 24 retained e-nodes, and 9 distinct exact root extractions.

No strict joint-over-both-sequential witness exists on the complete frozen budget sweep. All 29 feasible budget points are exactly absorbed by one sequential control. There is no qualifying structural increment: the certified structure is an absorption partition, which the frozen gate explicitly classifies as STOP rather than PASS.

## Exact negative-region partition

All byte budgets are multiples of four, as frozen.

| Budget region | Joint oracle | Runtime-first control | Memory-first control | Exact disposition |
|---|---|---|---|---|
| `B = 4..20` | infeasible | infeasible | infeasible | Root cannot be emitted below the 24-byte scalar construction lower bound. |
| `B = 24..44` | cost 2100, peak 24 | infeasible | cost 2100, peak 24 | Joint is exactly the memory-first extraction `7.2`; absorbed by memory-first. |
| `B = 48..136` | cost 1200, peak 48 | cost 1200, peak 48 | cost 2100, peak 24 | Joint is exactly the runtime-first extraction `7.3`; absorbed by runtime-first. |

At `B=24`, joint/memory-first execute `C:3, C:6, C:7`, with zero deletions and zero recomputations. At `B=48`, joint/runtime-first execute `C:26, C:27, C:7`, again with zero deletions and zero recomputations. The natural object therefore exposes a two-point extraction Pareto frontier, but no region in which materialization or recomputation changes the optimal representative choice.

## Extraction census

| Root representative/family | Exact variants | Static target milli-cost range | Best one-shot peak |
|---|---:|---:|---:|
| `7.2` scalar adds followed by `Vec` | 1 | 2100 | 24 B |
| `7.3` two `Vec` values followed by `VecAdd` | 1 | 1200 | 48 B |
| `7.5` alternate vector construction | 3 | 2200–2400 | 48 B |
| `7.6` alternate vector construction | 3 | 2200–2400 | 48 B |
| `7.8` three vector values followed by `VecMAC` | 1 | 1300 | 64 B |

The 9 extractions were all enumerated. The solver issued 306 exact fixed-extraction/budget schedule queries. No extraction or budget was retained or discarded based on outcome.

## Natural-object and backend mapping ledger

- Source: `egraphs-good/extraction-gym`, commit `903ba0f818b50608fe20ae9e0f03c35cb27bc50a`, file `data/diospyros/simple_vec_add_root_7.json`.
- Source size/hash: 17,477 bytes; SHA-256 `8301352...b05d8`; Git blob `0a6fdaa6432a55b7c49001bd83531835efc6a1af`.
- Source origin: Diospyros equality-saturation compiler for DSP vectorization, ASPLOS 2021, DOI `10.1145/3445814.3446707`.
- Projection: 91 source nodes; two malformed multi-digit node/e-class records removed; cyclic representatives removed by the preregistered SCC rule; no missing-dependency removal; 24 nodes remain.
- Output sizes: scalar 4 bytes; four-lane vector 16 bytes, at e-class result type.
- Operation cost: artifact costs scaled exactly by 1000. This is a target-operation proxy, not measured machine latency.
- External inputs/constants: caller-owned, immutable, and excluded equally for every method.
- Included in objective: every retained non-leaf execution and every recomputation.
- Not claimed: register allocation, spill/reload, cache traffic, measured latency, or energy.

## Full-cost ledger

| Item | Run 1 | Run 2 | Disposition |
|---|---:|---:|---|
| Artifact bytes | 17,477 | same | Included and hash locked |
| Locked projection bytes | 7,466 | same | Included |
| Projection wall time | 0.620 ms | one frozen projection | Recorded |
| Extraction enumeration | 1.001 ms | 0.876 ms | Included |
| Exact schedule search | 16.439 ms | 17.003 ms | Included |
| Total probe wall time | 17.953 ms | 18.456 ms | Included |
| Peak Python RSS | 22,622,208 B | 22,691,840 B | Included |
| Result JSON bytes | 44,663 | 44,663 | Included |
| E-graph construction time | unavailable from fixed artifact | unavailable | Not used in comparative objective; claim ceiling noted |
| Measured backend runtime/spills | unavailable | unavailable | Explicitly unsupported |

## Validation

- Unit tests: 4/4 passed.
- Source byte/hash check: passed.
- Exact schedule replays: 81/81 passed, with zero cost, peak, action-count, recomputation, or budget violations.
- Canonical run hashes: run 1 = run 2 = `90adbdefb2ede0797366f125e839e0cacc7b3ee5b670fa417ab8ae90aa37c82c`.
- Reproducibility verdict: `REPRODUCIBLE`.
- Fallacy scan: 11/11 covered. Statistical population inference is not made; the result is exhaustive for one frozen object.

## Claim ceiling

Supported: on this natural compiler e-graph and complete frozen B sweep, the joint oracle is everywhere infeasible or exactly absorbed by an exact sequential control.

Unsupported: a universal absorption theorem for all e-graphs; prevalence on other compiler workloads; measured memory/runtime benefit; or any paper-level positive claim.

