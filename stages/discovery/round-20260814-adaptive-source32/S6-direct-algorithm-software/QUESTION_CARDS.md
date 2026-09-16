# Source32 Question Cards

## QC32-01 — SystemZ packed-stack callee-save/layout construction

- Identity: current LLVM SystemZ ELF frame lowering; fixed MachineFunction, SystemZ ABI, callee-save requirements, exception behavior and generated object semantics.
- Carrier: `CANONICAL_FORMAL_ORACLE` with public LLVM SystemZ regression/MIR route.
- Problem / endpoint: a whole constructor may jointly choose callee-save range/use and packed-stack object representation under the same ABI, producing a target-specific prologue/bytes Pareto certificate.
- Non-generic discriminator: source defines a SystemZ ELF register-save area, fixed per-register offsets, a packed-stack state and range save/restore sequences; it is not automatically generic stack-slot packing.
- Current loci: `SystemZFrameLowering.cpp/.h` and SystemZ register-info interface.
- Full cost: compile CPU/RSS/temp, prologue/epilogue bytes and instruction count, stack-frame bytes, stock object semantics.
- Minimum falsifier: source already jointly chooses same frontier; no legal alternative under fixed ABI; direct collision; state erasure yields generic frame allocation.
- Finite debt: current union/default controls, legal witness, and collision matrix can be closed by Stage0 from public source/tests; no main result required.
- Audit: `RQ_COMPLETE / RAW_REQUIRED COMPLETE / OPEN_BOUNDED / FRESH`; `EVIDENCE_QUALIFIED_RAW`, C0 `YES`.

## QC32-02 — AArch64 SVE frame state

Source32–31 cooling makes this SME-adjacent identity ambiguous; `LOCATOR_ONLY__IDENTITY_DEBT`.

## QC32-03 — NVPTX mbarrier

Current official docs define barrier state, but the exact opportunity overlaps Source29’s cooled GPU-barrier locator unless mainline establishes a distinct signature; `EXCLUDED_BEFORE_RAW__COOLDOWN`.

## QC32-04 — SystemZ XPLINK

No current source/stock-oracle union completed inside the precommitted route; `LOCATOR_ONLY__SOURCE_CLOSURE_QUEUE`.
