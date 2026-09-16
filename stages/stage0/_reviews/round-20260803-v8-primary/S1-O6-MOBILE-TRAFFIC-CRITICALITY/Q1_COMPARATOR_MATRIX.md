# Q1 comparator — S1-O6-MOBILE-TRAFFIC-CRITICALITY

| Anchor | Verified contribution shape | Candidate overlap | Required delta |
|---|---|---|---|
| [Sereno, OSDI 2026](https://www.usenix.org/conference/osdi26/presentation/xin) | measured mobile LLM/UI bandwidth contention; speculative-yield system | same deployment problem | an information-bearing arbiter primitive, not another yield policy |
| [XSched, OSDI 2025](https://www.usenix.org/conference/osdi25/presentation/shen-weihang) | preemptive command scheduling across XPUs | command interference control | request-level post-issue decision with distinct information |
| [Layerweaver+, IEICE 2022](https://doi.org/10.1587/transinf.2021EDL8084) | NPU QoS-aware layer scheduling | QoS framing | shared-memory arbitration and causal mediation |

**Calibration:** `BELOW_PARITY_PENDING_REVISION`. None establishes a direct fatal collision, but the ARM/AMD QoS contracts mean a new tag cannot be presumed novel. A Q1 claim needs token semantics, an implementation-cost account, two natural traces, and a causal arbiter ablation.
