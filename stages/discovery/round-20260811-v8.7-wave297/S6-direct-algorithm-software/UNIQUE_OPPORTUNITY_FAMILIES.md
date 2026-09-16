# Unique opportunity families

| family | native oracle / natural carrier | required guarantee and full cost |
|---|---|---|
| HTSlib BAI/CSI | `samtools`/HTSlib region query; versioned public BAM snapshots | target-specific query/bytes/index-build bound; build/query CPU-RSS-I/O, index bytes, exact regions |
| OCaml bytecode linker | stock VM/linker; versioned OCaml packages | relocation/table locality guarantee; compile/link/load CPU-RSS, bytecode bytes, VM behavior |
| libxml2 XPath | stock XPath result; public XML/XPath suites | compiled-plan size/lookup guarantee; compile/query CPU-RSS, bytes, exact result |
| GNU ar | stock archive listing/extraction; public static-library builds | exact symbol lookup/bytes tradeoff; create/read CPU-RSS, bytes, symbol resolution |
| jemalloc | allocator trace/observable allocation contract; public server traces | bounded fragmentation/recourse; allocation CPU-RSS, peak/live bytes, latency |
| cmark-gfm | stock parse/HTML or AST output; public Markdown corpora | exact parse/reference lookup bound; parse CPU-RSS, AST/index bytes, output equality |

All require source-pinned full current unions and direct primary collision subtraction before admission. No family is promoted merely because a theorem seed can be stated.
