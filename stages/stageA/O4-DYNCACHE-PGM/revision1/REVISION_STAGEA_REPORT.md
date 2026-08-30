# O4-DYNCACHE-PGM Stage A Revision Report

- Decision: `STOP_RECOMMENDED`
- Quality tier: `BELOW_Q2_STOP`
- Revision: consumed `1/1`; no same-ID revision remains
- Atomic gate: `LEAF_LOCAL_NONVACUITY_AND_BTREE_ABSORPTION_GATE`
- Evidence ceiling: `NEGATIVE_ABSORPTION_RESULT`
- Stage B authorization: false
- `stageb_user_approval_id`: null

## Frozen revision contract

`REVISION_EXPERIMENT_CONTRACT.yaml` was frozen before execution at SHA-256 `30573f7275434c9241db4925fc2ca74ef1130cee256b4f921f44d31a70cd94ce`. It preserves the first-round key/object, strict predecessor, exact closed range, `capacity=4`, `ε=1`, atomic old/new publication, update information, and local full-cost ledger.

The predeclared PASS rule required at least one reachable or natural case where PDEC supplies a guarantee or fully priced metric outside both the plain COW B+tree and affine-hint B+tree control frontier. The predeclared STOP rule required stopping if the affine control absorbs every PDEC transition and guarantee with the same cost vector.

## Atomic-gate result

The STOP trigger fired exactly:

- 13,640 joint reachable states;
- 218,240 exhaustive update cases;
- 218,240 PDEC transitions reproduced by the affine-hint B+tree frontier;
- 0 PDEC transitions outside that frontier;
- 0 PDEC-specific residual cases;
- 641/641 natural replay transitions likewise absorbed;
- zero semantic or accounting failures.

The result was reproduced twice independently and all original/replay outputs matched byte-for-byte.

## Why a visible transition difference is not a contribution residual

PDEC can split a four-key page before capacity overflow when its endpoint affine residual exceeds `ε`. For `(0,1,2,7)`, PDEC produces `(0,1)|(2,7)` while a default capacity-only B+tree keeps one page. That difference is not unique: a B+tree leaf carrying the identical affine hint has the identical information and split repertoire, and can take exactly the PDEC split to inherit exactly the same no-fallback certificate.

The affine control then has the same state, exact semantics, certificate, query behavior, page touches, page writes, metadata, certificate evaluations, rebuilt slots, and peak auxiliary bytes as PDEC. Renaming that guarantee-preserving B+tree policy as PDEC does not create N1 or N2 substance.

## PDEC-specific guarantee audit

- `G1_CERTIFIED_NO_FALLBACK`: inherited by the affine-hint control. It is also non-discriminating at capacity four: PDEC reaches a four-slot candidate window and three exact comparisons, the same worst-case local search width/comparison bound as a full leaf.
- `G2_LOCAL_CAPS`: all controls attain the same `4 touches / 2 auxiliary pages / 5 rebuilt slots` maxima; these caps are not PDEC-specific.
- `M1_FULLY_PRICED_FRONTIER`: no PDEC point exists outside the affine-control frontier.

Therefore the initial leaf certificate plus COW publication mechanism is absorbed. The gate did not authorize adding a new global directory, deferred-credit system, or performance objective after seeing this result.

## Full-cost and negative-region result

The local ledger includes route, old read, new writes, payload bytes, affine metadata, certificate evaluations, rebuilt slots, auxiliary images/bytes, committed pages/bytes, candidate slots, exact comparisons, and fallback counts.

On the natural OSM replay, PDEC ends with 295 leaves and 82,600 committed bytes versus plain COW's 281 leaves and 71,936 bytes. PDEC also records 2,212 aggregate logical page touches versus 2,198 and writes 3,584 more payload bytes plus 22,392 metadata bytes. The affine-control frontier exactly matches every PDEC figure. No timing inference is drawn.

The negative region is structural: early certificate splits can increase pages and write cost while the frozen query window remains full-leaf width. Default-affine fallback avoidance does not rescue the claim because the same affine control can enforce the certificate at identical PDEC cost.

## Same-object and claim-honesty audit

- Same object: preserved.
- Information/action fairness: preserved; the affine control has the same leaf keys, summary, split repertoire, and atomic publication.
- Natural input: identical frozen OSM diff and mapping.
- Exact semantics: zero failures in all runs.
- Full local cost: explicitly charged; no weighted score used.
- Reproducibility: original plus two byte-exact replays.
- Claim ceiling: no theorem, global index, performance win, or paper claim is asserted.

## Q1/Q2 calibration consequence

The problem neighborhood remains important, but this same-ID mechanism has no non-absorbed contribution kernel. FITing-Tree and the minimum affine-hint B+tree control already occupy the leaf-level affine/error-policy space needed to reproduce the tested behavior. A hypothetical new global object or different mechanism cannot be introduced as another revision of this stopped candidate.

Calibration status becomes `PARITY_NOT_PLAUSIBLE`; quality becomes `BELOW_Q2_STOP`. This is a scientific STOP caused by strong-control absorption, not a resource reserve or evidence-readiness delay.

## Supported and unsupported conclusions

Supported:

- the three implementations are exact on the frozen finite and natural inputs;
- PDEC's current leaf transition is fully contained in the affine-hint B+tree action/guarantee frontier;
- the `4/2/5` caps and no-fallback certificate do not supply a unique residual;
- the negative result is deterministic and reproducible.

Unsupported:

- any claim about a newly designed global directory or deferred-credit mechanism;
- any end-to-end performance conclusion;
- any assertion that all possible page-aware dynamic learned indexes are impossible;
- any paper main claim.

## Required disposition

Submit this revision package to mainline as `STOP_RECOMMENDED`. Do not pivot, revise again, rename-revive the candidate, request Stage B review, or start Stage B. A genuinely different object or research question would require a new ID and new upstream process.
