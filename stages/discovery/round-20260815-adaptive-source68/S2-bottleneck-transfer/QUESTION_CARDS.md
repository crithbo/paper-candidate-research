# Question cards — Source68

## S68-01 — ELF RELR construction

- Same-object contract: fixed ELF ABI, relocation semantics and stock dynamic-loader endpoint.
- Current union: GNU ld generates DT_RELR/DT_RELRSZ/DT_RELRENT through `pack-relative-relocs`, with explicit defaults, target support and GLIBC ABI dependency.
- Full-cost boundary: link CPU/RSS/temp, relocation metadata bytes, loader CPU/page faults/RSS, and program startup latency.
- Contrary explanation: the stated proposal is a linker option/standard format choice; alternative grouping requires a new loader/format or generic compression.
- Disposition: `EXCLUDED_BEFORE_RAW__CURRENT_RELR_PRODUCER_UNION_OR_FORMAT_CHANGE`.

## S68-02 — Mach-O chained-fixup construction

- Same-object contract: fixed Mach-O image/fixup semantics and stock dyld launch behavior.
- Current union: static linker transforms calls and prepares data fixups; old and chained fixups have the same program output; chained format enables dyld page-in linking.
- Full-cost boundary: link CPU/RSS/temp/image bytes, dyld fixup/page-in CPU, dirty memory, and launch latency.
- Contrary explanation: page-in/linker format selection is already the native mechanism; any different representation changes image/loader format or is generic fixup packing.
- Disposition: `EXCLUDED_BEFORE_RAW__CURRENT_CHAINED_FIXUP_PAGEIN_LINKING_UNION`.

## S68-03 — ReadyToRun image construction

- Same-object contract: fixed assembly/runtime settings and CoreCLR observable behavior, including permitted JIT fallback.
- Current union: R2R embeds native plus IL, partial R2R profiles select methods, composite R2R and tiered JIT express startup/code-size/optimization tradeoffs.
- Full-cost boundary: publish CPU/RSS/temp/assembly bytes, startup CPU/RSS/latency, subsequent JIT CPU/bytes, and steady runtime.
- Contrary explanation: profile or method-selection policy is the existing native action union.
- Disposition: `EXCLUDED_BEFORE_RAW__CURRENT_PARTIAL_COMPOSITE_R2R_METHOD_SELECTION_UNION`.
