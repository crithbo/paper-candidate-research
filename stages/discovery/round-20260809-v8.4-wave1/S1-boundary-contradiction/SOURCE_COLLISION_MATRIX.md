# S1 Wave1 来源与碰撞矩阵

- Assignment: `DISCOVERY-S1-20260809-V8.4-WAVE1`
- Cutoff: 2026-08-09 (Asia/Shanghai)
- Method: accepted production Discovery `v2/v8.1` only; O1/O6 historical calibration is a method gate, not candidate evidence.
- Result: `ZERO_PROPOSALS`.

| Boundary/contradiction lead | Primary sources checked | Exact-object comparison | Strong current baselines / natural evidence | Decision |
|---|---|---|---|---|
| Mobile interaction semantics are lost at the scheduler boundary | [MUSched, OSDI 2026](https://www.usenix.org/conference/osdi26/presentation/xiao); [Sereno, OSDI 2026](https://www.usenix.org/conference/osdi26/presentation/xin); [XSched, OSDI 2025](https://www.usenix.org/conference/osdi25/presentation/shen-weihang) | MUSched already makes interaction capability a first-class scheduling signal across IPC dependencies. Sereno/XSched occupy XPU coexistence and command-level control. A proposal merely propagating “interactive” priority is either a same-object scheduler or a relabeling of the prior S1-O6 request-QoS reserve object. | MUSched has a production deployment and reported natural mobile interaction data; Sereno supplies the LLM/XPU coexistence baseline. No distinct, controllable intervention layer was found without reviving the reserved S1-O6 object. | `DROP`—same-object/terminal-reserve exclusion. |
| GPU async execution escapes language-level ownership semantics | [Fearless Concurrency on the GPU](https://arxiv.org/abs/2606.15991); [NVIDIA research page](https://research.nvidia.com/index.php/publication/2026-06_fearless-concurrency-gpu); [cuTile Rust](https://github.com/nvlabs/cutile-rs) | cuTile Rust already extends ownership into tile kernels, launch contracts, asynchronous pipelines, and CUDA graph replay. Any “safe async GPU API” proposal retains the same object and mechanism family. | Current artifact is public; its evaluation spans kernels and an end-to-end Qwen3 inference engine, so a toy race checker or wrapper would be weaker and unfair. | `DROP`—`DIRECT_FATAL` for the generic safe-async-GPU object. |
| Offline semantic-cache metrics contradict deployment outcomes | [Closing the Calibration Gap in Semantic Caching](https://arxiv.org/abs/2606.19719); [FreshCache](https://arxiv.org/abs/2607.04281); [Krites](https://arxiv.org/abs/2602.13165); [vCache](https://arxiv.org/abs/2502.03771) | Calibration-gap work already defines the mismatch, decomposes it, and gives cache-aware metrics; freshness and asynchronous verification independently occupy the two obvious residual mechanisms. | Natural web/conversational traces, explicit stale-error or verification contracts, and current cache baselines are already present. A benchmark-only variant lacks a new action; a threshold policy would be absorbed. | `DROP`—directly occupied problem plus no nontrivial residual mechanism. |
| Stream identity is lost at the multicore-to-DRAM boundary | [InterStellar 2.0](https://doi.org/10.1016/j.sysarc.2026.103832) | The paper explicitly exports fine-grained software stream descriptors and partitions stream batches to multi-channel DRAM controllers, then changes per-stream locality, batching, and scheduling. | The paper evaluates 1–32 DRAM channels against a COTS controller and exposes full metadata/hardware cost implications. A generic “send access semantics to the controller” candidate is the same mechanism. | `DROP`—`DIRECT_FATAL` for generic stream-metadata propagation. |

## Non-revival check

`S1-O6-MOBILE-TRAFFIC-CRITICALITY` is recorded in the current registry/plan as `HUMAN_RESEARCH_RESERVE` with a distinct old assignment. It was not reused, renamed, or used as evidence for a new proposal. The mobile-scheduling lead above is closed precisely because its only apparent residual would require that prohibited revival.

## Search-bounded conclusion

The matrix does not assert that the field is exhausted. It records that, within the verified current primary-source set, none of the investigated boundary leads leaves an exact object, decision variable, strong fair baseline set, natural input, full-cost route, and finite Stage A killer that independently supports `TIER_B_Q2_VIABLE`.
