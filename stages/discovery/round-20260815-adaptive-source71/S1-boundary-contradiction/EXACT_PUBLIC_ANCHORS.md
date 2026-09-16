# Exact public anchor

## S71-01 — LLVM musttail / tail-recursion boundary

- Exact specification anchor: LLVM Language Reference, `call` instruction and `musttail` requirements. URL: <https://www.llvm.org/docs/LangRef.html>.
- Current front-end/contract anchor: Clang attribute reference, `clang::musttail`. URL: <https://clang.llvm.org/docs/AttributeReference.html#musttail>.
- Current source locus and strongest native subtractor: LLVM `TailRecursionElimination.cpp`. URL: <https://github.com/llvm/llvm-project/blob/main/llvm/lib/Transforms/Scalar/TailRecursionElimination.cpp>.
- Exact object: a fixed LLVM IR function/call graph containing a `musttail` call, its caller/callee calling convention and ABI-impacting attributes, return adjacency, and program/exception/ABI semantics.
- Anchor question: can a target-specific whole-function construction enlarge useful tail-recursive lowering without changing the fixed `musttail` ABI/return/stack guarantee or reducing to existing generic tail-recursion elimination?
- Primary route: LangRef -> Clang contract -> current LLVM pass. No fallback was used.

The anchor is a locator, not evidence of current absence or novelty.
