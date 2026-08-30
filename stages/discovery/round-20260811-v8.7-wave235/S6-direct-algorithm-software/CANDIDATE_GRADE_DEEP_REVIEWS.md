# Candidate-grade deep reviews

## F1 — LLVM BOLT joint layout

- **Same-object/oracle:** fixed executable ABI/output/unwinding/relocations; stock loader and binary validation.
- **Strongest composition:** BOLT function-reordering/code-layout passes and all current modes, compiler layout alternatives, and native linker constraints.
- **Known-action N2 hypothesis:** jointly optimize placement/alignment/relocation-aware layout with an explicit approximation or multi-objective guarantee over i-cache locality, bytes, rewrite time, and load behavior.
- **Natural route/full cost:** public LLVM Test-Suite binaries; rewrite CPU/RSS/temp, output bytes, startup/run CPU/RSS, and validation.
- **72h killer:** pin BOLT revision/options; produce two loader-equivalent layouts; reject if stock BOLT composition already realizes the joint algorithm, only option choice remains, ABI/unwind changes, or full cost removes benefit.
- **Disposition:** `NOT_ADMITTED_UNFROZEN`—current source union and direct collision not closed.

## F2 — SquashFS joint block/fragment layout

- **Same-object/oracle:** fixed tree/metadata/file bytes, stock SquashFS reader and checksum/content equality.
- **Strongest composition:** current mksquashfs block/fragment/compressor/dedup/order settings and format constraints.
- **Known-action N2 hypothesis:** a full-image joint constructor with a guarantee on bytes and read/decompress cost, using only standard block/fragment actions.
- **Natural route/full cost:** versioned public rootfs tree; build CPU/RSS/temp, image bytes, mount/read/decompress CPU/RSS/I/O.
- **72h killer:** pin source/options and make a two-file legal placement witness; reject if native union absorbs it, tree semantics change, only compression tuning remains, or full cost has no residual.
- **Disposition:** `NOT_ADMITTED_UNFROZEN`—writer union/collision not closed.

## F3 — GNU linker joint layout/relaxation

- **Same-object/oracle:** fixed ELF ABI/exports/relocations and stock loader/readelf semantics.
- **Strongest composition:** current GNU linker layout/relaxation backends, scripts, defaults/nondefaults, and compiler/BOLT layout mechanisms.
- **Known-action N2 hypothesis:** joint section order/alignment/relaxation construction with a size–locality–link-cost guarantee.
- **Natural route/full cost:** public GNU/LLVM-built binaries; link CPU/RSS/temp, bytes, loader/startup/runtime cost.
- **72h killer:** pin backend and flags; generate two ABI-equivalent layouts; reject on union absorption, altered relocations/ABI, mere linker-script configuration, or full-cost failure.
- **Disposition:** `NOT_ADMITTED_UNFROZEN`—current union and direct collision not closed.

No brief is emitted. The absence of a brief is not based on readiness, implementation, or current positive results.
