# Pinned glibc TLSDESC audit — resume1

## Scope and pin

- Project and commit: `sourceware/glibc` at `e2789c46e3bfdcd67a82bea9946b315c179e83d3`.
- Four, and only four, direct official cgit blob routes were attempted once. No tree, clone, mirror, fallback path, or retry loop was used.
- Retained blobs: `sysdeps/x86_64/dl-tlsdesc.S` and `elf/tst-gnu2-tls2.c`.
- `elf/tlsdesc.c` and `elf/tst-gnu2-tls2mod0.c` were rate-limited (HTTP 429) before persistence. They are not treated as absent.

## Observed current native actions

| Pinned locus | Direct observation | Bounded interpretation |
|---|---|---|
| `dl-tlsdesc.S:37-56` | A descriptor for static TLS uses `_dl_tlsdesc_return`, with function pointer at descriptor word 0 and the corresponding TP offset at word 8. | A native static-offset descriptor state is explicitly represented. |
| `dl-tlsdesc.S:58-79` | `_dl_tlsdesc_undefweak` is a second resolver action with its own word-8 argument interpretation. | Resolver behavior is state-specific, not a generic cache API. |
| `dl-tlsdesc.S:81-103` | Shared builds instantiate `_dl_tlsdesc_dynamic` for FXSAVE, XSAVE, and XSAVEC state-save variants through `dl-tlsdesc-dynamic.h`. | The current x86-64 union already includes multiple dynamic-resolver implementation variants. The unretained included body prevents a complete relocation/lifetime-union conclusion. |
| `tst-gnu2-tls2.c:61-120` | The stock test opens three DSOs, closes two to create/reuse module-ID gaps, reopens a module, spawns a thread with a null DTV entry, then opens module 1 and forces the GNU2 TLSDESC slow path. | This is a fixed official DSO-lifetime carrier and stock-oracle trace for dynamic TLS/DTV generation behavior. |

## Trace and unresolved field

The retained test provides one complete stock trace:

`open(0), open(1), open(2), close(0), close(1), open(0), spawn-thread, open(1), access(apply_tls)`.

The test comment fixes its intended module-ID reuse, DTV-generation, null-entry, and slow-path conditions. But the module implementation required to verify the second schedule's exact descriptor/data behavior was rate-limited, as was `elf/tlsdesc.c`, the selected direct relocation/lifetime source. Therefore this packet cannot freeze two complete same-ABI/same-lifetime native descriptor-state schedules, and cannot assert a complete action union.

## Cost and falsifier boundary

The frozen full-cost dimensions remain dynamic-loader CPU/RSS, resolver calls, relocation/text bytes, `dlopen`/`dlclose` latency, and TLS allocation/lifetime cost. A finite continuation needs only the same pinned blobs that were rate-limited here: `elf/tlsdesc.c` plus `tst-gnu2-tls2mod0.c`, followed by a static check that two complete legal schedules preserve ABI result and DSO lifetime. No performance or execution claim has been made.
