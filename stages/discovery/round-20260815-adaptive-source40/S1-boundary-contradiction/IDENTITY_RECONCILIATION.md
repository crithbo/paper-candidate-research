# Source40 / Source19 identity reconciliation

Scope: mechanical, bounded reconciliation only. No new source retrieval, collision search, Stage 0 assessment, or Q2 assessment was performed.

Compared bytes:

- Source40 raw: `AARCH64_FPMR__FIXED_FP8_CALL_SEMANTICS__CALL_BOUNDARY_STATE_PRESERVATION`.
- Source19 D01: `AARCH64_FPMR_FP8__CALL_BOUNDARY_STATE_WRITE__FIXED_FP8_RESULT_AND_ABI`, from `CANDIDATE_GRADE_DEEP_REVIEWS.md` with SHA-256 `308e8795677662e897e1b84ddbad89fec5bee3ff16a38cc841912a57310885cd`.

| Required field | Source40 frozen raw | Source19 D01 | Relation |
|---|---|---|---|
| Object | AArch64 FPMR/FP8 call semantics and FPMR-related state at interprocedural boundaries | AArch64 FPMR controlling modal FP8 behavior at call boundaries | `EXACT` |
| Action | Interprocedural FPMR state preservation / placement across FP8 conversion regions | Whole-call-graph FPMR-state region construction choosing writes/checks over blocks and call boundaries | `TERMINAL_CONTAINS` |
| Endpoint | Fixed FP8 call semantics with native code-generation endpoint | Fixed FP8 result and public AAPCS64 endpoint | `EXACT` |
| Guarantee | Same calling convention and observable values/exceptions while retaining caller-saved ABI semantics | Same FP8 result and AAPCS64 caller-saved ABI observable | `EXACT` |
| Full-cost boundary | Compile CPU/RSS, bytes, save/restore, uops and runtime cycles | Compile CPU/RSS, bytes, FPMR reads/writes/branches, spill/frame growth and runtime cycles | `TERMINAL_CONTAINS` |

Source19 additionally records a current GCC direct collision: commit `1886dfb27a296b31de46b44beae0f1db6c1584b6`, “Avoid redundant writes to FPMR”, implements the repeated-call conditional-write witness. Its frozen conclusion is `DROP__DIRECT_CURRENT_GCC_FPMR_REDUNDANT_WRITE_COLLISION_AND_ABSORPTION`.

Conclusion: all five required fields are exact or terminally contained. The Source40 raw is therefore a historical repeat and direct-current-collision containment, not an independent opportunity family. This reconciliation does not infer anything from missing resources, implementation, or results.
