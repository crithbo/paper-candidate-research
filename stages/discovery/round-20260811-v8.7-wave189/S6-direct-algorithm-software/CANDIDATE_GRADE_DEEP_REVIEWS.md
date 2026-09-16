# Candidate-grade deep reviews

## 1. CompCert verified compilation — NOT ADMITTED UNFROZEN

**Object/oracle.** Same elaborated CompCert-C AST and target abstract Asm program; semantic preservation is checked in Rocq/Coq. Native output need not be byte-identical, but observable behaviours must remain within the formal theorem's relation.

**Current whole action.** The current compiler performs eight intermediate languages and fifteen passes, including transformations/optimizations/code generation; source-to-source options exist. This is a complete multi-pass transform producer, not an emitter baseline.

**Witness/closure.** Two legal pass-level representation choices would demonstrate possible internal divergence, but no current source/flag union was enumerated at per-pass granularity and no union-external global action or nontrivial guarantee is named. Natural carrier could be the public CompCert regression/C programs; cost would include compile CPU/RSS, generated code bytes and runtime only under identical target semantics. Kill if a pass configuration expresses the action, an end-to-end boundary changes, or the increment is only scheduling. `NOT_ADMITTED_UNFROZEN`.

## 2. CakeML verified backend — NOT ADMITTED UNFROZEN

**Object/oracle.** Fixed CakeML AST and target-architecture machine code, with HOL theorem compatible with source behaviours and the HOL kernel/verified compiler chain as checker.

**Current whole action.** The backend crosses eight intermediate languages and supports six targets; source describes compilation inside HOL and verified proof-checker binaries. Thus changing an individual code-generation or layout choice is not a new checked-constructor family.

**Witness/closure.** A prospective joint representation/allocation/pass constructor would need a same-information proof and a complexity/space guarantee beyond the existing backend. Current source/configuration and target-specific union, plus a native legal small witness, are not frozen. Natural route: public CakeML programs/checkers; full cost: compiler/checker CPU/RSS, executable bytes, temp and same semantic test/oracle. `NOT_ADMITTED_UNFROZEN`.

## 3. Why3 proof-obligation transformation — NOT ADMITTED UNFROZEN

**Object/oracle.** Fixed WhyML specification and theorem, transformed tasks and proof/session accepted by the designated prover/checking workflow.

**Current whole action.** Why3 exposes a current transformation catalogue and records proof sessions; transformations can return partly reduced goals. This is already a rule/strategy system, so a simple sequence selector is not N2.

**Witness/closure.** A complete jointly certified task constructor could be a research object only after fixing a stock checker/proof format, all transformation parameters and same proof-theorem semantics. The external-prover boundary and complete current union remain unclosed. Natural carrier: public Why3 examples/regressions; ledger: transformation, prover/checker CPU/RSS, task/proof bytes and temp. `NOT_ADMITTED_UNFROZEN`.

### Other screened families

Coqlex has a generated lexer with Coq proof; AProVE/CeTA has checked termination certificates; Lutsig has HOL-checked synthesis. Each has an appropriate kernel/checker but no source-frozen whole-action union plus union-external complete global constructor in this screening pass. They remain `NOT_ADMITTED_UNFROZEN`, not readiness drops.

### Common 72-hour killer

Pin immutable upstream source/release; enumerate every native transform/config path; make a minimal public input with two legal dependency-linked actions; use the stock proof kernel/checker and semantic oracle; compare whole producer union and full compile/transform/check cost. Reject if a current action expresses it, checker/theorem/output semantics change, or no nontrivial N2 guarantee survives.

