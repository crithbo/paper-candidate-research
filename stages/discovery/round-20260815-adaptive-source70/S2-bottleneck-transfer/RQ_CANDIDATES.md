# Pre-evidence RQ candidates — Source70

## RQ-S70-01 — C++ module scan/BMI constructor

For a fixed set of translation units, module interfaces, target and executable semantics, can a target-specific joint dependency-scan/BMI constructor reduce complete scan/build/import cost under the stock compiler and importer, rather than merely scheduling tasks or changing cache policy?

Anchor question: what complete dependency/BMI actions are already exposed by current Clang tooling, and is a same-object target-specific constructor still definable?

## RQ-S70-02 — OpenMP target map/lowering constructor

For a fixed OpenMP program, mapped logical objects, target device and observable host/device results, can compiler lowering jointly construct map metadata and materialization so as to improve full transfer/launch cost beyond the stock map-type/runtime action union?

Anchor question: which map/lowering actions are current OpenMP semantics and runtime configuration, versus a possible whole-program constructor?

## RQ-S70-03 — GPU fat-binary materialization constructor

For a fixed host program, GPU code objects, target architecture and observable CUDA/HIP execution, can a reader-equivalent binary constructor jointly change image layout/relocation/materialization with a target-specific guarantee beyond image-selection and JIT-cache policy?

Anchor question: do official code-object/runtime contracts expose any legal whole-binary construction freedom that preserves the stock loader endpoint?

All three were selected before source results. Ordinary closure only; no selective nomination is made.
