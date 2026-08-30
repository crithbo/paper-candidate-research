# Source / collision / verification-materialization action matrix

**Assignment:** `DISCOVERY-S2-20260811-V8.7-WAVE87-VERIFICATION-COPY-MATERIALIZATION-BOTTLENECK` · **cutoff:** 2026-08-11.

| Unique family | Official current anchor | Frozen reader/checker object and full cost | Current union / flags | Disposition |
|---|---|---|---|---|
| rkyv | [rkyv releases](https://github.com/djkoloski/rkyv/releases), [rkyv upstream](https://github.com/rkyv/rkyv) | archived carrier with rkyv safety; construction+alignment+validate+access | archived variants, zero-copy access and `check_archive` validation surface | safety path or changed archived carrier; no complete alternate action | `DROP` |
| OpenSSL X.509 | [OpenSSL upstream](https://github.com/openssl/openssl) | certificate chain verification; bytes+ASN.1+chain+crypto+policy+errors | X.509/TLS/crypto/provider source/manual API union | copy/cache policy or carrier/ABI change | `DROP` |
| WABT | [WABT upstream](https://github.com/WebAssembly/wabt) | Wasm binary accepted/validated/interpreted; read+decode+validate+materialize+diagnostic | `wasm-validate`, interpreter; proposal flags and defaults | native config/path selection or changed spec contract | `DROP` |
| LLVM lld ELF | [current lld ELF input source](https://github.com/llvm/llvm-project/blob/main/lld/ELF/InputFiles.cpp) | ELF link output/diagnostics; buffer+parse+materialize+link+diagnostics | memory-buffer input, section/property/symbol/IR-object reader union | lazy/cached reader policy; new form unproven against diagnostics semantics | `DROP` |
| libxml2 | [libxml2 upstream](https://gitlab.gnome.org/GNOME/libxml2) | XML/schema read+validation+tree/error object | SAX/DOM/validation path | controller/tree-contract change | `STRUCTURAL_DROP` |
| libarchive | [libarchive upstream](https://github.com/libarchive/libarchive) | archive member/read/checksum result | reader/copy/materialization path | exact action/fidelity plan unfrozen | `NOT_ADMITTED_UNFROZEN` |
| Apache Xerces | [Xerces-C++ upstream](https://github.com/apache/xerces-c) | validated XML with exposed DOM/SAX semantics | DOM/SAX and validation construction | reader policy or changed exposed tree | `STRUCTURAL_DROP` |
| CBOR | [TinyCBOR upstream](https://github.com/intel/tinycbor) | CBOR decode/validation result with canonicality semantics | decode/validation/materialization surfaces | carrier/checker contract unfrozen | `NOT_ADMITTED_UNFROZEN` |

## Deduplication and reality-check boundary

Wave70 parser/validator objects (simdjson, FlatBuffers, LevelDB, OpenZFS), Wave60 format/representation objects, Wave55 and all registry active/terminal objects are excluded. Native interfaces were not counted as automatic absorption. The direct drops identify only the screened action as a native configuration/policy or carrier-changing formulation; they do not assert a general lack of future work.
