# Official-source audit — S2-93-CQ01

| Sequence | Route | Result |
|---:|---|---|
| 1 | `api.github.com/repos/postgres/postgres` | 200; default `master`. |
| 2 | `api.github.com/repos/postgres/postgres/commits/master` | 200; pin `7e6e294e4e451c55c52caa1ff68df9858912d066`. |
| 3 | `src/backend/jit/llvm/llvmjit_expr.c` | 200; expression JIT. |
| 4 | `src/backend/jit/llvm/llvmjit_deform.c` | 200; tuple-deform JIT. |
| 5 | `src/backend/jit/llvm/llvmjit.c` | 200; LLVM context/module/provider. |
| 6 | `src/test/regress/sql/jit.sql` | 404 telemetry only; not carrier absence. |

Current expression compilation, descriptor-informed tuple deforming and LLVM context/module code generation are visible at the pin. `SEARCH_BOUNDED_OPEN` remains for any direct collision outside that observed union; no external search was authorized. No proposed union-external action, legal two-plan witness or finite guarantee is present in this queue, so no structural-fatal claim is made.
