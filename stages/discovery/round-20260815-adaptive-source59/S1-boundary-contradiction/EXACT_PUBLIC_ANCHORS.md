# Exact public anchor

## A01 — x86-64 `R_X86_64_TLSDESC` descriptor contract

- Exact public anchor/version: AMD64 System V ABI draft 0.99.7, TLSDESC relocation section; public PDF observed 2026-08-15.
- URL: https://www.uclibc.org/docs/psABI-x86_64.pdf
- Stable object: a fixed x86-64 ELF program/DSO graph using the TLSDESC relocation and ABI-defined resolver call contract, including module open/close visibility.
- Immutable guarantee: ABI-visible TLS address/offset result, resolver register convention, relocation legality, and dynamic-loader lifetime semantics remain unchanged.
- Primary source route: current Sourceware glibc resolver and `dlclose` paths, with its direct TLS descriptor tests. Transport fallback: current glibc manual/docs.

The anchor establishes a cross-layer state seam only; it does not establish an unimplemented action or performance residual.
