# QRefine-Triton-W4A16

## Conditional research claim

If an executable validator can prove the frozen mixed bit-vector/IEEE relation for a restricted W4A16 decode-GEMV at the pre-`llvm.to_module` LLVM-dialect MLIR boundary on both independently lowered Triton targets, return localized counterexamples, and retain at least one grammar-admitted non-scalar schedule per target, it may have a credible compiler/systems paper shape. This is conditional; no proof, bug, speedup, or acceptance is claimed here.

## Frozen object and contribution

The proof object is one packed groupwise W4A16 M=1 decode-GEMV, not arbitrary CUDA/HIP or general Triton. It fixes sm89 and gfx1100, logical subgroup width 32, the mixed bit-vector/IEEE relation, and the no-binary-verification boundary.

Proposed route: `N1 + N2` — a target-aware operational validation abstraction plus a compositional algorithm over the explicit packed/dequant/reduction trace. The nontrivial element is not a configuration selector: it jointly accounts for memory/indexing and floating semantics at a concrete compiler phase.

## Boundary, baseline, and fairness

Each target lowering is snapshotted immediately after `pm.run(mod, "make_llir")` and before `llvm.to_module`; vendor code generation is outside the claimed proof. The existing Triton lowering/testing infrastructure and the closest verifier families named in the archived brief remain strongest comparison targets for independent Stage 0.

vLLM W4A16 is a natural packing/shape anchor, not a legal performance baseline. Its use does not admit `tl.dot`, tensor cores, WMMA, MFMA, or any grammar-excluded path. Any Stage-A performance comparison must use only a schedule allowed by the frozen grammar, on the same object, target and cost denominator.

## Current-source reality check

Official frozen Triton NVIDIA source explicitly runs `make_llir`, then invokes `llvm.to_module`; current official AMD source independently retains that conversion boundary. This supports the capture locus. It does **not** prove the absence of competing validators or their non-coverage; independent Stage 0 must complete that collision judgment.

## Evidence and execution plan

The natural carrier is the frozen vLLM W4A16 source plus frozen Triton pipelines. The finite Stage-A plan is: source/solver pin; capture and inventory; 12 pre-registered mutants; small symbolic composition; one admitted non-scalar schedule per target. Full cost includes capture/normalization, proof obligations, solver CPU/RSS/wall, compiler CPU/RSS/temp/output bytes and permitted schedule latency/bandwidth.

## Fastest killer and stop conditions

Stop/revise the proposed mechanism if semantic-critical operations cannot be modeled/rejected, if fewer than 10/12 pre-registered mutants are rejected, if any core packing/index mutant lacks localization, if composition is unbounded, or if the grammar admits only scalar schedules. Absorb/drop if an independent current-collision review finds a system already proving this full frozen relation on both pipelines with only routine adaptation.

## Readiness

- Structural potential: `TIER_B_Q2_VIABLE` conditional on independent collision and fidelity review.
- Current evidence readiness: `E1_STATIC_PREFLIGHT`.
- Discovery disposition: `READY_FOR_INDEPENDENT_STAGE0`; no Stage 0 was performed by this lane.
