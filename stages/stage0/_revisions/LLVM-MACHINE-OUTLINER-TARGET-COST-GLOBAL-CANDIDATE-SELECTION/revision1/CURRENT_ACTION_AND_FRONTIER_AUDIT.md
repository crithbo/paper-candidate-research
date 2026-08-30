# Current action and frontier audit

## Pinned action catalogue

| Stage | Current action | Relevance to sole gate |
|---|---|---|
| Map | classify MachineInstr as legal/terminator/illegal/invisible and delimit blocks | fixes candidate semantic domain |
| Local discover | suffix tree finds repeated substrings | direct baseline |
| Local prune | sort occurrences and discard overlaps for each repeated substring | irreversible candidate-family reduction before final selection |
| Global discover | CGData global outlined hash tree supplies matches from earlier codegen | already absorbs global discovery |
| Target legality | `getOutliningCandidateInfo`, function-safety and target hook data | admits/rejects each group |
| Native construction | `buildOutlinedFrame` and `insertOutlinedCall` | establishes per-group call/frame semantics |
| Select | scalar priority sort then greedy walk | current strongest compatible-set baseline |
| Post-select prune | erase candidates containing already selected mapped instructions | enforces interval incompatibility |
| Controls | thresholds, leaf policy, reruns, linkonce, global disable, naming | finite configuration baseline |

## Completeness test

`FunctionList` is not a complete native action catalogue in the required sense: local overlap pruning has already removed some occurrences.  A revision may not claim an exact selection over a family it reconstructs by replacing that discovery policy, because that is a different candidate-discovery mechanism.  The complete frozen action family is therefore the retained groups plus their native constructions.

## Non-product test

For a retained group `g`, current information is reducible to:

`(occurrence intervals, fixed target legality, sequence bytes, frame bytes, per-occurrence call bytes, optional scalar runtime cost)`.

Compatibility is disjointness of occurrences after prior selections.  Frame/call/unwind/relocation actions are emitted per group; no inspected current hook creates a shared action whose feasibility or cost depends on jointly selecting two incompatible groups.  The state transition is consequently an independent-set/interval-selection transition.  It is not made target-specific by attaching the target's fixed costs as labels.

## Failed witness map

| Group | Interval | Native status | Conflict | What a selector can change |
|---|---|---|---|---|
| `G0` | `[0,3)` | hook-accepted, positive fixed saving | `G1` | choose / omit |
| `G1` | `[1,4)` | hook-accepted, positive fixed saving | `G0` | choose / omit |
| `G2` | `[4,7)` | hook-accepted, positive fixed saving | none | choose / omit |

Plans `{G0,G2}` and `{G1,G2}` are native legal if each group is accepted.  Their difference is fully represented by abstract compatible-subset choice.  There is no required native action absent from one plan but present in the other beyond the selected calls/frames themselves; therefore this is not comparator-separating N2 evidence.

## Result

The atomic gate cannot close.  The failure arises from action grammar and contribution type, not from a missing build or result.  It activates `BELOW_Q2_STOP__CURRENT_MACHINE_OUTLINER_GLOBAL_SELECTION_ABSORPTION_OR_GENERIC_CONFLICT_GRAPH_PACKING`.
