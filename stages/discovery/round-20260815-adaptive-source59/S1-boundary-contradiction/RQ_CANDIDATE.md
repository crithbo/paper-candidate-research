# RQ candidate RQ01

- Exact anchor: x86-64 TLSDESC ABI contract, draft 0.99.7, observed 2026-08-15.
- Same-object envelope: fixed program/DSO graph, `dlopen`/`dlclose` trace, x86-64 TLS descriptor relocation and ABI-visible TLS result.
- Primary RQ: Can a glibc/x86-64-specific resolver–relaxation construction choose legal TLSDESC materialization states over a fixed module-lifetime trace while preserving the exact ABI and dynamic-loader visibility semantics, with a non-generic guarantee?
- Contribution hypothesis: SYSTEM_ARCHITECTURE / N2, conditional only.
- Co-defined bundle: descriptor action state, loader carrier/trace, and full cost.
- FINER-lite: feasibility conditional on current resolver and loader test source; relevance conditional; novelty threat high; scope pass; no paper-quality conclusion.
- Ordinary closure only; no selective nomination.
- Disposition: `RQ_READY_FOR_ORDINARY_CLOSURE`.
