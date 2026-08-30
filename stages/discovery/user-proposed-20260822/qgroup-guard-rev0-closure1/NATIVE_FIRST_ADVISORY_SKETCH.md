# Native-first advisory sketch (non-gating)

The assignment asked to inspect the native W4A16 producer before broad
literature search.  That order was followed because the candidate is an
implementation-action claim.

## Current native sequence located

1. The compressed-tensors WNA16 scheme records group size, packed weights,
   scales, optional zero points, and optional activation ordering; it selects a
   multiprocess linear-kernel backend.
2. `TritonW4A16LinearKernel.can_implement` restricts quant types, activation
   type, packed-N divisibility, `g_idx`, supported group sizes, and `K % G`.
3. The Triton GEMV kernel derives exactly one metadata row
   `g_idx=(k_start * BLOCK_K)//group_size` for a K tile, loads that row's scales
   and optional zero points, and dequantizes the tile.
4. Before launch, the source clamps `BLOCK_K` when it exceeds `group_size`,
   explicitly stating that otherwise the tail of the tile would use the wrong
   group scales.

For the frozen `G=128` object the default source choices use `BLOCK_K=32`, so
the group boundary is crossed only after four legal tiles.  The hypothetical
`BLOCK_K=128` is also same-object legal but changes only a bounded tile
parameter; it does not add a verification or repair action.  A 256-wide
one-`g_idx` tile is not a legal instance of this kernel contract.

## Advisory conclusion

There is no current-union-external native guard/repair left in the requested
action space.  This advisory conclusion is corroborated by code, and is not
caused by any missing advisory field or the number of public bug reports.
