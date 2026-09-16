# Source and collision matrix

Frozen cutoff: 2026-08-10. All listed materials are primary standards, official project documentation, or upstream source.  No shadow-rule materials were consulted.

| family | current reality evidence / flags | collision and action-divergence witness | disposition |
|---|---|---|---|
| INFLUX-TSM-BLOCK-CUT | Official v2 [storage-engine](https://docs.influxdata.com/influxdb/v2/reference/internals/storage-engine/) documentation plus official [upstream repository](https://github.com/influxdata/influxdb): v1.x/2.x is identified as `master-1.x`, while default is a distinct Arrow/Parquet line. | Existing writer's shape-sensitive encoding is the direct subtractor; no independently named legal action beyond encoding/block controls. | DROP |
| RE2-DFA-BUDGET | Current upstream [`re2.h`](https://github.com/google/re2/blob/main/re2/re2.h): `kDefaultMaxMem`, `Options::set_max_mem`, DFA cache flush and NFA fallback. | Proposed retention/budget policy is exactly a native option/cache management decision; altering it is tuning/selector. | DROP |
| EXT4-EXTENT-PLACEMENT | Current kernel [ext4 overview](https://www.kernel.org/doc/html/latest/filesystems/ext4/overview.html) and upstream [`fs/ext4/ext4.h`](https://github.com/torvalds/linux/blob/master/fs/ext4/ext4.h): extent/locality policy, mballoc criteria and debug controls. | Global batches have extra future information; local replacement is allocator policy. | DROP |
| HPACK-TABLE-RETENTION | [RFC 7541](https://datatracker.ietf.org/doc/html/rfc7541), sections 2.3–2.3.3 and 4.4: static/dynamic table, indexing and eviction. | Table contents and eviction are protocol-native actions; a trace policy adds no new guarantee. | DROP |
| JEMALLOC-SIZE-CLASS | Official [jemalloc manual](https://jemalloc.net/jemalloc.3.html): size classes and allocation semantics. | Different class map changes internal cost/compatibility; remaining settings are configuration. | DROP |
| OPENFST-STATE-ORDER | Official [OpenFST documentation](https://openfst.org/twiki/bin/view/FST/) and [minimize source](https://openfst.org/doxygen/fst/html/fstminimize_8cc_source.html). | Existing optimize/minimize/determinize constructors absorb state-order-only proposal. | DROP |
| ELF-HASH-LAYOUT | Current [GNU ld manual](https://sourceware.org/binutils/docs/ld.pdf) documents `--hash-style`; current [glibc dynamic linker manual](https://sourceware.org/glibc/manual/latest/html_node/Dynamic-Linker.html). | GNU/SysV/both is current linker action; no same-object residual apart from option selection. | DROP |
| CUDD-REORDERING | Official [CUDD dynamic-reordering manual](https://www.cs.rice.edu/~lm30/RSynth/CUDD/cudd/doc/node3.html), including `Cudd_AutodynEnable`. | Choosing when/order to invoke reordering is a selector over native actions. | DROP |

For each row, the strongest union is evaluated under the same object, information condition, semantic output and full denominator.  No row was dropped for missing implementation, artifact download, hardware, or AI readiness.
