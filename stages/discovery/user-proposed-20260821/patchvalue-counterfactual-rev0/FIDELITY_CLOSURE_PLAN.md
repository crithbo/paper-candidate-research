# Finite fidelity closure plan

## Status

`FINITE_FIDELITY_GAP` — the new object is well-defined at the contract level, but no branch/interface claim has been executed or inferred from old PatchYield work.

## Full atomic action

The allocation action is exactly: after a common minimum number of complete calls, select one state `s_i` and grant one extra complete LLM call under the fixed decoder distribution.  The policy may choose only from admitted states whose public prefix is already present.  It does not route, restart, terminate, reorder tools, alter the model/precision, or examine hidden evaluations.  A multi-call arm is an evaluation intervention, not a production scheduler primitive.

## Finite Stage 0 / Stage A closure steps

1. Pin one OpenHands code path and identify the completed-call boundary and serializable state fields listed in `COUNTERFACTUAL_IDENTIFIABILITY_AUDIT.md`.
2. Define `omega`: exact temperature/top-p policy and a finite seed schedule randomised independently of state/repository/final label.  This must be a new PatchValue config, never an implicit reuse of PatchYield's temperature-zero deterministic request seed.
3. Specify copy-isolated stop and `h`-call branch construction, including writeable worktree/container separation, read-only model/image sharing, per-arm evaluator reset, and handling of timeouts/tool errors.
4. Produce a small non-claim-bearing legality witness: common-prefix hashes equal; branch seeds/worktrees distinct; hidden evaluator records only terminal labels; no arm reads another arm's post-state output.
5. Freeze a repository-disjoint state-sampling and train/calibration split.  Pre-register exact estimand metrics (conditional calibration, ranking/LCB allocation, fixed total full-cost) and all comparator implementations.
6. Before claim-bearing work, reject the allocation claim if the branch protocol changes object semantics, exposes hidden information, omits clone/evaluator/tool cost, or cannot separate a treatment-effect estimate from a terminal-success classifier.

## Full-cost denominator

`C_total` includes state preparation; common-prefix cost reported separately but not double-counted; every arm's prefill/decode/KV work; GPU allocation and active time; CPU/tool/container time; snapshot/clone/restore I/O and storage; native evaluator/harness time; predictor/allocator compute; cancelled/failed/timeout branches; and retained artifact bytes.  Success is reported as final evaluator pass per fixed total `C_total` and fixed total complete-call budget, with all branch arms included.

## 72-hour first evidence and structural failures

The first legal 72-hour evidence task is the small branch-isolation witness, not a performance comparison.  It fails closed if snapshot replay is not semantically identical through the branch point, branch randomness is not precommitted and independent, evaluator labels leak to the policy, or the allowed action becomes a router/restart/early-stop controller.  If that witness closes, the next falsifier is repository-held-out incremental calibration versus the named feature baselines; no such run is authorized here.
