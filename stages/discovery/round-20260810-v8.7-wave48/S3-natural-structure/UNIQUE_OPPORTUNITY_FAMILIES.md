# Unique opportunity families

The eight rows below are deduplicated families, independently screened after excluding Wave44–47, GIN, WebGraph, HNSW, AIGER, and all registry terminal objects.

| family | named natural structure | exact object and canonical oracle | strongest same-object union | result |
|---|---|---|---|---|
| INFLUX-TSM-BLOCK-CUT | correlated timestamp deltas and long value runs within a series | TSM write/read stream; official TSM reader round-trip | TSM cache/WAL/TSM writer plus timestamp and value compression selection | DROP after deep review |
| RE2-DFA-BUDGET | heavy-tailed compiled-regexp state footprints and repeated text prefixes | RE2 match result under its documented options; RE2 conformance tests | one-pass/NFA/DFA execution, static memory budgeting, cache flush, NFA fallback | DROP |
| EXT4-EXTENT-PLACEMENT | naturally clustered file extents in package/build trees | ext4 file byte stream and fsck/readback | extent tree plus native block/inode allocator | DROP after deep review |
| HPACK-TABLE-RETENTION | repeated header fields with bounded recency | RFC 7541 encoded header block; conforming decoder | static/dynamic tables, insertion, eviction, size update, Huffman/literal forms | DROP |
| JEMALLOC-SIZE-CLASS | skewed allocation sizes and lifetimes | allocator API result and allocation/deallocation semantics | documented size-class map, bins, arenas and configuration | DROP |
| OPENFST-STATE-ORDER | repeated labels and near-deterministic state fan-out | weighted FST acceptance/weight equivalence | OpenFST determinization, minimization, encode/decode and optimize operations | DROP |
| ELF-HASH-LAYOUT | shared-library symbol-name skew and duplicate dependency topology | ELF loader-visible symbol resolution; `readelf`/dynamic-loader semantics | GNU ld `--hash-style={sysv,gnu,both}` plus GNU dynamic linker | DROP |
| CUDD-REORDERING | BDD variable-use locality across formal repositories | Boolean-function equivalence checked by CUDD | CUDD dynamic reordering and its documented enable/configuration actions | DROP |

Sources are first-party/primary: InfluxDB [storage engine](https://docs.influxdata.com/influxdb/v2/reference/internals/storage-engine/); [RE2 current source](https://github.com/google/re2/blob/main/re2/re2.h); [ext4 overview](https://www.kernel.org/doc/html/latest/filesystems/ext4/overview.html); [RFC 7541](https://datatracker.ietf.org/doc/html/rfc7541); [jemalloc manual](https://jemalloc.net/jemalloc.3.html); [OpenFST](https://openfst.org/twiki/bin/view/FST/); [GNU ld manual](https://sourceware.org/binutils/docs/ld.pdf); and [CUDD manual](https://www.cs.rice.edu/~lm30/RSynth/CUDD/cudd/doc/node3.html).
