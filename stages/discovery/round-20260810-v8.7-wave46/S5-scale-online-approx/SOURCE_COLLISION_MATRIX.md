# Online / approximate native-constructor matrix

| Lead | Primary source | Decision and information | Cost / guarantee / no-gain | Disposition |
|---|---|---|---|---|
| WiseCode | [OSDI '26 technical sessions](https://www.usenix.org/conference/osdi26/technical-sessions) | structure/coefficient/coding constructor over wide stripes | must retain repair and storage guarantees while counting encoding/decoding/search; no unabsorbed construction frozen | `DIRECT_CURRENT_CONSTRUCTOR` |
| POEGA | [OSDI '26 technical sessions](https://www.usenix.org/conference/osdi26/technical-sessions) | proxy graph and refinement under evolving snapshots | graph approximation quality, GPU memory/I/O and multi-version state are current; excluded object | `EXCLUDED_PRIOR_OBJECT` |
| Helmsman | [OSDI '26 technical sessions](https://www.usenix.org/conference/osdi26/technical-sessions) | clustering index, pruning, userspace storage and build pipeline | ANN recall/latency/build/memory cost; excluded ANN object | `EXCLUDED_PRIOR_OBJECT` |
| DeLFS | [OSDI '26 technical sessions](https://www.usenix.org/conference/osdi26/technical-sessions) | decentralized placement/locking construction | filesystem semantics plus metadata/data/lock full cost; only scheduling remains | `DIRECT_CURRENT_CONSTRUCTOR` |
| Spice/SHELF | [OSDI '26 technical sessions](https://www.usenix.org/conference/osdi26/technical-sessions) | storage-to-VMA layout construction and bulk restore | restore latency, I/O, copy/fault, isolation semantics; direct current construction | `DIRECT_CURRENT_CONSTRUCTOR` |
| DMTree | [FAST '26 technical sessions](https://www.usenix.org/conference/fast26/technical-sessions) | compute-side collaborative index action | point/range operations, bandwidth/RDMA IOPS and locking semantics; direct current construction | `DIRECT_CURRENT_CONSTRUCTOR` |
| ParaSync | [FAST '26 technical sessions](https://www.usenix.org/conference/fast26/technical-sessions) | parallel CDC/match/reconstruction pipeline | same sync traffic/reconstruction semantics and CPU/network/disk cost; direct current construction | `DIRECT_CURRENT_CONSTRUCTOR` |
| ZooRoute | [NSDI '26 technical sessions](https://www.usenix.org/conference/nsdi26/technical-sessions) | path provisioning plus proactive rerouting | reliability, forwarding and control cost; remaining delta is a selector | `DROP_CONTROLLER_SELECTOR_ONLY` |

No retained shortlist depended on an upstream absence claim. Therefore the current-source/commit/flag ledger is `NOT_TRIGGERED`, rather than a fabricated negative source check.
