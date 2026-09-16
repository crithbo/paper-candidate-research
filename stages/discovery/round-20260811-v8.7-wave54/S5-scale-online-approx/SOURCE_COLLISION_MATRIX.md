# Source and collision matrix

All citations below are first-party conference/project pages checked on 2026-08-11. `Current-upstream reality` is `NOT_TRIGGERED` unless stated: none of the dropped lines relies on an assertion that a current implementation lacks an action. Thus no absence claim is made from old documentation, a release note, issue, or future-work text.

| Family / primary source | Frozen same object and natural carrier | Current native action / fair same-information union | Review result |
|---|---|---|---|
| [Pluto (OSDI 2026)](https://www.usenix.org/conference/osdi26/presentation/wu-ying-wei) | Distributed graph analytics; paper graph workloads. | Full mirroring/BSP + static partial mirroring + mirror-free work migration. | `DROP`: only an unformed online placement selector remained. Deep reviewed. |
| [FRACTAL (NSDI 2026)](https://www.usenix.org/conference/nsdi26/presentation/huang) | Unmodified distributed shell-script execution; scripts and failure/recovery workloads. | Recoverable-region partitioning + precise dependency/progress subgraphs + exactly-once recovery. | `DROP`: online recovery selection is a controller unless a new semantics-preserving representation is named. Deep reviewed. |
| [SBB (OSDI 2026)](https://www.usenix.org/conference/osdi26/presentation/hu-kang) | Userspace packet runtime; flow/request workloads and tail-latency target. | User interrupts + flow migration + task stealing. | `DROP`: alternative balancing policy is not a distinct complete N2 action. Deep reviewed. |
| [MemChannel (NSDI 2026)](https://www.usenix.org/conference/nsdi26/presentation/guo-zerui) | Switched CXL memory-pool transport; competing memory flows. | Sender-driven, fabric-informed rate/admission/congestion control. | `EXCLUDED`: hardware-dependent transport line; no fresh same-object residual identified. |
| [STREAMBUS (NSDI 2026)](https://www.usenix.org/conference/nsdi26/presentation/lu-jun) | Transparent on-demand application streaming; application block-access traces. | Synchronous requested-block service + asynchronous Markov prefetch. | `DROP`: remaining idea is predictor/prefetch selection, not a new constructor. |
| [Medley (NSDI 2026)](https://www.usenix.org/conference/nsdi26/presentation/wang-haiping) | Live CDN delivery; production stream/request traffic. | Substream partitioning and edge assignment. | `NOT_ADMITTED_UNFROZEN`: natural public carrier and union-external atomic action not available in this scan; no scientific negative inference. |
| [BLADE (NSDI 2026 sessions)](https://www.usenix.org/conference/nsdi26/technical-sessions) | Wi-Fi contention control; cloud-gaming/XR traffic. | Distributed contention-window adaptation. | `DROP`: parameter-adaptation/controller family is expressly excluded. |
| [QCON (NSDI 2026 sessions)](https://www.usenix.org/conference/nsdi26/technical-sessions) | 5G multi-connectivity real-time streaming; application QoE and radio link state. | QoE monitor, multilink scheduling, and priority reinjection. | `DROP`: scheduling/controller composition; no atomic residual. |
| [Law (NSDI 2026 sessions)](https://www.usenix.org/conference/nsdi26/technical-sessions) | 802.11 real-time streaming; latency-sensitive packet traffic. | Cross-layer queue/rate/retry architecture that spends application loss tolerance. | `EXCLUDED`: guarantee changes are central and the scoped S5 residual was not same-guarantee. |
| [DeLFS (OSDI 2026)](https://www.usenix.org/conference/osdi26/presentation/ahn) | Manycore log-structured filesystem; storage workloads. | Decentralized metadata/data/locking and split critical/deferrable paths. | `EXCLUDED`: ordinary storage-layout/locking direction; outside this assignment's online/approx focus. |
| [DroidSpeak (NSDI 2026 sessions)](https://www.usenix.org/conference/nsdi26/technical-sessions) | Cross-model distributed KV reuse. | Selective layer recomputation and pipelined loading. | `EXCLUDED_REPEAT`: prior S5 dynamic-KV family. |
| [HCDN (NSDI 2026 sessions)](https://www.usenix.org/conference/nsdi26/technical-sessions) | Live-CDN stream scheduling. | Modular orchestration and redirection strategies. | `EXCLUDED_REPEAT`: prior S5 live-CDN/scheduling family. |

## Primary-source reality checks for the three deep reviews

| Line | Current material checked | Absence claim / docs-source-flags outcome |
|---|---|---|
| Pluto | Official OSDI 2026 paper page and its open-access paper link, checked 2026-08-11. | `NOT_TRIGGERED`: the conclusion is not that source lacks dynamic mirroring; it is that no complete, non-controller candidate action was frozen. No flag or source-symbol absence claim is made. |
| FRACTAL | Official NSDI 2026 paper page and prepublication-paper link, checked 2026-08-11. | `NOT_TRIGGERED`: no claim about a missing runtime interface/flag. The semantic union described by the primary paper is used positively. |
| SBB | Official OSDI 2026 paper page and paper link, checked 2026-08-11. | `NOT_TRIGGERED`: no assertion that current runtime source lacks a scheduler action. No default/nondefault configuration absence claim is required. |

No source is used to claim global novelty.  The matrix is a bounded, first-party collision record only.
