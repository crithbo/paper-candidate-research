# Source / current-collision matrix

All sources are first-party official USENIX records checked at the frozen cutoff. Current-upstream reality is a **positive collision check**: no conclusion depends on claiming a current source lacks a flag, API, or semantics, so no absent-feature assertion is made from old documents/issues.

| Family | First-party anchor | Current complete action / direct collision | Result |
|---|---|---|---|
| PILOT | [NSDI 2026 technical sessions](https://www.usenix.org/conference/nsdi26/technical-sessions) | Pilot execution runtime/library performs in-situ recovery dry-runs. | Absorbed |
| AMBULANCE | [OSDI 2026 technical sessions](https://www.usenix.org/conference/osdi26/technical-sessions) | Racing BFT protocol directly joins recovery with common-case cost. | Absorbed |
| TRAINMOVER | [OSDI 2026 technical sessions](https://www.usenix.org/conference/osdi26/technical-sessions) | Delta setup, warmup and standby form complete recovery action. | Absorbed |
| MWAIT-SCHED | [OSDI 2026 technical sessions](https://www.usenix.org/conference/osdi26/technical-sessions) | Idle visibility mechanism is a complete same-object construction. | Absorbed |
| DGC | [OSDI 2026 technical sessions](https://www.usenix.org/conference/osdi26/technical-sessions) | Disaggregated marking plus RDMA paging and orchestrator. | Native union |
| UFA | [NSDI 2026 technical sessions](https://www.usenix.org/conference/nsdi26/technical-sessions) | Differentiated failover/preemption architecture. | Policy residual only |
| BIFROST | [NSDI 2026 paper page](https://www.usenix.org/conference/nsdi26/presentation/fan) | SmartNIC multipath reliable transport with failure recovery. | Platform-specific |
| GALILEO | [NSDI 2026 technical sessions](https://www.usenix.org/conference/nsdi26/technical-sessions) | PERC-guided learned-controller integration. | Controller |
| BLADE | [NSDI 2026 paper page](https://www.usenix.org/conference/nsdi26/presentation/guo-fengqian) | Distributed contention-window adaptation. | Controller |
| ROBUSTRL | [OSDI 2026 technical sessions](https://www.usenix.org/conference/osdi26/technical-sessions) | Detect-restart-reconnect role runtime. | Native platform runtime |
