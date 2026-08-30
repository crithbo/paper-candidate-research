# Raw-screen events

| ID | Family | Reliability / latency / cost coupling | Result |
|---|---|---|---|
| R01 | ANANKE-FS-RECOVERY | transparent fault recovery + common-case latency/overhead | deep → direct absorption |
| R02 | NVLOG-NVM-WAL | crash consistency + sync latency + temporary NVM cost | deep → direct absorption |
| R03 | ATOMICDISK-TEE | sync atomicity/security + trace latency + trusted-storage cost | deep → direct absorption |
| R04 | ZOOROUTE-OVERLAY | deterministic failure recovery + outage latency + probing/memory cost | deep → direct absorption |
| R05 | XO-L7-OFFLOAD | request reliability/semantics + CPU/network latency cost | native system; no residual |
| R06 | RTCP-RATELIMIT | rate-limit reliability + retransmission bandwidth cost | controller/protocol tuning |
| R07 | LAW-WIFI | bounded latency + loss tolerance + goodput | controller/link architecture residual |
| R08 | AFAAS-COLDSTART | production stability + startup tail + resource contention | complete native system |
| R09 | SPECLOG-ORDER | order correctness + e2e latency + coordination cost | complete ordering abstraction |
| R10 | FIDE-CRASH-DETECT | failure detection reliability + consensus latency/cost | complete detector/protocol family |

R5-P0: `RAW=10`; `REPEAT=0`; `UNIQUE=10`; `DEEP=4`; `BRIEF=0`.
