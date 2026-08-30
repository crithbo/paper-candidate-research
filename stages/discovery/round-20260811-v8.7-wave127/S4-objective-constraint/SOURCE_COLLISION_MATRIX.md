# Source and collision matrix

Frozen cutoff: 2026-08-11. Sources are first-party USENIX venue pages/papers. The published constructor is the frozen current implementation/version; no unsupported source-absence claim is made. Flags/configuration are not applicable where the constructor is paper-defined rather than a maintained upstream interface.

| family | official primary source | explicit joint objectives / current constructor | upstream-reality conclusion |
|---|---|---|---|
| Shoal++ | [NSDI 2025 technical sessions](https://www.usenix.org/conference/nsdi25/technical-sessions) | DAG BFT gives DAG throughput and 4.5-message-delay average commit; current commit construction described | positive constructor collision |
| IMPRESS | [FAST 2025 technical sessions](https://www.usenix.org/conference/fast25/technical-sessions) | important-token identification plus multi-tier KV management controls TTFT/I/O while maintaining quality | positive constructor collision |
| CLONE | [ATC 2025 technical sessions](https://www.usenix.org/conference/atc25/technical-sessions) | explicit latency-energy-quality model/system co-design | action requires changed accelerator/model object |
| Juneberry | [NSDI 2025 technical sessions](https://www.usenix.org/conference/nsdi25/technical-sessions) | Ordered Queue uses hardware ACKs for low latency while retaining linearizability and PM durability | positive constructor collision |
| WALLET | [NSDI 2026 technical sessions](https://www.usenix.org/conference/nsdi26/technical-sessions) | nested confidential execution and LibOS I/O jointly target TCB, latency and density | positive constructor collision / threat-model boundary |
| Compass | [OSDI 2025 technical sessions](https://www.usenix.org/conference/osdi25/technical-sessions) | directional filtering, prefetch and tailored ORAM jointly target quality, latency, obliviousness | only guarantee change or traversal policy remains |

Six-dimensional subtraction for R01/R02/R04/R05: decision rule, information, resource/complexity, quality/guarantee, full cost, and generalization/no-gain are all contained by the listed current union or require a changed contract.
