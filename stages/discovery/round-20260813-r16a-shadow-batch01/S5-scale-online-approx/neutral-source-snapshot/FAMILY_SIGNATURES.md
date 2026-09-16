# Neutral source snapshot and family signatures

Snapshot date: 2026-08-13.  These signatures are source-neutral and precede both outputs.

| Family ID | Canonical signature | Frozen primary sources | Current reality / opposing evidence |
| --- | --- | --- | --- |
| `S5R16A-CARGO-INDEX` | fixed Cargo registry index and resolved package set; append/yank metadata construction; stock Cargo sparse/git consumer; index/update/read/network cost | [Cargo index](https://doc.rust-lang.org/cargo/reference/registry-index.html), [Cargo config](https://doc.rust-lang.org/cargo/reference/config.html), [current source API](https://doc.rust-lang.org/stable/nightly-rustc/cargo/sources/registry/index/struct.RegistryIndex.html) | sparse and git are current protocols; ETag cache and index version rules are documented. |
| `S5R16A-APT-ARCHIVE-INDEX` | fixed `.deb/.dsc` tree and APT-consumed Packages/Sources/Contents/Release; native archive-index construction; exact metadata/checksum/read cost | [apt-ftparchive manual](https://manpages.debian.org/trixie/apt-utils/apt-ftparchive.1.en.html) | current commands cover packages/sources/contents/release/generate and cache/config choices. |
| `S5R16A-THINLTO-CACHE` | fixed bitcode/options and linked binary; incremental ThinLTO index/cache construction; link/cache/read cost | [LLVM ThinLTO 22.1](https://releases.llvm.org/22.1.0/tools/clang/docs/ThinLTO.html), [LLVM C API](https://www.llvm.org/docs/doxygen/lto_8h.html) | cache dir and all documented pruning controls are current; cache is not a distinct linked-output constructor. |
| `S5R16A-CONDA-REPODATA` | fixed conda package metadata and solver-visible repodata; patch/repodata construction; bytes/parse/solve cost | [Conda repodata reference](https://docs.conda.io/_/downloads/conda/en/latest/pdf/), [conda-build docs](https://docs.conda.io/_/downloads/conda-build/en/25.11.x/pdf/) | repodata patch mechanism is documented; current writer/config and versioned natural update trace remain unclosed. |

Leakage guard: no V9 field, ranking, disposition, or wording is included in this neutral snapshot.
