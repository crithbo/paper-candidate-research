# FLATBuffers Profiled Whole-Buffer Layout — Revision 1 Claim Matrix

| Claim / obligation | Static support in revision | Strongest subtractor or attack | Current disposition | First later killer |
|---|---|---|---|---|
| same object is preserved | fixed schema/root, values/nulls/presence, identity/alias classes, vector/key order, header, stock reader/verifier | unpack/repack may lose alias identity; alternate format changes object | `CLOSED_STATIC` | verifier/accessor/identity mismatch |
| action class is native-realizable | finite public-call grammar and per-transition plan expansion | current builder already provides every order/config action | `CLOSED_AS_KNOWN_ACTION_N2` | any emitted plan needs raw bytes or patched reader |
| action catalog is complete for claimed family | all node orders, field permutations, permitted sharing/alias, vector helper, config and finish arms; escape hatches explicitly outside normalized family | repeated writes/dead objects/raw pushes could make an unbounded emitter space | `CLOSED_FOR_DECLARED_CANONICAL_FAMILY` | tiny oracle finds omitted canonical plan |
| local state is insufficient | vtable, string, alias and alignment behavior are globally prefix-dependent | local subtree DP / additive node weights | `CONFIRMED` | none; this is a subtraction result |
| revised state is suffix-sufficient | exact size/alignment, live offsets, future-matchable vtables/strings, unresolved profile endpoints, dependency ideal | hidden predecessor/history fact changes a future legal action or cost | `STATIC_LEMMA_DEFINED` | equal normalized states yield different stock suffixes |
| DP path and native plan are bijective | action IDs include node/permutation/share/config; transitions expand to public calls | generic schedule may omit physical builder semantics | `STATIC_LEMMA_DEFINED` | oracle path count/bytes mismatch |
| guarantee is nontrivial and honest | exact Pareto frontier over declared grammar; suffix-certified merging; output-sensitive `R`; exponential worst case admitted | generic exhaustive subset DP/ILP | `CONDITIONAL_N2` | no strict quotient compression on natural instances |
| objective is fair | frozen training profile; exact static distance/bytes/action/temp vector; deterministic tie; full-cost ledger separate | profile leakage or claiming cache benefit from byte distance | `CLOSED_STATIC` | held-out/full-cost result is dominated |
| byte witness is mechanical | two 56-byte images, exact offsets/vtables, 20 vs 36 right-distance | both actions already in current union; no natural benefit | `ACTION_DIVERGENCE_ONLY` | stock reproduction/verifier failure |
| strongest current union is represented | generated Pack, all declared native arms, stable/hot-first, tiny complete oracle, generic solver subtractor | current API absorbs new-action and heuristic claims | `CLOSED_STATIC` | same union covers candidate frontier/full cost |
| latest direct collision is absent | no such claim made | bounded search cannot prove absence | `SEARCH_BOUNDED_OPEN` | direct same-object equal-guarantee paper/upstream component |
| natural Stage A route is finite | 20–50 official TFLite/LiteRT source-builder objects plus 20–50 second public source-builder-backed objects, preregistered split and killers | binaries may erase alias provenance; planning may explode | `ROUTE_FROZEN_NOT_RUN` | fidelity, scale, or full-cost killer |
| Q2 paper shape | format-specific complete-action exact quotient plus natural full-cost test route | order-only/config/emitter/generic solver is below bar | `TIER_B_Q2_VIABLE_IF_CLOSING_CONFIRMS` | sentinel fires |
| Q1 parity | no completed implementation, natural evidence, or broad theory | evidence ceiling far below Q1 exemplars | `NOT_ESTABLISHED` | not applicable at Stage 0 |

## Mechanical decision map

- If independent closing verifies the grammar boundary, suffix congruence, safe forgetting, path–plan bijection, witness arithmetic, and finite killer route: `STAGE0_PASS / TIER_B_Q2_VIABLE`.
- If any real same-object/action/formal defect reduces the work to order enumeration, local DP, generic scheduling/ILP, or emitter engineering: `BELOW_Q2_STOP__NATIVE_ACTION_OR_GENERIC_LAYOUT_SCHEDULING_ABSORPTION`.
- Missing implementation, native output, natural gain, or main results is not a Stage 0 STOP reason.
- Revision budget is exhausted: `1/1 CONSUMED`; no automatic second revision.
