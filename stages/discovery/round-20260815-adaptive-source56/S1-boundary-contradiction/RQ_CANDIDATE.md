# RQ candidate RQ01

- Assignment/lane: Source56 / S1 boundary contradiction.
- Seed: S01.
- Exact anchor: RISC-V Zawrs Version 1.01; observed 2026-08-15.
- Stable object and guarantee: fixed RV64 LR/SC polling loop, unchanged C/C++ atomic semantics, ISA legality, and visible synchronization endpoint.
- Primary RQ: Can a target-specific compiler construction place `WRS.NTO`/`WRS.STO` in a fixed class of LR/SC retry loops with a nontrivial correctness or cost guarantee beyond a configurable wait/retry heuristic?
- Co-defined bundle: atomic action, observable endpoint, and carrier.
- FINER-lite: feasible only conditionally through public compiler tests/atomic-loop carriers; interesting if it changes compiler treatment of energy/forward progress; novelty threat high; scope pass; relevance conditional.
- Ordinary closure: used; no selective nomination.
- Disposition: `EARLY_FATAL` after the anchor/current check: the surviving formulation is generic retry/wait policy selection, not a target-specific contribution contract.
