# Source30 Question Cards

## QC30-01 — ARM MVE multiblock tail-predicated loop construction

- Identity: current LLVM ARM MVE target; fixed vectorized loop/MachineFunction, fixed Armv8.1-M MVE+low-overhead-loop features, same active-lane masks, loop outputs and exception/branch behavior.
- Carrier: `CANONICAL_FORMAL_ORACLE`; public LLVM ARM/MVE regression/MIR tests are a finite route.
- Problem: current tail-predication lowering recognizes `get.active.lane.mask` and drives a later low-overhead-loop transformation, but official current source explicitly limits tail predication to a single basic block. A target-specific region constructor may partition/rewrite a legal multiblock loop to native tail-predicated/fallback regions.
- Contribution: `COMPILER_TOOL`, N2, target-native action and certified legality/Pareto endpoint.
- Counterfactual: if true, a backend decision changes from rejecting/falling back on eligible multiblock MVE loops to producing a provably legal bounded region plan.
- Non-generic discriminator: the recurrence must encode MVE VPT state, `VCTP`, `DLSTP/WLSTP/LETP`, vector element widths, and LOB/MVE legality—not an unconstrained loop scheduler.
- Current locus: official `MVETailPredication.cpp` plus `ARMLowOverheadLoops.cpp`; default and non-default `tail-predication` and `arm-loloops-disable-tailpred` controls are recorded.
- Known direct fatal: `NONE_FOUND_WITHIN_BOUND`; source confirms a single-block limitation, not a completed multiblock constructor.
- Minimum falsifier: current pass/other native action already accepts an equivalent multiblock plan; no two legal native plans exist for a two-block test; direct same-object construction collision; or any proposal must alter exceptions/loop semantics.
- Full-cost: compile CPU/RSS/temp, code bytes, explicit predicate/LOB instruction count, stock verifier/object semantics; no hardware-speed claim.
- Finite closure plan: inspect current eligibility/legality paths and flags; choose one two-block ARM MVE regression candidate; reconstruct stock reject/fallback and a legal candidate plan; independent Stage0 collision check. No implementation or main result is required in Discovery.
- Bounded debts: complete current union, strongest collision, legal witness and corpus selection are `OPEN_BOUNDED`, owned by `DISCOVERY_C0_DEEP → STAGE0`; each has the listed finite falsifier.
- Audit: `RQ_COMPLETE / RAW_REQUIRED COMPLETE / OPEN_BOUNDED / FRESH`; disposition `EVIDENCE_QUALIFIED_RAW`, C0 `YES`.

## QC30-02 — AArch64 MOPS expansion

- Current source/object action and direct collision closure were not reached within the precommitted bounded route. The likely intervention reduces to target instruction selection.
- Disposition: `EXCLUDED_BEFORE_RAW__GENERIC_INSTRUCTION_SELECTION_RISK`.

## QC30-03 — LoongArch address materialization

- Official current directory/source evidence exposes ordinary target lowering and relocation/fixup paths, but the proposed object is too close to reviewed linker/layout identities and has no distinct stock oracle/action contract.
- Disposition: `EXCLUDED_BEFORE_RAW__REVIEWED_LINKER_LAYOUT_ADJACENCY`.

## QC30-04 — cooperative matrix region lowering

- A target-specific producer/consumer plus cross-lane-distinct identity was not frozen. SPIR-V specification alone does not supply it.
- Disposition: `LOCATOR_ONLY__IDENTITY_CLOSURE_DEBT`.
