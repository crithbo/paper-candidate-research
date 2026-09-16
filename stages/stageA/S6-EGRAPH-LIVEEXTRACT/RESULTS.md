# S6-EGRAPH-LIVEEXTRACT Stage A Results

## Material Passport

- Origin Skill: `academic-research-suite / experiment-agent`
- Origin Modes: `plan → run → validate`
- Origin Date: 2026-08-09
- Verification Status: `VERIFIED` for the deterministic locked probe
- Version Label: `stagea_liveextract_probe_v1`

## Result summary

- Final locked suite: 401 instances: one pinned `extraction-gym` `eggcc-bril/add.bril.json` projection plus 400 controlled instances generated with seed `260809`.
- Exact work performed: 3,106 distinct reachable extractions, 105,496 fixed-extraction schedule queries, and 11,730 budget points.
- Controlled witness count: 1/400 instances and 1 budget point.
- Public-projection witness count: 0/1. The public projection had one reachable extraction and therefore could not express an extraction-order separation.
- Reproduction: two complete runs had the same canonical SHA-256 `acdf34ffdf403282af1d4a9a75a18db226a13b2efacc5402dbd52296d3b7ab40` after excluding wall-clock/RSS telemetry.

This is `PRELIMINARY_SUPPORT` for the existence of the coupling mechanism in the frozen formal object. It is not natural backend-memory evidence and is not the paper main claim.

## Exact witness

Instance `controlled_235`, two roots, budget `B=15`:

| Method | Total execution cost | Peak live | Executions | Recomputations | Selected extraction |
|---|---:|---:|---:|---:|---|
| Joint exact oracle | 30 | 15 | 5 | 0 | `0=input;1=a0;2=a1;3=a0;5=a0;6=a1` |
| Runtime-first → exact fixed-DAG schedule | 32 | 15 | 6 | 1 | `0=input;1=a1;2=a1;3=a0;5=a0;6=a1` |
| Memory-first scheduling-aware extraction → exact fixed-DAG schedule | 34 | 15 | 5 | 0 | `0=input;1=a0;2=a0;3=a0;5=a0;6=a1` |

At the same object and `B`, the joint point reduces the runtime proxy by 2/32 = 6.25% relative to runtime-first and by 4/34 = 11.76% relative to memory-first. The mechanism-specific difference is that runtime-first selects a cheaper representative for e-class 1 but must compute that value twice; the joint choice pays one extra unit for a smaller representative and avoids the recomputation. Memory-first chooses a lower-static-peak e-class-2 representative but pays four extra cost units.

The exact replayed joint action trace is `C1, C3, C5, D3, C2, D1, C6`. All child-residency, root-emission, cost, and peak checks passed.

## Negative and boundary results

- 399/400 controlled instances produced no strict joint-over-both-sequential witness. This shows that the effect is sparse under the frozen random distribution and prevents a prevalence or generality claim.
- The public `eggcc-bril/add.bril.json` projection produced no witness because its eligible six-e-class projection contained one extraction. This is a useful natural-structure negative control, not a falsifier of other natural e-graphs.
- Source output sizes were absent in `extraction-gym`; the public projection therefore uses the preregistered unit-size convention. It is not natural backend allocation evidence.
- No runtime, register allocation, spill/reload, code-generation, or machine-latency claim is supported.

## Full-cost ledger

| Cost item | Run 1 | Run 2 | Disposition |
|---|---:|---:|---|
| Oracle wall time | 12.270 s | 11.536 s | Included |
| Peak Python RSS | 29,605,888 B | 29,458,432 B | Included |
| Locked input JSON | 973,093 B | same | Included |
| Result JSON | 133,541 B | 133,541 B | Included |
| Public data materialized | 866,607 B | same | Under 5 MiB cap |
| E-graph construction from compiler | unavailable | unavailable | Claim ceiling limitation |
| Backend schedule/allocation/spill/runtime | unavailable | unavailable | Claim ceiling limitation |

## Validation report

- Unit tests: 4/4 passed.
- Determinism: canonical run outputs match byte-for-byte.
- Integrity: no budget or dominance violation in any reported witness.
- Statistical tests: not applicable; the probe is deterministic exhaustive search over each locked instance, not a sample-estimation study.
- Fallacy scan: 11/11 checked. Nine are not applicable to deterministic enumeration; look-elsewhere/forking-path risks were bounded by the preregistered 400-trial limit and reporting the full tested count.
- Machine-readable validation: `results/validation.json`.

## Claim ceiling

Supported: one frozen controlled acyclic e-graph admits a strict joint point relative to both exact sequential controls; the premise is not falsified by the bounded probe.

Unsupported: prevalence on compiler workloads, natural peak-memory savings, asymptotic advantage, deployable algorithm performance, backend speedup, Q1 paper parity, or the global absence of a direct collision.
