# Source42 divergence seed pool

- Assignment/lane: `DISCOVERY-S1-20260815-ADAPTIVE-SOURCE42-GLOBAL-IDENTITY-CLOSURE-V1` / S1.
- Generated before evidence lookup: `YES`; network-security exclusion: `PASS`; seeds: `8`.

| Engine | Seed IDs | Perspective |
|---|---|---|
| `BISOCIATION_STRUCTURAL_TRANSFER` | S01 | compiler/backend engineer |
| `PROBLEM_REFRAMING` | S02 | runtime engineer |
| `CONSTRAINT_MANIPULATION` | S03 | ABI maintainer |
| `NEGATION_OR_INVERSION` | S04 | hardware architect |
| `ABSTRACTION_LADDER` | S05 | theorist |
| `ADJACENT_POSSIBLE_OR_BOUNDARY` | S06 | compiler/backend engineer |
| `JANUSIAN_TENSION` | S07 | runtime engineer |
| `COMPOSE_DECOMPOSE_SIMPLIFY` | S08 | maintainer |

### S01 — MLIR async token/runtime ownership

The `async` dialect has SSA token/value dependency semantics while its reference-counted runtime owns storage and completion separately. With a fixed async program result, a join-aware lifetime construction might preserve token semantics while avoiding redundant retain/release transitions. It fails if only a generic ownership optimizer or runtime scheduler remains.

### S02 — WebAssembly EH and tail-call boundary

Wasm exception unwinding and tail-call frame replacement each commit control state, but their composition may constrain a producer/runtime differently from ordinary tail-call lowering. A candidate would preserve fixed component/trap behavior through a target-specific representation or proof, not use a wrapper engine or change the exception model.

### S03 — LLVM preallocated call frame on invoke/unwind edges

LLVM’s preallocated call-frame interface can be viewed as an ABI ownership transfer that becomes nonlocal under an exceptional edge. A candidate would construct same-ABI call-frame lifetime/cleanup transitions through `invoke`, with explicit validity and full-cost accounting, rather than choose a calling-convention flag.

### S04 — CUDA async-copy barrier completion

CUDA async-copy pipelines combine a producer-visible copy completion with a barrier-visible consumer point. Under fixed tile results, a native pipeline action might change legal arrival/consumption grouping without host scheduling; it is invalid if it is only a configuration or controller choice.

### S05 — LLVM statepoint exception relocation

This restates the Source41 statepoint exceptional-edge relocation surface. It is intentionally a control seed and is not selected because Source41 remains a bounded unresolved exact identity without external delta.

### S06 — MLIR GPU async token lowering

GPU launch completion tokens are lowered through MLIR async/runtime boundaries. A same-result construction might jointly encode token ownership and launch completion without changing CUDA/HIP execution semantics; a generic launch controller is out of scope.

### S07 — C++ coroutine destruction after exception

Coroutine frame destruction and exception propagation interact at a call boundary. The question is only viable if a specific ABI-level invariant remains beyond Source02 coroutine identity; otherwise it is a historical repeat.

### S08 — Wasm canonical-ABI post-return resource cleanup

Canonical ABI post-return cleanup may be a distinct ownership endpoint from prior async ABI work only if the exact resource action, guarantee, and full-cost boundary differ. It is a control for five-field relation, not a novelty assertion.

## Convergence

| Selected | Why selected before evidence | RQ |
|---|---|---|
| S01 | compiler/runtime ownership seam; N2/N1 distinction test | RQ01 |
| S02 | formal ISA/runtime control-flow contract | RQ02 |
| S03 | ABI/unwind ownership seam | RQ03 |
| S04 | GPU native barrier action versus controller test | RQ04 |

S05 is an active exact identity; S06–S08 remain backlog until the five-field preflight. No seed is evidence or an opportunity-family count.
