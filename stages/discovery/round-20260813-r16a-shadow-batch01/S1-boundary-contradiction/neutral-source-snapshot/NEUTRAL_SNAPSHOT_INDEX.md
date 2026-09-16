# Neutral source snapshot

Snapshot date: 2026-08-13. These statements are descriptive only; they contain neither a proposal nor a canonical disposition.

| Family ID | Canonical signature | Neutral first-party/standard snapshot |
|---|---|---|
| S1-R16A-F01 | `CPYTHON_IMPORT__PREEXEC_SYSMODULES_PUBLICATION__FAILURE_REMOVAL__FIXED_MODULE_TRACE__IMPORT_SEMANTICS__LOADER_UNION__CPU_RSS_LATENCY` | Python 3.14 importlib docs require a loader to insert a new module in `sys.modules` before loading, then remove a module it inserted if load fails. CPython importlib source is the implementation route. |
| S1-R16A-F02 | `GLIBC_DLOPEN__GLOBAL_SCOPE_RESERVE_UPDATE__CONSTRUCTOR_BOUNDARY__FIXED_DSO_GRAPH__ELF_SEMANTICS__LOADER_UNION__CPU_RSS_RELOC` | glibc current source/history route describes two-phase global-scope preparation before constructors and non-throwing update afterward, including recursive `dlopen` accounting. |
| S1-R16A-F03 | `RUST_ONCE__POISON_FORCE_RECOVERY__FIXED_INIT_GRAPH__HAPPENS_BEFORE__STD_UNION__CPU_RSS_BLOCKING` | Rust `std::sync::Once` documents incomplete/poisoned/complete states; `call_once_force` can run after poison and clears poison only when its closure succeeds. |
| S1-R16A-F04 | `POSIX_ROBUST_MUTEX__OWNER_DEATH_EOWNERDEAD__CONSISTENT_OR_ENOTRECOVERABLE__FIXED_SHARED_STATE__POSIX_GUARANTEE__LIBC_UNION__CPU_RSS_BLOCKING` | POSIX documents `EOWNERDEAD`, `pthread_mutex_consistent`, and release-without-consistent leading to `ENOTRECOVERABLE`; application state recovery remains application responsibility. |

Dedup check: no matching signature was found in the frozen registry search for CPython import/importlib, glibc `dlopen`/dynamic link, robust mutex/pthread mutex, or Rust Once/poison. These four signatures are mutually `INDEPENDENT`; no R16A cross-lane duplicate was observed during this bounded local check.
