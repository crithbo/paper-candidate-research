# RAW_SCREEN_ROW_EVENT ledger

| ID | Family / first-party source | Result |
|---|---|---|
| R01 | Rust safe/unsafe boundary ([Reference](https://doc.rust-lang.org/stable/reference/unsafe-keyword.html), [upstream](https://github.com/rust-lang/rust)) | `CANDIDATE_GRADE_DEEP_REVIEW` |
| R02 | LLVM `undef`/poison/freeze ([LangRef](https://llvm.org/docs/LangRef.html), [UB manual](https://llvm.org/docs/UndefinedBehavior.html)) | `CANDIDATE_GRADE_DEEP_REVIEW` |
| R03 | Java VarHandle ordering modes ([official API](https://docs.oracle.com/en/java/javase/16/docs/api/java.base/java/lang/invoke/VarHandle.html)) | `CANDIDATE_GRADE_DEEP_REVIEW` |
| R04 | TypeScript strict-null mode ([official TSConfig](https://www.typescriptlang.org/tsconfig/strictNullChecks.html)) | `STRUCTURAL_DROP__MODE_FLAG` |
| R05 | PostgreSQL permissive/restrictive RLS ([current docs](https://www.postgresql.org/docs/18/ddl-rowsecurity.html)) | `STRUCTURAL_DROP__POLICY_GUARANTEE_CHANGE` |
| R06 | OpenSSL default/FIPS provider ([official docs](https://docs.openssl.org/master/man7/OSSL_PROVIDER-FIPS/)) | `STRUCTURAL_DROP__PROVIDER_MODE` |

No implementation-absence claim was used.
