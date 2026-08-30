# R32 Source35 assignment-local shadow proposal

## Decision

- Audit label: `BACKTEST_REQUIRED__PROSPECTIVE_ASSIGNMENT_LOCAL_SHADOW`
- Active non-product veto after Source33: `STOP`
- Non-product analysis: `RETAIN_AS_ONE_CYCLE_SHADOW`
- Earliest boundary: after Source34 completes
- Scope: Source35 only
- Shared patch: none
- User policy approval required: no

## Exact directive

```yaml
source35_adaptation:
  id: BASE_RQ_CANONICAL_PLUS_NON_PRODUCT_SHADOW_AFTER_COMMIT_V1
  duration: EXACTLY_ONE_COMPLETE_SIX_LANE_ASSIGNMENT
  canonical_path:
    method: V8_7
    rq_frontend: RQ_REFINEMENT_STAGED_EVIDENCE_V1__PRODUCTION
    claim_pack: OFF
    v9: OFF
  decision_order:
    - FREEZE_BASE_FAMILY_AND_CANONICAL_DISPOSITION
    - WRITE_AND_HASH_CANONICAL_BASE_DECISION
    - RUN_NON_PRODUCT_NOTE_IN_SHADOW_ONLY
    - WRITE_DISCORDANCE_RECORD
    - ROUTE_ONLY_BASE_CLEAN_BRIEFS_TO_EXISTING_STAGE0
  shadow_applies_only_to: EVIDENCE_QUALIFIED_RAW__JOINT_OR_COMPOSED_ACTION
  shadow_fields:
    - factor_A
    - factor_B
    - strongest_sequential_composition
    - shared_endogenous_variable_or_cross_term
    - source_dependency_trace_max_two_loci
    - state_erasure_result
    - hypothetical_source33_disposition
  shadow_authority:
    may_change_base_decision: false
    may_select_or_backfill_source: false
    may_block_clean_brief: false
    may_rescue_canonical_drop: false
  unresolved_handling: ATTACH_AS_STAGE0_ATOMIC_CLOSURE_DEBT_IF_BASE_BRIEF_EXISTS
  required_metrics:
    - base_raw_count
    - base_clean_brief_count
    - shadow_applicable_count
    - shadow_would_pass_count
    - shadow_would_hold_count
    - shadow_would_drop_count
    - family_level_discordance
    - independent_stage0_feedback_when_available
  unchanged:
    - SIX_LANES_AND_CAPACITY
    - SAME_OBJECT
    - DIRECT_FATAL
    - CURRENT_UNION_AND_CURRENT_SOURCE_REALITY_CHECK
    - FAIR_STRONG_BASELINE
    - NATURAL_OR_CANONICAL_CARRIER
    - FULL_COST
    - FALSIFIER_AND_REPRODUCIBILITY
    - Q2_MINIMUM
    - NETWORK_SECURITY_EXCLUSION
    - ZERO_QUOTA
    - NO_OUTCOME_AWARE_BACKFILL
```

## Mechanical validation

For every shadow-applicable family:

1. `CANONICAL_BASE_DECISION.yaml` exists before the shadow note and has a stable hash.
2. Identity and base disposition are identical across base and shadow records.
3. Shadow cannot alter the base file, clean brief count, source selection or route.
4. Any chronology mismatch or base rewrite invalidates only that shadow comparison; no replay, replacement or quota fill is allowed.
5. Handoff reports all denominators, including zero.

## Rollback

At Source35 completion, default rollback is `NON_PRODUCT_SHADOW_OFF` for Source36 unless a new audit explicitly interprets the prospective discordance. Base artifacts and downstream Stage0 outcomes remain immutable. Rollback cannot revive SystemZ, promote RVV/NVPTX, change Source34, or erase any unresolved debt.
