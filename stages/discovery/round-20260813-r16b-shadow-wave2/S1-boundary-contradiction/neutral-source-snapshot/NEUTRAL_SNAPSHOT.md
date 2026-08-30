# Neutral snapshot — 2026-08-13

Pre-dedup checked frozen registry/history and R16A sample ledger. The following signatures are mutually `INDEPENDENT`, absent from that bounded search, and no other R16B lane signature was available locally. They are neutral descriptions, not proposals or dispositions.

| ID | Canonical signature | First-party snapshot and two recovery/publication actions |
|---|---|---|
| F01 | `ITANIUM_CPP_GUARD__LOCAL_STATIC_INIT__ACQUIRE_RELEASE_ABORT__FIXED_FUNCTION_SEMANTICS__ABI_UNION__CPU_BLOCKING` | Itanium C++ ABI: acquire returns work/no-work; the initializer must release on success or abort on exception. |
| F02 | `CPP_CALL_ONCE__EXCEPTIONAL_RETRY__RETURNING_PUBLICATION__FIXED_ONCE_FLAG__MEMORY_ORDER_GUARANTEE__STD_UNION__CPU_BLOCKING` | C++ `call_once`: exceptional invocation leaves flag unset and retries; returning invocation publishes side effects to passive calls. |
| F03 | `CPYTHON315_LAZY_IMPORT__PROXY_FIRST_USE_PUBLICATION__FAILURE_AT_USE__FIXED_IMPORT_TRACE__PYTHON315_UNION__CPU_RSS` | Python 3.15 lazy import creates a proxy and loads at first use; default is `normal`, with `all` and filter controls documented. |
| F04 | `LINUX_FIRMWARE_FALLBACK__DIRECT_LOOKUP_SYSFS_PUBLICATION__LOADING_DATA_READY__FIXED_DEVICE_REQUEST__FW_LOADER_UNION__CPU_RSS_LATENCY` | Linux firmware loader performs direct lookup or eligible sysfs fallback; userspace publishes upload using loading/data/ready state. |

R16A near relations are not equivalent: F01/F02 differ from Rust Once by ABI and C++ standard recovery semantics; F03 differs from CPython eager import rollback by Python 3.15 proxy/first-use semantics; F04 differs from prior systemd/firmware-like families by the firmware-loader request/sysfs transaction object.
