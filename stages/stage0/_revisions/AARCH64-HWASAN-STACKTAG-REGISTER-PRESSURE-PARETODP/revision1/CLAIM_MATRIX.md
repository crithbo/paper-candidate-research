# Claim matrix — HWASan revision1

| Claim / gate conjunct | Evidence | Status |
|---|---|---|
| MTE stack tagging is excluded from HWASan same-object catalogue | confirmation review plus current `AArch64StackTagging` guard | PASS |
| Current HWASan uses one base tag plus a fixed per-alloca re-tag | current `getStackBaseTag`, `getAllocaTag`, official design | PASS |
| Current pass fixes tagged-use replacement, align/pad, tag/untag and short-granule behavior | current `instrumentStack` / `tagAlloca` | PASS |
| Two native-realizable fixed-contract HWASan plans exist | complete action audit finds no candidate branch | FAIL |
| Divergence is tied to live tagged-pointer pressure | mask reassignment preserves base/XOR operand form and pointer liveness | FAIL |
| Future-action/full-cost preserving target-specific state exists | no nontrivial HWASan action coordinate remains | FAIL |
| Exact/FPT/certified target-specific Pareto recurrence exists | would be generic layout/RA enumeration only | FAIL |
| Finite Stage A falsifier can be frozen | specified for a new-ID successor only | PASS, non-authorizing |

## Verdict

The sole revision gate is not closed. This is a scientific, same-object action-space failure, not a readiness or resource failure.

`RECOMMEND_BELOW_Q2_STOP__CURRENT_HWASAN_STACKTAG_COMPOSITION_OR_GENERIC_RA_PACKAGING`

