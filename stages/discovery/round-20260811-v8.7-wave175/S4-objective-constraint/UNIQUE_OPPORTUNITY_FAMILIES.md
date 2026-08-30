# Unique opportunity family

## R01 — token-aware NVGPU shared-memory lifetime construction: `UNFROZEN`

Exact object: a fixed MLIR program using `gpu`/`nvgpu` operations and lowered to the matching NVVM/NVIDIA backend. Same-function guarantee: bitwise/numerical output as required by the original program, unchanged tensor-map/out-of-bounds semantics, unchanged global/shared address spaces, and all explicit `nvgpu.device.async.token` plus mbarrier dependencies preserved.

Frozen legal action universe:

- `nvgpu.device_async_copy`, group, and wait tokens;
- mbarrier creation/init/arrival/test/wait phases in shared memory;
- TMA descriptor, load/store, predicate, multicast, swizzle/L2/OOB/interleave attributes;
- `gpu.alloc`, `gpu.barrier`, `gpu-async-region`, `gpu-to-llvm` lowering choices;
- bufferization allocation/deallocation simplification, buffer/loop hoisting, and `nvgpu-optimize-shared-memory`.

The official current sources define the operations and several transforms, but do not yet establish a closed, complete current constructor union for *token-aware, whole-buffer interval allocation/reuse*. The only fetched pinned transform implementation optimizes shared-memory access indices and explicitly aborts when subviews exist rather than performing alias analysis. This is insufficient to certify either direct absorption or a union-external N2 action. Therefore the item remains `UNFROZEN`, not a candidate/brief.

Natural corpus route: MLIR's official GPU/NVGPU examples and regression tests containing asynchronous copies/TMA/mbarriers, selected only after a specific matching NVIDIA backend is frozen. Native oracle: MLIR verifier plus lowered NVVM/backend acceptance and original kernel output/bounds test. Full cost: pass/compile time, allocation/deallocation, all copy/TMA traffic, barriers, peak shared-memory bytes, register use/occupancy effect, and kernel launch/run cost.
