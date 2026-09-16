# Exact public anchors and primary RQs

| Seed | Exact public anchor | Same-object boundary | Primary RQ | Source route / stop |
|---|---|---|---|---|
| S56-01 | Clang Modules / C++ header-unit current documentation and source locus, accessed 2026-08-15 | fixed translation-unit semantics, module imports, diagnostics and stock compiler result | Is a target-specific BMI validation/materialization constructor able to reduce compile+load full cost without changing imported declarations or diagnostics? | ANCHOR/CURRENT: Clang modules docs/source. Stop if only cache/serialized-AST layout or a module semantic change remains. |
| S56-02 | rustc dev guide incremental compilation documentation/current source locus, accessed 2026-08-15 | fixed crate source, compiler result/diagnostics and incremental-correctness semantics | Can a target-specific dependency/fingerprint/work-product constructor improve full incremental compile cost while preserving stock incremental validity? | ANCHOR/CURRENT: rustc dev guide/source. Stop if it is cache invalidation/reuse policy or generic graph maintenance. |
| S56-03 | OpenJDK class-data-sharing current documentation/source locus, accessed 2026-08-15 | fixed class set, JVM class-loading semantics and program outputs | Can a target-specific archive-map/relocation/verification construction reduce startup full cost while retaining stock CDS/JVM acceptance? | ANCHOR/CURRENT: OpenJDK CDS docs/source. Stop if archive selection/config or generic layout is all that survives. |

No optional alternatives: the selected boundaries are not genuinely ambiguous.
