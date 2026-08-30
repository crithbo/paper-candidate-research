# Canonical v8.7 disposition

Input is exactly `../neutral-source-snapshot`.

| ID | Canonical disposition | Current-union / fair-baseline reason | Natural carrier, full cost, finite killer |
|---|---|---|---|
| F01 C++ guard | `DROP` | ABI already requires acquire→release or acquire→abort. Any alternative is a compiler/runtime implementation detail, generic locking, or changes exactly-once semantics. | Real C++ local-static functions; guard contention, code bytes, init latency, blocking. Killer: if candidate is acquire/release/abort reordering or changes exception behavior. |
| F02 C++ call_once | `DROP` | The standard total order of exceptional calls followed by a returning call already defines retry/publication. A callable chooser is policy; generic scheduling is not target-specific N2. | Public C++ concurrency tests; wait CPU, wakeups, state bytes, latency. Killer: reduce to standard active/passive/exceptions. |
| F03 CPython 3.15 lazy import | `DROP` | Current docs expose proxy first-use, default `normal`, `all`, filters, and explicit restrictions. A placement rule is configuration; cross-module batching changes failure-time/observable import semantics. | Python stdlib/app import traces; startup/first-use CPU/RSS, proxy memory, exception timing. Killer: candidate is mode/filter or alters first-use/error semantics. |
| F04 Linux firmware fallback | `NOT_ADMITTED_UNFROZEN` | Direct lookup, platform fallback, sysfs fallback, nowait and cache form a broad current union. A same-device integrity-preserving constructor and direct paper collision remain bounded but unclosed. | Kernel firmware-loader test/fault routes; lookup/fallback latency, buffer RSS, sysfs transfer bytes, device readiness. Killer: candidate reduces to fallback flag/callback or changes firmware integrity/device semantics. |

No canonical clean brief or Stage0 proposal. Current docs/source/default/nondefault routes were checked; no absence claim is made for F04.
