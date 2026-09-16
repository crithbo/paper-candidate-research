# Build Provenance

All official source trees are preserved under `artifact/` or `toolchain/`. Canonical tree hashes and per-file hashes are in `SOURCE_TREE_HASHES.json`.

## MaxPre

- Source: IJCAR 2024 artifact, MaxPre tree SHA-256 `385FB66564411C8A913028ADD35B11E8369867E45DAFA87560FD02A59BF84168`.
- Derived tree SHA-256: `B37F013E9C4F48C192AC32832B2A5B92C91F194BC29F9357D2107281539D3639`.
- Changes: Windows fallback for `WEXITSTATUS`; correction of the Windows-only `GlucosePre::cpuTime` namespace; replacement of POSIX `times()` timing with `std::chrono` in the derived Windows build.
- No changes to preprocessing techniques, deletion generation, proof emission, WCNF output, objective handling, or candidate scheduling.
- Binary: 1,736,192 bytes; SHA-256 `8B1C5CD5752A69CC2A0D949173C53E6586756675872F28E585593BC82E2BABF9`.

## VeriPB 3.0.2

- Official commit: `c648bac06be995b82bd218e248f005140fc8ce11`.
- Official archive SHA-256: `ACED5C32D18119DA9CCDE5DAFDC9B8A831923187644C427B466A4945EA279138`.
- Official tree SHA-256: `AFE90E3C320F0A7D7BF155713D45698ADBB799716D8BD733C7578DC8202D09B4`.
- Derived tree SHA-256: `A9258446DCF70FB13383110B10CB528CBC80B675754A10FFF613F37A2B9BF994`.
- Portability delta: remove the `mimalloc` global allocator and its unused locked packages; use the Rust system allocator. Proof parsing, checked-deletion logic, elaboration, WCNF/output rules, and CLI contract are unchanged.
- Final build: locked/offline Cargo build, Zig C toolchain, `CRATE_CC_NO_DEFAULTS=1`, `-fno-sanitize=undefined`.
- Binary: 3,034,653 bytes; SHA-256 `2E38A50D8D85CD3D1AC4D870F449A53CB42A177D37E2A3FAA9876A0EE1B5D9F4`.

## CakePB WCNF

- Official repository commit: `6edb2f3585f1c3e1b925964c4f33e133f7279d02`.
- Official source archive SHA-256: `2C8CB2BAD5F9627E99C5BFF956866B3EC3FE77634C7972EA7DCC70D202E09392`.
- Official tree SHA-256: `F22DEEC9CCD53E66019F8AECFED8D9A09D0DAECC152282BE0BBA76ED0E0C243A`.
- Upstream HOL4/CakeML revisions declared by the repository: `f18e6e7277c2648d40c2491d87f09083c909e6e9` / `9b353e8d240d0a5ad1090ddf2c15acc9304affcf`.
- Derived assembly SHA-256: `8EBBF8A3ECD157A6DD399BF005EF05E3D149BDB230B1EADA0EB0C70F635CC64E`.
- Portability delta: remove unsupported Windows `.func/.endfunc`; route `cake_exit` through the Windows calling-convention shim; make the non-returning exit wrapper tail-jump to `cml_exit`.
- No generated CakeML proof-checking byte was modified.
- Binary: 1,104,896 bytes; SHA-256 `19B0820803CBD6274B9A4712BA0D74AE35C6BCAF28AF0CAF12A226B5AE336953`.

## Smoke closure

On the official `bcp-simp-nonunif-75_50.07` tuple:

1. VeriPB 3.0.2 accepted proof version 2 under `--force-checked-deletion` and elaborated a version-3 kernel.
2. CakePB returned `s VERIFIED NO CONCLUSION` and `s VERIFIED OUTPUT EQUIOPTIMAL` with exit code 0.
3. The same binaries and flags were then used for every corpus eligibility check, legal-choice trial, and both full-cost replays.
