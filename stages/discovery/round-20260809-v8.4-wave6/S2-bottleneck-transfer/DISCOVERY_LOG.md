# Discovery log — S2 Wave 6

- Assignment: `DISCOVERY-S2-20260809-V8.4-WAVE6`
- Cut-off: 2026-08-09 (Asia/Shanghai).
- Permitted method: accepted production Discovery `v2/v8.1`; O2 `CALIBRATED`.
- Prohibited and not used: TLS-blocked two-axis `v8.2r2`.
- Sources: paper originals, author artifacts, and official/upstream repositories/pages only.
- Execution: no download, experiment, benchmark, Stage 0/A/B, or shared-control-file modification.

## Baseline-residual-first protocol

For every lead, the candidate space begins only after freezing the strongest deployable same-object union's:

1. input semantics and correctness/optimality guarantee;
2. information available at every decision point;
3. action space;
4. full cost, including newly dominant artifact generation, storage, transfer, checking, or metadata work.

Only an atomic N1/N2/N3 action outside that union may proceed. A scheduling controller, selector, or retuned heuristic inside the union is dropped even if it could improve a measured metric.

## Searches and primary evidence

Queries:

1. `2025 2026 SAT solver proof logging bottleneck learned clause deletion certificate paper artifact`
2. `2025 2026 parallel SAT proof logging proof DAG partition checker paper`
3. `2025 2026 parallel SAT solver proof certificate communication storage artifact`
4. `2025 2026 SMT solver proof production checking performance paper`
5. `2025 2026 database storage metadata full-cost open artifact system paper`
6. `2025 2026 distributed algorithm compute communication open source real trace paper`

Retained first-party sources:

- [PalRUP, SAT 2026](https://drops.dagstuhl.de/entities/document/10.4230/LIPIcs.SAT.2026.17), with its linked [checker source](https://github.com/rubenGoetz/PalRUP-Check), [Mallob source](https://github.com/domschrei/mallob), and [experimental data](https://github.com/rubenGoetz/SAT26_experimental_data). It changes the post-solver bottleneck from monolithic proof writing/checking to persistent parallel proof files plus decentralized checks.
- [Real-time Proof Checking for Distributed Incremental SAT Solving, TACAS 2026](https://repositum.tuwien.at/handle/20.500.12708/228305), an immediate alternative based on real-time checking.
- [Factoring Learned Clauses, SAT 2026](https://drops.dagstuhl.de/entities/document/10.4230/LIPIcs.SAT.2026.28), a current same-domain solver-mechanism check.
- [Efficient and Verifiable Proof Logging for MaxSAT, ASE 2025](https://conf.researchr.org/details/ase-2025/ase-2025-papers/49/Efficient-and-Verifiable-Proof-Logging-for-MaxSAT-Solving) and [Certified Branch-and-Bound MaxSAT Solving](https://arxiv.org/abs/2511.10273), retained only as optimization/certification adjacent work, not cross-object baselines.

## Result

**0 / 2 `PROPOSE_STAGE0`.** The public PalRUP artifacts could support a 20–50-instance CPU Stage A, but no action outside the strongest same-object union survives. This is a structural selection result—not a rejection based on code, current result, resource availability, or AI readiness.

Excluded by assignment rather than re-evaluated: UPMEM/PIMDAL, AXI4MLIR, accelerator translation validation, zkVM autotuning, Git pack, PB deletion, and S4 page packing. No terminal topic is revived.
