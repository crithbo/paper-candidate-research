# First-party source and collision matrix

| Object | Primary current source | Current implementation / option evidence | Residual outcome |
|---|---|---|---|
| GDB index | [GDB Index Files](https://www.sourceware.org/gdb/current/onlinedocs/gdb.html/Index-Files.html), [Index Section Format](https://www.sourceware.org/gdb/current/onlinedocs/gdb.html/Index-Section-Format.html) | `gdb-add-index`; `save gdb-index`; `objcopy`; gold `--gdb-index`; `set index-cache enabled`; documented deprecated-index control. | Direct absorption for a generic whole-index builder; no target-specific action is frozen. |
| gcov files | [GCC Gcov Data Files](https://gcc.gnu.org/onlinedocs/gcc-9.5.0/gcc/Gcov-Data-Files.html), [current gcov JSON docs](https://gcc.gnu.org/onlinedocs/gcc/Invoking-Gcov.html) | `-ftest-coverage`, `-fprofile-arcs`, `-fprofile-dir`, `gcov --json-format`. | A producer is inseparable from instrumentation/runtime counting; no same-object representation constructor identified. |
| BTF | [Linux BTF documentation](https://docs.kernel.org/bpf/btf.html) | Kernel verifier/API; pahole/LLVM generation; `.BTF.base`; `btf__relocate`; automatic external-module generation. | The natural cross-version resilience mechanism is currently represented by the stock union. |
| CTF | [Binutils CTF specification](https://sourceware.org/binutils/docs/ctf-spec.html) | Current format exploits ELF string tables; C source is authoritative when specification differs. | Incomplete carrier and union-external action. |
| LLVM profiles | [LLVM instrumentation profile format](https://llvm.org/docs/InstrProfileFormat.html), [coverage mapping format](https://llvm.org/docs/CoverageMappingFormat.html), [llvm-profdata](https://llvm.org/docs/CommandGuide/llvm-profdata.html) | raw/indexed formats, mapping separation, profile merge/remap. | Historical near-identity exclusion. |
| perf trace | [Linux perf tracepoint analysis](https://docs.kernel.org/trace/tracepoint-analysis.html) | `perf record` output and `perf report` consumption. | Only semantic-changing reorder or generic wrapper remains. |

Latest collision search was bounded to official/current documentation and the
local registry.  No current-absence claim is made for an unclosed candidate.
