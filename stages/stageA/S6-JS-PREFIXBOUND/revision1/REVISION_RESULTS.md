# S6-JS-PREFIXBOUND Revision Results

## Verdict

- Executable verdict: `PRELIMINARY_SUPPORT`
- Owner recommendation: `PASS_RECOMMENDED` to independent Stage A re-review
- Evidence ceiling: finite contract-faithful exact model plus natural-structure-only JOB check and a deterministic persistent-payload residual
- Stage B: forbidden; `stageb_user_approval_id=null`

## Correctness and replay

| Check | Result |
|---|---:|
| Frozen formal instances | 19,440 |
| Formal + JOB reachable exact states | 404,479 |
| Full-vector optimum mismatches | 0 |
| Compact optimum mismatches | 0 |
| Compact/full-vector equivalence mismatches | 0 |
| Candidate future-equivalence counterexamples | 0 |
| Bound checks | 404,479 |
| Bound overestimates | 0 |
| Primary/replay nonvolatile match | true |

## State, transition and retained-payload accounting

All aggregate values below include the formal family plus JOB 4a. `Canonical retained payload` is the preregistered sum of canonical UTF-8 JSON records for every frozen table entry and persistent metadata record. It is not a claim about process RSS.

| Representation | States | Transitions | Canonical retained payload | State residual vs exact | Transition residual vs exact | Retained residual vs exact |
|---|---:|---:|---:|---:|---:|---:|
| Exact order-state DP | 404,479 | 877,024 | 20,929,349 B | — | — | — |
| Full-vector quotient | 389,774 | 873,661 | 53,678,883 B | +14,705 (3.6355%) | +3,363 (0.3835%) | −32,749,534 B |
| Compact equivalent quotient | 389,774 | 873,661 | 20,327,780 B | +14,705 (3.6355%) | +3,363 (0.3835%) | **+601,569 B (2.8743%)** |

Maximum per-instance frozen payload was `1,529 B` exact, `3,739 B` full-vector and `1,382 B` compact. Full-vector uses `2.5648x` the exact aggregate retained payload and is absorbed.

## Complete logical work ledgers

The predeclared logical-work total is the unweighted sum of every listed event. It is a deterministic accounting device, not a calibrated CPU-cycle model.

| Event | Exact | Full-vector | Compact | Future-equivalence audit | Bound oracle |
|---|---:|---:|---:|---:|---:|
| Transition evaluations | 877,024 | 873,661 | 873,661 | 0 | 0 |
| Sort-cost invocations | 1,754,048 | 3,207,545 | 2,568,155 | 837,607 | 11,918,561 |
| Table lookups | 877,024 | 873,661 | 2,229,296 | 404,479 | 10,291,832 |
| Key hashes | 877,024 | 873,661 | 1,355,635 | 404,479 | 10,291,832 |
| Key compares | 550,040 | 561,382 | 1,122,764 | 14,705 | 5,605,478 |
| Table writes | 547,703 | 526,877 | 1,321,130 | 404,479 | 8,579,889 |
| Signature invocations | 0 | 951,156 | 404,479 | 404,479 | 0 |
| Signature vector elements | 0 | 1,460,223 | 820,833 | 820,833 | 0 |
| Signature normalizations | 0 | 1,460,223 | 820,833 | 820,833 | 0 |
| Compact class assignments | 0 | 0 | 389,774 | 0 | 0 |
| Bound evaluations | 0 | 0 | 0 | 0 | 404,479 |
| Bound oracle calls | 0 | 0 | 0 | 0 | 808,958 |
| Bound oracle transitions | 0 | 0 | 0 | 0 | 10,291,832 |
| **Logical work total** | **5,482,863** | **10,788,389** | **11,906,560** | **4,111,894** | **58,192,861** |

Residuals including bound oracle:

- full-vector: `5,482,863 - (10,788,389 + 58,192,861) = -63,498,387` units；
- compact: `5,482,863 - (11,906,560 + 58,192,861) = -64,616,558` units。

因此没有 work residual，也没有 optimizer-speed claim。

## Time and peak measurements

| Phase | Primary wall / CPU | Replay wall / CPU | Primary / replay peak incremental tracemalloc |
|---|---:|---:|---:|
| Exact | 14.184 / 13.828 s | 11.087 / 10.891 s | 10,044 / 10,044 B |
| Full-vector | 41.939 / 41.125 s | 32.909 / 32.938 s | 20,052 / 20,052 B |
| Compact | 39.697 / 39.344 s | 25.744 / 25.156 s | 7,620 / 7,620 B |
| Future-equivalence audit | 33.068 / 32.563 s | 26.194 / 25.563 s | 13,508 / 13,508 B |
| Bound oracle | 206.289 / 200.875 s | 161.138 / 157.531 s | 33,828 / 33,828 B |

Total wall time was `393.632 s` primary and `300.872 s` replay. Overall peak `tracemalloc` was `27,120,334 B` in both. Timing is volatile and was not used as the sole gate; both quotient representations were slower than exact.

## JOB 4a natural-structure check

| Metric | Exact | Full-vector | Compact |
|---|---:|---:|---:|
| States | 29 | 24 | 24 |
| Transitions | 44 | 41 | 41 |
| Optimum | 4304.112939279771 | 4304.112939279771 | 4304.112939279771 |

This uses a real pinned SQL join graph/equality structure but frozen proxy costs. It is not natural performance evidence.

## Gate interpretation

Full-vector was absorbed and therefore could not pass the preregistered non-vacuity gate. The one allowed compact representation reproduced the same equivalence relation and created a positive deterministic retained-payload residual, so the explicit STOP condition “full-vector absorbed and compact has no positive deterministic residual” did not fire. The result remains narrow: persistent representation bytes only, with negative work and time.

