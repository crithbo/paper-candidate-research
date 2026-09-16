# Raw-screen row events — Wave51 S3

Assignment: `DISCOVERY-S3-20260811-V8.7-WAVE51-NATURAL-MECHANISM-DEPTH`. Cutoff: 2026-08-11. Applied revision: `v8.7-authoritative-plus-r3-p0-clarity-compatibility__r5-p0-funnel-clarity__r7-p0-repair-vector-dormant-off__p1-shadow-not-authoritative`; `DISCOVERY_QUALITY_MODE=OFF`.

| event | unique family | natural carrier / exact object | initial status | screen result |
|---|---|---|---|---|
| R01 | EBPF-STATE-QUOTIENT | accepted/rejected Linux eBPF program under the kernel verifier | `DEEP_DIVE_REQUIRED` | Natural branch-state repetition and a formal accept/reject oracle are present. |
| R02 | NGINX-LOCATION-COMPILE | nginx location configuration with request-to-location semantics | `STRUCTURAL_DROP` | The remaining action is precedence-preserving configuration selection/factoring, not a new constructor. |
| R03 | WASM-LEB-LAYOUT | valid WebAssembly binary module and decoded abstract syntax | `DEEP_DIVE_REQUIRED` | Multiple legal encodings have a spec oracle, but a nontrivial same-object action must survive canonicalization. |
| R04 | JVM-CP-REINDEX | JVM class file and verifier-visible execution semantics | `DEEP_DIVE_REQUIRED` | Natural reference-frequency skew can affect `ldc`/`ldc_w`; investigate existing full constant-pool rewrites. |
| R05 | LLVM-REGALLOC-STRUCTURE | MachineIR plus target-correct executable code | `NOT_ADMITTED_UNFROZEN` | Natural live-range shapes exist, but no structure-specific action outside global allocator families is frozen. |
| R06 | LEAN-EXPR-SHARING | Lean declarations accepted by the kernel | `NOT_ADMITTED_UNFROZEN` | Repeated proof subterms are observable, but the exact serializable object/full-cost contract is not frozen. |
| R07 | DWARF-NAME-INDEX-LAYOUT | DWARF `.debug_names` index with debugger lookup semantics | `DEEP_DIVE_REQUIRED` | Repeated identifiers and prescribed lookup tables admit a deterministic reader/oracle. |
| R08 | ANTLR-ATN-SERIALIZATION | generated recognizer and accepted parse-language semantics | `STRUCTURAL_DROP` | The upstream serializer already emits state/edge/decision map; reordering alone changes version/target contract or is packing. |
| R09 | JVM-CP-REINDEX | same family, re-screen after Pack200 primary specification audit | `STRUCTURAL_DROP` | Pack200 explicitly reconstructs constant pools and adjusts all references without semantic change: direct constructor collision. |

R5-P0 counts: `RAW_SCREEN_ROW_EVENT=9`; re-screen events `=1`; `UNIQUE_OPPORTUNITY_FAMILY=8`; `CANDIDATE_GRADE_DEEP_REVIEW=3`; `STAGE0_BRIEF=0`.
