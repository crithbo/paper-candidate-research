# Evidence-qualified routing cards

These cards record the bounded source-level decision, not a claim of novelty, Q2 status, or experimental result.

## QC-01: X86 `vzeroupper` placement

- Exact identity: fixed LLVM X86 MachineFunction, AVX/SSE call and ABI semantics; output preserves all machine semantics.
- Endpoint/counterfactual: reduce AVX-to-SSE transition penalty while accounting for inserted instruction bytes and compilation cost.
- Proposed atomic mechanism: choose a function/CFG-level set of legal `vzeroupper` insertion points based on dirty/clean vector-state flow.
- Stock oracle/carrier: LLVM X86 machine verifier and LLVM test-suite/LLVM IR-to-MIR regression corpus route.
- Current locus: [X86InsertVZeroUpper.cpp](https://github.com/llvm/llvm-project/blob/main/llvm/lib/Target/X86/X86InsertVZeroUpper.cpp), current `main`, inspected 2026-08-15; hidden `UseVZeroUpper` defaults true, and the pass propagates `PASS_THROUGH`, `EXITS_CLEAN`, and `EXITS_DIRTY`, then inserts before the first unguarded SSE call when AVX is available.
- Strongest current union: target feature guard + configurable pass + CFG state propagation + dirty-successor analysis + insertion before legal calls.
- Natural/canonical route: version-pinned LLVM test-suite programs with x86-64 AVX-capable target configuration.
- Full-cost initial boundary: compile CPU/RSS/temp, output bytes, inserted instructions, transition-cost proxy, and stock validation/runtime execution where hardware is later available.
- Minimum falsifier: a single MIR/IR function in which an alleged plan differs from current pass output yet retains ABI and machine semantics; source inspection already shows the alleged action family is emitted by the pass.
- Ownership disposition: `KNOWN_FATAL`.
- Decisive reason: the candidate's defining state-sensitive insertion action is already the current native producer action; remaining work would be selector/pass retuning or a generic placement formulation, not a distinct Source44 whole constructor.

## QC-02: R600 ALU-clause formation

- Exact identity: fixed R600 LLVM MachineFunction and stock R600 ISA semantics.
- Endpoint/counterfactual: form legal ALU clause boundaries to change instruction/control overhead without changing program semantics.
- Proposed atomic mechanism: jointly mark and merge consecutive legal `CF_ALU` clause regions.
- Stock oracle/carrier: LLVM machine-code verification plus version-pinned LLVM R600 tests/MIR corpus route.
- Current locus: [R600ClauseMergePass.cpp](https://github.com/llvm/llvm-project/blob/main/llvm/lib/Target/AMDGPU/R600ClauseMergePass.cpp), current `main`, inspected 2026-08-15. The current pass merges consecutive legal `CF_ALU` clauses after the native marker path; its source exposes the exact clause-formation operation.
- Strongest current union: conservative native clause marking followed by legal consecutive-clause merging.
- Natural/canonical route: public LLVM R600 regression programs; this is an implementation-carrier route only, not a claim of a natural deployment gain.
- Full-cost initial boundary: code-generation CPU/RSS/temp, code bytes, clause/control overhead, and stock machine verification.
- Minimum falsifier: two legal clause decompositions for one fixed MIR function. Even such a witness is non-admissible here because current producer already exposes the same merge action.
- Ownership disposition: `KNOWN_FATAL`.
- Decisive reason: a target-specific global constructor was not isolated beyond current marker-plus-merge composition; generic segmentation or a merge-policy selector would violate the non-generic discriminator.

## QC-03: AArch64 compare/condition rewrite

- Exact identity: fixed AArch64 MachineFunction, compare/branch condition semantics and target CPU feature set.
- Endpoint/counterfactual: lower code-size/latency proxy by legal cross/intra-block condition and compare adjustment while preserving machine semantics.
- Proposed atomic mechanism: select coupled compare/condition rewrites across basic blocks.
- Stock oracle/carrier: LLVM AArch64 machine verifier and version-pinned LLVM test-suite/MIR route.
- Current locus: [AArch64ConditionOptimizer.cpp](https://github.com/llvm/llvm-project/blob/main/llvm/lib/Target/AArch64/AArch64ConditionOptimizer.cpp), current `main`, inspected 2026-08-15; it is the native machine-function condition optimizer and implements compare adjustment/reuse paths. Relevant target-machine option wiring is in [AArch64TargetMachine.cpp](https://github.com/llvm/llvm-project/blob/main/llvm/lib/Target/AArch64/AArch64TargetMachine.cpp).
- Strongest current union: current target option wiring plus intra/cross-block condition optimization and compare adjustment.
- Natural/canonical route: public versioned LLVM AArch64 code-generation tests; no claim is made that this route alone supplies deployment-level benefit.
- Full-cost initial boundary: compile CPU/RSS/temp, output bytes, latency/code-size proxy, and stock verification.
- Minimum falsifier: a fixed MachineFunction with two legal compare/condition rewrites. Current source owns the proposed rewrite family, so a different output alone would not establish a residual.
- Ownership disposition: `KNOWN_FATAL`.
- Decisive reason: no non-generic target-specific endpoint/guarantee survived subtraction of the current condition optimizer; a pass-order or heuristic tweak is insufficient.
