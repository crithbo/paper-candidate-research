# Candidate-grade deep review — D01

## Current source reality

`X86PreTileConfig` documents the complete pre-allocation obligation: AMX shapes are encoded by pseudo operands, `ldtilecfg` must reach every variable shape, multiple inserts are used when no common dominating point exists, and the caller-saved configuration must be reloaded after a call that clobbers AMX registers. The pass computes those legal points.

`X86TileConfig` then runs after tile register allocation, consults the final physical mapping (`VirtRegMap`) and writes the row/column fields for each used physical tile into the descriptor. The documented descriptor contains separate fields for tile0 through tile7. Specialized tile RA is enabled by default through LLVM’s `x86-tile-ra` control.

These are a current, same-object two-stage composition: legal placement first, physical-shape materialization second. They already include tile liveness, final physical assignment, configuration reachability, calls and frame references.

## Witness red-team

Consider virtual tiles A and B in successive regions with shapes `sA` and `sB`, separated by a call. Reassigning A/B among `tmm0…tmm7` cannot remove their descriptors: a single TILECFG describes the shapes of every physical tile concurrently. If the regions are simultaneously reachable under one config, the post-RA pass writes both fields into that descriptor. If control flow lacks a legal common dominator, `X86PreTileConfig` must insert another `ldtilecfg`; a physical remap cannot create dominance. If the intervening call clobbers AMX state, the ABI requires a reload; preserving it would change the caller/callee contract.

Tile spilling may alter stack/frame cost, but choosing which fixed-shape tile interval to spill is ordinary tile register allocation/spilling. Combining it with a descriptor-placement policy creates no new state or guarantee: the descriptor is deterministically derived from the existing physical allocation and required configuration boundaries.

## N2 test

The proposed “tileconfig state + live-range + spill + call” algorithm therefore degenerates into one of:

1. current specialized tile register allocation and its spill/coalescing costs;
2. current pre-configuration reachability/call-clobber insertion;
3. current post-RA descriptor construction; or
4. generic interval coloring/ILP over those same decisions.

No non-generic joint transition remains under the fixed tile-shape/ABI object. Reducing `ldtilecfg` by retaining a configuration across a clobbering call is illegal; changing tile shapes/ISA/ABI changes the object. This is a structural absorption result, not a claim about AMX hardware or implementation availability.

## Finite killer that would have applied

A 72-hour closure would use public LLVM AMX CodeGen tests: pin source; enumerate `x86-tile-ra`, tile config passes and AMX target features; compare produced config descriptors and calls; use assembler/objdump plus descriptor/ABI/unwind legality. The fastest killer is a two-region/call witness: if a supposedly eliminated reload crosses a clobbering call or requires an impossible descriptor, reject it. No experiment was run.

## Verdict

`DROP__CURRENT_TWO_STAGE_COMPOSITION_AND_FIXED_ABI_ABSORB`.

There is no brief. The conclusion is bounded to fixed-shape LLVM AMX tile code; it does not assess AMX kernel scheduling, tile-shape selection, or a different ABI.
