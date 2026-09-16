# Source / genealogy / collision matrix

All sources below are official USENIX paper or technical-session records accessed by 2026-08-10. This is a bounded Discovery screen, not a global novelty assertion.

| Genealogy | First-party source | Contribution action | Fair same-object union considered | Residual and classification |
|---|---|---|---|---|
| hS | [OSDI '26 technical sessions](https://www.usenix.org/conference/osdi26/technical-sessions) | speculative subprocess execution, dynamic effect detection, selective effect commit | Bash/PaSh and hS-like safe speculative execution | A proposed ordering policy is a selector; no separate global action was identified. `DIRECT_SUBTRACT` leaves no admissible residual. |
| Incr | [OSDI '26 — Incr](https://www.usenix.org/conference/osdi26/presentation/xie-yizheng) | effect/dependency tracking and reuse of stored intermediate results | shell re-execution plus automatic incrementalization | The claimed nonlocal reuse representation is directly expressed. `DIRECT_FATAL` for a restatement. |
| Spice/SHELF | [OSDI '26 technical sessions](https://www.usenix.org/conference/osdi26/technical-sessions) | sparse/reordered overlay, layout decoupling, bulk metadata restore | process/VM snapshots and SHELF | Direct current action; a changed restoration guarantee changes exact object. `DIRECT_FATAL`. |
| Arctic | [OSDI '26 technical sessions](https://www.usenix.org/conference/osdi26/technical-sessions) | lock-free ART with freezing coordination and operation-key reclamation | current concurrent indexes and Arctic | Direct mechanism, plus prohibited RocksDB-family overlap. `DIRECT_FATAL`. |
| OBASE | [OSDI '26 technical sessions](https://www.usenix.org/conference/osdi26/technical-sessions) | object-aware runtime migration and address-space reorganization | OS tiering backends plus OBASE | Direct mechanism and S4-object overlap. `DIRECT_FATAL`. |
| DeLFS | [OSDI '26 technical sessions](https://www.usenix.org/conference/osdi26/technical-sessions) | decentralized LFS metadata/data organization, LFS-aware locking, path disentanglement | F2FS/MAX/F2FSJ/ScaleLFS and DeLFS | No atomic action beyond current construction was frozen. `DIRECT_SUBTRACT`. |
| DMTree | [FAST '26 technical sessions](https://www.usenix.org/conference/fast26/technical-sessions) | compute-side collaborative locating and locking for point/range operations | private caches and DMTree | Direct current nonlocal action. `DIRECT_FATAL` for a restatement. |
| ParaSync | [FAST '26 technical sessions](https://www.usenix.org/conference/fast26/technical-sessions) | multithreaded chunking, streaming matching, pipelined delta reconstruction | conventional sync and ParaSync | Direct current pipeline action. `DIRECT_FATAL` for a restatement. |
| PolarStore | [FAST '26 technical sessions](https://www.usenix.org/conference/fast26/technical-sessions) | device/software dual-layer compression with database-aware I/O | software and hardware compression, PolarStore | Remaining scheduling idea is controller-only. `DIRECT_SUBTRACT` to no admissible residual. |
| DisCoGC | [FAST '26 technical sessions](https://www.usenix.org/conference/fast26/technical-sessions) | combined discard and compaction reclamation | compaction-only and DisCoGC | Current union directly expresses joint reclamation action. `DIRECT_FATAL`. |
| SPLIDT | [NSDI '26 technical sessions](https://www.usenix.org/conference/nsdi26/technical-sessions) | partitioned decision-tree inference and recirculation resource reuse | prior data-plane DTs, SPLIDT | Further per-workload action selection is a controller. `DIRECT_SUBTRACT`. |
| HCDN | [NSDI '26 technical sessions](https://www.usenix.org/conference/nsdi26/technical-sessions) | fine-grained stream scheduling in a coordinated CDN framework | conventional CDN and HCDN/OpenTiga mechanisms | Only orchestrator/scheduling residual surfaced; excluded under assignment rules. `DROP_CONTROLLER_ONLY`. |

## Current-upstream-reality ledger

| Potential absence claim | Commit/tag | Docs/source/flags checked | Contrary evidence | Result |
|---|---|---|---|---|
| None retained after paper-level collision screen | N/A | N/A | N/A | v8.7 not triggered; no implementation-absence conclusion is stated. |

## Admission boundary

Any brief would require exact same function/guarantee, fair strongest executable union, public natural or formal input route, full-cost/complexity-error accounting, a source-supported atomic N1/N2/N3 gap, finite killer, and v8.6 closure plan. None of the twelve genealogies survived this boundary.
