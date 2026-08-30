# Discovery Question Card — QC01

## Identity

- Card / RQ: `QC01 / RQ01`, seed S01.
- Exact public identity: current GNU GCC `Optimize Options` page, `-fipa-ra`, checked 2026-08-15; source locus precommitted as official `gcc/ipa-ra.cc`.
- Carrier kind: `IMPLEMENTATION_CARRIER_ONLY`; a finite later route could use versioned GCC testsuite C/C++ call graphs.  None was acquired, built, or run.
- Network-security exclusion: `PASS`.
- Identity preflight: only `RELATED_ONLY` against Source44 RVV state construction; this did not exclude the RQ.

## Contract and evidence-qualified raw gate

- Exact object: fixed C/C++ whole-program call graph, target ABI, liveness, flags and observable behavior.
- Hypothesized endpoint: a whole-call-graph allocation/caller-save frontier retaining ABI/program behavior.
- Initial full cost: IPA state and compiler CPU/RSS, generated code size, spill/move/save traffic, and fixed-workload runtime.
- Current official locus: current GCC documentation states that `-fipa-ra` uses caller-save registers when they are unused by called functions.  It also records concrete constraints: caller and callees must share the compilation unit and compile order; the option is incompatible with explicit LTO partitioning and is recommended with profile feedback but not enabled by default.
- Minimal two-action sketch: under fixed ABI and call graph, a caller may retain a value in a call-clobbered register when every relevant callee leaves it unused, or save/restore/spill it around the call.  This is legal action freedom, not yet a contribution.
- Strongest immediate contrary explanation: ordinary interprocedural register allocation/ABI-aware caller-save allocation already expresses exactly this decision class.  The official option itself implements the direct native primitive.
- **Non-generic discriminator audit:** `FAILED`.  The proposed recurrence selects registers/save locations based on liveness and costs only; no target-specific finite state, semantic law, nonstandard guarantee, or construction skeleton survives after removing the compiler name.  It is prohibited generic RA rather than an S6 N2.
- Minimum falsifier: demonstrate that the putative method can be stated as target-agnostic cross-function RA/caller-save selection.  The frozen RQ statement has exactly that form.
- Finite route: `NOT_NEEDED_AFTER_GENERIC_KERNEL`; there is no raw entry or closure debt transfer.
- Front-end disposition: `EXCLUDED_BEFORE_RAW__GENERIC_REGISTER_ALLOCATION_KERNEL`.

No disposition uses lack of implementation, result, resource, AI readiness, exact source checkout, or benchmark.
