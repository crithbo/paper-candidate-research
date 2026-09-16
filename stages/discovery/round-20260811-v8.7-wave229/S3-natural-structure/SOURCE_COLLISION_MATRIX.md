# Source and collision matrix

| first-party source | role | collision result |
|---|---|---|
| [Linux master `scripts/kallsyms.c`](https://raw.githubusercontent.com/torvalds/linux/master/scripts/kallsyms.c) | current constructor | global two-byte token-profit optimization and complete emitted table union; defeats a frequency-only proposal |
| [Linux master `kernel/kallsyms.c`](https://raw.githubusercontent.com/torvalds/linux/master/kernel/kallsyms.c) | current decoder/query semantics | token table/index expansion is required for same-object equivalence |
| [Linux master `scripts/link-vmlinux.sh`](https://raw.githubusercontent.com/torvalds/linux/master/scripts/link-vmlinux.sh) | current build/config path | multi-pass link/map generation and `CONFIG_KALLSYMS`/`CONFIG_KALLSYMS_ALL`/64-bit-or-relocatable controls are in full cost |
| [Linux master `kernel/kallsyms_internal.h`](https://raw.githubusercontent.com/torvalds/linux/master/kernel/kallsyms_internal.h) | representation interface | declares offsets, names, token table/index, markers and sequences |
| [Linux v6.12 `scripts/kallsyms.c`](https://raw.githubusercontent.com/torvalds/linux/v6.12/scripts/kallsyms.c) | tagged configuration/history check | documents historical absolute-percpu/base-relative pathway; no conflation with master |
| [Linux mainline repository](https://github.com/torvalds/linux) | tag carrier origin | official tagged source is available for a bounded future natural release set |

Current-source conclusion: the strongest union is broad and a frequency heuristic is directly absorbed.  The review does not prove that every possible whole cross-release constructor is absorbed; it instead records the missing controlled law and action witness as `NOT_ADMITTED_UNFROZEN`.
