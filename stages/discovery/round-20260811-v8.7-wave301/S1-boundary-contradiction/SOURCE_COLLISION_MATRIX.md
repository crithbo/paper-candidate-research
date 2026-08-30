# Source / collision matrix — Wave301

| family | official/current source | conclusion |
|---|---|---|
| glibc loader | [dynamic linker](https://sourceware.org/glibc/manual/latest/html_node/Dynamic-Linker.html), [hardening](https://www.sourceware.org/glibc/manual/latest/html_node/Dynamic-Linker-Hardening.html), [current source log](https://sourceware.org/pipermail/glibc-cvs/2019q4/068153.html) | binding/dlopen commitment is current loader/linker/config union: `DROP` |
| futex2 | [futex2](https://docs.kernel.org/6.11/userspace-api/futex2.html), [kernel locking](https://docs.kernel.org/6.6/kernel-hacking/locking.html) | wake placement is scheduler/fairness controller under existing state machine: `DROP` |
| Python import | [importlib](https://docs.python.org/3/library/importlib.html) | module insertion-before-load and loader state are semantic current union: `DROP` |
| JVM class init | no first-party source/corpus closure | raw only |
| TLS | glibc hardening flags | overlaps U01 |
| robust futex | [robust futex docs](https://docs.kernel.org/6.7/locking/robust-futexes.html) | overlaps U02 |

Bounded source search is not a novelty or absence claim.
