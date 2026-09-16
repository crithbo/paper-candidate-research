# DISCOVERY_LOG — Wave 240

## Result

`COMPLETE_ZERO_PROPOSALS`.

The proposed AMX joint residual fails structurally. TILECFG represents all eight physical tile shapes at once, post-RA configuration construction already derives that state from the allocator, and pre-RA placement already handles reachability/call clobbers. Under a fixed shape and ABI, remapping cannot remove a required caller-saved reload or dominance boundary; what remains is current tile RA/spilling or generic coloring.

| funnel stage | count |
|---|---:|
| RAW_SCREEN_ROW_EVENT | 1 |
| UNIQUE_OPPORTUNITY_FAMILY | 1 |
| CANDIDATE_GRADE_DEEP_REVIEW | 1 |
| STRUCTURAL_DROP | 1 |
| NOT_ADMITTED_UNFROZEN | 0 |
| STAGE0_BRIEF / PROPOSE_STAGE0 | 0 |

No resource, hardware, implementation, AI-readiness or missing-result claim participates in the drop.
