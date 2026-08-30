# Source43 Question Cards — current-union decisions

## QC01 — PowerPC CTR-loop form

- **Exact object:** fixed PowerPC `MachineFunction`, hardware-loop intrinsic/loop semantics, target mode and emitted behavior.
- **Five-field identity result:** `NO_MATCH`; this establishes neither novelty nor absence.
- **Current upstream reality:** `PPCCTRLoops.cpp` defines `PPCCTRLoops`, processes nested loops, checks CTR clobbers/reads, and has explicit `expandCTRLoops` and `expandNormalLoops` paths. The native pass is registered as “PowerPC CTR loops generation.”
- **Strongest current union:** current PPC target pass plus machine-loop analysis, target instruction information and its two legal output constructions.
- **Natural/oracle/full-cost route:** LLVM PowerPC code-generation tests; machine verifier/assembler/disassembler plus semantics tests; compile CPU/RSS/temp, code bytes, loop instruction count and target throughput proxy.
- **Minimum falsifier:** current source exhibiting both native legal forms — satisfied.
- **Disposition:** `EXCLUDED_BEFORE_RAW__CURRENT_UNION_DIRECT_COVERAGE`. Recasting this as a generic loop selection or pass order would violate the contribution contract.

## QC02 — MIPS delay-slot filler

- **Exact object:** fixed MIPS `MachineFunction`, subtarget/erratum mode, delay-slot and final program semantics.
- **Five-field identity result:** `NO_MATCH`; no novelty inference.
- **Current upstream reality:** current `MipsDelaySlotFiller.cpp` implements a MachineFunction pass, backward, forward and successor-block searches, hazard checks, liveness invalidation, compact branch policy and documented hidden default/non-default controls for disabling each search mode. `MipsTargetMachine.cpp` inserts it before branch expansion because the actions interact with forbidden-slot hazards.
- **Strongest current union:** all named native filler searches, branch expansion and target hazard handling under the same MachineFunction semantics.
- **Natural/oracle/full-cost route:** LLVM MIPS code-generation tests; machine verifier/assembler/disassembler and semantic execution tests; compile CPU/RSS/temp, text bytes, useful/empty delay slots and branch hazard costs.
- **Minimum falsifier:** current source moves legal candidates and handles cross-block/hazard constraints — satisfied.
- **Disposition:** `EXCLUDED_BEFORE_RAW__CURRENT_UNION_DIRECT_COVERAGE`.

## QC03 — x86 execution-domain assignment

- **Exact object:** fixed x86 SSE `MachineFunction`, equivalent opcode semantics and target microarchitecture feature assumptions.
- **Five-field identity result:** `NO_MATCH`; no novelty or current-absence conclusion.
- **Current upstream reality:** LLVM’s current `ExecutionDomainFix` describes equivalent x86 SSE operand-domain variants and changes those variants to minimize costly domain crossings. The current X86 target registration initializes `X86ExecutionDomainFixPass` in the native code-generation pipeline.
- **Strongest current union:** domain-fix pass plus target scheduling/codegen composition; a local variant choice is already the named native action.
- **Natural/oracle/full-cost route:** LLVM X86 tests; assembler/disassembler and execution semantics oracle; compile CPU/RSS/temp, text bytes, instruction-domain transitions and target latency/throughput proxy.
- **Minimum falsifier:** current native pass performs the claimed domain reassignment — satisfied.
- **Disposition:** `EXCLUDED_BEFORE_RAW__CURRENT_UNION_DIRECT_COVERAGE`. A broad graph relabeling or selector would be generic and not a same-object residual.

No card has a remaining concrete public-source gap. No `EVIDENCE_QUALIFIED_RAW`, C0, deep review or brief is authorized.

