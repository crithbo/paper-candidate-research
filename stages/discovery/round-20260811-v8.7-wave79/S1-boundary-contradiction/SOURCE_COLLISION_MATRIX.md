# SOURCE_COLLISION_MATRIX

| Object | Current first-party reality | Collision result |
|---|---|---|
| LLVM bitcode | [LLVM docs](https://llvm.org/docs/ExtendingLLVM.html), [upstream](https://github.com/llvm/llvm-project) expose reader/writer/parser/compatibility work. | Reader/writer/verifier union absorbs valid reconstruction. |
| glibc ELF | [Dynamic linker](https://sourceware.org/glibc/manual/latest/html_node/Dynamic-Linker.html), [hardening](https://sourceware.org/glibc/manual/latest/html_node/Dynamic-Linker-Hardening.html) expose loader/version/namespace constraints. | Loader union or changed ABI/environment. |
| JVM class files | [JVMS](https://docs.oracle.com/en/java/javase/26/docs/specs/jvms/index.html), [ClassFileVersion](https://docs.oracle.com/en/java/javase/26/docs/api/java.base/java/lang/classfile/ClassFileVersion.html). | Native parser/verifier union or transform/flag. |
| PostgreSQL dump | [Current pg_dump](https://www.postgresql.org/docs/current/app-pgdump.html), [upstream](https://github.com/postgres/postgres). | Serializer/restore bridge or unsupported guarantee. |
| Python pickle | [Official docs](https://docs.python.org/3/library/pickle.html), [upstream](https://github.com/python/cpython). | Protocol adapter/serializer. |
| Rust editions | [Edition guide](https://doc.rust-lang.org/edition-guide/), [upstream](https://github.com/rust-lang/rust). | Lint/migration or changed language object. |

No old issue, future-work note, or unverified implementation absence was used as evidence.
