# Current-source / same-object collision matrix

| Object | First-party evidence | Current action/configuration union | Decision relevance |
|---|---|---|---|
| systemd journal | [Journal file format](https://systemd.io/JOURNAL_FILE_FORMAT), [journald.conf](https://www.freedesktop.org/software/systemd/man/252/journald.conf.html) | indexed append format; DATA/FIELD/ENTRY/hash/array objects; `Compress=` default/threshold. | Leaves no frozen non-controller whole constructor. |
| ftrace | [Kernel ftrace documentation](https://docs.kernel.org/trace/ftrace.html) | tracer choice, tracefs controls, ring buffer, timestamped event semantics. | Reorder changes object; controls are forbidden controller/tuning. |
| LLVM profiles | [llvm-profdata](https://llvm.org/docs/CommandGuide/llvm-profdata.html), [InstrProf source](https://llvm.org/doxygen/InstrProf_8cpp_source.html) | merge including `--weighted-input`; profile kind/merge restrictions. | Ranking rule is current action/configuration, not a new N3 constructor. |
| BTF | [Linux BTF documentation](https://docs.kernel.org/bpf/btf.html) | `.BTF.base`, automatic external-module generation, relocation and kernel API verification. | Directly absorbs base-reuse and cross-version relocation. |
| GDB index | [GDB index files](https://www.sourceware.org/gdb/current/onlinedocs/gdb.html/Index-Files.html), [format](https://www.sourceware.org/gdb/current/onlinedocs/gdb.html/Index-Section-Format.html) | gdb/add/save/objcopy/gold construction paths and index-cache controls. | Directly absorbs generic constructor. |
| CTF | [Binutils CTF specification](https://sourceware.org/binutils/docs/ctf-spec.html) | current CTF/ELF sharing semantics; source is authoritative if spec conflicts. | Does not furnish a stable law or candidate whole action. |

This is a bounded first-party review.  It does not make a global absence claim
for CTF or any unsearched literature route.
