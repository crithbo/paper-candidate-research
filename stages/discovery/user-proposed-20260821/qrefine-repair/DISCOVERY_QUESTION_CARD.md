# Discovery Question Card — QREFINE-TRITON-W4A16

## Exact identity and question

- **Object:** fixed `w4a16_decode_gemv_m1_g128_uint4b8_fp16` from the archived operator specification: M=1, K multiple of 128, N multiple of 8, symmetric packed `uint4b8`, FP16 input/scales, FP32 accumulation, final FP16 output.
- **Targets:** Triton v3.7.1 commit `f797708c0626e5f9840ca5b0a98790e2c7cb09ad`, LLVM pin `1f126a6dea50d185c0781743a667390037ae88bd`, NVIDIA sm89 and AMD gfx1100; logical subgroup width 32.
- **Question:** can a target-aware translation validator establish the frozen mixed bit-vector/IEEE trace relation for each independently lowered target at one pre-`llvm.to_module` LLVM-dialect MLIR boundary, while preserving a non-toy schedule grammar and yielding localized counterexamples?
- **Endpoint:** final FP16 bits equal the operational specification for every valid frozen-shape input; each target is checked independently. No cross-device or final-binary correctness claim exists.

## Atomic action and non-generic discriminator

The action is an operational semantics-aware validation pass over the frozen pre-conversion MLIR snapshot: it tracks packed nibble selection, address/mask/group/scale/output indices, the fixed reduction tree, and IEEE conversion/FMA/rounding/denormal conditions, rejecting any TCB-policy-forbidden operation. This is not a wrapper around tests or an arbitrary kernel checker; the discriminator is target-lowering-aware proof of the joint discrete-and-floating relation at the stated boundary.

## Current-source reality and comparator roles

The frozen NVIDIA backend exposes the `make_llir` phase and converts its post-pass module through `llvm.to_module`; the current official AMD backend exposes the analogous `make_llir` boundary. Therefore the capture locus is concrete rather than inferred from a future-work statement. Default/non-default exclusions are fixed: no ASan/debug extraction/custom instrumentation/LLVM-optimization disable route enters the object.

The vLLM W4A16 kernel is a packing/shape anchor only. It is not a legal performance comparator and does not establish coverage of `tl.dot`, tensor cores, WMMA, or MFMA. Stage A must construct a same-grammar legal comparator; the operational interpreter is semantic-only.

## Natural route, cost boundary, and falsifier

- **Natural carrier:** the frozen vLLM W4A16 source family, with the archived operator/grammar hashes and two concrete Triton lowerings.
- **Full cost:** Stage A must report capture/normalization/obligation generation, solver wall/CPU/RSS, generated proof artifacts, compiler CPU/RSS/temp bytes, and (only for a grammar-admitted schedule) latency or effective bandwidth. It must not compare against grammar-external optimized paths.
- **Cheapest decisive failure:** on the pre-registered 12 mutants, fail if fewer than 10 are rejected, any of the four packing/index mutants cannot be localized, a semantic-critical operation is neither modeled nor rejectable, or a whole-output composition route is absent.

## Finite fidelity closure plan

Within the archived 72-hour route: freeze source checkouts and solver identity; capture the two MLIR snapshots at the specified locus; inventory/reject unsupported operations; run the 12 mutants; establish small-symbolic composition; then compile one legal non-scalar schedule per target. This is a Stage-A plan, not an executed result.

**Card disposition:** `READY_FOR_INDEPENDENT_STAGE0` with current-collision and final legal performance-comparator assessment explicitly delegated to independent Stage 0.
