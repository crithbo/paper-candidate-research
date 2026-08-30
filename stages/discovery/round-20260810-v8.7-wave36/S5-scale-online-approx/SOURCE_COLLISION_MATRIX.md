# Wave 36 algorithmic residual / facet-collision matrix

This follows up, but does not revise, Wave 31. Sources are first-party paper, project and author-artifact sources accessed on 2026-08-10.

| Facet | PolarStore residual | SPLIDT residual | HCDN residual |
|---|---|---|---|
| Exact object | Cloud-native RDBMS shared storage with compression | Programmable-data-plane stateful DT inference over packet windows | Live-video CDN delivery across heterogeneous edge nodes |
| Same function / guarantee | Database storage with compression and critical-I/O performance | Line-rate inference, classifier task, target feasibility and TTD | Video delivery preserving QoE/startup/stall semantics |
| Current source / version | [FAST '26 official page](https://www.usenix.org/conference/fast26/presentation/hu), 2026 proceedings | [official artifact repository](https://github.com/SpliDT-Decision-Trees/SpliDT-Artifact-NSDI26), `main`; visible submodule refs `712f49d`, `3dfa8a7` | [NSDI '26 official paper](https://www.usenix.org/system/files/nsdi26-wang-liying.pdf), 2026 proceedings |
| Fair strongest union | software compression + PolarCSD compression + database I/O optimization + compression-aware scheduling | prior DTs + partitioned subtrees + recirculation reuse + DSE/training framework + baseline configurations | original CDN + alternative/multihomed edges + OpenTiga/client assistance + all four stated strategies |
| Atomic action considered | online codec/layout assignment | delta partition/tree/rule update after drift | global stream-to-edge representation instead of redirection policies |
| Information equivalence | same workload/I/O and device information | must use only available flow-window labels/features and target constraints | same stream-node hotness, load, capacity, node type and proactive stream knowledge |
| Mechanism A | joint block/codec representation | exact affected-subtree maintenance | content-addressable stream-fragment graph |
| Mechanism B | online approximation with bounded re-encoding work | approximate partition maintenance with bounded F1/TTD deviation | hierarchical shared-fragment multicast representation |
| Why not a brief | Neither mechanism was specified outside existing compression/scheduling action; decision rule collapses to placement selection. | Actual source/configuration examination required by v8.7 was not available; no absence claim, algorithm, complexity accounting or finite falsifier can be honestly frozen. | Both mechanisms require changing delivery object/format or are schedulers; within the exact object only an orchestrator remains. |
| Natural carrier | Cloud-native RDBMS traces would be required; none is claimed here. | Seven public traffic datasets documented by the authors; not downloaded or run. | Proprietary production CDN traces in the paper; no public same-object carrier frozen. |
| Finite fidelity status | `STRUCTURALLY_UNCLOSABLE` for the controller-only residual | `RESOURCE_BLOCKED_FIDELITY_GAP` for source inspection only; not a proposal | `STRUCTURALLY_UNCLOSABLE` for controller-only / changed-object routes |
| 72h falsifier if admitted | N/A: no atomic method | N/A: source closure is prerequisite, not an experiment | N/A: no same-object non-controller method |
| Collision classification | `DIRECT_SUBTRACT` → controller-only | `SEARCH_BOUNDED_OPEN` only; no novelty conclusion | `DIRECT_SUBTRACT` → controller-only |

## v8.7 current-upstream reality ledger

| Lead | Current version / source check | Docs/source and flags/config | Contrary evidence | Disposition |
|---|---|---|---|---|
| PolarStore | official FAST '26 proceedings page | no implementation-absence claim; source flags not relevant | paper explicitly contains scheduling | structural controller-only drop |
| SPLIDT | `main`, visible artifact submodule refs `712f49d`/`3dfa8a7`, checked 2026-08-10 | project README documents framework, baselines, datasets; raw training/config files returned fetch cache-miss, so their symbols/flags are unverified | public artifact proves access path exists, not absence/presence of online update | no proposal; source-check resource boundary |
| HCDN | official NSDI '26 proceedings paper | paper enumerates periodic scheduling, redirection rules, OpenTiga/client and overhead | positive source says controller is the current mechanism | structural controller-only drop |
