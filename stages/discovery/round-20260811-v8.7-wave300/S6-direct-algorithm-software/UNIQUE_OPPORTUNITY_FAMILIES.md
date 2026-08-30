# Unique opportunity families

| family | natural carrier / oracle | required target-specific theorem and full cost |
|---|---|---|
| ANTLR ATN | versioned public grammar suites; native parse/deserialization equality | compatible serialized-ATN size/load bound; generation/load/parse CPU-RSS, bytes |
| Java StackMapTable | versioned Java projects; JVM verification/execution equality | verification-metadata construction bound; compile/verify/load CPU-RSS, class bytes |
| Bison LR table | public grammar suites; parser acceptance/output equality | parser-table layout/state action theorem; generation/parse CPU-RSS, table bytes |
| OpenJDK CDS | official class-library/app snapshots; loader behavior | CDS relocation/table locality guarantee; dump/load/startup CPU-RSS, archive bytes |
| GNU gettext MO | versioned catalogs; native lookup equality | catalog table theorem; write/lookup CPU-RSS, bytes |
| Wasmtime cache | versioned modules; validator/runtime equality | cacheable artifact/fixup guarantee; compile/load/run CPU-RSS, bytes |

Every row needs a current complete writer/verifier union and primary collision closure before admission; theorem seeds alone are not briefs.
