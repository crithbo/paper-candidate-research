# Source42 current-source Question Cards

## QC01 — ARM/Thumb constant islands

- **Exact identity:** fixed ARM/Thumb `MachineFunction`, constant-pool and jump-table contents, relocation model and emitted program behavior.
- **Five-field preflight:** `NO_MATCH`; this is only a continuation-to-source result, not novelty evidence.
- **Current upstream reality:** current LLVM `ARMConstantIslandPass.cpp` declares the constant-island placement and branch-shortening pass, performs initial constant/jump-table placement, can create water blocks, and carries current controls `-arm-adjust-jump-tables` (default true), `-arm-constant-island-max-iteration` (default 30), and `-arm-synthesize-thumb-1-tbb` (default true).
- **Strongest current union:** that pass plus its native block-layout, branch insertion, island-placement and iteration actions; the proposed complete C formulation is already the named native action.
- **Natural/oracle/full cost route:** public LLVM ARM/Thumb code-generation tests; assembler/disassembler and semantic test oracle; compile CPU/RSS/temp, text/relocation bytes, branch/island edits and code-size cost.
- **Cheapest falsifier:** a source-level finding that the named pass permits the same island/branch/block construction — already satisfied.
- **Disposition:** `EXCLUDED_BEFORE_RAW__FROZEN_DIRECT_CURRENT_COLLISION`. No action-absence claim, source gap or Stage0 route remains.

## QC02 — x86 macro-fusion DAG schedule

- **Exact identity:** fixed x86 `MachineInstr` DAG, subtarget fusion rules and emitted behavior.
- **Five-field preflight:** `NO_MATCH`; no novelty inference.
- **Current upstream reality:** current LLVM `X86MacroFusion.cpp` classifies first/second fusion instructions and exposes `shouldScheduleAdjacent` through a target `ScheduleDAGMutation`. The intended adjacency construction is thus native scheduler behavior, not a missing primitive.
- **Strongest current union:** target fusion classification plus schedule-DAG mutation and normal dependency-constrained machine scheduling.
- **Natural/oracle/full cost route:** LLVM X86 scheduling tests with assembler and execution/semantic test oracle; compile CPU/RSS/temp, code bytes, schedule legality and target throughput proxy.
- **Cheapest falsifier:** a target-native adjacency action currently applied by the schedule mutation — already satisfied.
- **Disposition:** `EXCLUDED_BEFORE_RAW__FROZEN_DIRECT_CURRENT_COLLISION`. A new formulation would be a generic scheduler/order wrapper unless it changes the exact action/guarantee.

## QC03 — x86 separate shrink-wrap components

- **Exact identity:** fixed x86 function/CFG, ABI, CFI/unwind and stack behavior.
- **Five-field preflight:** historical frame rows are `RELATED_ONLY`; they do not mechanically exclude this x86 object.
- **Current upstream reality:** current GCC optimization documentation states `-fshrink-wrap` and `-fshrink-wrap-separate` are enabled by default at optimization levels when target-supported. Current GCC internals define hooks for separate component discovery, per-block requirements, disqualification, and emission. The official 2025 x86 patch shows `TARGET_SHRINK_WRAP_*` component handling and x86 save/restore emission.
- **Strongest current union:** ordinary shrink wrapping, separate component hooks, target frame emission and all documented flag modes; a flag selector is not a residual.
- **Natural/oracle/full cost route:** public GCC i386 shrink-wrap tests; assembler, ABI/unwind and execution test oracle; compile CPU/RSS/temp, text bytes, dynamic prologue/epilogue work and CFI cost.
- **Cheapest falsifier:** current hooks emit separately shrink-wrapped prologue/epilogue components — supported by current docs/source interface and x86 official implementation history.
- **Disposition:** `EXCLUDED_BEFORE_RAW__FROZEN_DIRECT_CURRENT_COLLISION`. No absence claim is made, so no incomplete source pin can manufacture a residual.

No card reaches `EVIDENCE_QUALIFIED_RAW`; no C0/deep/brief is created.

