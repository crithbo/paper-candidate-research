# Source31 RQ Candidates

## RQ31-01 — PowerPC MMA accumulator-state construction

- RQ-A: Can fixed Power10/PowerPC MMA MachineIR use a joint accumulator/subregister binding and spill representation algorithm without changing matrix result/ABI semantics?
- RQ-B: Does a bounded accumulator interference interface support an exact/FPT/certified Pareto construction jointly accounting for FMA reassociation pressure and native accumulator spills?
- Selected: RQ-B; type `COMPILER_TOOL`, N2.
- Boundary: fixed MachineFunction, MMA feature set, numerical result, ABI and target instruction legality.
- Primary source route: official LLVM current PPC register/instruction source; public LLVM PPC tests as canonical carrier.
- FINER-lite: feasible `CONDITIONAL`; interesting `CLEAR`; novelty threat `HIGH`; scope `PASS`; relevant `CLEAR`.
- Disposition: `RQ_READY_FOR_EVIDENCE_LOOKUP`.

## RQ31-02 — AVR shifts

The likely delta is ordinary instruction expansion; selected only as a falsifying control. `RQ_READY_FOR_EVIDENCE_LOOKUP`.

## RQ31-03 — SystemZ vector pairs

Exact target/current action union not yet frozen. `RQ_READY_FOR_EVIDENCE_LOOKUP`.

## RQ31-04 — cooperative matrix fragment state

Need distinct producer/consumer identity; historic overlap is a pre-registered risk. `RQ_READY_FOR_EVIDENCE_LOOKUP`.
