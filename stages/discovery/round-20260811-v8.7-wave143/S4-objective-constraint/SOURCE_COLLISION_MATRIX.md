# Source and collision matrix

Frozen cutoff: 2026-08-11. Sources are first-party USENIX official pages/papers. They establish positive current published constructions; no unverified absence claim or configuration omission is used.

| id | official current source | positive source fact | collision outcome |
|---|---|---|---|
| R01 | [Pineapple — NSDI 2025](https://www.usenix.org/conference/nsdi25/presentation/bantikyan) | timestamps unify Multi-Paxos and ABD; source gives safety/liveness model and operation construction | current complete operation union |
| R02 | [GPHash — FAST 2025](https://www.usenix.org/conference/fast25/presentation/chen-menglei) | warp-cooperative lock-free hash operation, CAS/slots, caching, consistency | current consistent-index union |
| R03 | [Scalio — OSDI 2025](https://www.usenix.org/conference/osdi25/presentation/sun) | RDMA/NVMe-oF offload, two-layer design and linearizable cache protocol | current I/O-plus-consistency union |
| R04 | [FiDe — ATC 2025](https://www.usenix.org/conference/atc25/presentation/rovelli) | reliable fast detection and FiDe-based coordination protocols | current reliability/timing union |
| R05 | [FAST 2025 technical sessions](https://www.usenix.org/conference/fast25/technical-sessions) | source describes on-device/in-kernel read-path composition | no whole action beyond placement |
| R06 | [NSDI 2025 official conference listing](https://www.usenix.org/conferences/multimedia?f%5B0%5D=rhercejktsjii&page=292) | temporal verification of stateful P4 programs is listed | insufficient frozen contract; no deep claim |

For paper-defined constructors, default/non-default runtime flags do not exist. The current-source check records this and relies only on the cited positive construction.
