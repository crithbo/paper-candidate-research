# LLVM-RVV-GROUP-MASK-SPILL-PARETODP Revision 1 Closing Review

- Assignment: `STAGE0-C2-20260811-LLVM-RVV-GROUP-MASK-SPILL-PARETODP-REVISION1-CLOSING-V8.7`
- Role: long-lived D-root `STAGE0-CONFIRMATION-SENTRY / CLOSING`
- Decision: `CONFIRM_STAGE0_PASS`
- Quality: `TIER_B_Q2_VIABLE` (conditional)
- Confidence: `0.83`
- Evidence ceiling: `E0-H_STATIC_PINNED_CURRENT_SOURCE_AND_FORMAL_CONSTRUCTION__NO_IMPLEMENTATION_NATIVE_OUTPUT_OR_RESULT`
- Revision budget: `1/1 CONSUMED`; no second revision is created or requested
- Latest-collision status: `SEARCH_BOUNDED_OPEN`
- Stage A/B authorized or created: `false / false`
- Experiment, benchmark, candidate implementation, or automation run: `false`

## Closing disposition

The revision closes the single gate `SOUND_RVV_TRACE_ACTION_AND_QUOTIENT_CERTIFICATE` well enough for a conditional Stage 0 pass. The result is not based on missing implementation or hoped-for natural gains. It rests on a statically definable same-object action grammar, a forced-capacity witness, an honest landed/unlanded action boundary, a conservative future-action-and-cost bisimulation, an exact bounded-trace Pareto algorithm, and finite Stage A fidelity killers.

No reviewed material establishes direct absorption, same-object failure, a legal capacity escape, or a formal contradiction. Accordingly, `BELOW_Q2_STOP` would exceed the negative evidence. `INCONCLUSIVE_POLICY_HOLD` is also unwarranted: the proposition and its finite closure route are defined without requiring a second scientific revision. Mainline may mechanically register the Stage 0 pass; this lane does not perform that state change.

## Independence and packet integrity

This reviewer did not author the RVV PRIMARY or revision1. The earlier confirmation found the original PRIMARY insufficient and required the certificate now under closing review; that prior finding was treated as an attack surface, not as inherited acceptance.

Revision1 canonical packet verification:

| File | Recomputed SHA256 | Result |
|---|---|---|
| `REVISION_REPORT.md` | `6EEBF0F58BB56AAFDC978191DC1ECBCE6E6A1E05765C51C1B1CD6D7C901479F0` | PASS |
| `CURRENT_ACTION_AND_QUOTIENT_AUDIT.md` | `1662A2FBB9C61C36C721A7FE39C1DF8934BB6F7A663BBFE14F8EF9D7D6296C0F` | PASS |
| `CLAIM_MATRIX.md` | `A9B5C690C7B967AA58D29DA1068DF11F87B989A298B589BE576AE2D99F0AB81B` | PASS |
| `handoff.yaml` | `DD82230F5DC9B96185EB7DDA6723D5F41B9A2D33D098EFCEB7D9E73C754984D8` | PASS |
| manifest self | `7DC46A511E39C2C6482C8B5DD12A1177B60DADB88146EBA8FD4E044808A0C59A` | 4/4 PASS |

## Independent technical attacks

### 1. Forced pressure is mechanically valid at the frozen class boundary

The witness uses three pairwise-live, full-lane `VRM8NoV0` values. With aligned LMUL8 starts and the `NoV0` restriction, their only three simultaneous placements are the non-v0 groups rooted at `v8`, `v16`, and `v24`, covering `v8...v31`. A live physical mask occupies `v0`. The eight pairwise-interfering fractional-LMUL values are frozen to current LLVM's ordinary one-physical-register `VR` class; they therefore cannot be packed as independent fractional slices of a single physical register. Only `v1...v7` remain, so eight one-register demands exceed seven leaves.

This is a capacity proof, not a claim that an already-run Greedy allocation selected a particular victim. It remains valid only under the explicitly frozen full-lane/group liveness, ordinary-`VR` class, pairwise interference, and no-rematerialization/no-legal-split escape. Native MIR replay of those facts is the first fidelity obligation; any contrary class, subrange, placement, or rematerialization behavior kills the witness.

### 2. Whole spill and typed partial spill are separated honestly

Current whole-register spill/reload is in the pinned landed action catalog. Typed partial spill/reload from PR `#105661` is not landed at LLVM commit `5bb2565693f062a9e99929db1814a7a076d4dc76`. The revision consistently assigns it the dual role `UNLANDED_DIRECT_SUBTRACTOR_AND_GUARDED_CANDIDATE_ACTION`; it neither calls the action native nor claims the typed action itself as novelty.

The same-object proposition may include this proposed, semantics-preserving action because its type/lane/memory/VTYPE guards and output boundary are frozen. However, legality and semantic replay are still unobserved. Failure of the guarded lowering or rejoin boundary is a scientific Stage A killer, not evidence already available at closing.

### 3. The quotient is sound by conservative certification, not by occupancy similarity

The revision does not merge semantic values, spill slots, VTYPE/VL states, or masks. A physical dyadic-subtree or eight-register-block swap is admitted only after equality of the complete suffix action/legality/cost relation, including `v0`/`NoV0`, aliases and subranges, fixed uses, mask copies, whole/typed spill eligibility, frame/ABI obligations, VTYPE transitions, terminal roles, and all declared cost coordinates. The inverse swap supplies the reverse transition, so the stated equivalence is a strong cost-preserving bisimulation for the frozen finite grammar.

This certificate is deliberately fail-closed. Register-order hints, ABI roles, fixed uses, or any register-specific cost must split a class; a failed tuple check falls back to singleton states. That fallback preserves exactness but not paper novelty. The formal symmetric family can merge up to the `3!` placements of three indistinguishable non-v0 LMUL8 blocks when the complete suffix truly leaves them symmetric. It does not establish that such orbits occur frequently in natural traces.

### 4. Exactness and complexity are supportable with a narrow claim ceiling

Enumerating the complete legal macro-actions from the exact labeled state, canonicalizing only under the certified bisimulation, and Pareto-pruning cost labels yields the exact frontier for the frozen bounded acyclic trace grammar. It does not yield whole-CFG or universal register-allocation optimality.

The reported runtime is exponential through the quotient-state and frontier terms. Calling it output-sensitive FPT is acceptable only with `(w,h,g,D,M,Z,F,p,Q)` retained explicitly as parameters and with polynomial dependence claimed only in trace length `n`. Fixed `R=32` and singleton fallback cannot be marketed as an asymptotic speedup. If canonical or natural instances collapse to identity enumeration, or if a same-information generic exact method matches the construction without target-specific reduction, the Q2 N2 residual disappears.

### 5. Comparator union and residual are conditionally adequate

The frozen union includes complete current LLVM, a strengthened current-victim plus guarded typed sequential transform, the same-action labeled exact DP, and exhaustive/CP/ILP/Unison-style exact subtractors. This prevents wins from omitted vset/PEI behavior, typed-spill relabeling, or a generic solver reformulation.

The remaining paper kernel is narrow: an RVV-specific exact Pareto constructor with a certified dyadic physical-state quotient and joint victim/representation/VTYPE decisions. The sequential separation is valid only while the comparator's prior victim decision is genuinely irrevocable. If an equal-information, equal-budget sequential/current union can reopen the victim and expose the same frontier, direct absorption follows and the topic must stop.

## Evidence ceiling and first Stage A preclaim gate

Stage 0 supports only conditional paper potential. It does not support a native output, current Greedy victim claim, typed-spill implementation, natural orbit incidence, compile-time improvement, spill reduction, runtime benefit, or Q1 claim.

Before any claim-bearing Stage A observation, one fidelity gate must close all of the following as a single fail-closed packet:

1. hash-complete pinned current/proposed action catalog, including current allocator, mask, whole-spill, vset, scalar RA, PEI, MC, and all relevant controls;
2. MachineVerifier-valid MIR witness proving the three `VRM8NoV0` groups, live `v0`, eight ordinary-`VR` fractional values, exact subranges/kills, and absence of placement/rematerialization escape;
3. assembler/disassembler plus independent semantics/live-out/VTYPE/ABI checks for whole and guarded typed plans, with typed spilling labeled unlanded;
4. exhaustive tiny-instance equality of labeled and quotient successor/action-cost multisets and exact Pareto frontiers;
5. parity against B1/B2/B3/B4 at identical trace information, actions, budgets, and full-cost coordinates, including replay of the frozen current victim boundary.

Only after that gate may natural LLVM RVV traces be used to test orbit incidence, frontier residual, planner CPU/RSS, text bytes, vset/mask instructions, spill traffic, scalable frame/save-restore cost, failures, and fallback.

## Scientific killers retained

- any legal placement, class, subrange, split, or rematerialization escape from the `8 > 7` cut;
- typed-action legality, semantics, or rejoin failure;
- any quotient successor, legality, VTYPE/VL, ABI/frame, terminal, or cost mismatch;
- B2 or another fair equal-information union reopening the victim and exposing the same frontier;
- identity/singleton degeneration on the formal witness or preregistered natural-incidence threshold failure;
- generic exact-method collapse without a material RVV-specific reduction;
- no residual after complete full-cost accounting.

These are finite Stage A killers. Their results are currently unknown and cannot be promoted into either positive evidence or a Stage 0 STOP.

## Provenance and bounded search

The user-frozen closing controls were `AGENTS.md=66231F71EF6AB250A1AD9FF576D5840978F09EFC03BF5D2F0527D47F4D82B063`, `plan.md=430CC062F264BB84CF7D77293AD6227952E31AD64934FE17294ADDF5BE3D18D9`, `registry.yaml=F32AC0D5E49C0C8A43C14727A4A2FF7F77DC375C18A99825EAB0E5644A3E777E`, and `ROLE_STAGE0_REVIEW.md=741EC3544797FF8A5BF337E1E3448B5F683823E5229F818F162834400581626E`. At this lane's read time, `AGENTS.md` and the role matched, while mainline had concurrently advanced plan to `865E072C5B24986982B4B0578EB08C9A89E3942A62BD03A74DE5EECA697DF393` and registry to `0EAB8EFB94A0C63FE114074F6A744E8620EE87B44F29A591BD2E61CFCC4C240F`. The current registry still matched this exact active assignment, unique write directory, reviewer independence, and `StageA/B=false`. The frozen scientific contract was retained; no shared file was modified.

No new retrieval was started in this closing. The accepted pinned first-party packet is the source basis. Unclosed latest collision remains `SEARCH_BOUNDED_OPEN`; transport failure is not used to infer absence.

This verification round ran on the same model family that drove the revisions; over-optimization to this judge's latent biases is possible (Ren et al. 2026, arXiv:2607.13104 §8.1.2).

## Stage 0 repair vector

`NO_MATERIAL_REPAIR`. Revision1 materially repaired the prior witness/state-certificate defects. This closing narrows the evidence ceiling and preserves replay, quotient, direct-absorption, degeneration, natural-incidence, and full-cost killers; it does not introduce another revision.

## Final decision

`CONFIRM_STAGE0_PASS / TIER_B_Q2_VIABLE / confidence 0.83`.

Mainline owns the state transition. This lane returns to `IDLE_REUSABLE_AWAITING_MAINLINE`; Stage A/B remain false here.
