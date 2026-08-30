# Command log — exceptional R3G

All commands ran from `D:\project\writing\reserch`. Every write was under `stages\stageA\PARQUET-PAGE-COSEGMENT\exceptional-r3g`; prior owner/gate trees remained read-only. Bundled Python 3.12.13 used the frozen topic-local vendor path containing PyArrow 25.0.0, DataFusion 54.0.0, thriftpy2 0.7.0a1, zstandard 0.23.0 and psutil 7.0.0.

| Step | Command/action | Result | Claim-bearing |
|---:|---|---|---:|
| 1 | Full-read controls, role, ARS experiment/reproducibility instructions; verify frozen control SHA-256 | PASS | no |
| 2 | Rehash resume1 manifest | 718/718 PASS | no |
| 3 | Rehash independent gate manifest | 6/6 PASS | no |
| 4 | Freeze `EXPERIMENT_CONTRACT.yaml` and corrected executor | complete | no |
| 5 | `exceptional_probe.py preclaim` | initial dynamic-module registration error | no |
| 6 | preclaim after registration fix | BSS global type error; fail closed | no |
| 7 | preclaim after type-scoped BSS | dated-witness parser error; fail closed | no |
| 8 | final preclaim, including all seven representations and executed Latin query | PASS | no |
| 9 | first corrected natural command start `2026-08-11T08:43:20.7045679Z` | R3G consumed; serial enumeration stopped at 120 s, no result.json | yes, no decision record |
| 10 | two-worker equivalent materialization | stopped at boundary; no result.json | diagnostic |
| 11 | four-worker equivalent materialization without enforced fallback | baseline closed; exact error `candidate selection budget exceeded for green_tripdata_2024-01.parquet`; no result.json | diagnostic |
| 12 | enforce already-frozen 120 s fallback in isolated candidate process; rerun preclaim | PASS | no new mechanism |
| 13 | replay1 complete start `2026-08-11T08:57:26.1189064Z` | 20/20 complete | yes |
| 14 | replay2 start `2026-08-11T09:44:31.5933532Z` | 20/20 complete | yes |
| 15 | `aggregate_exceptional.py` | hashes, costs, replay equality recomputed | read-only recomputation |

Final validation found no bundled PyYAML/Node YAML parser. YAML files were therefore checked structurally by direct read and required-field assertions rather than silently claiming third-party parser validation; JSON parsing was executed for all 45 JSON files.

No download, install, global PATH/environment mutation, Stage B command or external write occurred. The isolated 120-second fallback is the pre-existing contract action, not an algorithm change: timeout terminates the unchanged planner, emits the selected union, and charges the full attempt.
