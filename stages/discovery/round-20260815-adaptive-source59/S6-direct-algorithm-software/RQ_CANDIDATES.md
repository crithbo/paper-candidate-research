# Source59 S6 — primary RQ

## Exact public anchor

GCC target machine-description processor-reservation definitions consumed by the `genautomata` generator, with fixed scheduling resource semantics and stock scheduler/hazard-recognition results.

## Primary RQ

For a fixed target reservation description and scheduling-resource semantics, can a target-specific joint constructor over reservation-state equivalence, transition representation and recognizer partition give a non-generic exact/FPT/approximation/certified-Pareto bound on automaton bytes and hazard-recognition work beyond GCC's current automaton construction?

## Boundary / falsifier

Target reservation semantics, scheduler behavior and compiler target remain fixed. Generic DFA minimization/encoding, scheduling policy, configuration, or a changed machine description is out of scope. The RQ is falsified if `genautomata` already implements the relevant automaton construction/minimisation or the only surviving residual is generic automata synthesis. Ordinary closure is bounded to official/current documentation and source; no build or experiment is authorized.
