# Evidence-qualified question card

| Field | S80-RQ-01 |
|---|---|
| Exact identity | Fixed LLVM IR modules, target/toolchain, lookup sequence, executable behavior, stock ORCv2 |
| Same-object endpoint | Identical lookup-visible symbols and executable observable semantics |
| Candidate contribution | Proposed N2 joint materialization/link plan; no target-specific algorithm/guarantee was frozen |
| Current source locus | ORCv2 official documentation: LLJIT eager default; lazy compilation/lazy reexports; MaterializationUnits/custom compilers; dependency tracking/concurrent JIT |
| Fair strongest union | Eager compile, lazy compile, lazy reexports, custom MaterializationUnits/compilers, lookup dispatch, and dependency tracking under the same ORCv2 interface |
| Information condition | Module graph and lookup sequence must be equally available to candidate and baseline |
| Full-cost boundary | IR/summary preparation, compile, materialize, link/relocate, lookup/startup, runtime, CPU, RSS, temporary storage, and code bytes |
| Natural route | Deterministic selection of a public LLVM test-suite/IR corpus at Stage 0; no dataset was acquired here |
| Minimal falsifier | Produce a target-specific nonseparable constructor with stated guarantee that cannot be reproduced by the documented union, then compare full cost on one stock-lookup-equivalent witness |
| Finite closure | Bounded Stage-0 review of current source entry points and one minimal legal witness; no implementation or positive result is required for this Discovery disposition |
| Disposition | `EXCLUDED_BEFORE_RAW__GENERIC_LAZY_EAGER_POLICY_OR_CURRENT_MATERIALIZATION_COMPOSITION` |

Why excluded: the only concrete divergence remaining after the current-union check is choosing when to materialize/compile. That is a generic policy/controller shell, while ORCv2 already composes eager/lazy materialization, lazy reexports, and user-defined MaterializationUnits/compilers. No union-external target-specific whole action plus algorithmic guarantee was frozen. This is a structural admission finding, not a claim that no future ORC research is possible.
