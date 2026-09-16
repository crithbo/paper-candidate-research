# RAW_SCREEN_ROW_EVENT ledger

| ID | Family / primary sources | Frozen compatibility object | Outcome |
|---|---|---|---|
| R01 | LLVM bitcode reader/writer ([current LLVM extension guidance](https://llvm.org/docs/ExtendingLLVM.html), [upstream](https://github.com/llvm/llvm-project)) | Bitcode module accepted by a stated LLVM reader and reconstructed to the specified IR semantics. | `CANDIDATE_GRADE_DEEP_REVIEW` |
| R02 | glibc/ELF symbol versioning loader ([dynamic linker manual](https://sourceware.org/glibc/manual/latest/html_node/Dynamic-Linker.html), [hardening guidance](https://sourceware.org/glibc/manual/latest/html_node/Dynamic-Linker-Hardening.html)) | ELF process image with fixed `NEEDED`, versions, namespace and loader-visible bindings. | `CANDIDATE_GRADE_DEEP_REVIEW` |
| R03 | JVM class-file version / verifier ([JVMS 26](https://docs.oracle.com/en/java/javase/26/docs/specs/jvms/index.html), [ClassFileVersion API](https://docs.oracle.com/en/java/javase/26/docs/api/java.base/java/lang/classfile/ClassFileVersion.html)) | Versioned class file accepted by a declared JVM with identical execution and verification outcome. | `CANDIDATE_GRADE_DEEP_REVIEW` |
| R04 | PostgreSQL dump/restore bridge ([current pg_dump](https://www.postgresql.org/docs/current/app-pgdump.html), [upstream](https://github.com/postgres/postgres)) | Database logical state and supported restore/upgrade guarantee. | `STRUCTURAL_DROP__DUMP_EMITTER_OR_UNSUPPORTED_GUARANTEE` |
| R05 | Python pickle protocols ([official pickle docs](https://docs.python.org/3/library/pickle.html), [upstream](https://github.com/python/cpython)) | Object graph and documented protocol-version unpickle semantics. | `STRUCTURAL_DROP__SERIALIZER_ADAPTER` |
| R06 | Rust edition migration ([edition guide](https://doc.rust-lang.org/edition-guide/), [upstream](https://github.com/rust-lang/rust)) | Crate source plus edition and compiler semantic/diagnostic contract. | `STRUCTURAL_DROP__COMPATIBILITY_LINT_OR_CHANGED_LANGUAGE_OBJECT` |

No row relies on a current-absence claim.
