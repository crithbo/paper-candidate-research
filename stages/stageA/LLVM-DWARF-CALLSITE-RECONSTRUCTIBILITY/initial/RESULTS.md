# Results

## Outcome

`BLOCKED_USER_ACTION_REQUIRED` at the pre-claim resource/fidelity gate. There are zero claim-bearing observations and zero scientific runs.

## Mechanical observations

| Observation | Result | Scientific use |
|---|---|---|
| Frozen upstream hashes | 8/8 match | establishes input continuity only |
| Frozen controls | AGENTS, plan, role and templates match | establishes rule/template continuity only |
| Live registry | hash drifted; active lane/assignment/topic/write directory and StageB=false match | accepted as post-dispatch mechanical drift |
| Exact LLVM `e72ba6…` source/toolchain | not found locally | resource blocker only |
| PATH LLVM tools | `clang`, `llc`, `llvm-dwarfdump` absent | resource blocker only |
| Other local LLVM builds | version/commit or target mismatch | explicitly not run on witness |
| Existing Linux execution route | WSL distro absent; no route found | executable-behavior check unavailable |
| Network/download/build/install | none | contract compliance |

## Claim-bearing result table

| Run | Classification | Witness | Candidate | Current union | Result |
|---|---|---|---|---|---|
| none | no run | not materialized | not run | not run | no scientific inference |

The frozen A/B call-site hypothesis, native legality, current-union residual, exact Pareto frontier, natural prevalence and full-cost dominance all remain unresolved.

## Cost and resource accounting

- Network: 0 requests and 0 bytes.
- Downloads: 0 bytes.
- Builds/installations/environment edits: none.
- GPU/exclusive device: none.
- Claim experiment CPU/wall/RSS: not applicable because none was started.
- Diagnostic command CPU/RSS: this execution environment did not provide exact aggregate statistics; no estimate is made.
- New candidate-directory storage: exact final bytes are reported with the manifest hash in the final handoff message; the package is text-only and far below 4 GiB.

## Reproducibility verdict

`CANNOT_VERIFY__MISSING_EXACT_ENVIRONMENT`. Deterministic replay requires the exact commit, target-enabled tools, native readers and target execution route; using the discovered LLVM 22.1.8 or AMDGPU-only build would violate the frozen object.
