# RAW_SCREEN_ROW_EVENTS

| row | focused object | initial action-divergence witness | screening decision |
|---|---|---|---|
| R01 | A separately compiled AArch64 SVE PCS caller/callee pair with a live scalable value across the call. | Let `F` take/return an SVE or predicate type and modify a live `z8`/`p4` value; Arm PCS requires full preservation at `F`'s public boundary. A hypothetical joint constructor would move, merge, or eliminate that preservation while preserving the same boundary. | `CANDIDATE_GRADE_DEEP_REVIEW` |

The row was admitted to depth because the witness is native-legal, not because it establishes a residual.
