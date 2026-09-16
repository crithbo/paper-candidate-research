# Unique regime-structure families

| family | natural artifact and repeatable structure | complete action considered | canonical oracle | disposition |
|---|---|---|---|---|
| GFA-REPEAT-PATH-CONTRACTION | GFA paths/walks sharing ordered oriented subpaths | contract a supported path into one segment and rewrite links/paths | GFA path spelling/validity | DROP |
| HDF5-REGIME-CHUNK-CONSTRUCTOR | scientific arrays with spatially separated dense, sparse and repeatedly accessed regions | choose chunk boundaries/cache layout across regimes | HDF5 reader equality and selection semantics | DROP |
| OTEL-TRACE-SKELETON | traces with repeated service-span tree skeletons | construct a shared skeleton plus per-instance differences | OpenTelemetry span/trace reconstruction | DROP |
| KAFKA-KEY-REGIME-COMPACTION | bursty key lifetimes in compacted logs | decide compaction segment work | log consistency | EXCLUDED: online controller |
| TEMPORAL-COMMUNITY-PHASE-BLOCK | phase-local community membership | block/relabel graph state | graph output equivalence | EXCLUDED: Wave59 lineage |
| BGP-ROUTE-REGIME-PREFIX | route announcements by regime | persistent prefix quotient | LPM equivalence | EXCLUDED: Wave54 lineage |
| PARSER-VALIDATOR-REGIME-CACHE | phase-local parse/validation state | cache/reuse state | parser/validator result | EXCLUDED: S2 |
| LLVM-PROFILE-PHASE-REGION | compiler profile phase changes | form code regions | target code behavior | EXCLUDED: S6 |
