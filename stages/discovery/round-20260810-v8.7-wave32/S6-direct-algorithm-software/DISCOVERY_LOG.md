# Discovery log — S6 Wave32

Assignment: `DISCOVERY-S6-20260810-V8.7-WAVE32`  
Role: direct algorithm / software construction Discovery  
Frozen cutoff: `2026-08-10`  
Method: accepted production Discovery v2/v8.1, v8.6 finite-fidelity admission, and v8.7 current-upstream reality check. The blocked two-axis v8.2r2 method was not used.

## Scope and state check

This package is independent of Wave29. The excluded Wave29 objects (Wasm, Cap'n Proto, Protobuf, CBOR, FlatBuffers, Zstd, Lucene FST, Roaring, ELF string tables, and LRAT) were not rescreened. The current plan identifies Wave30/31 only by Discovery role, not by frozen exact object; this package therefore stays in distinct format, verifier, build-log, and codec families and makes no claim about unrecorded Wave30/31 facts. Active, blocked, and terminal registry objects were not revived or renamed.

All web checks below used primary specifications, official project documentation, or upstream source. A sandboxed TLS request failed; a subsequently authorized **read-only** request returned HTTP 200 for the listed official sources. This is an access note, not a scientific inference.

## Ten screened contribution lineages

| # | Exact natural object and primary evidence | Current reality / strongest same-object union | Disposition and reason |
|---|---|---|---|
| 1 | SPIR-V binary modules; [SPIR-V unified specification](https://registry.khronos.org/SPIR-V/specs/unified1/SPIRV.html), current [SPIRV-Tools](https://github.com/KhronosGroup/SPIRV-Tools) `388f5af1a6d4a4df4ab9bf69a1817255952e6ef1` | Native validation plus optimizer/ID-remapping paths; current `source/val/validate.cpp` exposes validation. | `DROP_CURRENT_UNION_OR_ACTION_GAP_UNFROZEN`: a putative module-layout planner has not been separated from current optimizer/remapper actions under fixed module semantics. |
| 2 | Linux BPF Type Format type graphs; [kernel BTF specification](https://docs.kernel.org/bpf/btf.html), current [libbpf](https://github.com/libbpf/libbpf) `f7081a6baf3f54949aacb8c2fc11bb30783b83e9` | `src/btf.c` contains `btf__dedup`; kernel/libbpf acceptance supplies native semantics. | `DROP_DIRECT_ABSORPTION_RISK`: current dedup is an explicit same-object constructor. No union-external complete action was certified. |
| 3 | Android DEX identifier/table layout; [official DEX format](https://source.android.com/docs/core/runtime/dex-format) | The format fixes index/table ordering constraints and consumers decode those indices. | `DROP_FORMAT_CONSTRAINED_OR_NO_ATOMIC_RESIDUAL`: a reorder would require an exact current-writer union and all reference-rewrite semantics; none was certified in this package. |
| 4 | JVM class-file constant-pool construction; [JVMS class-file format](https://docs.oracle.com/javase/specs/jvms/se25/html/jvms-4.html) | Native JVM loading is an oracle, but an executable current writer/rewriter union and all compatibility constraints were not frozen. | `DROP_FIDELITY_ROUTE_NOT_FINITE_YET`: not a claim that an improvement is impossible; it is insufficiently closed for a grounded brief. |
| 5 | Apache Avro object-container blocks; [Avro 1.12 specification](https://avro.apache.org/docs/1.12.0/specification/) and current [upstream](https://github.com/apache/avro) `87212a6d47247a30dff247d16386d722c56d4390` | Block, sync marker, codec, and block-size choices are already configuration/codec dimensions. | `DROP_TUNING_OR_OBJECT_CHANGE`: no nontrivial union-external constructor remains after charging codec and reader compatibility. |
| 6 | MessagePack map/container serialization; [official specification](https://github.com/msgpack/msgpack/blob/master/spec.md) and current [C implementation](https://github.com/msgpack/msgpack-c) `b0d379a6f29af7dd65423ff78a94de8948f01bd8` | Readers accept map order; no native canonicality guarantee was frozen. | `DROP_SAME_GUARANTEE_UNFROZEN`: canonical ordering would add a guarantee rather than preserve a native same-function contract. |
| 7 | Brotli meta-block/context-map construction; [RFC 7932](https://www.rfc-editor.org/rfc/rfc7932.html) | Standard decoding is formal/native semantics, but encoder strategies and quality modes form a broad current action family. | `DROP_NO_AUDITABLE_UNION_EXTERNAL_ACTION`: a proposed partition planner could not be distinguished from mode/heuristic tuning without an exact source-level union. |
| 8 | Ninja dependency-log compaction; [Ninja manual](https://ninja-build.org/manual.html), current [upstream](https://github.com/ninja-build/ninja) `b51a1e37c2fb89bbefa600bd155e1ce13983f09d` | `src/deps_log.cc` contains `Recompact`; natural build logs and reader semantics exist. | `DROP_DIRECT_ABSORPTION`: current same-object recompaction absorbs the obvious construction action; a global residual was not shown. |
| 9 | LZ4 frame/block encoder construction; [LZ4 frame format](https://github.com/lz4/lz4/blob/dev/doc/lz4_Frame_format.md), current [upstream](https://github.com/lz4/lz4) `0774d05537f9762f838f7ab541b7765f1a729cb5` | Current `lib/lz4.c` exposes `LZ4_compress*`; natural files and decoder are available. | `DROP_TUNING_SELECTOR_RISK`: no fully specified new construction independent of existing fast/HC mode choices was found. |
| 10 | GNU archive symbol-table construction; [GNU ar documentation](https://sourceware.org/binutils/docs/binutils/ar.html) | The archive reader/symbol-table contract is native, but the candidate action reduces to standard symbol-index generation and ordering conventions. | `DROP_NO_NONTRIVIAL_N2`: no same-object algorithmic action gap or finite killer survived the baseline-residual-first screen. |

## Outcome

`COMPLETE_ZERO_PROPOSALS`.

No row meets the admission bar for a grounded brief: none has both a frozen strongest deployable same-information action union and a source-supported, union-external atomic N1/N2/N3 action with a finite natural fidelity closure plan. This is a Discovery disposition only. It is not an experimental negative result, a claim that these ecosystems cannot yield papers, or a finding about AI readiness.

The most informative rejects are BTF and Ninja, where current upstream source exposes the obvious same-object action directly; MessagePack, where a canonical-order claim would change the guarantee; and SPIR-V/Brotli, where the apparent opportunity remains indistinguishable from the current action union or a selector/tuning proposal.
