# Source and collision matrix — Source04

| Family | Official/current source checked | Current same-object union | Action-divergence witness status | Collision / admission result |
|---|---|---|---|---|
| CompCert incremental verified construction | [CompCert 3.17 documentation](https://compcert.org/man/manual001.html), [complete compiler source / proof boundary](https://compcert.org/doc/html/CompCert.html) | The documented complete verified pass chain from C through assembly, including selection, CFG, constant propagation, register allocation and assembly emission. | No minimal legal two-output transition was frozen that differs from that whole constructor without merely reusing proofs or changing the proof boundary. | Not admitted; no current-absence assertion. |
| Frama-C Eva incremental abstract state | [Eva manual](https://www.frama-c.com/fc-plugins/eva.html), [Eva options](https://www.frama-c.com/fc-plugins/eva.html#options) | Official Eva analysis/configuration/cache facilities. | A bounded-recourse state action plus a target-specific soundness/complexity theorem was not closed. | Not admitted; configuration/caching is not promoted. |
| CakeML verified backend | [CakeML project](https://cakeml.org/), [current compiler how-to](https://cakeml.org/download.html) | Verified backend across 8 IRs; target selection and documented register-allocation modes. | Candidate reduced to a native flag or generic proof reuse; no union-external whole action. | Not admitted. |
| F* extraction | [F* official site](https://fstar-lang.org/), [official extraction tutorial](https://fstar-lang.org/tutorial/book/part1/part1_execution.html) | Supported extraction/code-generation routes and their stated host-code boundary. | No same-boundary action found; cache/rebuild variant is a build policy. | Structural drop. |
| Isabelle code generation/refinement | [Isabelle refinement theory](https://isabelle.in.tum.de/library/HOL/HOL-Library/Code_Target_Refinement.html) | Code-equation refinement and code generation. | No target-specific fixed object or finite checker-backed two-action witness. | Structural drop.

## Cross-lane / historical de-duplication

The shared registry, plan, and history were searched before depth. Alive2, Dafny/Boogie/Why3, CBMC, Souffle, Kani, Binaryen, Z3, Rosette, SPIN and the Source01–03 identities were excluded from this screen. No `PROPOSE_STAGE0` signature is emitted, so there is no new family requiring reservation.

## Claim ceiling

This matrix supports only bounded, source-pinned non-admission reasons. It does not claim global novelty, implementation absence, impossibility, or a performance result.
