# All-history five-field identity preflight

Bounded lookup: current `registry.yaml` and `plan.md`, queried for `musttail`, `tail call`, `tailcall`, `tail-call`, and `TailRecursion` on 2026-08-15.

| Candidate | Exact object | Action / estimand | Endpoint | Guarantee | Full cost | Relation / outcome |
|---|---|---|---|---|---|---|
| S71-01 LLVM musttail | LLVM IR musttail call/function | whole-function tail/frame construction | stack/frame/codegen cost | musttail ABI/return/unwind contract | compiler CPU/RSS, frame/stack, code bytes, runtime | `RELATED_ONLY` to historical RISC-V Zicfiss shadow-stack tailcall object; distinct object/action/endpoint/guarantee |

The historical Zicfiss entry concerns shadow-stack prologue/epilogue and CFI/ELF psABI runtime semantics, not an LLVM `musttail` IR transformation. It cannot exclude this locator. No terminal/held queue was opened. The current LLVM mechanism below supplies the scientific exclusion.
