# Source42 RQ convergence

## RQ01 — ARM constant-island construction

For a fixed ARM/Thumb `MachineFunction`, relocation model and emitted-code semantics, is there an independent whole-object constructor for constant islands, jump-table blocks and branch reachability that improves a target-specific cost frontier beyond the native placement pass?

Alternatives formed before evidence lookup: (A) island placement only; (B) island plus jump-table placement; (C) island, branch shortening and block layout. Selected C because it is the only complete same-object formulation; a local placement-only question would be a routine emitter patch.

## RQ02 — x86 macro-fusion adjacency construction

For a fixed x86 `MachineInstr` dependence DAG, CPU feature set and program behavior, is there a target-specific complete constructor that jointly realizes fusion adjacencies with legal schedule decisions and a non-generic guarantee beyond the existing scheduler mutation?

Alternatives: (A) pair classification only; (B) pair adjacency; (C) complete DAG schedule with fusion. Selected C because A/B are local classification or ordering.

## RQ03 — x86 separate shrink-wrap construction

For a fixed x86 function, ABI, unwind behavior and CFG, is there a complete constructor for separately emitted save/restore components that surpasses current target hooks without changing ABI, CFI, stack semantics or the full cost boundary?

Alternatives: (A) enable/disable flag; (B) one component choice; (C) all legal components and placements. Selected C; A is explicitly a configuration selector.

All three questions are `RQ_READY_FOR_EVIDENCE_LOOKUP` only. Their later dispositions are controlled by the current-source cards, not by FINER scheduling.

