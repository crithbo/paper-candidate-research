# Current upstream reality check

- Frozen LLVM commit: `e72ba6cf366a3180cbf5a8690d9e50665880ab76`
- Target: `x86_64-unknown-linux-gnu`, SysV AMD64
- Status: `NOT_CLOSED__RESOURCE_BLOCKED_BEFORE_CLAIM`
- Collision boundary retained: `SEARCH_BOUNDED_OPEN`

## What was checked locally

The workspace was searched read-only for exact-commit source/build provenance, LLVM executables, the decisive `DwarfDebug.cpp`/`LiveDebugValues.cpp`/X86 target sources, and an existing Linux execution route. The exact commit occurs only in frozen reports/contracts; no exact-commit source tree, archive name, or toolchain provenance was found.

The one locally available LLVM-main source archive is named and documented as commit `1f112d62e1fa2c4f1a04887abd72da1ed61cf791`. Its custom `llc` registers AMDGPU/R600 targets only. General LLVM 22.1.8 tools exist in other immutable candidate directories, but their printed identities are `ca7933…` or the MSYS2 package commit `6e4e79…`, not the frozen commit.

## Complete-union audit status

The Stage 0 package statically names the correct union components:

1. X86 allocator, coalescing, copy, split, spill/reload and CSR policy;
2. compatible `LiveDebugVariables` and instruction-reference lifecycle;
3. fixed-mode `LiveDebugValues`;
4. `DwarfDebug` call-site forwarding, clobber and entry-value actions;
5. the legal fixed configuration grid; and
6. a generic exact RA oracle as a ceiling only.

This Stage A did not re-open these components at `e72ba6…`, enumerate their flags, or run them. Consequently it cannot assert that Plan A remains unavailable, that Plan B is accepted, that the current union does or does not reproduce the coordinate, or that any residual action exists.

## Inference discipline

No implementation-absence, direct-collision, current-union absorption, witness legality, or scientific quality inference is made from the missing local assets. The frozen Stage 0 static certificate remains an upstream input at its original ceiling; it is not upgraded by this resource preflight.

