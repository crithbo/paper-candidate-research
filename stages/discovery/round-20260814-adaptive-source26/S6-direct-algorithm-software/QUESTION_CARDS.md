# Source26 Question Cards

## QC01 — AArch64 load/store pair and address materialization

- Seed / exact identity: `S01` / `LLVM_AARCH64_LOAD_STORE_PAIR_AND_ADDRESS_MATERIALIZATION__FIXED_MACHINE_FUNCTION_AND_AARCH64_SEMANTICS`.
- Carrier / oracle: official LLVM MIR and LLVM Test-Suite route; fixed `MachineFunction`, AArch64 ISA and unwind semantics; `llvm-mc`/MIR checks plus semantic code-generation review are the future oracle.
- Proposed endpoint: a target-specific bounded live-offset constructor jointly choosing pair formation and address materialization, with an exact/Pareto size–materialization bound.
- Current same-information union: current `AArch64LoadStoreOptimizer` is a post-register-allocation peephole pass; its official source exposes pairing scans, update and constant-offset folding, UMOV folding, and register renaming. Hidden controls include update scan limit 100, constant scan limit 10, UMOV scan limit 16, and renaming default true. It also preserves flagged instruction order for unwind correctness.
- Contrary / subtraction: the observed source supports a substantial local action union. The planned two small official routes did not close a primary same-object algorithmic collision or a non-generic global state recurrence; a “larger scan” or generic instruction-selection DP would not be a valid residual.
- Full-cost / finite route if reopened: MIR write/verify, code bytes, compile CPU/RSS/temp, and fixed-emulator/ISA oracle; a 72-hour killer would reject if the bounded-state recurrence reduces to an existing local scan/rename composition or requires moving unwind-flagged instructions.
- Required-field audit: `INCOMPLETE`; direct-collision facet and target-specific guarantee remain unclosed.
- Disposition: `LOCATOR_ONLY__PUBLIC_EVIDENCE_UNCLOSED`; this is not a claim of absent implementation or negative result.

## QC02 — AArch64 SME streaming/ZA transitions

- Seed / exact identity: `S02` / `LLVM_AARCH64_SME_INTRA_FUNCTION_STREAMING_ZA_TRANSITION_CONSTRUCTION__FIXED_IR_AND_ABI_SEMANTICS`.
- Current reality: official LLVM documentation states PSTATE.SM behavior is controlled by function attributes, not feature flags, and calls that are not streaming-compatible require SMSTOP transitions. SMEABIPass also handles `aarch64_new_za` before SelectionDAG.
- Dedup: current registry records `discovery_v8_7_wave280` as `AARCH64_SME_ZA_CURRENT_PCS_LLVM_GCC_UNION_ABSORPTION`.
- Disposition: `EXCLUDED_BEFORE_RAW__REPEAT_OPPORTUNITY_FAMILY`; this does not count toward Source26 raw/C0/deep or justify a STOP revival.

## QC03 — AArch64 SVE predicate/tail state

- Seed / exact identity: `S04` / `LLVM_AARCH64_SVE_PREDICATE_TAIL_STATE_CONSTRUCTION__FIXED_LOOP_IR_AND_VLA_SEMANTICS`.
- Carrier / oracle: LLVM AArch64 SVE tests and fixed loop IR; `opt` output plus IR legality are future oracle routes.
- Current union: LoopVectorize exposes tail-folding and epilogue policies (`none`, `prefer`, `must`) and its target interface chooses tail folding from legality/cost. The AArch64 source additionally exposes default/nondefault `-sve-tail-folding` modes (`disabled/default/all/simple`) with reduction, recurrence, and reverse modifiers, plus a threshold.
- Subtraction: the hypothesized contribution is only a re-expression of policy/cost-model choice over already explicit tail/epilogue actions. No distinct target-specific recurrence, guarantee, or survivor witness was named without becoming routine cost-model tuning.
- Disposition: `STRUCTURAL_DROP__GENERIC_POLICY_COST_MODEL_RESIDUAL`; no inference about implementation, results, or resources.

## QC04 — cooperative-matrix legal fragment construction

- Seed / exact identity: `S05` / `MLIR_SPIRV_COOPERATIVE_MATRIX_LEGAL_FRAGMENT_CONSTRUCTION__FIXED_KERNEL_AND_SPIRV_VALIDATION_SEMANTICS`.
- Current reality: MLIR documents cooperative-matrix types and operations; the SPIR-V specification/API semantics make matrix scope, shape, use, memory layout, stride and scope-uniformity explicit constraints. A fixed target, producer, layout legality set, public kernel carrier, and full writer/validator union were not obtainable in the two planned small routes.
- Proposed endpoint if externally re-anchored: a target-specific finite legality-automaton constructor, with validator acceptance and identical kernel result fixed.
- Disposition: `LOCATOR_ONLY__PUBLIC_EVIDENCE_UNCLOSED`; absent fixed target/complete producer union is a closure gap, not scientific failure.

## Funnel summary

| Card | Selected locator | Fresh raw | C0 | D1 | Deep | Brief | Final disposition |
|---|---:|---:|---:|---:|---:|---:|---|
| QC01 | yes | no | no | no | no | no | LOCATOR_ONLY__PUBLIC_EVIDENCE_UNCLOSED |
| QC02 | yes | no | no | no | no | no | EXCLUDED_BEFORE_RAW__REPEAT_OPPORTUNITY_FAMILY |
| QC03 | yes | no | no | no | no | no | STRUCTURAL_DROP__GENERIC_POLICY_COST_MODEL_RESIDUAL |
| QC04 | yes | no | no | no | no | no | LOCATOR_ONLY__PUBLIC_EVIDENCE_UNCLOSED |
