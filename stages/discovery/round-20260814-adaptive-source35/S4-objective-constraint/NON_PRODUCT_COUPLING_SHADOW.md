# Non-product coupling shadow — Source35

## Isolation contract

- Canonical base snapshot: `CANONICAL_BASE_DECISION.yaml`
- Frozen before this diagnostic: SHA256 `504F8EBE55B278CA84FEB74F7A43C7C939ACF2C98663555D89B175EC8213DD72`
- The snapshot is immutable after this point. This shadow cannot create raw items or briefs, cannot block, rescue, or alter the base disposition, and has no active veto.

## Applicability review

The diagnostic applies only to a base-admitted joint/co-design/integrated/whole-constructor item with an allocation, register-allocation, scheduling, packing, placement, or controller factor. Canonical base admission count is zero. Therefore every seed is outside the shadow input domain.

| Required shadow disposition | Count | Interpretation |
|---|---:|---|
| `NOT_APPLICABLE` | 12 | No base-admitted item with a frozen applicable factor. |
| `SHADOW_SURVIVES` | 0 | No shadow input. |
| `SHADOW_NOT_READY_NON_PRODUCT_UNPROVEN` | 0 | No shadow input. |
| `SHADOW_COLLAPSES_GENERIC_PRODUCT` | 0 | No shadow input. |

This is a diagnostic outcome only, not negative scientific evidence about an unadmitted seed.
