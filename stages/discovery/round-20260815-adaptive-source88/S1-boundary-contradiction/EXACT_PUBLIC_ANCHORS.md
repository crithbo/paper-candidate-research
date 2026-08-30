# Exact public anchor

## A01 — glibc/Linux `dlclose` object-lifetime boundary

- exact public object: glibc 2.43 dynamic-loader `dlopen`/`dlclose` semantics for a fixed ELF shared-object dependency graph.
- current interface anchor: [Linux man-pages `dlopen(3)` / `dlclose`](https://www.man7.org/linux/man-pages/man3/dlclose.3.html), current page accessed 2026-08-15.
- official project/version anchor: [glibc 2.43 manual](https://sourceware.org/glibc/manual/), last updated 2026-02-02.
- upstream implementation locus for a later source-specific closure: glibc `elf/dl-close.c`; no implementation-absence claim is made.
- natural carrier: plugin/library applications that load a shared object, call its symbols, and release its handle.

The anchor fixes reference count/dependency conditions, destructor-before-unload behavior, and the documented fact that successful `dlclose` does not guarantee address-space removal.
