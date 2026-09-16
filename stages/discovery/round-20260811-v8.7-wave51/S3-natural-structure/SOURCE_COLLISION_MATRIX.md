# Source / collision matrix

Frozen cutoff: 2026-08-11. All materials listed are official standards, official project documentation, or upstream project source. `DISCOVERY_QUALITY_MODE=OFF`; this is a production v8.7 matrix, not an R7 shadow analysis.

| family | primary current evidence | action-space conclusion |
|---|---|---|
| EBPF-STATE-QUOTIENT | [Linux verifier documentation](https://www.kernel.org/doc/html/latest/bpf/verifier.html): `regsafe()`, `states_equal()`, liveness and pruning. | Native semantic equivalence/pruning directly subtracts the proposed quotient. |
| NGINX-LOCATION-COMPILE | [nginx core module documentation](https://nginx.org/en/docs/http/ngx_http_core_module.html) specifies prefix and regex location matching/precedence. | Any equivalent location factoring is a precedence-preserving configuration/compiler wrapper. |
| WASM-LEB-LAYOUT | [WebAssembly 3.0 binary conventions](https://webassembly.github.io/spec/core/binary/conventions.html) and [validation algorithm](https://webassembly.github.io/spec/core/appendix/algorithm.html). | Legal alternatives are encoding-level choices; no nontrivial same-object constructor was frozen. |
| JVM-CP-REINDEX | [JVMS SE 26](https://docs.oracle.com/en/java/javase/26/docs/specs/jvms/index.html), [OpenJDK constant pool source](https://github.com/openjdk/jdk/blob/master/src/hotspot/share/oops/constantPool.cpp), and [Pack200 specification](https://docs.oracle.com/en/java/javase/11/docs/specs/pack-spec.html). | Pack200's full parse/rebuild/renumber operation is a direct same-object subtractor. |
| LLVM-REGALLOC-STRUCTURE | [current LLVM pass declarations](https://github.com/llvm/llvm-project/blob/main/llvm/include/llvm/CodeGen/Passes.h). | Greedy, fast, basic and PBQP actions exist; a natural structure-specific residual was not frozen. |
| LEAN-EXPR-SHARING | [Lean `Expr`](https://github.com/leanprover/lean4/blob/master/src/Lean/Expr.lean) and [kernel environment](https://github.com/leanprover/lean4/blob/master/src/Lean/Environment.lean). | Potential remains unfrozen; no negative inference from absent implementation/resource. |
| DWARF-NAME-INDEX-LAYOUT | [DWARF 5](https://dwarfstd.org/doc/DWARF5.pdf), [current DWARF site](https://dwarfstd.org/), [LLVM reader source](https://llvm.org/doxygen/DWARFDebugLine_8cpp_source.html). | Existing standard constructor confines residual to tuning/layout selection. |
| ANTLR-ATN-SERIALIZATION | [ANTLR serializer API](https://www.antlr.org/api/JavaTool/org/antlr/v4/runtime/atn/ATNSerializer.html) and [official upstream](https://github.com/antlr/antlr4). | State/edge/decision serialization is already an upstream constructor; target packing changes contract. |

Latest-collision conclusion is bounded to the sources above. The three deep reviews found direct same-object subtractors; no claim of globally exhaustive novelty is made.
