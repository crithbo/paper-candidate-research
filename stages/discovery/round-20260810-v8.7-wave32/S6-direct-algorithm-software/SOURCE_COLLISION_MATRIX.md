# Source and collision matrix — S6 Wave32

Frozen cutoff: `2026-08-10`. Only first-party standards, official documentation, and upstream project/source repositories are used.

| Family | Natural object / oracle | Current upstream evidence frozen | Fair strongest executable union | Collision/action-space finding |
|---|---|---|---|---|
| SPIR-V | Binary module; specification and `spirv-val` semantics | SPIRV-Tools `388f5af1a6d4a4df4ab9bf69a1817255952e6ef1`; [source](https://github.com/KhronosGroup/SPIRV-Tools/blob/main/source/val/validate.cpp) | Validator + optimizer + ID-remapping transform paths | No source-supported atom outside that union was frozen; no brief. |
| BTF | Kernel/libbpf BTF type graph acceptance | libbpf `f7081a6baf3f54949aacb8c2fc11bb30783b83e9`; [`btf__dedup`](https://github.com/libbpf/libbpf/blob/master/src/btf.c) | Current BTF construction plus explicit dedup | Direct absorption of the evident sharing/dedup action. |
| DEX | DEX id and reference-table semantics | [Android format](https://source.android.com/docs/core/runtime/dex-format) | Format-constrained producer/consumer contract | No verified complete writer union, hence no action-gap certificate. |
| JVM class file | Class-file parsing/loading | [JVMS §4](https://docs.oracle.com/javase/specs/jvms/se25/html/jvms-4.html) | Would require a frozen compiler/rewriter union | Fidelity closure is not finite in this package. |
| Avro | Object container file reader | Avro `87212a6d47247a30dff247d16386d722c56d4390`; [specification](https://avro.apache.org/docs/1.12.0/specification/) | Current container writer, codec and block controls | Residual reduces to existing configuration/codec choice. |
| MessagePack | Reader-decoded map/container value | msgpack-c `b0d379a6f29af7dd65423ff78a94de8948f01bd8`; [specification](https://github.com/msgpack/msgpack/blob/master/spec.md) | Current serializers under reader semantics | Canonical order is not a frozen native guarantee. |
| Brotli | RFC decoder output | [RFC 7932](https://www.rfc-editor.org/rfc/rfc7932.html) | Current encoder mode/strategy family | No atomic global action could be separated from tuning/selection. |
| Ninja | Dependency-log replay | Ninja `b51a1e37c2fb89bbefa600bd155e1ce13983f09d`; [`Recompact`](https://github.com/ninja-build/ninja/blob/master/src/deps_log.cc) | Current log writer plus recompaction | Direct same-object action already present. |
| LZ4 | Frame decoder output | LZ4 `0774d05537f9762f838f7ab541b7765f1a729cb5`; [format](https://github.com/lz4/lz4/blob/dev/doc/lz4_Frame_format.md) | Current `LZ4_compress*` construction modes | Proposed planner would be an unproven selector/tuning layer. |
| GNU ar | Archive/member and symbol-table reader semantics | [GNU ar documentation](https://sourceware.org/binutils/docs/binutils/ar.html) | Standard archive index construction | No nontrivial union-external construction action identified. |

## Current-upstream reality notes

The four source-dependent rows that might otherwise support a current-absence statement were checked against current upstream HEAD references above. This package makes **no** implementation-absence claim: it records only present source symbols (`btf__dedup`, `Recompact`, `LZ4_compress*`, and SPIR-V validation) or an inability to freeze the required union. Consequently no claim relies on an old issue, release note, or future-work statement. No default/non-default flag/threshold claim is made because no candidate is retained.

## Admission result

There is no action-gap certificate, finite natural Stage A killer, or `FIDELITY_CLOSURE_PLAN` to transfer. A Topic Brief would therefore be misleading; none is created.
