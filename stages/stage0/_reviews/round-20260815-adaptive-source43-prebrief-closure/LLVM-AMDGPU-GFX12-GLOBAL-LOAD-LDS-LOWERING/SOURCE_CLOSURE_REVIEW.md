# LLVM AMDGPU GFX12 global-load→LDS lowering — independent source closure

## Scope and disposition

- Assignment: `STAGE0-P1-20260815-LLVM-AMDGPU-GFX12-GLOBAL-LOAD-LDS-LOWERING-PREBRIEF-CLOSURE-V8.7`.
- Mode: `PREBRIEF_SOURCE_CLOSURE`; this is neither a full Stage 0 review nor authorization for Stage A/B.
- Disposition: `NOT_ADMITTED_UNFROZEN__BOUNDED_SOURCE_OR_CARRIER_CLOSURE_INCOMPLETE`.
- Frozen endpoint: one GFX12-capable LLVM IR/MIR kernel retains visible values, memory order, legal waits/barriers, and final output while considering global→LDS transfer lowering with placement/wait/occupancy cost.

## Current-source reality check

The default-branch LLVM pin is `08e48243b19ded3f9423913c1e0b274a3472358a` (2026-08-14). In the retained current `SIISelLowering.cpp`, the lowerer explicitly recognizes `amdgcn_global_load_lds` and `amdgcn_global_load_async_lds` alongside `load_to_lds` variants.

At lines 1832–1858 it describes one source global/flat load memory operand and one LDS destination store memory operand. Lines 1953–1966 identify the LDS destination pointer; later paths cover the async LDS-DMA families and select concrete LDS opcodes. This is decisive evidence that a caller intrinsic is not a missing native primitive, and it must be in any fair union.

The current directory index also identifies separate lowerings, schedulers, `SIInsertWaitcnts`, and wait-count utilities. Therefore a proposed paper cannot be rephrased as merely introducing the intrinsic, a spelling adapter, a generic scheduler, or ordinary manual placement.

## What was and was not closed

| Obligation | Result | Consequence |
|---|---|---|
| Current LLVM default-branch pin and exact global-load/LDS lowering locus | Closed | Current intrinsic lowering is a direct comparator action. |
| Target-native source/global + LDS-destination memory modeling | Closed | Same memory-order/action family is grounded. |
| Exact in-tree GFX12 kernel test that supplies a same-kernel two-plan carrier | Not closed | Required to distinguish a whole action from caller composition. |
| Complete native selection, wait/barrier, scheduling and default/non-default control catalog | Not closed | The retained index names relevant components but does not establish their full action semantics. |
| Current-union absorption of a placement+wait+occupancy joint constructor | Not proved | Existing intrinsic lowering alone is not a complete whole-action constructor. |
| Target-specific residual beyond generic memory scheduling | Not proved | No legally frozen two-plan witness or formal guarantee was identified. |

The literal `global-load-lds.ll` locator returned an official 404. The retained directory index did not expose a filename with the paired `load`/`lds` spelling. Neither fact is used as absence: a matching carrier may be named differently or live below an indexed subdirectory. The six-attempt resource cap is exhausted, so no further retrieval was authorized.

## Current-union and generic-kernel attack

The current union already includes caller intrinsic selection/lowering, separate wait insertion and wait-count utility paths, and scheduling components. A later candidate must specify an action over a single existing kernel that is not equivalent to: (1) the caller choosing an existing intrinsic form, (2) current lowering plus wait insertion, or (3) generic memory scheduling/placement.

This closure did not establish direct absorption because the proposed action includes a whole-kernel placement/wait/occupancy construction and no source-backed proof was obtained that the current composition jointly optimizes that object. Conversely, it did not establish a residual because no public two-plan carrier or complete control/guarantee map was frozen. Thus the correct disposition is bounded-unfrozen, not structural drop and not clean brief.

## Required bounded successor closure

1. Use a new, compliant resource envelope to retain a current in-tree or otherwise official same-kernel GFX12 carrier that exercises the exact lowering.
2. Freeze the target/cpu/features, source and LDS pointer semantics, barrier/wait behavior, and stock checker/reader route.
3. Enumerate the relevant default and non-default action surfaces for selection, scheduling, wait insertion, occupancy and pressure.
4. Provide two legal same-kernel plans with identical endpoint but distinct complete actions, and test whether any difference remains after the current union and generic memory-scheduling reduction.
5. If a residual remains, state a target-specific non-product guarantee and full-cost coordinates; otherwise classify it as current-union or generic-memory-scheduling absorption.

## Evidence limits

No candidate implementation, compilation, execution, benchmark, performance result, or hardware use occurred. The official AMD GFX12 ISA documentation confirms legal `global_load_lds*` forms but does not itself show compiler construction. A bounded paper/collision search was not treated as an absence proof.

## Sources

- LLVM current source: [`SIISelLowering.cpp`](https://github.com/llvm/llvm-project/blob/08e48243b19ded3f9423913c1e0b274a3472358a/llvm/lib/Target/AMDGPU/SIISelLowering.cpp).
- LLVM current source tree: [`llvm/lib/Target/AMDGPU`](https://github.com/llvm/llvm-project/tree/08e48243b19ded3f9423913c1e0b274a3472358a/llvm/lib/Target/AMDGPU).
- LLVM/ROCm official [GFX12 AMDGPU assembly reference](https://rocm.docs.amd.com/projects/llvm-project/en/docs-7.2.3/LLVM/llvm/html/AMDGPU/AMDGPUAsmGFX12.html).

AI assisted source inspection and report drafting; no scientific claim-bearing action was executed.
