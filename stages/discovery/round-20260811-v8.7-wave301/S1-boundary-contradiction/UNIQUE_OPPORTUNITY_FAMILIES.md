# Unique opportunity families — Wave301

| ID | exact same object / strongest union | natural carrier, oracle and full cost |
|---|---|---|
| U01 | ELF process, dependency graph, symbol/relocation semantics and glibc loader state; ld flags, rtld lazy/eager binding, dlopen/init order | glibc tests and public ELF apps; loader trace/ELF relocation oracle; link/load CPU/RSS, reloc/GOT bytes, latency |
| U02 | fixed userspace futex2 vectors, values, timeout and observable wake result; kernel wait setup/enqueue/wake/requeue and userspace lock protocol | kernel selftests/libc synchronization workloads; syscall/result oracle; CPU/RSS, syscalls, latency and queue state |
| U03 | fixed Python module/package/loader state, executed semantics and `sys.modules`; importlib finder/loader/spec/cache/reload union | CPython regression package corpus; module result/spec/cache oracle; import CPU/RSS, I/O, pyc/cache bytes |
| U04 | class-init state/result | source union not pinned |
| U05 | TLS loader commitment | U01 overlap |
| U06 | robust futex ownership | U02 overlap |
