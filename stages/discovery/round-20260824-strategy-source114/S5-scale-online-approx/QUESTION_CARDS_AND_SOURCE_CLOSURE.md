# Source114 S5 Performance-Model / Theory Source Closure

Static public-source closure only.  No artifact was downloaded, no model was run, and no simulator was built or replayed.

## RQ01 — low-bit-kernel roofline / traffic decision model

- **Provisional object, action, and endpoint:** choose one legal launch/layout/precision configuration for an exact public low-bit kernel by predicting its latency (`ns/kernel`) or normalized throughput (`tokens/s`) from FLOP and byte traffic.  The offline seed did not name a repository, immutable revision, kernel symbol, model shape, precision packing rule, target GPU, or legal configuration set.
- **Source locus and version/date:** Williams, Waterman, and Patterson, *Roofline: An Insightful Visual Performance Model for Multicore Architectures*, CACM 2009, DOI `10.1145/1498765.1498785`, model definition/operational-intensity roofline; accessed 2026-08-24 through the public publication record.  This is a general model source, not a versioned carrier for the proposed kernel.
- **Current/contrary evidence:** the Roofline model already supplies the generic compute-versus-memory bound.  It is contrary to any claim that merely re-draws a roofline or repeats a generic simulator is a new performance-model contribution.  No current public source was identified that fixes the seed's exact low-bit kernel object and the candidate's decision endpoint together.
- **Estimand and units required for admission:** kernel-wall time in ns, per-token latency in ms/token only when the enclosing token workload is frozen, bytes transferred at each relevant memory level, FLOPs/integer operations, achieved occupancy, and model prediction error.  None can be assigned without changing or inventing the kernel carrier.
- **Full-cost boundary:** data packing/unpacking, quantization/dequantization, launch/setup, layout conversion, all device-memory traffic, synchronization, host-device transfer when present, compilation/JIT cost when it is on the user-facing path, and the measured prediction/selection error.  A FLOP/byte-only calculation omits several decision-relevant costs.
- **Finite closure / search boundary:** one bounded public-model/roofline seed plus the canonical Roofline source was inspected.  Stop before raw because no immutable carrier simultaneously fixes object, units, legal action set, and endpoint; no further search or outcome-aware carrier substitution is permitted in this assignment.
- **Disposition:** `PRE_RQ_NONADMISSION__EXACT_KERNEL_ESTIMAND_UNITS_AND_DECISION_ENDPOINT_UNFROZEN`.

## RQ02 — joint compiler compile-and-execution-cost estimator

- **Provisional object, action, and endpoint:** choose between specified compiler transform alternatives for one versioned IR/program/target by a joint estimate of compilation cost and resulting execution cost.  The offline seed did not freeze an IR corpus, compiler revision, target triple, transform alternatives, workload, time horizon, or threshold at which the choice changes.
- **Source locus and version/date:** [MLIR Transform Dialect documentation](https://mlir.llvm.org/docs/Dialects/Transform/), current public documentation accessed 2026-08-24, overview and core-operations loci; it documents fine-grain transformation control and numerous transform operations.  [LLVM TargetTransformInfo API](https://llvm.org/doxygen/classllvm_1_1TargetTransformInfo.html), current public API documentation accessed 2026-08-24, is the current upstream cost-query locus.
- **Current/contrary evidence:** these upstream facilities already provide transformation control and target-cost queries.  They are contrary to a claim that the presence of a cost API, or simply wrapping it in a simulator, establishes a new decision model.  Conversely, neither documentation locus supplies the missing fixed transform choice, program distribution, compile-time accounting rule, and user-facing endpoint for this seed.
- **Estimand and units required for admission:** compiler wall time (`s`), output code execution time (`ns/invocation` or `tokens/s` for a frozen inference workload), code size (`bytes`) if decision-relevant, estimator error, and a fixed total-cost horizon such as `compile_s + N * execute_s`.  `N` and the decision threshold are unfrozen, so no decision-changing comparison is defined.
- **Full-cost boundary:** front-end and IR preparation, analysis/pass/solver time, code generation/link or JIT costs where applicable, cache state, binary/code-size effects, target execution, and the cost/error of obtaining the estimator input.  Compile-only or execute-only ranking is insufficient for the stated joint endpoint.
- **Finite closure / search boundary:** bounded inspection of the current official transform and cost-model loci; stop before raw because selecting an IR transform or endpoint would constitute a new, outcome-aware RQ rather than closure of the frozen seed.
- **Disposition:** `PRE_RQ_NONADMISSION__EXACT_IR_TRANSFORM_COST_HORIZON_AND_DECISION_ENDPOINT_UNFROZEN`.

## Current-union and denylist check

- Source113's exact/contains hold includes a generic Vidur/Mooncake simulator calibration without a fixed decision endpoint.  RQ01 is a distinct kernel-performance object and RQ02 is a distinct compiler-transform object, so neither is recorded as a same-object repeat; both nevertheless fail independently before raw for the missing field bundle above.
- This bounded nonadmission is not a current-union absence claim, scientific STOP, deployment claim, or statement about the value of simulators.

## Funnel result

`offline_seed=4; provisional_RQ=2; valid_selected_RQ=0; pre_RQ_nonadmission=2; raw=0; deep=0; clean_brief=0`.

`COMPLETE_ZERO_PROPOSALS__PERFORMANCE_MODEL_DECISION_CONTRACT_UNFROZEN`.
