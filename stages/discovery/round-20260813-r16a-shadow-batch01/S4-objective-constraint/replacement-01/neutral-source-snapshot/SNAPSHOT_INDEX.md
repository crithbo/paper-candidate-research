# Neutral replacement source snapshot

Frozen 2026-08-13 before canonical review and V9 shadow.

| ID | Canonical signature | Exact object | Current first-party pin |
|---|---|---|---|
| `S4-R16A-R01-LUCENE-BLOCKTREE` | `LUCENE_BLOCKTREE_TERMS_CONSTRUCTOR__TERM_POSTINGS_SET__STOCK_TERMS_READER__INDEX_BYTES_BUILD_CPU_RSS_SEEK_MEMORY_COST` | Fixed Lucene indexed term/postings set consumed by matching stock BlockTree terms reader | Lucene main `75eddfaff22eb46e8a68529952fb6787b1258854` |
| `S4-R16A-R02-CCACHE-MANIFEST` | `CCACHE_MANIFEST_RESULT_CONSTRUCTOR__COMPILATION_INPUT_OUTPUT_SEMANTICS__STOCK_CCACHE_VALIDATION__CACHE_BYTES_HASH_CPU_RSS_HIT_LATENCY_COST` | Fixed compiler input/output semantics represented by stock ccache manifest/result cache | ccache master `aa5642289037ab1998f4d4815e5b2c4244e1b560` |
| `S4-R16A-R03-MODULESYMVER` | `LINUX_MODULE_SYMVERS_CONSTRUCTOR__EXPORTED_SYMBOL_ABI_SET__STOCK_MODPOST_MODULE_LOADER__BYTES_BUILD_CPU_RSS_ABI_CHECK_COST` | Fixed exported-symbol ABI set and module-version contract consumed by stock modpost/module loading | Linux master `3d6d817622b0a9721e3cc404df3469171582be13` |
