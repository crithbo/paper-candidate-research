# Raw-screen events

| ID | Family | Coupled constraint | Result |
|---|---|---|---|
| R01 | AEGONKV-GC | throughput + P99 tail + storage cost | deep → direct absorption |
| R02 | PIPEANN-SSD | ANN quality + storage latency/deadline | deep → direct absorption |
| R03 | SKYBRIDGE-STALE | availability + low latency + staleness deadline | deep → direct absorption |
| R04 | SPARS-RENDER | stable frame deadline + visual-quality budget + power | deep → direct absorption |
| R05 | PRVTEL-RETENTION | DP privacy + query fidelity + retention resource | structural: learned-model constructor |
| R06 | SANTA-ISOLATION | competing-flow fairness + throughput-delay preferences | structural: AQM controller |
| R07 | SOZE-BANDWIDTH | weighted bandwidth fairness at scale | structural: allocation policy |
| R08 | HARVEST-CONTAINERS | latency-SLO fairness + spare CPU harvesting | structural: controller |
| R09 | LIBRA-LLM | request SLO + goodput + split/KV resource | excluded S5 online partition/scheduling |
| R10 | HCDN-LIVE | QoE + CDN bandwidth cost + best-effort capacity | excluded S5 scheduling |

R5-P0: `RAW=10`; `REPEAT=0`; `UNIQUE=10`; `DEEP=4`; `BRIEF=0`.
