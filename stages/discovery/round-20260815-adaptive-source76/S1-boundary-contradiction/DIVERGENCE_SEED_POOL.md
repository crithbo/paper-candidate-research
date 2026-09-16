# Bounded non-evidence seed portfolio

| ID | Engine | Boundary prompt | Pre-evidence disposition |
|---|---|---|---|
| S01 | guarantee inversion | Rust caller-location attribution decays at function-pointer/trait-object coercion | selected |
| S02 | state split | foreign ABI unwinding versus panic-runtime outcome | not selected; scope risks an ABI/guarantee change |
| S03 | representation seam | language-visible location versus implicit ABI argument | merged into S01 |
| S04 | counterfactual | no-mangle export and hidden caller location | not selected; public ABI compatibility dominates |
| S05 | abstraction ladder | closure/coroutine caller tracking | not selected; unstable feature lacks a fixed natural carrier |
| S06 | cross-layer mismatch | compiler lowering of diagnostic provenance through dynamic dispatch | merged into S01 |

Seeds are not novelty, absence, or quality claims.
