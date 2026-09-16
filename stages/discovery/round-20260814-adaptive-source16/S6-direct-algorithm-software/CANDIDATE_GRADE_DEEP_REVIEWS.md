# Candidate-grade deep reviews — Source16

## D1 — AArch64 SME ABI transition-and-preservation constructor

**Exact object and same-function guarantee.** A fixed LLVM IR call graph with
fixed ACLE/IR attributes, values, exceptions and AArch64 SME ABI behavior. The
output must preserve observable call results and the required PSTATE.SM/ZA
entry/return state; it is not allowed to weaken the ABI.

**Candidate atomic action and two native-legal plans.** Around a normal-to-
streaming call, Plan A emits the ABI-mandated transition and saves/reloads live
FP/SVE values around it. Plan B would jointly choose preservation placement
across an adjacent compatible-call region while emitting the same required
transitions and preserving every live value. Both are syntactically native
actions only if no operation can cross a state transition illegally.

**Current union and subtractor.** LLVM documents all interface combinations,
compiler-inserted `SMSTART/SMSTOP`, conditional nodes, SelectionDAG ordering,
register masks, and a dedicated ABI pass. It explicitly says changing PSTATE.SM
can change SVE length, zero FP/vector registers and change the permitted
instructions; transitions are inserted at ABI call boundaries [S1]. The fair
union is the ABI pass plus call lowering, chains/glue and register allocation,
not a weak per-instruction baseline.

**Residual verdict.** A bounded certificate for Plan B cannot be named without
either moving a mandatory boundary transition or turning the problem into
ordinary live-range/spill scheduling. The former changes the fixed ABI object;
the latter is generic scheduling rather than an SME-specific N2. Thus
`STRUCTURAL_DROP__ABI_MANDATED_TRANSITIONS_OR_GENERIC_LIVENESS_SCHEDULING`.

**Natural route, full cost, finite falsifier.** LLVM AArch64 SME tests and
public ACLE examples; oracle is IR/assembly plus ABI/call-result equivalence.
Full cost would include compile CPU/wall/RSS/temp, code bytes, transition and
spill/reload instructions, and call-path latency. A 72-hour falsifier is a
two-call mixed-interface MIR/IR witness showing a Plan B that preserves all
state and has a target-specific guarantee not reducible to current ABI lowering
or generic liveness. This was not frozen; no experiment was run.

## D2 — SPIR-V cooperative-matrix capability/operation constructor

**Exact object and same-function guarantee.** A fixed LLVM/OpenCL kernel,
cooperative-matrix operand dimensions/types/layouts, enabled capability set and
validated SPIR-V behavior. Stock SPIR-V validation and kernel results are the
oracle.

**Candidate atomic action and two-plan test.** The contemplated pair is two
SPIR-V modules that compute the same matrix result while choosing distinct
cooperative-matrix capability/operation constructions. Current documentation
ties cooperative-matrix operations to declared capabilities/extensions; those
declarations are part of the module's target contract [S2]. A two-plan pair was
not frozen without changing that capability or the operation representation.

**Current union and subtractor.** The fair union includes LLVM's SPIR-V target,
extension/capability selection, standard SPIR-V validation, and direct
cooperative-matrix toolchains/specifications. A generic tiling, lowering or
instruction selector does not become a target-specific whole constructor merely
because the output is SPIR-V.

**Residual verdict.** `STRUCTURAL_DROP__CAPABILITY_CONTRACT_OR_GENERIC_MATRIX_LOWERING`.
The apparent choice either changes the enabled feature contract or is a generic
matrix lowering/tiling residual; no target-specific exact/FPT/approx/certified
guarantee survived this subtractor.

**Natural route, full cost, finite falsifier.** Version-pinned OpenCL/LLVM
cooperative-matrix tests; validator plus output equality oracle. Full cost would
include compile CPU/wall/RSS/temp, SPIR-V bytes, validation, dispatch and host
result checking. A 72-hour killer is a validator-accepted two-module pair with
identical capability contract and results, coupled to a non-generic formal
guarantee. No such pair was claimed or tested.

## Third-depth decision

Only D1 and D2 had a role-complete pre-outcome two-plan skeleton. The contract
requires at least three such cards before a third depth review. No family was
added or promoted after seeing these outcomes.
