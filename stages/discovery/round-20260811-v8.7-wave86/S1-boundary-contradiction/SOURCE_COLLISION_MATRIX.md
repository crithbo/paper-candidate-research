# SOURCE_COLLISION_MATRIX

| Object | Current official reality | Result |
|---|---|---|
| Rust | [Reference](https://doc.rust-lang.org/stable/reference/unsafe-keyword.html), [upstream](https://github.com/rust-lang/rust) | Safe/unsafe is an obligation boundary; adapter or weaker obligation fails. |
| LLVM | [LangRef](https://llvm.org/docs/LangRef.html), [UB manual](https://llvm.org/docs/UndefinedBehavior.html) | `freeze` and legal transformations cover same-contract actions. |
| VarHandle | [Official API](https://docs.oracle.com/en/java/javase/16/docs/api/java.base/java/lang/invoke/VarHandle.html) | Ordering modes/fences are current native union. |
| TypeScript | [TSConfig](https://www.typescriptlang.org/tsconfig/strictNullChecks.html) | Flag changes type/diagnostic contract. |
| PostgreSQL | [RLS docs](https://www.postgresql.org/docs/18/ddl-rowsecurity.html) | Policy composition changes authorization predicate. |
| OpenSSL | [FIPS provider docs](https://docs.openssl.org/master/man7/OSSL_PROVIDER-FIPS/) | Provider selection is mode, not N2. |
