# Current upstream reality check

- Resolved LLVM commit: `ba5bccfe01368f76e74d6ff4c35f1330e155b4ba`
- Target: `riscv32-unknown-elf`, RV32IMAC+Zcmp, ILP32
- Status: `SOURCE_METADATA_PINNED__EXECUTABLE_UNION_NOT_CLOSED`
- Collision boundary: `SEARCH_BOUNDED_OPEN`

## Official metadata finding

The short Stage 0 locator was valid and unique. Official GitHub REST commit metadata reports the full commit above, root tree `0c3abf…cdf1`, a valid signature and the immutable RISC-V tree/blob IDs in `OFFICIAL_METADATA_PIN.yaml`. This closes the provenance ambiguity without changing the object.

## Current-union reality boundary

The decisive source set is pinned for:

1. current GPR register allocation and register constraints;
2. fixed CSR prefix, pushability, Zcmp grammar/adjustment, frame layout, CFI and libcall paths;
3. late POP/RET rewriting;
4. pre-/post-RA pseudo expansion; and
5. target-pipeline ordering.

Eleven pinned blobs are byte-identical to local copies by Git blob ID, but the Zcmp grammar file and `RISCVTargetMachine.cpp` are not. More importantly, no local RISC-V-enabled writer/verifier is provenance-bound to the frozen commit. Therefore the complete current configuration union, default/non-default controls and emitted coordinates cannot be enumerated or compared here.

## Inference discipline

The metadata proves identity only. It does not prove that current LLVM emits either plan, that the union lacks the candidate frontier, that either plan is native legal in an emitted object, or that a natural residual exists. Missing exact executable assets are not collision or absorption evidence.

