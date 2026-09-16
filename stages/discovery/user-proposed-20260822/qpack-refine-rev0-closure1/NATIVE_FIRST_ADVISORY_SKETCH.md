# Native-first advisory sketch

This is an assignment-local investigation order, not an admission rule.

## Resolved native map

1. **Creator:** compressed-tensors checkpoint stores
   `weight_packed [N,K/8]`, `weight_scale [N,K/G]`, and
   `weight_zero_point [N/8,K/G]`.
2. **Modifier:** `process_weights_after_loading` applies a full packed-axis
   conversion: unpack 4-bit K-packed values, transpose `[N,K]` to `[K,N]`,
   repack eight consecutive N-values into an `int32`, and transpose scale data.
3. **Zero-point action:** preserve kernel layout when already
   `[K/G,N/8]`; otherwise transpose the declared compressed-tensors layout;
   any other shape raises an assertion.
4. **Consumer:** `triton_w4a16_gemm` asserts contiguous arrays and the exact
   packed/scales/zero shapes; its kernel extracts nibbles at offsets
   `[0,4,...,28]`, computes group row `g_idx`, and loads the matching scale/zero
   row. `BLOCK_K` is clamped so a tile cannot cross group boundaries.

## Advisory invariant considered

For every logical `(k,n)`, the post-load packed nibble and the scale/zero group
selected by the kernel denote the same source quantized value and frozen
dequantization equation.

## Why it does not survive as an N2

The fixed native action already implements the sole nontrivial conversion in
that invariant. Reifying the relation as additional checks would duplicate an
existing constructor's semantics without changing the object, reader/kernel, or
guarantee; it is a checker/wrapper rather than a target-specific joint
algorithm. This is a direct-fatal finding, not a penalty for any missing
advisory field.

