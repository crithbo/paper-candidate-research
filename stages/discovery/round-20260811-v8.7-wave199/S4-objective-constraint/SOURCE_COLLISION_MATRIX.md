# Source and collision matrix

Frozen cutoff: 2026-08-11. Sources are official project documentation/source.

| id | primary source | current producer/checker evidence | conclusion |
|---|---|---|---|
| R01 | [Lean validating proofs](https://lean-lang.org/doc/reference/latest/ValidatingProofs/), [Lean reference](https://lean-lang.org/doc/reference/latest/) | serialized proof, kernel replay, comparator and external checker | direct current union |
| R02 | [Rocq core language](https://rocq-prover.org/doc/V8.19.2/refman/language/core/index.html) | tactics make terms; kernel type checks proof terms | direct current union |
| R03 | [Isabelle implementation](https://isabelle.in.tum.de/library/Doc/Implementation/Logic.html) | reconstruction/expansion and primitive kernel replay | direct current union |
| R04 | [Metamath home](https://us.metamath.org/), [Metamath manual](https://us.metamath.org/downloads/metamath.pdf) | explicit proof steps and independent verification | direct current union |
| R05 | no complete first-party producer/checker source frozen | incomplete | not admitted |
| R06 | no complete first-party producer/checker source frozen | incomplete | not admitted |

The collision result relies on positive current constructor evidence; no absence claim is used.
