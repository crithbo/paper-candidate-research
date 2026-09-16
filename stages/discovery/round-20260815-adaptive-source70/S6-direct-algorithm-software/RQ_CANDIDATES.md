# Source70 RQ candidate

## S70-01 — rustc canonical trait-goal response construction

For a fixed Rust crate/edition/features and the same trait-bound acceptance plus diagnostic semantics, can a Rust-specific joint constructor for canonical goals, candidate responses, fixpoint/cycle handling and proof responses provide a non-generic exact/FPT/approximation/certified-Pareto guarantee beyond current rustc next-solver composition?

Primary route: current Rust Compiler Development Guide solver/canonicalization material. Contrary route: Rust's primary Chalk SLG solver documentation, which defines canonical query tables, suspended strands, cached answers and cyclic goal handling. Falsifier: if the proposed choice reduces to ordinary canonical tabled logic/SLG solving, it cannot enter raw as a Rust-specific direct algorithm contribution.
