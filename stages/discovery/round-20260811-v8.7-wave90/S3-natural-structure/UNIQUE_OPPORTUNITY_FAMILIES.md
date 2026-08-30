# Unique opportunity families

| ID | Exact natural object and carrier | Structural regularity | Nontrivial atomic action | Status |
|---|---|---|---|---|
| UF-90-01 | A fixed Nix store closure, with derivations from public Nixpkgs builds. | Repeated identical NAR serialisations survive across version cohorts. | Form equivalence classes of eligible files and replace them with one physical representation while preserving paths. | Candidate-grade review; `DROP`. |
| UF-90-02 | A fixed Cargo manifest/lockfile dependency graph from a public Rust workspace. | Multiple versions and feature cohorts occur under the same graph constraints. | Select the complete package-version/feature graph satisfying manifest, target and MSRV constraints. | Candidate-grade review; `DROP`. |
| UF-90-03 | A signed Debian repository index history and a target `Packages` index. | Multiple prior index versions are retained, including architecture-independent cohorts. | Select/publish a legal set and order of index differences that reconstructs the same target index. | Candidate-grade review; `NOT_ADMITTED_UNFROZEN`. |
| UF-90-04 | A fixed OCI manifest and its ordered layer descriptors from public image releases. | Releases frequently share base-version layer cohorts and content-addressed blobs. | Construct a manifest/layer representation with identical specified root filesystem and verification semantics. | Candidate-grade review; `DROP`. |

No family produces a `STAGE0_BRIEF`: either the exact action is already directly expressed by the strongest current union, or the required same-object publication semantics/action union could not be closed without changing the artifact.
