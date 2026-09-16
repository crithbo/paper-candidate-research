# Candidate-grade deep review — D01

## Current contract and action union

Arm’s current ABI-AA AAPCS64 source states that when a subroutine takes an SVE/predicate argument or returns one, the full contents of `z8–z23` and `p4–p15` are callee-saved. It also distinguishes this SVE PCS rule from ordinary low-64-bit SIMD preservation. The official LLVM AArch64 calling-convention source defines `CSR_AArch64_SVE_AAPCS` with full `Z8–Z23` and `P4–P15`; Clang exposes `aarch64_sve_pcs` / LLVM `aarch64_sve_vector_pcs`; GCC documents SVE target selection and vector-length modes.

The applicable current union is consequently not just a local spill heuristic:

1. an externally visible SVE PCS call must satisfy the fixed callee-save set;
2. LLVM/GCC register allocation and prologue/epilogue lowering choose the legal saves/restores;
3. legal inlining eliminates an internal call boundary; legal tail-call formation transfers the boundary; and
4. changing the PCS/attribute of an externally visible callee is a changed ABI, not a same-object action.

## Minimal witness and red-team result

Witness W: `C` holds a scalable value in `z8` and predicate in `p4`, calls opaque separately compiled `F(sv..., predicate...)`, and uses those values after return. `F` is required to use the SVE PCS because its public signature contains scalable data. Moving the save obligation from `F` to `C` does not create a legal same-PCS alternative: the independently compiled caller of `F` still requires `F` to preserve the registers. Removing the call through inlining or a tail call is already in the current union and is not a new state-transition constructor.

The initially hypothesized N2—jointly partition live scalable ranges across a call graph and choose preservation boundaries—therefore has no demonstrated union-external atomic action under the frozen contract. Its only apparent actions are (a) existing allocator/prologue choices, (b) existing inlining/tail-call transformations, or (c) a nonstandard/vector PCS change. Generic ILP formulation or cost tuning would not change this conclusion.

## Six-dimensional absorption check

| dimension | result |
|---|---|
| decision rule | Existing allocator/prologue and IPA decide save placement or boundary elimination. |
| information | A new constructor has no additional valid information at a public opaque call. |
| complexity/resource | Proposed global partitioning may cost more compilation, but cannot relax the PCS constraint. |
| quality/guarantee | Relaxing full preservation changes separately compiled ABI legality. |
| full cost | Any comparison must include compilation, code size, spills, cycles, stack/RSS; no residual action survives to compare. |
| generalization/no-gain | Internal calls are already handled by IPA when legal; public calls retain the same hard preservation rule. |

## Fidelity and finite killer

- Natural route: open Arm SVE intrinsic kernels with an SVE-typed opaque helper.
- Oracle: compiler acceptance plus ABI-aware disassembly verification of the save set, and an output/exception-equivalence run on an SVE-capable target or emulator.
- 72-hour killer: pin one LLVM and one GCC current revision; compile W both with and without legal IPA; inspect PCS attributes, CSR selection, prologue/epilogue, tail-call/inlining decisions. Any allegedly better public-boundary transformation either fails the saved-register check or reproduces one of the existing union actions.
- No execution was performed here. The killer is specified only to make the structural argument auditable.

## Verdict

`DROP__CURRENT_UNION_ABSORBS_OR_ABI_CHANGES`.

This is a structural absorption result, not a conclusion about implementation availability, SVE hardware access, expected performance, or AI readiness. No `TOPIC_BRIEF` is produced.
