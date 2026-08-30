# Source / collision audit — S6-EGRAPH-LIVEEXTRACT

| Source | Grade | Verified boundary |
|---|---|---|
| [FastOpt](https://doi.org/10.1145/3689801) | OOPSLA 2024 / official DOI | exact sparse extraction and Cranelift benchmark |
| [Julia EqSat](https://doi.org/10.1145/3795883) | TACO 2026 / DOI | ILP extraction exploiting code reuse; compile-time/performance accounting |
| [e-boost](https://www.csl.cornell.edu/~zhiruz/pdfs/eboost-iccad2025.pdf) | ICCAD 2025 paper | shared-DAG cost-aware extraction; corrected from a preprint-only characterization |
| [egg](https://github.com/egraphs-good/egg) / [Cranelift egraph](https://docs.rs/cranelift-egraph/latest/cranelift_egraph/) | official open implementations | same-object execution resources |

**Collision:** `SEARCH_BOUNDED_OPEN_WITH_DIRECT_SUBTRACT`. The report does not claim no adjacent memory scheduling literature; it scopes the residual to the fixed acyclic e-graph joint object.
