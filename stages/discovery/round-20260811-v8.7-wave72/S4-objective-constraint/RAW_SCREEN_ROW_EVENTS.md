# Raw-screen events

| ID | Unique family | Constraint tension | Funnel result |
|---|---|---|---|
| R01 | PILOT-RECOVERY-DRYRUN | recovery safety versus recovery cost/availability | deep → direct absorption |
| R02 | AMBULANCE-BFT-RACING | common-case latency/throughput versus slow-leader recovery | deep → direct absorption |
| R03 | TRAINMOVER-INTERRUPTION | recovery downtime versus elastic/standby resource cost | deep → direct absorption |
| R04 | MWAIT-SCHED-TAIL | bare-metal idle latency versus predictable pCPU multiplexing | deep → direct absorption |
| R05 | DGC-MANAGED-GC | GC tail versus remote marking resource/correctness | structural drop: native architecture plus orchestrator |
| R06 | UFA-FAILOVER-CAPACITY | availability guarantee versus steady-state capacity buffer | structural drop: differentiated failover policy |
| R07 | BIFROST-TRANSPORT-RECOVERY | tail/recovery versus SmartNIC multipath transport | structural drop: platform-specific native transport |
| R08 | GALILEO-PERC | robustness bounds versus SLO controller actions | structural drop: certificate-guided controller |
| R09 | BLADE-WIFI-ROBUSTNESS | ultra-low tail/fairness versus contention adaptation | structural drop: adaptive controller |
| R10 | ROBUSTRL-ROLE-RECOVERY | effective training time versus role-specific recovery | structural drop: GPU platform/role runtime |

R5-P0: `RAW_SCREEN_ROW_EVENT=10`; `REPEAT_OR_RESCREEN=0`; `UNIQUE_OPPORTUNITY_FAMILY=10`; `CANDIDATE_GRADE_DEEP_REVIEW=4`; `STAGE0_BRIEF=0`.
