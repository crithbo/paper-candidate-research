# Source31 deep review

## D31-01 — PowerPC MMA joint accumulator construction

- Same object: fixed MMA MachineFunction, target/ABI, numerical outputs and stock codegen/object semantics.
- Strongest current composition: PPC RA consumes accumulator/subregister hints; PPC machine combiner can reduce FMA pressure; target register/instruction paths emit ACC/UACC/WACC spill and restore operations. Controls include `ppc-fma-rp-reduction` and existing PPC register options.
- Whole action: use a bounded MMA accumulator/VSR interference interface to jointly bind accumulator classes, choose legal reassociation pressure form, and choose native spill representation; output a PPC-specific legal Pareto frontier rather than generic allocation.
- Minimal witness: two live MMA accumulators whose VSR input pairing and an intervening pressure point permit stock and candidate legal bindings; Stage0 must construct it from an upstream test.
- Guarantee: FPT in live accumulator interface size; certificate preserves ACC/UACC/WACC subregister legality and emits only current PPC native spill/restore forms.
- Carrier/oracle/full cost: LLVM PowerPC MMA regression; LLVM verifier/object semantics; compile CPU/RSS/temp, output bytes, accumulator copy/spill/restore counts and bytes.
- 72h killer: current union matches frontier, no legal two-plan witness, direct same-object collision, or generic RA reduction.
- Outcome: conditional `PROPOSE_STAGE0__FINITE_FIDELITY_GAP`, `TIER_B_Q2_VIABLE`.
