# Six deep-review action/collision matrix

All original/official source records below were checked through 2026-08-11. No implementation-absence claim is made; v8.7 source-symbol/flag absence audit is `NOT_TRIGGERED`.

| Object / primary source | Online information + complete action + guarantee | Strongest fair union, natural carrier, full-cost | Outcome |
|---|---|---|---|
| [Uniform-machine load balancing](https://doi.org/10.1016/j.orl.2023.02.013) | Prefix jobs, related-machine speeds, bounded reassignment; competitive makespan. | Doubling/migration framework + bounded-migration predecessors; job traces; makespan plus moved size. | `DROP` |
| [Dynamic bin packing migrations](https://www.microsoft.com/en-us/research/publication/the-power-of-migrations-in-dynamic-bin-packing/) | Item arrivals/departures, repacking/migration; active-time approximation and migration-delay guarantee. | Limited/no/high migration union; job-life traces; active bins plus migrations/delay. | `DROP` |
| [OBADC](https://drops.dagstuhl.de/entities/document/10.4230/LIPIcs.ITCS.2025.81) | Insert/merge/delete components, vertex migration; competitive migration and cluster count. | Native algorithm/lower bound + balanced allocation; process communication logs; all moved vertices. | `DROP` |
| [Maximum starting time](https://cris.technion.ac.il/en/publications/online-minimization-of-the-maximum-starting-time-migration-helps/) | Online jobs, reassignment; competitive max starting time with limited migration. | Native construction and schedule predecessors; machine-job traces; objective plus reassignments. | `DROP` |
| [KnapsackLB](https://www.microsoft.com/en-us/research/publication/knapsacklb-enabling-performance-aware-layer-4-load-balancing/) | Probe feedback, L4 backend weights; latency optimization. | KnapsackLB/current L4 LB; service traces; probes/latency. | `NOT_ADMITTED_UNFROZEN`: controller, no complete recourse action. |
| [Heterogeneous-slot paging](https://scholars.duke.edu/publication/1652764) | Prefix page/slot-set requests; cache replacement and fault competitiveness. | Native heterogeneous-slot cache algorithms + paging; cache traces; faults/state. | `NOT_ADMITTED_UNFROZEN`: no migration action. |

## Current reality/fidelity record

Each line has positive source-defined semantics and an explicit 72h falsifier form in `DISCOVERY_LOG.md`. Because no action gap depends on an absent upstream feature, no version/commit/flag nonexistence is claimed. The bounded scan does not assert global novelty absence.
