# Unique families and source pins

| row | current first-party anchor | current fact relevant to objective shift | natural carrier |
|---|---|---|---|
| B01 PCH/PCM | LLVM `main` `5bb2565693f062a9e99929db1814a7a076d4dc76`; Clang PCH internals: https://clang.llvm.org/docs/PCHInternals.html | AST files have lazy reader integration and module DAG / ID mapping | LLVM/Clang test and public C/C++ module suites |
| B02 rmeta | Rust official compiler source (reader/writer family) | metadata must retain matching compiler compatibility and lazy import semantics | crates.io-compatible Rust compiler test/crate corpus |
| B03 ICU `.dat` | ICU `main` `f86dc86d89aa3c3cd661af8b88e6b4d2ac99ca59`; https://unicode-org.github.io/icu/userguide/icu_data/ | `icupkg` gives 16-byte item alignment; data can be package/library/files with distinct loader semantics | ICU data/testdata and CLDR-derived packages |
| B04 QML cache | Qt Declarative `dev` `ca0ff4f479c014531b2b446355f9654b4a02efe8`; https://doc.qt.io/qt-6/qtqml-tool-qmlcachegen.html | qmlcachegen is native build-time cache generation | Qt QML examples/tests |
| B05 Go export | Go `master` `fc017cdba57e7bead1aa67873c76de65ddfcb6df`; https://go.dev/src/cmd/compile/README | unified export data is a serialized object graph with index-based lazy decoding | Go standard library and public module graphs |
| B06 MO | GNU gettext manual: https://www.gnu.org/software/gettext/manual/html_node/MO-Files.html | native alignment/hash/format choices are reader constrained | GNU and Linux distribution translation catalogs |

Current source is pinned wherever a deep action claim would otherwise depend on it. A source-sensitive row that is not fully frozen remains `UNFROZEN`, not a claim of absence.

