# Candidate-grade deep reviews

## D1 — LLVM target-cost-aware global machine outlining

| Facet | Frozen value |
|---|---|
| Exact object | A fixed LLVM MachineIR module, target triple and ABI/unwind/relocation semantics; output replaces legal instruction sequences with target-native outlined functions and calls. |
| N2 action | Choose a globally compatible set of existing native outline candidates, jointly accounting for target-provided frame/call costs, overlap, function boundaries and code-size/runtime cost. |
| Current strongest union | MachineOutliner suffix-tree discovery, legality classes, target hooks, repeated outlining, local/global CGData modes and current command controls. |
| Strong subtractors | Current MachineOutliner; its documented 2016 outlining design; target backend implementations; direct outlining/code-size papers/tools to be closed at Stage 0. |
| Guarantee shape | Exact Pareto frontier for bounded candidate-conflict components, or FPT in conflict-treewidth and target-call-state, with a certified non-dominance result over the current greedy selection. |
| Same-function guarantee | Native calls/frames are constructed solely through the target hooks; fixed instruction semantics, ABI, unwind and relocation requirements remain unchanged. |
| Natural carrier / oracle | LLVM Test-Suite and supported-target MIR; `-verify-machineinstrs`, linker/object/unwind checks and deterministic test execution. |
| Full cost | Candidate generation plus selection CPU/RSS/temp; resulting bytes, relocations/unwind metadata and code-size/runtime deltas. |
| 72h killer | Exhaustive enumeration on a small legal MIR conflict component. Stop the mechanism if no native-legal plan is outside the current choice, or no frontier point dominates/currently differs under the full denominator. |
| Fidelity status | `FINITE_FIDELITY_GAP`: target-specific cost extraction and native witness output must be closed before any claim-bearing test. |
| Claim ceiling | Conditional Q2-shaped N2 only; no declared speed/size result and no priority claim. |

### Adversarial checks

- If a current target’s global CGData/outlining mode already constructs the same target-cost frontier, this is direct absorption.
- If the new solver ignores frame/call/unwind/relocation costs, it is a generic interval/packing wrapper and fails.
- If the witness requires changing target, ABI, input MachineIR, or observable code semantics, same-object fails.
