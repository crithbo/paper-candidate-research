# UNIQUE_OPPORTUNITY_FAMILIES

| ID | fixed contract | current two-stage union | natural route / oracle | full cost |
|---|---|---|---|---|
| U01 | Same LLVM AMX MachineIR, fixed tile shapes and values, caller/callee ABI, call clobbers, frame/unwind behavior and ISA target. | `X86PreTileConfig` computes reachable `ldtilecfg` insertion points before physical tile allocation; specialized tile RA allocates tiles; `X86TileConfig` runs after allocation and records each physical tile’s final row/column shape in the config descriptor; normal spill/frame/post-RA/MC handle remaining work. | Public LLVM AMX CodeGen tests and AMX intrinsic GEMM-style functions; later compiler verifier, assembler/objdump, config descriptor and unwind checks; AMX simulator/CPU only for ceiling. | compile CPU/RSS; code bytes; `ldtilecfg`/release count; tile spill/reload/frame work; static uops; later runtime/memory.

TILECFG has entries for all eight physical tiles; its content is not a one-shape-only resource.
