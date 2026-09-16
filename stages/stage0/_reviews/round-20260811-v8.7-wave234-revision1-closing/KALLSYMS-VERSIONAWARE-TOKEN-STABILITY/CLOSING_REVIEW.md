# KALLSYMS-VERSIONAWARE-TOKEN-STABILITY — revision1 independent closing review

## Frozen assignment and result

- Assignment: `STAGE0-C2-20260811-KALLSYMS-VERSIONAWARE-TOKEN-STABILITY-REVISION1-CLOSING-V8.7`
- Role: independent Stage 0 closing; revision1 is already consumed (`1/1`).
- Decision: `INCONCLUSIVE_POLICY_HOLD`
- Stage 0 tier: `TIER_B_Q2_VIABLE__UNCONFIRMED_AFTER_CONSUMED_REVISION`
- StageA/B authorization: `false` / `false`
- Evidence ceiling: static-contract review only. No implementation, native run, natural gain, or Stage A observation was requested or used as a negative inference.

## Input integrity

The frozen controls matched the assignment: `AGENTS.md` `66231F71EF6AB250A1AD9FF576D5840978F09EFC03BF5D2F0527D47F4D82B063`, `plan.md` `DDC952F74B521F04DA1AE30B87579F568115CD547B7800D98FAD8376B6021D86`, `registry.yaml` `93A78237BE35374F5D4C60B8D49BFA655C83331FADDCC9197BCB913C3276C278`, and `ROLE_STAGE0_REVIEW.md` `741EC3544797FF8A5BF337E1E3448B5F683823E5229F818F162834400581626E`.

The supplied PRIMARY (`4/4`), confirmation (`2/2`), and revision1 (`4/4`) package hashes were read as frozen inputs. Latest-collision status remains `SEARCH_BOUNDED_OPEN`; no transport or retrieval failure is treated as evidence of absence.

## Independent closing attack

### 1. Same-object and fixed-point contract

`ONLINE_FIXED_PREDECESSOR` is a defensible same-object framing when the installed predecessor image is fixed and the target is regenerated through the stock kallsyms object, the native `link-vmlinux` iterative relink/regeneration sequence, and its final map check. It does not replace the reader, post-process the produced image, or bypass the fixed-point pipeline.

The revision's `R0(M)` restriction is also a static, sufficient way to keep the link-sensitive object features fixed: stock section sizes, alignment, relocations, and symbol layout are preserved, while the actual kallsyms payload may differ. Therefore it is not, on its face, a changed-object or custom-codec construction. Its being a narrow subgrammar is an evidence-ceiling restriction, not a Stage 0 failure merely because its natural density remains for Stage A to test.

### 2. LKF state, guarantee, and honesty

The stated bounded-conflict frontier contains token/slot ownership, replacement-run, name/ULEB/marker/table-index residue, predecessor-window delta state, and exact cost vector. For the explicitly restricted `R0` grammar, that is a plausible target-specific exact dynamic-programming contract rather than a claim that a generic ILP has solved arbitrary kallsyms layout. The stated complexity is appropriately conditional and exponential in the retained boundary; a width-cap overflow is declared as a certified non-positive result, not hidden as polynomial/FPT performance.

This supports a finite static route, but it does not alone establish an unabsorbed N2 contribution. That requires a legal action or certified frontier point outside the complete fair baseline union.

### 3. Decisive closing defect: the supplied witness lies inside the declared strong union

Revision1's only concrete byte-mechanical action-divergence witness assigns predecessor token slots `254 -> ab` and `255 -> xy`; the stock target greedily assigns `255 -> ab` and `254 -> xy`; LKF restores `255 -> xy` and `254 -> ab`. Its claimed `8` versus `15` local delta-byte arithmetic follows from retaining predecessor slot identities.

But the revision's own comparator union includes a same-information finite **predecessor-token-stability heuristic grid**. That comparator receives the same predecessor and target names, and its stated purpose is exactly to preserve/reuse legal predecessor token identities. No restriction in the revision excludes the displayed `ab/xy` reassignment from that policy. Consequently, the witness is a valid contrast with stock greedy token assignment, but it is not evidence that LKF reaches an artifact outside the declared current-plus-fair strong union. The subsequent VCDIFF/other binary-delta comparison cannot restore the missing separation: it compares the same LKF artifact that the stability comparator can already emit.

Thus the revision fails the atomic gate conjunct requiring a native-realizable divergence witness that the complete same-information union cannot express. The `8 < 15` calculation is not a natural-benefit claim, and it is not rejected for lacking execution; it is rejected because its proposed comparator separation is statically false on the revision's own definitions.

### 4. Why this is not a scientific STOP

The defect establishes that the supplied witness cannot certify the claimed residual. It does **not** establish that every legal `R0` LKF frontier point is reproducible by the finite predecessor-stability grid, by stock per-version optimization plus a binary delta, or by another current same-object component. Nor is there a formal impossibility result for the complete bounded-conflict construction.

Accordingly, a conclusion of `REVISE_NOT_ALLOWED_AND_STOP` would overstate the evidence: it would require direct absorption or a same-object/formal failure of the entire LKF mechanism, not merely the failure of its sole supplied separation witness. Conversely, `CONFIRM_STAGE0_PASS` is unavailable because the gate's required union-external witness is unclosed.

Revision1 has already consumed the only scientific revision. Under the frozen Stage 0 rule, this exact state—no credible PASS and no demonstrated scientific STOP—must be recorded as `INCONCLUSIVE_POLICY_HOLD`, without inventing a second revision, moving to Stage A, or reclassifying missing experiments as negative evidence.

### 5. Stage A killer route

The 20-tag, two-configuration plan is finite and reproducible in form: it can check native fixed-point fidelity, `R0` coverage, exact-tiny-oracle agreement, full planner/link/delta cost, and Pareto separation against the strongest union. It would be an appropriate first preclaim route only after a valid Stage 0 certificate exists. It cannot cure the present static union-separation defect, and this closing does not authorize Stage A.

## Mechanical disposition

`INCONCLUSIVE_POLICY_HOLD` is the only justified disposition. Mainline should record the hold and leave the candidate outside Stage A/B. Any later exception revision, reformulation, or withdrawal requires explicit user/mainline authority; this lane must not create one automatically.
