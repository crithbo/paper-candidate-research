# Action-gap and fidelity closure plan

## Required legal witness

A candidate must produce two caches from the same pinned JSC revision and same JavaScript input such that both are accepted by the unmodified stock cache reader/interpreter, have identical JavaScript observables, and differ through a whole representation-construction action—not an external compressor, cache-policy threshold, runtime controller, generic bytecode layout rewrite, or changed reader.

The candidate action must be outside the fully closed current generator/serialization/invalidation union. It must state an algorithmic object, state/complexity, and an exact preservation or explicit quality guarantee. No such witness is frozen here because the current union is not closed.

## Full-cost denominator

`parse + bytecode generation + cache serialization/write (CPU/RSS/temp/bytes) + cache lookup/read/deserialization/startup (CPU/RSS/latency) + invalidation/rebuild`, evaluated with the same engine, program semantics, and cache reader. This denominator prevents moving work from startup to cache construction from appearing free.

## Finite Stage A fidelity closure

1. Pin the source files and public cache API/format path for one revision; enumerate default and non-default options/build gates.
2. Create a smallest source program whose two candidate cache artifacts are both accepted by the stock reader and produce the same observable result.
3. Audit that all changed serialization/generation fields are legal and that the current fair union cannot reproduce the whole action.
4. Run the pre-registered natural-suite measurement only after the preceding semantic closure.

## 72-hour killer

Reject the line immediately if any of these occurs: (a) the 20–50 pre-registered programs do not show a repeatable normalized cliff; (b) stock acceptance or observable equivalence fails for the two-cache witness; (c) a complete source audit maps the purported action to an existing generation/format/cache-policy union member; or (d) the effect disappears after full write/read/invalidation cost is counted.
