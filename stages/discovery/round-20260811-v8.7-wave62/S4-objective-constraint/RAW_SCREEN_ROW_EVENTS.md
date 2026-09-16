# Raw-screen row events

All anchors are first-party USENIX conference pages checked on 2026-08-11. “Current check” is positive-documentation collision checking: no row asserts an absent upstream feature, so an absence/flag claim is not used.

| ID | Unique opportunity family | Constraint-shift seed | Result |
|---|---|---|---|
| R01 | CLOUD-EBS-TAIL | cloud-block-store P99999 tail and fairness | deep → `DROP_DIRECT_ABSORPTION` |
| R02 | THINKAHEAD-IMAGE-TAIL | initial image-I/O tail under preload budget | `EXCLUDED_CROSS_LANE_S5` |
| R03 | MDK-SLO-CAPACITY | maximize admitted jobs subject to performance SLO | deep → `DROP_DIRECT_ABSORPTION` |
| R04 | RAMRYDER-BW-CAPACITY | independently constrained VM memory bandwidth/capacity | `EXCLUDED_CROSS_LANE_S2` |
| R05 | KAREUS-TIME-ENERGY | fixed time versus fixed energy for training | deep → `DROP_DIRECT_ABSORPTION` |
| R06 | JVMALLOC-MOBILE-ENERGY | soft real-time with CPU/energy/memory constraints | deep → `DROP_DIRECT_ABSORPTION` |
| R07 | QUEUEMEM-NF-ENERGY | terabit NF payload placement and energy | `STRUCTURAL_DROP_HARDWARE_PLACEMENT` |
| R08 | HYDRASERVE-COLD-SLO | serverless LLM cold-start SLO and resource consumption | `STRUCTURAL_DROP_SCHEDULER_COMPOSITION` |
| R09 | PYROCUMULUS-MIGRATION-SLA | VM live-migration consistency/network-budget/tail trade-off | `STRUCTURAL_DROP_PLATFORM_SPECIFIC` |
| R10 | SVALINN-QOS | goodput under latency targets | `STRUCTURAL_DROP_CONTROLLER` |

R5-P0 counts: `RAW_SCREEN_ROW_EVENT=10`; `REPEAT_OR_RESCREEN=0`; `UNIQUE_OPPORTUNITY_FAMILY=10`; `CANDIDATE_GRADE_DEEP_REVIEW=4`; `STAGE0_BRIEF=0`.
