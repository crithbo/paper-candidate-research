# S4 Source11 — Reproducible Compiler / Architecture Ranking-Reversal Screen

Assignment `DISCOVERY-S4-20260814-ADAPTIVE-SOURCE11`; canonical method `V8_7_POTENTIAL_READINESS_SEPARATED`; claim-pack mode `OFF`.  This was a bounded, source-only screen on 2026-08-14.  No benchmark, build, E2 smoke, or measurement was run.  In particular, a possible reversal is not reported as an observed fact.

The admission unit is a versioned natural panel plus a pre-registered estimand, controlled confounds, a stable decision threshold, held-out falsifier, and an offline same-object corrective construction.  Merely changing a compiler option, showing a dashboard rank, or selecting a configuration is not a corrective construction.

| Raw screen ID | Deduplicated family / neutral opportunity | Source-grounded current reality check | Required same-object correction and finite falsifier | Disposition |
|---|---|---|---|---|
| R1 | `LLVM_MCA_STATIC_SCHEDULE_MODEL_VS_ARCHITECTURE_RANKING` | Current LLVM `llvm-mca` is a static analysis of assembly for a selected target scheduling model; docs expose `-mcpu`, analysis views, store-queue and register-file parameters.  It intentionally does not model fetch/decode, branch prediction, or cache-hit/miss behavior. | A frozen corpus of versioned assembly plus matched hardware observations would be needed to establish a reversal; the correction must be an offline, semantics-preserving construction rather than a model/flag selector.  Held-out target/workload panels must falsify the claimed threshold. | `NOT_ADMITTED_UNFROZEN`: neither a versioned natural paired panel nor a target-specific non-controller construction is frozen. |
| R2 | `LLVM_BOLT_PROFILE_LAYOUT_RANKING_VS_FULL_COST` | LLVM documents BOLT as a runtime-profile-guided post-link binary optimizer whose action space already contains profile-guided binary layout transformations. | A residual would have to be a whole offline layout constructor with the same binary semantics, and show a reproducible full-cost rank reversal (profile collection + transformation + startup/tail cost) outside that action union. | `NOT_ADMITTED_UNFROZEN`: no natural versioned panel, threshold, or action-gap certificate was frozen; profile/layout configuration alone is not a residual. |
| R3 | `GCC_TARGET_TUNING_RANK_REVERSAL` | Current GCC documentation exposes `-march`, `-mcpu`, and `-mtune` target options; these are target-tuning controls, and `-march` may alter runnable ISA. | Any proposed rank correction that selects these values is configuration tuning; preserving one portable output/ISA contract would require a distinct, fully specified algorithm. | `STRUCTURAL_DROP__ORDINARY_TARGET_TUNING_OR_CHANGED_EXECUTABILITY`. |
| R4 | LLVM revision / test-suite performance ranking | This is the Source10 LLVM version-panel identity, not a new family. | Reopening would require a distinct constructor and independently frozen natural regime contract. | `EXCLUDED_SOURCE10_IDENTITY`. |
| R5 | HotSpot tier-transition ranking | This is the Source10 runtime tier/controller identity. | A tier policy is not the required offline same-object constructor. | `EXCLUDED_SOURCE10_IDENTITY__CONTROLLER_RISK`. |
| R6 | SPEC CPU base/peak ranking | This is the Source03 evaluation-metric identity. | Base/peak reporting correction was already screened; no new action is asserted. | `EXCLUDED_SOURCE03_IDENTITY`. |

Counts: `RAW_SCREEN_ROW_EVENT=6`; `UNIQUE_OPPORTUNITY_FAMILY=3` (R1–R3); `CANDIDATE_GRADE_DEEP_REVIEW=0`; `STAGE0_BRIEF=0`; `PROPOSE_STAGE0=0`.

No row reached candidate-grade depth because none jointly closed the required natural panel, estimand/confounds, stable threshold, held-out falsifier, and non-controller same-object corrective action.  This is not an inference from missing implementation, results, hardware, resources, or AI readiness.

## Primary-source search record

- LLVM, [llvm-mca command guide](https://llvm.org/docs/CommandGuide/llvm-mca.html), current documentation accessed 2026-08-14: static scheduling-model analysis, option surface, and stated front-end/cache limitations.
- LLVM, [Advanced Build Configurations](https://llvm.org/docs/AdvancedBuilds.html), current documentation accessed 2026-08-14: BOLT is profile-guided post-link binary optimization and layout is within its native scope.
- GCC, [Option Summary](https://gcc.gnu.org/onlinedocs/gcc/Option-Summary.html), current documentation accessed 2026-08-14: target-specific `-march`/`-mcpu`/`-mtune` controls.

Search boundary: official LLVM/GCC documentation and source-linked documentation, plus the assignment's prior-family exclusions, were consulted.  No global novelty claim is made.
