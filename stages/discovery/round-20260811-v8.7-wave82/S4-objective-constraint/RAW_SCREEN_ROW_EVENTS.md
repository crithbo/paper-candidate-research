# Raw-screen events

| ID | Unique family | Coupled constraint | Result |
|---|---|---|---|
| R01 | POWER-CRASH-CORRUPTION | crash recovery + corruption detection + PM cost | deep → direct absorption |
| R02 | WOLVES-WOFS | synchronous crash consistency + write/latency cost | deep → direct absorption |
| R03 | F2FSJ-RECOVERY | F2FS consistency + recovery/write interference | deep → direct absorption |
| R04 | SHIFTLOCK-RDMA | reader-writer/starvation/fault tolerance + tail/goodput | deep → direct absorption |
| R05 | GRACE-LOSS-VIDEO | visual quality + loss resilience + real-time latency | structural drop: complete joint codec |
| R06 | COMPASS-ENCRYPTED-SEARCH | search accuracy + privacy + latency/bandwidth | structural drop: complete index/ORAM construction |
| R07 | LENGTH-LEAKAGE-ORAM | leakage profile + storage + bandwidth lower bounds | structural drop: bounded construction family |
| R08 | WALLET-CONFIDENTIAL-SERVERLESS | TCB/isolation + latency + density | structural drop: native architecture |
| R09 | STIMPACK-CLOUD-GAMING | perceptual quality + edge resource + service utility | structural drop: utility controller |
| R10 | MAE-RTC-ENCODER | high-quality video + tail latency + bitrate adaptation | excluded S5 controller object |

R5-P0 counts: `RAW=10`; `REPEAT=0`; `UNIQUE=10`; `DEEP=4`; `BRIEF=0`.
