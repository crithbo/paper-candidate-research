# Source58 S6 — primary RQ

## Exact public anchor

LLVM's target `.td` instruction descriptions consumed by `llvm-tblgen -gen-asm-matcher`, with fixed assembly syntax, target feature semantics and stock MC assembler/parser acceptance plus resulting instruction semantics.

## Primary RQ

For a fixed LLVM target description and assembly language semantics, can a target-specific joint constructor over operand classes, mnemonic/feature predicates, matcher alternatives and continuation structure give a non-generic exact/FPT/approximation/certified-Pareto guarantee on emitted matcher bytes and assembly-match work beyond LLVM's current assembler-matcher emitter?

## Boundary / falsifier

Changing syntax, target MD, feature semantics, or accepting a generic parser/decision-tree solver is out of scope. The RQ is falsified if the current emitter already composes predicate/alternative matcher optimization or if the remaining construction is generic syntax-rule compilation. Ordinary closure is limited to official docs/current source and one direct source-level generic-kernel subtractor; no generation, build, benchmark or experiment is authorized.
