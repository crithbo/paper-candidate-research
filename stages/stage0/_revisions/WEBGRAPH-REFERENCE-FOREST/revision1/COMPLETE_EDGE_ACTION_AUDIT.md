# Complete-Edge Action Audit — WEBGRAPH-REFERENCE-FOREST Revision 1

## Atomic audit question

Can one fixed native BVGraph instance simultaneously provide:

1. actual sorted successor lists and a complete legal reference-edge cost table;
2. the final forest produced by `BvCompZ` after best-parent selection, depth DP and all-edge greedy refill;
3. a strictly lower-cost legal complete-edge forest under the identical native objective; and
4. a nontrivial exact/FPT/approximation/formal property governing that action?

Audit verdict: `NO__ATOMIC_GATE_NOT_CLOSED`.

## Pinned action space

| Dimension | Frozen boundary |
|---|---|
| Implementation | first-party Rust `webgraph 0.6.2`, `BvCompZ`; CLI `0.4.2` |
| Graph | immutable, fixed natural vertex order, exact sorted successor lists |
| Output | ordinary native BVGraph graph stream plus offsets/properties |
| Reference edge | one predecessor within fixed compression window; nonempty referenced list |
| Constraint | fixed maximum reference-chain depth and chunk boundary |
| Coding | fixed endianness, interval threshold, outdegree/reference/block/residual codes |
| Objective | native estimator bits for each selected root/reference action; later full-cost adds construction/access dimensions |
| Information | graph and fixed contract only; no measured timing oracle or reordered graph |

## Current pipeline, mechanically reconstructed from release source

| Phase | Source behavior | Consequence for revision |
|---|---|---|
| Cost enumeration | Root and all legal predecessor costs are populated in `reference_costs` using the native `Compressor` and estimator | An abstract weight table cannot substitute for actual lists/codes |
| Best-parent forest | Strictly lower bit cost selects one nearest-tie predecessor per node | Complete-edge residual cannot stop at showing a discarded second edge |
| Depth DP | `update_references_for_max_length` computes a maximum-weight depth-bounded subforest of the selected forest | Generic global/depth-bounded forest claim is absorbed |
| Greedy refill | `find_additional_references_greedily` scans every legal predecessor for each node subject to chain/forward-depth feasibility | Witness must beat the final refill, not the DP intermediate |
| Native write | Chosen references are recompressed, emitted and offset-accounted | Stream/offset/decode parity is part of the object |

## Candidate witness ledger

| Attempt | Real successor lists | Native costs | Final `BvCompZ` forest | Strictly better complete forest | Disposition |
|---|---:|---:|---:|---:|---|
| Discovery sibling `1→0`, `2→0` | no | no | no | no | invalid: siblings do not compete under path depth |
| Abstract chain/star with savings `6,10,9` | no | author-injected | source-level simulation only | abstract only | forbidden abstract-weight witness |
| Nested-list family `A`, `A∪{x}`, `A∪{x,y}` | parametric, not one frozen graph | no exact estimator derivation | unknown | unknown | useful search seed only; gate not closed |
| Brute-force small native enumeration | not executed or claimed | not obtained | not obtained | not obtained | future ceiling/probe; forbidden as claimed method |

No row satisfies the linked atomic requirement.

## Why the refill still does not create a paper by itself

Static source shows a sequential greedy refill whose feasibility filter combines the current predecessor chain length with a forward-chain value derived before the refill. This makes order dependence and conservative exclusions plausible. Plausibility is not a native action divergence. Without an induced native cost matrix and final output, describing that control flow is source auditing, not a new constructor.

## Formal residual audit

### Plausible property

For fixed compression window `W` and maximum depth `D`, exact complete-edge optimization is plausibly fixed-parameter tractable via a left-to-right frontier state that retains the relevant parent/depth configuration of the most recent `W` lists. A finite recurrence and an `n·f(W,D)`-type complexity target can be stated.

### Why it does not pass

- No formal state/recurrence/proof is required at Stage 0, but the property must govern a named same-object action that differs from the current final pipeline.
- The action half is absent.
- Without it, the route collapses to a generic exact oracle over native costs. The frozen rules explicitly prohibit brute-force/oracle-as-method and require a complete-pipeline divergence.

## Same-object and fidelity audit

| Requirement | Status | Reason |
|---|---|---|
| Fixed graph and order | `PASS` | never changed |
| Exact successor-list recovery | `PLAN_PASS` | native readers make this finite; no new output produced |
| Stream/offset/random-access preservation | `PLAN_PASS` | explicit contract retained; no candidate stream exists |
| Same information | `PASS` | no extra timing/reorder oracle proposed |
| Native objective | `FAIL_FOR_WITNESS` | no actual cost table/strict inequality |
| Final-pipeline comparator | `PASS` | full `BvCompZ` pipeline is correctly frozen |
| Complete-edge action divergence | `FAIL` | not defined on a realizable instance |
| Nonproduct algorithmic property | `CONDITIONAL_ALONE` | frontier DP route is plausible but unbound to native divergence |

## Stage A route audit

The public CPU route is finite and reproducible in principle:

1. pin the immutable crate/CLI versions and code settings;
2. enumerate native list fixtures only as a witness-search oracle;
3. compare the final `BvCompZ` forest with a complete-edge ceiling;
4. require exact stream/offset/reader equality;
5. proceed to frozen natural graph strata only after a real action divergence exists.

This is not a resource blocker. It is also not enough to authorize Stage A after the unique revision failed to define the candidate's same-object action.

## Audit conclusion

The current implementation absorbs the broad mechanism. The only remaining formal idea is not linked to a native-realizable complete-pipeline divergence. The atomic scientific revision therefore fails and triggers `BELOW_Q2_STOP__CURRENT_BVCOMPZ_ZUCKERLI_REFERENCE_FOREST_ABSORPTION`.

