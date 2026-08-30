# LLVM-PPC-PREFIX-PRESSURE-PARETODP — Independent Stage 0 confirmation

- Assignment: `STAGE0-C2-20260811-LLVM-PPC-PREFIX-PRESSURE-PARETODP-CONFIRM-V8.7`
- Role: `INDEPENDENT_CONFIRMATION_SENTRY`
- Decision: `CONFIRM_REVISE_ONCE`
- Tier: `TIER_B_Q2_VIABLE__CONDITIONAL_ON_UNIQUE_GATE`
- Confidence: `0.83`
- Evidence ceiling: `STATIC_CURRENT_SOURCE_AND_CERTIFICATE_ROUTE_ONLY__NO_IMPLEMENTATION__NO_RESULT`
- Latest-collision status: `SEARCH_BOUNDED_OPEN`

## Independent disposition

I confirm the sole gate `PPCREL34_ELFV2__FUTURE_NATIVE_ACTION_PRESERVING_TRACE_PARETO_CERTIFICATE`.  The topic retains conditional Q2 N2 potential only if it supplies a direct-PCREL34 versus materialized-address trace that is outside current GOT `PLDpc` relaxation and a target-specific certified solver.  It must not claim that prefixed PC-relative instructions themselves are new.

Current LLVM/lld absorbs important fragments: prefixed classification, PCREL GOT `PLDpc` def/use handling, default-on `ppc-pcrel-linker-opt`, default-on `ppc-late-peephole`, typed MC relocation emission and PCREL34/GOT-PCREL34 linker relaxation.  Those facts invalidate any easy GOT/no-temporary witness, but they do not establish a same-object current composition with a complete Power10 ELFv2 trace quotient and exact/FPT/certified Pareto guarantee.  Generic CP/ILP/Unison-style integrated RA/scheduling is a strong methodological subtractor, not by itself a fatal deployment oracle.

## Decisive independent checks

### 1. Fixed object and witness boundary

The object must be one Power10, ppc64le Linux, ELFv2, medium-code-model pre-form MachineIR trace, with fixed semantics, def/use and alias facts, ABI/unwind/frame requirements, symbol binding/visibility and relocation model.  Candidate choices are limited to target-legal forms of a fixed addressable operation:

1. direct `PCREL34` prefixed access when ISA/ABI/relocation conditions allow;
2. another legal target prefixed displacement form; or
3. materialize-address-plus-use, including its distinct address value and all native RA/coalescing/spill consequences.

A valid witness must use a direct PCREL34 access with concrete binding and relocation facts.  It may not be a GOT-indirect `PLDpc` sequence: the current pre-emit/lld union already recognizes that path, and lld distinguishes a loadable-object relaxation from `paddi`, which requires an address.  Changing ABI, code model, binding, object format, linker, CFG or semantics is a same-object failure.

### 2. Complete strong union

The revision must include current LLVM instruction/form selection; greedy/PBQP RA, coalescing/spills/frame handling; PPC late pre-emit transformations; MC emission; and `ld.lld` relaxation.  Independent official Doxygen confirms both `ppc-pcrel-linker-opt` and `ppc-late-peephole` default to true.  Their legal disabled settings, Power10 feature selection and code-model/relocation modes are finite negative controls, not missing actions.  Form-fixed/current-RA and form-aware/fixed-RA ablations are required.

GCC/binutils can be deployment subtractors but do not automatically form an equivalent-MachineIR baseline.  A generic solver or the theoretical ability to enumerate registers is not a fatal union: it lacks the frozen LLVM action grammar, complete cost ledger and candidate's claimed target-specific guarantee.

### 3. Future-native-action quotient

The state must distinguish direct loaded values from materialized addresses; legal PCREL/form/relocation-pair status; target register class/subregister constraints; live interference and remaining uses; callee/caller/frame/unwind obligations; and all declared Pareto costs.  Any quotient must preserve every legal future LLVM/MC/lld form, RA, spill/coalescing, relocation, ABI/frame and cost transition.

The certificate must state base/terminal cases, deterministic ties and an honest exact/FPT or certified-frontier bound.  Register symmetry may be quotiented only after proving future native action, register-class, reserved-register, ABI and cost preservation; arbitrary physical-register renaming is invalid.  Generic CP/ILP, raw identity enumeration, threshold tuning or scalar "prefixed saves a register" weighting is not N2.

### 4. Static divergence and finite Stage A killer

The static witness must show a legal action the full LLVM/lld configuration union does not already produce and a declared-cost frontier point unavailable to every stated single-policy composition.  It proves action divergence only, not performance.  The finite Stage A preclaim gate must pin CPU/triple/ELFv2/code model/binding/assembler/linker and verify semantics, assembly, object, typed relocations and DWARF/unwind before any cost claim.  It then must replay the complete union on public LLVM PPC tests/Test-Suite functions and charge model/optimizer, compile/link, RSS, text, relocations, spill/copy/frame, verification and runtime costs.  Illegality, union domination or overhead-erased full-cost residual kills the mechanism.

## Verdict and unique revision contract

The gate is lawful and finite.  It closes only if one integrated certificate has:

1. a concrete direct-PCREL34/materialized-address witness outside GOT `PLDpc` relaxation;
2. the complete current LLVM/lld action/configuration catalog;
3. a finite future-native-action/legality/cost-preserving state equivalence;
4. target-specific exact/FPT/certified Pareto recurrence with an honest bound; and
5. the finite Stage A fidelity/full-cost killer above.

It must end `BELOW_Q2_STOP` if the witness is current GOT relaxation, illegal, or changes the frozen object, or if the solver reduces to generic RA/CP/ILP, arbitrary register symmetry, identity enumeration or threshold tuning.  Missing implementation or results are not STOP evidence.

## Sources and independence

- Frozen PRIMARY package hash check: `4/4 PASS`; observed LLVM source pin `f127b4c19c63b0492fb924934e37e032c17ea35b`.
- [LLVM PPC pre-emit Doxygen](https://llvm.org/doxygen/PPCPreEmitPeephole_8cpp.html) confirms the two relevant switches are hidden but default-on.  [Lozano et al., TOPLAS 2019](https://dblp.org/rec/journals/toplas/LozanoCBS19.html) and the [2019 survey](https://kth.diva-portal.org/smash/record.jsf?pid=diva2%3A1348978) establish generic combinatorial RA/scheduling as prior art.
- No revision, candidate implementation, experiment, benchmark, Stage A or Stage B activity was performed.  No E-drive path was read or written.
