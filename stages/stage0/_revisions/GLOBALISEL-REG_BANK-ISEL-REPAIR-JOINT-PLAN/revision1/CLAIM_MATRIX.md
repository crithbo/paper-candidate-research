# Claim matrix — revision 1

| Claim | Static support | Ceiling | Falsifier / guard |
|---|---|---|---|
| AArch64 has legal equal-cost GPR/FPR alternatives for the declared s64 load/OR forms | pinned RBI source action tables | source-level fact | source pin/action table replay disagrees |
| Current Fast/Greedy does not build the witness joint plan | pinned RPOT + strict comparison + local-repair source logic | static, one declared witness | native replay emits `P_joint` or a legal stock action reconstructs it |
| `A64-RBI-FDP` is exact for the declared RBI/repair/planner cost frontier | action-to-path/path-to-action argument and finite recurrence | theorem only for stated grammar/width | missing catalog action, interface-preservation counterexample or oracle disagreement |
| Later pipeline cost is preserved as an evaluation contract | fixed boundary identity/ABI and interface record | no quantitative claim | downstream RA/frame/scheduling/MC parity or full-cost killer fails |
| Paper potential is Tier-B conditional | nonlocal native action plus target-specific FPT structure | conditional Stage0 potential only | closing reviewer finds union absorption or invalid proof |

## Explicit nonclaims

- No compiled output, runtime, code-size, register-pressure, spill or corpus
  result is claimed.
- The theorem does not establish final physical register-allocation optimality.
- Generic ILP/CP, arbitrary bank permutation, local-cost tuning, copy-count
  optimisation and a different target/GMIR/ABI are outside the method.
- `SEARCH_BOUNDED_OPEN` is not an assertion that no direct literature exists.

