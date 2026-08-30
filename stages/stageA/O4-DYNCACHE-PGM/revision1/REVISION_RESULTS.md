# O4-DYNCACHE-PGM Stage A revision results

## Material Passport

- Origin Skill: `academic-research-suite / experiment-agent`
- Origin Modes: `plan → run → validate`
- Origin Date: 2026-08-09
- Verification Status: `VERIFIED`
- Version Label: `o4_pdec_stagea_revision1_v1`
- Atomic gate: `LEAF_LOCAL_NONVACUITY_AND_BTREE_ABSORPTION_GATE`
- Frozen contract SHA-256: `30573f7275434c9241db4925fc2ca74ef1130cee256b4f921f44d31a70cd94ce`

## Controls and interpretation

The revision implements exactly two controls on the unchanged object:

1. `PLAIN_COW_BTREE_LEAF`: capacity-only copy-on-write leaf maintenance and exact full-leaf binary search.
2. `BTREE_LEAF_WITH_AFFINE_HINT`: the same leaf with the same 24-byte endpoint affine summary available to PDEC. Its default policy keeps a capacity-feasible page and falls back when the hint is uncertified. Its absorption frontier may choose the same certificate-triggered split as PDEC when asked to inherit PDEC's guarantee.

The absorption-frontier policy is not a third research control. It is the fair best response of the affine-hint control under the contract's same-information and same-action rule. A PDEC result counts only if this control cannot reproduce it.

## Exhaustive joint-state result

The checker closed the joint reachable graph of plain COW, affine-hint default, affine-hint absorption frontier, and PDEC under every insert/delete over keys `0..7`.

| Metric | Result |
|---|---:|
| Joint reachable states | 13,640 |
| Joint update cases | 218,240 |
| PDEC transitions inside affine-control frontier | 218,240 |
| PDEC transitions outside affine-control frontier | 0 |
| PDEC-specific residual cases | 0 |
| Predecessor checks per mechanism | 136,400 |
| Range checks per mechanism | 491,040 |
| Semantic/accounting failures | 0 |

The result is complete for the frozen finite model: every PDEC state, contiguous partition action, local guarantee, and update cost vector was reproduced by the affine-hint B+tree control's guarantee-preserving policy.

### First default-policy difference and why it does not pass

The shortest difference is:

`insert 0 → insert 1 → insert 2 → insert 7`

- Plain COW/default affine leaf: one page `(0,1,2,7)`.
- PDEC: two pages `(0,1)` and `(2,7)` because the four-key affine residual exceeds `ε=1`.
- Affine-hint absorption frontier: exactly the same two pages as PDEC, using the same leaf keys, certificate, split action, and publication rule.

Fully priced update cost at the differentiating step:

| Cost | Plain COW | PDEC | Affine-control frontier |
|---|---:|---:|---:|
| Logical page touches | 3 | 4 | 4 |
| New leaf images | 1 | 2 | 2 |
| Payload bytes written | 256 | 512 | 512 |
| Affine metadata bytes written | 0 | 48 | 48 |
| Certificate key evaluations | 0 | 4 | 4 |
| Peak auxiliary bytes | 256 | 560 | 560 |

This is a real default-policy difference but not a non-absorbed mechanism residual. The affine control inherits the PDEC state and guarantee at identical full local cost.

### Predeclared guarantee and metric outcomes

| Predeclared item | Outcome | Gate effect |
|---|---|---|
| `G1_CERTIFIED_NO_FALLBACK` | PDEC has no fallback, but the affine-control frontier has the identical certificate and zero fallback. PDEC's maximum candidate window is still 4 key slots with 3 comparisons, equal to a full capacity-4 leaf. There are 8,598 PDEC query instances violating the strict `<4` candidate-slot requirement. | Absorbed and locally vacuous as a strict search bound |
| `G2_LOCAL_CAPS` | All mechanisms reach the same maxima of 4 logical touches, 2 auxiliary pages and 5 rebuilt slots. | Inherited by controls |
| `M1_FULLY_PRICED_FRONTIER` | PDEC and the affine-control frontier have identical transition, state, query-guarantee and cost vectors on every case. | Zero unique points |

Across the reachable graph, PDEC differs from plain/default-affine state on 187,029 update events, but is absorbed on every one. It has more pages than plain on 64,904 events and writes more payload bytes on 14,496 events. These are negative regions, not a benefit hidden by averaging.

## Natural replay result

The unchanged OSM sequence `7,235,045` and input SHA-256 `4b09084d3f08676f152203d38ea340649c8eb34a6daf89d185baebf433ca3fe5` were replayed with the first-round mapping and observed-window semantics.

| Metric | Result |
|---|---:|
| OSM create / modify / delete events | 506 / 135 / 10 |
| Effective updates | 639 |
| Same-key or unobserved-delete no-ops | 12 |
| PDEC transitions tested against affine frontier | 641 |
| PDEC transitions outside affine frontier | 0 |
| Semantic/accounting failures | 0 |

PDEC and the affine-control frontier were again identical. Against plain COW, the natural negative region was measurable:

| Full local metric | Plain COW | Affine default | PDEC = affine frontier |
|---|---:|---:|---:|
| Final leaf pages | 281 | 281 | 295 |
| Final committed total bytes | 71,936 | 78,680 | 82,600 |
| Aggregate payload bytes written | 235,264 | 235,264 | 238,848 |
| Aggregate affine metadata bytes written | 0 | 22,056 | 22,392 |
| Aggregate logical page touches | 2,198 | 2,198 | 2,212 |
| Maximum query candidate slots | 4 | fallback/full-page possible | 4 |

PDEC therefore uses 14 additional leaf pages and 10,664 additional committed bytes over plain COW on this input, without a strict sub-page candidate bound. This does not establish an end-to-end slowdown—the revision did not benchmark time—but it closes the declared local cost vector negatively.

The natural stream still contains no effective deletion because the frozen observed window lacks an initial snapshot. No delete robustness claim is made.

## Double replay validation

The original result plus two independent deterministic replays matched byte-for-byte:

| File | Original | Replay A | Replay B | Verdict |
|---|---|---|---|---|
| `exhaustive.json` | `b47573cd39a1b720c1dce2aeced4ea76635a1dff9a8118625210d53192010269` | same | same | exact |
| `natural.json` | `e376e6fdcdb4b15d527db3ad4e49cad11ade530a56b1c00974fda4b67623713b` | same | same | exact |

- Reproducibility verdict: `REPRODUCIBLE`
- Decision stability: `STOP_RECOMMENDED` in all six result executions
- Statistical fallacy scan: not applicable; this is deterministic closure and exact vector equality, not inferential statistics.

## Decision

The controls absorb all current PDEC leaf behavior and no bounded same-object residual exists. Under the frozen revision rule, the result is `STOP_RECOMMENDED` with evidence ceiling `NEGATIVE_ABSORPTION_RESULT`. It is not `PRELIMINARY_SUPPORT`, and it does not establish or test a different global-directory research object.
