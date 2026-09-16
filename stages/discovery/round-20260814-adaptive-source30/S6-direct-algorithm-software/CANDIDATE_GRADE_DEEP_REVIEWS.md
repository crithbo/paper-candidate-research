# Source30 Candidate-grade deep review

## D30-01 — ARM MVE multiblock tail-predicated loop construction

- Fixed object: one LLVM ARM MachineFunction for Armv8.1-M with MVE and LOB enabled; same vector loop values, active-lane semantics, branches, exceptions, and target features.
- Current strongest composition: vectorizer emits active-lane masks; `MVETailPredication` converts recognized masks to VCTP; `ARMLowOverheadLoops` converts native forms to DLSTP/WLSTP/LETP. This is the named fair baseline, including `tail-predication` and `arm-loloops-disable-tailpred` controls.
- Candidate action: jointly choose a semantically legal partition/reconstruction of a multiblock loop into a tail-predicated region plus fallback segments, and its VPT/VCTP/LOB state representation. This is a whole-loop constructor, not an engine selector, threshold or generic scheduler.
- Static survival trace: a loop with a preheader, vector active-mask path and two internal blocks. The candidate survives only if source-level LLVM legality establishes two same-result alternatives—stock fallback/rejection and a plan using existing VCTP/DLSTP/WLSTP/LETP actions—without changing exception or branch behavior.
- Algorithm/guarantee shape: FPT in the finite number of region boundary states, VPT state and MVE width class; output has a certificate that every tail-predicated region satisfies the same active-lane and LOB legality checks. Objective is a Pareto vector of emitted bytes, predicate/loop instructions and compile cost.
- Carrier/oracle: version-pinned LLVM ARM/MVE regression/MIR selection; LLVM verifier plus matching generated-machine semantics/object checks.
- Full cost: compilation CPU/RSS/temp; bytes; VPT/VCTP/LOB instruction counts; semantic check. Hardware throughput is excluded from the initial claim.
- 72h killer: current source admits the equivalent multiblock plan, the two-plan witness is illegal, direct literature covers same action/guarantee, or target state can be erased leaving generic CFG scheduling.
- Disposition: `PROPOSE_STAGE0__FINITE_FIDELITY_GAP`, conditional `TIER_B_Q2_VIABLE`.
