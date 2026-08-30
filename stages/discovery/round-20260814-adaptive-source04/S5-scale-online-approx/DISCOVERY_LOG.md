# Discovery log — Source04

## Frozen envelope

- Assignment: `DISCOVERY-S5-20260814-ADAPTIVE-SOURCE04`
- Lane: `S5_SCALE_ONLINE_APPROX`
- Date/cutoff: 2026-08-14
- Method: `V8_7_POTENTIAL_READINESS_SEPARATED`; `DISCOVERY_CLAIM_PACK_MODE=OFF`.
- Scope gate: an item may become raw only after its real object, current-union-external action, target-specific theorem shape, and finite checker-backed witness are all named. This batch did not relax that gate to fill a slot.

## Neutral source snapshots and pre-raw screening

| Family/signature | Neutral primary snapshot | Fixed object / stock semantics | Action-promise and witness check | Disposition |
|---|---|---|---|---|
| `COMPCERT_C_TO_ASM__SEMANTIC_PRESERVATION__INCREMENTAL_PASS_PROOF_REUSE__COMPILE_PROOF_COST` | CompCert 3.17 manual, dated 2026-02-13; upstream manual records the complete C-to-assembly pass chain. | C source and generated assembly behaviours under the compiler's stated semantics. | A proposed incremental reuse of pass proofs is not a named legal compiler constructor action. The current pass chain and proof boundary are broad, while no source-pinned target-specific recourse theorem or two-output checker witness was identified. | `NOT_ADMITTED_PRE_RAW__UNION_EXTERNAL_ACTION_AND_TARGET_THEOREM_UNFROZEN` |
| `FRAMAC_EVA_C_ANALYSIS__ALARM_SEMANTICS__INCREMENTAL_ABSTRACT_STATE_UPDATE__ANALYSIS_COST` | Official Frama-C Eva documentation and current option/cache documentation. | Eva's C-program value-analysis alarms and abstract-state semantics. | Caches and option-controlled analyses are native operational details, but this search did not establish a complete bounded-recourse abstract-state constructor distinct from the current configuration/action union, nor a target-specific soundness/complexity promise. | `NOT_ADMITTED_PRE_RAW__CURRENT_UNION_EXTERNAL_ACTION_PROMISE_NOT_CLOSED` |
| `CAKEML_ML_TO_MACHINE_CODE__BEHAVIOUR_COMPATIBILITY__INCREMENTAL_VERIFIED_BACKEND_CONSTRUCTION__COMPILE_PROOF_COST` | CakeML official project page and current download/how-to pages; project describes an 8-IR verified backend and target/config flags. | CakeML program to target-machine code, with the project's behaviour-compatibility theorem. | The actual `--reg_alg` and target choices are already native configuration. An online proof-reuse/reconstruction candidate was not reduced to a distinct whole-constructor action with a theorem over this fixed compiler object. | `NOT_ADMITTED_PRE_RAW__NATIVE_CONFIG_OR_GENERIC_PROOF_REUSE_NOT_N2` |
| `FSTAR_EXTRACTION_TO_OCAML_C_WASM__SOURCE_PROPERTY_BOUNDARY__INCREMENTAL_EXTRACTION_CONSTRUCTOR__EXTRACTION_PROOF_COST` | Official F* home page and extraction tutorial (current). | F* program extraction to supported backends; official tutorial explicitly retains a boundary when extracted code is called from unverified host code. | Treating extraction caching/recompilation as an online algorithm either changes the trusted/host boundary or becomes a build policy. No same-guarantee, union-external action plus checker-backed target theorem was frozen. | `DROP__CHANGED_GUARANTEE_OR_BUILD_POLICY_NOT_TARGET_SPECIFIC_N2` |
| `ISABELLE_CODEGEN_REFINEMENT__HOL_FUNCTION_SEMANTICS__INCREMENTAL_CODE_EQUATION_SELECTION__PROOF_BUILD_COST` | Isabelle official refinement/code-generation theory documentation. | HOL function and generated-code semantics. | Code-equation/refinement selection is the generic refinement mechanism itself. No deployed fixed-object natural carrier, target-specific recourse guarantee, or finite two-action witness was found. | `DROP__GENERIC_REFINEMENT_SELECTION_NOT_TARGET_SPECIFIC_ALGORITHM` |

## Current-upstream reality checks

The assessment used current official documentation rather than issue or future-work language. For the potentially relevant compiler families, the checked union included documented target and register-allocation flags (CakeML), and the complete documented verified pass structure (CompCert). For Eva, the checked union included its documented configuration/cache surface. No absence claim is made: the dispositions say only that the required action/theorem/witness was not closed from this bounded snapshot.

## Decision

`COMPLETE_ZERO_PROPOSALS`. None of the scoped leads passed the contract's pre-raw conjunction. In particular, no brief is created, and this does not assert that a useful implementation is impossible or that any hypothesis is false. A later assignment may re-open one only after pinning a real target-specific whole action, theorem shape, and checker-backed legal transition.

## Prohibited work

No experiment, benchmark, E2 smoke, build, installation, large download, V9 output, Stage0/A/B creation, automation, or shared-control write was performed.
