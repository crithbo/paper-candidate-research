# Canonical source and collision matrix

| Family | Current first-party anchor | Strongest same-object subtraction | Outcome |
|---|---|---|---|
| rr | rr-debugger/rr repository and rr-project documentation | Existing record/replay/checkpoint approaches; source-level producer union still to close | `NOT_ADMITTED_UNFROZEN` |
| rustc CGU | rust-lang/rust partitioning documentation and compiler source anchor | Current CGU partitioning/linkage behavior; complete configuration union still to close | `NOT_ADMITTED_UNFROZEN` |
| Souffle | Souffle official repository and relations/index documentation | Official automatic index/representation selection and its combinatorial optimizer | `STRUCTURAL_DROP` |
| OpenJDK C2 | openjdk/jdk HotSpot C2 source and HotSpot documentation | Current C2 transformations/scheduling and direct compiler literature; bounded subtraction remains open | `NOT_ADMITTED_UNFROZEN` |

No current-absence claim is used for an admitted candidate. The three open rows remain search-bounded only and require docs, source, default/non-default option, and primary-collision closure before any later admission.
