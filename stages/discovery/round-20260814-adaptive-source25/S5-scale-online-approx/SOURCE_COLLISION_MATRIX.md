# Source and Collision Matrix — Source25

| ID | First-party snapshot | Current-union finding | Collision / strongest subtractor | Carrier-oracle status | Disposition |
|---|---|---|---|---|---|
| QC25-01 | TensorFlow/tflite-micro official `main`, 2026-08-14 | Repository exposes current code tree and Memory Management documentation, but this bounded pass did not close allocator actions/configurations | Stock TFLM allocation modes under identical invocation semantics | Versioned public model-update trace and exact invocation contract not frozen | `LOCATOR_ONLY` |
| QC25-02 | KhronosGroup/SPIRV-Tools official repository, 2026-08-14 | Assembler/parser/disassembler/validator/optimizer; optimizer is a pass/recipe union including ID canonicalization | `spirv-opt` current pass/recipe union | Validity is not a frozen semantic-equivalence oracle; carrier version absent | `LOCATOR_ONLY` |
| QC25-03 | MLIR official Language Reference and Vector documentation, 2026-08-14 | Generic extensible/retargetable IR and lowering mechanisms | Existing generic lowering union; no target-specific construction action frozen | Sparse object, natural versioned trace, and oracle not frozen | `EXCLUDED_BEFORE_RAW` |
| QC25-04 | Boolector official repository, 2026-08-14 | Generic bit-vector/array SMT solver ecosystem | Generic solver/encoding action is a forbidden generic subtractor | Dated public BTOR2 model release and exact oracle not frozen | `LOCATOR_ONLY` |

## Reality-check record

No card makes a current-implementation-absence claim. Consequently none uses an unverified absence as evidence. For the only potentially absorbing union, SPIRV-Tools, the current official repository explicitly describes optimizer transformations and canonicalization; that adverse union evidence prevents promotion. No source download, source execution, configuration change, or artifact build was performed.

## Latest-collision ceiling

This matrix records the official/current materials inspected on 2026-08-14, not a universal novelty claim. A future Stage 0 would need independent current-source and literature collision review if any card were later closed.
