# QGROUP-GUARD-REV0 — bounded divergence seed

## Frozen seed

`S6-QGROUP-01`: a W4A16 GEMV tile may cross a quantization group while the
kernel uses one scale/zero-point row for the entire tile.  The proposed native
action is to verify the group mapping and repair an illegal schedule without
changing the decoded weights, output tensor, or groupwise quantization
semantics.

This is a locator only.  It does not assert a bug, novelty, or an admissible
paper residual.  The untrusted proposal attachment supplied with the
assignment is not used as evidence.

## Minimal same-object trace

For `K=256`, `G=128`, and a fixed W4A16 packed matrix, a legal `BLOCK_K=32`
schedule visits group indices `0,0,0,0,1,1,1,1`.  A hypothetical `BLOCK_K=128`
schedule visits `0,1`; both preserve the decoded result.  A `BLOCK_K=256`
schedule cannot use a single `g_idx` for its whole tile: it must either be
rejected/repaired or load two group rows.

The trace distinguishes a real metadata invariant from a mere parameter name.
It is not evidence that the hypothetical 256-wide schedule belongs to the
current producer union or has a non-generic algorithmic residual.

## Initial falsifier

If the frozen native kernel already enforces one scale group per K tile (by
legal tile selection and/or a clamp), the requested verification/repair action
is directly absorbed and this seed must be dropped.
