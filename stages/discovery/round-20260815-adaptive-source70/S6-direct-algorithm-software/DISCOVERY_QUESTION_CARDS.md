# Discovery question card — S70-01

| Field | Frozen value |
|---|---|
| Exact public identity | Current rustc next-generation trait solver for fixed crate/edition/features. |
| Carrier kind | `IMPLEMENTATION_CARRIER_ONLY`; a later public Rust crate route is finite but was not acquired or built. |
| Same-object contract | Same trait-bound acceptance, ambiguity/error result and diagnostics under Rust trait semantics. |
| Contribution hypothesis | `COMPILER_TOOL`, N2: a joint canonical-goal/response construction. |
| Current source/doc locus | Rust Compiler Development Guide `solve/trait-solving`, `solve/canonicalization`, `solve/significant-changes`, and proof-tree pages. |
| Candidate action | Canonicalize nested goals/responses, choose/merge candidates, cache tables, handle cycles/fixpoints, return proof response. |
| Minimum falsifier | Current solver plus Chalk's on-demand SLG table/strand engine represents the same logical decision kernel. |
| Full-cost boundary | Compiler CPU/RSS, query/table memory, diagnostics latency, and build artifacts; not measured. |
| Finite closure | Bounded current and contrary documentation route; no experiment is needed to test the non-generic discriminator. |

## Outcome

Current rustc explicitly canonicalizes nested goals, eagerly canonicalizes candidate responses, merges them, and uses a fixpoint for cyclic trait solving. Chalk describes u-canonicalized table keys, cached answers, suspended strands and breadth-first cycle handling. The proposed algorithm is therefore generic tabled logic solving with Rust terminology, not an identified Rust-specific action or guarantee. It is excluded before raw; this says nothing about unrelated future trait-system research.
