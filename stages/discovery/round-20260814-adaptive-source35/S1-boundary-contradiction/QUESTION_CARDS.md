# Evidence-qualified question cards

## Q35-01 — RISC-V Zihintpause

- Exact identity: a same-program RISC-V spin loop with fixed C/C++ atomic semantics, fixed ISA target containing Zihintpause, and identical observable synchronization result.
- Candidate endpoint: target-specific compiler construction for PAUSE placement with a stated static cost/guarantee.
- Counterfactual: without a target-specific construction, PAUSE placement remains code-generation or runtime-policy choice.
- Source locus: ratified Zihintpause specification and LLVM `RISCVUsage.rst` main branch documentation.
- Minimum falsifier: specification or stock compiler union makes only a hint/tuning/controller decision available, not a distinct fixed-semantics construction.
- Initial closure route: Stage0 would pin LLVM source and test suite, enumerate lowerings, and use assembler/disassembler plus atomic litmus expectations; full cost would include compile CPU/RSS, code bytes, static instruction mix and runtime wait behavior.
- C0 disposition: `LOCATOR_ONLY__GENERIC_POLICY_SHAPE`. The official specification says PAUSE is a bounded hint whose duration may be zero and recommends only one in portable spin loops; LLVM documents assembly support and tuning controls. The proposed placement consequently lacks a frozen non-controller action/guarantee and is not promoted.

## Q35-02 — OpenGL SPIR-V specialization

- Exact identity: a fixed OpenGL SPIR-V shader module, specialization values, interface layout, output semantics and API-visible link/use behavior.
- Candidate endpoint: a non-driver, same-artifact constructor with a formal compile/artifact-cost guarantee.
- Counterfactual: without it, the API's specialization operation owns realization in the driver pipeline.
- Source locus: Khronos OpenGL registry / ARB_gl_spirv and SPIR-V specification.
- Minimum falsifier: specialization is an API configuration/driver compilation action, so a proposed external construction either postprocesses or changes the runtime/compiler object.
- Initial closure route: Stage0 could pin registry/source revisions, a public shader corpus and `glSpecializeShader`/link oracle; full cost would include artifact bytes, API compile/link latency, CPU/RSS and GPU execution only under fixed driver semantics.
- C0 disposition: `LOCATOR_ONLY__CONFIGURATION_OR_DRIVER_OWNED`. The source route establishes a real boundary but not a user-space complete mechanism independent of the stock specialization pipeline; no raw promotion.
