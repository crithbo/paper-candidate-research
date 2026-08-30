# Source / facet collision matrix

| Lead | First-party source | Exact object and source facets | Direct subtractor / current-union result | Final disposition |
|---|---|---|---|---|
| TileLoom | [OSDI 2026 TileLoom](https://www.usenix.org/conference/osdi26/presentation/li-wei) | tile program mapped to spatial target; source captures topology, memory hierarchy, compute and tile distribution | Same mapping action encodes performance/energy constraints. Identical-variable optimizer is not N2 without new guarantee/complexity/representation. | `DROP__REWEIGHTING_OR_HEURISTIC` |
| FORGE | [OSDI 2026 technical sessions](https://www.usenix.org/conference/osdi26/technical-sessions) | DM cache groups, hotness/FIFO eviction, lazy synchronization | Paper jointly uses grouping, synchronization and eviction under same semantics; external layer is selector/controller. | `DROP__NO_ATOMIC_ACTION_GAP` |
| GOODPUT | [NSDI 2026 GOODPUT](https://www.usenix.org/conference/nsdi26/presentation/wang-yu) | WLAN channel, bonding, station assignment; prediction/sensing inputs | Current MILP directly covers algebraic objectives/constraints. Solver substitution/scalarization is not a new mechanism. | `DROP__CONTROLLER_AND_SAME_VARIABLE_ABSORPTION` |

## Reality check

Conclusions use current published mechanism descriptions, not a claim that upstream lacks a feature. No old issue, release note, or future-work inference is used.

