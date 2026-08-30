# Source32 question card — RVV LMUL/RA/vsetvli

Exact public identity: LLVM 24.0.0git RVV backend documentation, fixed RVV IR/program, `+v` target semantics and stock executable output; carrier `IMPLEMENTATION_CARRIER_ONLY` with LLVM RVV tests/source route.

Opportunity: RVV LMUL determines grouped physical-register classes and legal alignment; LLVM documents vector register allocation before `RISCVInsertVSETVLI`, which then performs dataflow to emit/minimize configurations. Candidate N2 is an RVV-specific Pareto algorithm over group assignment and configuration state, not an `-mtune` flag or generic scheduler.

Minimum falsifier: a bounded mixed-LMUL/masked basic block where all legal LMUL-group allocations yield the same vtype-transition/spill Pareto set as stock composition. Full cost boundary: compile CPU/RSS, code size, spills/rematerialization, vsetvli count, static schedule/resource model and runtime cycles on an eventual public RVV carrier.

Required raw fields are present. Bounded debt: full current source union, direct literature collision, complete witness and natural corpus; owner `DISCOVERY_C0_DEEP`, three decisive questions maximum. Disposition `EVIDENCE_QUALIFIED_RAW`.
