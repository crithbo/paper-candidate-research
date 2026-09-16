# LLVM-RVV Revision 1 Claim Matrix

| ID | Claim or obligation | Status | Static basis | Ceiling / killer |
|---|---|---|---|---|
| C0 | Same pinned MachineIR/VLEN/ABI/semantics | `CLOSED_STATIC` | fixed post-ISel trace, `VLEN=128`, RVV features, liveness, VTYPE/VL, ABI/frame and terminal boundary | any changed program, vectorizer, ISA, VLEN, ABI or output contract fails |
| C1 | Complete landed current action catalog | `CLOSED_AS_STATIC_SPEC` | pinned five LLVM source blobs, options, allocator/group/mask/whole-spill/vset/scalar/PEI/MC paths | Stage A action-table omission fails preclaim fidelity |
| C2 | Typed partial spill is not current-native | `CLOSED` | PR #105661/RFC kept as unlanded direct subtractor and guarded candidate action | relabeling it native or novel is fatal |
| C3 | Witness forces pressure | `CLOSED_STATIC_CAPACITY` | 3 full `VRM8NoV0` groups + live `v0` + 8 ordinary-`VR` fractional values leave 7 singleton registers | any liveness/class/rematerialization/placement escape kills witness |
| C4 | At least two legal same-object plans | `CLOSED_STATIC__REPLAY_REQUIRED` | current whole spill and guarded typed spill preserve same values/VTYPE/ABI boundary | native MIR/semantic replay mismatch kills action divergence |
| C5 | Separation from strengthened sequential comparator | `CLOSED_AS_ACTION_PROPOSITION` | B2 cannot reopen an irrevocable current victim; joint constructor may compare another victim with exact vset costs | if B2 has same joint action at equal information/budget, residual is absorbed |
| C6 | Complete future-action/cost preserving quotient | `CLOSED_STATIC` | only recursively certified RVV dyadic subtree/block swaps; value, slot, mask and VTYPE identities retained | first successor, legality, cost or terminal mismatch kills certificate |
| C7 | Nontrivial target-specific N2 | `SUPPORTED_CONDITIONAL` | exact dyadic-orbit Pareto DP, factor-up-to-`3!` canonical formal family, explicit degeneration | singleton-only canonical/natural behavior or generic-solver collapse removes N2 |
| C8 | Exact/FPT/frontier guarantee | `CLOSED_STATIC_PROPOSITION` | bisimulation induction, explicit state and output-sensitive complexity in `(w,h,g,D,M,Z,F,p,Q)` | oracle/frontier mismatch or hidden state invalidates guarantee |
| C9 | Current strongest union does not directly absorb paper kernel | `SEARCH_BOUNDED_OPEN` | current/B2/B3/B4 roles separated; no identical direct source in accepted bounded audit | later direct source or B2 equal-action proof can stop topic |
| C10 | Natural traces retain nontrivial orbits/Pareto residual | `UNKNOWN_STAGEA` | finite public LLVM/canonical route only | no natural state/frontier/full-cost residual kills direction |
| C11 | Performance or compile-cost gain | `NOT_CLAIMED` | no run performed | cannot support Stage A/B or paper-result claim |
| C12 | Q2 structural potential | `SUPPORTED_CONDITIONAL` | target-specific exact algorithm, forced witness, strongest union and finite killers | survives only after Stage A fidelity and scientific killers |

## Gate disposition

`SOUND_RVV_TRACE_ACTION_AND_QUOTIENT_CERTIFICATE = STATICALLY_CLOSED`.

This consumes Stage 0 revision `1/1`. It supports only `RECOMMEND_STAGE0_PASS_FOR_CLOSING_REVIEW`, conditional `TIER_B_Q2_VIABLE`. It does not authorize Stage A/B or claim implementation, native output, natural benefit, or completed proof.

