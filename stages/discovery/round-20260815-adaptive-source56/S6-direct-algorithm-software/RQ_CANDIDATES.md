# Source56 S6 — RQ convergence

## Exact public anchor

GCC upstream's `gcc/genrecog.cc`, which consumes a fixed target machine description and emits an instruction recognizer; the fixed generated recognizer must preserve GCC's accepted RTL-pattern recognition and constraint semantics.

## Primary RQ

For one fixed GCC target machine description and RTL-recognition semantics, can a target-specific joint construction over predicate tests, alternative ordering, decision nodes and shared subtrees provide an exact, FPT, approximation, or certified Pareto guarantee on generated recognizer size and recognition work beyond the current `genrecog` composition?

## Immutable boundary and finite falsifier

The generated recognizer, target MD and accepted/rejected RTL pattern decisions are fixed; a different backend, changed machine description, generic decision-tree solver, flag selector, or post-generator wrapper is out of scope. The RQ is falsified if current source already makes the stated target-specific construction, or if all surviving freedom is generic decision-tree synthesis. The ordinary closure reads the current source and GCC documentation plus one direct recognition-construction subtractor; no build or generated output is authorized.
