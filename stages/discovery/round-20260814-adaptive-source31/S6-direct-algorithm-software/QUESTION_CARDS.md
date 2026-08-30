# Source31 Question Cards

## QC31-01 — PowerPC MMA accumulator/subregister/spill construction

- Exact identity: current LLVM PowerPC backend, fixed MMA-enabled MachineFunction, target features, numerical matrix result, ABI and stock object/codegen semantics.
- Carrier: `CANONICAL_FORMAL_ORACLE`; public LLVM PPC/MMA tests route.
- Problem / counterfactual: current code contains RA hints for primed/unprimed accumulators, dedicated accumulator spill/restore opcodes and FMA register-pressure patterns. If a target-specific joint constructor exists, it changes allocation/spill/reassociation decisions for the same kernel without changing results.
- Claim: `COMPILER_TOOL / N2 / target-native action + FPT/certified Pareto guarantee`.
- Non-generic discriminator: accumulator `ACC/UACC/WACC` state binds to VSR subregister inputs and special spill forms; the algorithm must preserve those PPC MMA constraints and cannot be a generic RA solver.
- Current loci: `PPCRegisterInfo.h/.cpp` and `PPCInstrInfo.h/.cpp`, including `ppc-fma-rp-reduction`, accumulator move reporting, and accumulator/paired-vector spill forms.
- Minimum falsifier: current LLVM already jointly optimizes identical binding/reassociation/spill frontier; no legal two-plan MMA witness; direct same-object prior; or PPC state erases to generic RA.
- Full cost: compile CPU/RSS/temp, code bytes, ACC move/spill/restore count and bytes, stock object semantics; no hardware claim.
- Finite closure: Stage0 pin current PPC pass sequence and flags, choose one MMA regression, form two legal codegen plans, and subtract direct literature. Bounded debts are union, witness and collision; owner `DISCOVERY_C0_DEEP → STAGE0`.
- Disposition: `EVIDENCE_QUALIFIED_RAW`, C0 `YES`, claim ceiling `FINITE_FIDELITY_GAP`.

## QC31-02 — AVR shifts

Official source describes non-8/16-bit shifts expanded to inline loops. The proposed residual has no target-specific guarantee beyond ordinary expansion. `EXCLUDED_BEFORE_RAW__GENERIC_INSTRUCTION_SELECTION`.

## QC31-03 — SystemZ vector pairs

No frozen current source/action and stock-oracle triad in the bounded route. `LOCATOR_ONLY__SOURCE_CLOSURE_QUEUE`.

## QC31-04 — cooperative matrix fragments

No distinct target-specific producer/consumer identity. `LOCATOR_ONLY__IDENTITY_CLOSURE_DEBT`.
