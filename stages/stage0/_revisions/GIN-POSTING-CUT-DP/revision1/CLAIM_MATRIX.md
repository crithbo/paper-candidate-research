# GIN-POSTING-CUT-DP Revision 1 Claim Matrix

## Decision matrix

| ID | Claim | Type | Evidence in this package | Status | Claim ceiling / closing attack |
|---|---|---|---|---|---|
| C1 | Frozen query sequence and sorted posting streams determine logical `next_gt/advancePast` events without page/layout identifiers. | same-object semantics | `REVISION_REPORT.md` §3 induction and event schema | `STATIC_PASS` | Must validate against tiny unchanged GIN merge oracle before claim-bearing run. |
| C2 | Physical page/call trace remains layout-dependent and is regenerated per candidate by one deterministic reader automaton. | methodological fidelity | report §5; current `entryLoadMoreItems`, `dataLocateItem`, segment-skip semantics | `STATIC_PASS` | No claim that the automaton has been implemented or source-equivalence tested. |
| C3 | Declared catalog contains only consecutive native-compressible segments, capacity-legal leaves, ordered internal groups, derived right bounds, sibling order and one equal-depth root. | action legality | report §4 | `STATIC_PASS_CONDITIONAL_ON_NATIVE_SERIALIZATION` | Stage A preclaim gate must serialize/read a tiny tree; current result is static. |
| C4 | Open-frontier state covers leaf/segment cuts, internal child grouping, right bounds, height and unresolved event cost. | algorithm completeness | report §6.1–6.2 | `STATIC_PASS` | Closing should search for missing reader state that makes closed-left subtrees relevant. |
| C5 | Canonical accepting paths and declared trees are bijective. | formal guarantee premise | report §6.3 proof sketch | `STATIC_PASS_FOR_STAGE0` | Full formal proof not produced; tiny exhaustive oracle required in Stage A. |
| C6 | Unpruned recurrence returns exact optimum over `T(H)` for frozen scalar proxy. | N2 guarantee | Bellman recurrence + finite state/path-tree bijection | `STATIC_PASS_FOR_STAGE0` | Does not imply wall-clock optimum, all native histories, or scalable runtime. |
| C7 | Complexity is finite and explicit in `n,m,H,C_0,K_l,phi,F`. | feasibility/complexity | report §6.4 | `STATIC_PASS` | Bound may be impractical; frontier explosion is a killer, not hidden. |
| C8 | There are two native-decodable trees with identical leaves/bytes/pages/height but different internal grouping and `dataLocateItem` comparison cost. | action-divergence witness | report §7 | `STATIC_PASS` | Native writer/reader legality still requires tiny serialization; synthetic witness is not natural evidence. |
| C9 | With `N=2K+2`, native full groups `[K,K,2]`; trace groups `[ceil(K/2),K,K+2-ceil(K/2)]`; target `L_{K+1}` is first in the former level-1 page and first binary-search midpoint in the latter. | witness arithmetic | report §7.1–7.3 | `HAND_CHECK_PASS` | Verify exact comparison count using pinned `dataLocateItem` in closing/Stage A. |
| C10 | The two-key event `next_gt(A,r_{K+1})=first(L_{K+2})` causes root descent to `L_{K+1}` then a right step, preserving SQL result. | witness semantics | report §7.2 | `STATIC_PASS_CONDITIONAL` | Tiny native merge replay is required; no observed trace is claimed. |
| C11 | `LOCAL-PARTITION-DP + NATIVE-PARENTS` cannot generate the witness's internal regroup action once leaves are fixed. | strongest subtractor separation | report §7.4 and §8 | `PASS` | If adapted comparator is allowed arbitrary internal regrouping with same guarantee, this separation fails. |
| C12 | Current PG18 may incidentally generate non-full layouts, but no verified current surface supplies complete trace-aware hierarchy exactness. | current collision | `REVISION_AUDIT.md` §§3–6 | `SEARCH_BOUNDED_OPEN` | Not an absence proof; a later same-object source can be direct fatal. |
| C13 | The static proposition, if implemented and naturally supported, has a credible Q2 N2 paper shape. | structural potential | complete action + exact finite guarantee + native witness + finite killer | `TIER_B_Q2_VIABLE_CONDITIONAL` | Q1 not supported; natural headroom and scalability remain untested. |
| C14 | AI can implement decisive extractor/DP/oracle/comparator path. | execution routing | bounded CPU/source route in report §9 | `AI_CORE_CONDITIONAL` | No execution credit from unrun work; estimate remains conditional. |

## Explicit non-claims

| ID | Non-claim | Recorded status |
|---|---|---|
| N1 | Candidate improves natural PostgreSQL workload performance. | `NOT_TESTED` |
| N2 | Candidate writes valid native pages today. | `NOT_IMPLEMENTED_NOT_TESTED` |
| N3 | Candidate beats current PG18 baseline union in full cost. | `NOT_TESTED` |
| N4 | DP scales to large natural posting streams. | `NOT_TESTED__FRONTIER_EXPLOSION_IS_KILLER` |
| N5 | Search found no prior same-object work. | `FORBIDDEN_WORDING`; correct status is `SEARCH_BOUNDED_OPEN` |
| N6 | Full-packing is always poor. | `NOT_CLAIMED`; it is expected to dominate no-skip/full-scan strata |
| N7 | Synthetic two-tree witness is natural evidence. | `FORBIDDEN`; legality/action non-vacuity only |
| N8 | Stage A or Stage B is authorized. | `FALSE__BOTH_UNAUTHORIZED` |

## Atomic gate checklist

| Required element | Location | Result |
|---|---|---|
| current pin `a4c41...` | report §0; audit §3 | PASS |
| layout-independent logical event | report §3 | PASS |
| native-legal finite catalog | report §4 | PASS |
| open-frontier state/transitions/base/legal predicates | report §6 | PASS |
| deterministic reader event evaluator | report §5 | PASS |
| full-cost proxy and vector | report §5.2 | PASS |
| finite complexity | report §6.4 | PASS |
| exact or bounded guarantee | report §6.3, exact unpruned | PASS |
| two-key native-legal two-tree witness | report §7 | PASS |
| complete comparator action/guarantee map | report §8 | PASS |
| implementation/experiment overreach avoided | report §§9–10; non-claims | PASS |

## Final matrix disposition

- Gate status：`CLOSED_STATICALLY`
- Revision decision：`RECOMMEND_STAGE0_PASS_FOR_CLOSING_REVIEW`
- Tier if confirmed：`TIER_B_Q2_VIABLE`
- Evidence ceiling：`STATIC_CURRENT_SOURCE_ALGORITHM_AND_SYMBOLIC_WITNESS_ONLY`
- Next authority：same long-lived D-root confirmation sentry
