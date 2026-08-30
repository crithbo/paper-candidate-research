# Action-Space / Collision Matrix — Wave 9

**Cutoff:** 2026-08-09. A direct subtractor requires the same natural/formal object, information, actions, guarantee, and relevant full-cost ledger. Static/rebuild methods are ceilings, never substitutes for an online deployment baseline.

| Object | Update → query / guarantee → full-cost contract | Strongest current fair union | Candidate-looking atomic action | Action-gap certificate | Collision disposition |
|---|---|---|---|---|---|
| Cloud block-store range index | Range write/overwrite → block/range read → index bytes, lookup/update throughput, overlap resolution, fragmentation, split/merge/GC and write amplification | Per-block index; RASK's range-native tree, log-structured leaf, range-tailored search/GC, range-aware split/merge; rebuild ceiling | Range-native representation with online coalescing | **FAIL:** RASK already expresses every listed action within the same range-index object. A temporal/version change is a different object, not a residual. | `DIRECT_SUBTRACTOR_ABSORPTION` |
| Evolving graph snapshots | Snapshot add/change → fixed graph query per snapshot, approximate result/refinement → vertex-state bytes, proxy cost, out-of-memory I/O, query/update time | Exact snapshot processing; current EGA; POEGA proxy graph, refinement, concurrent snapshot processing, adaptive state compaction | Compact proxy representation plus refine-on-demand | **FAIL:** POEGA jointly contains this representation/refinement action. Per-query adaptation is a controller. | `DIRECT_SUBTRACTOR_ABSORPTION` |
| Disk-backed serverless snapshot | Snapshot materialization/change → process restored with equivalent state → image bytes/layout, VMA metadata, I/O/copies/faults, restore latency | Conventional process/VM snapshot restoration; Spice's SHELF plus spliceVMA and bulk metadata restoration | Decouple physical and virtual snapshot layouts | **FAIL:** SHELF/spliceVMA directly implements the action. Prefetch-only changes are selector/tuning. | `DIRECT_SUBTRACTOR_ABSORPTION` |
| Log-structured storage reclamation | Obsolete/live block updates → reclaim space without violating read semantics → valid-data movement, write amplification, space, tail latency, discard/compaction work | Full compaction; DisCoGC discard-and-compaction | Avoid or defer valid-data relocation | **FAIL:** discard-plus-compaction is already the core action. Threshold/reordering formulations are controllers. | `DIRECT_SUBTRACTOR_ABSORPTION_OR_CONTROLLER` |

## Finite-natural-killer audit

| Object | Public natural corpus confirmed from first-party source? | Candidate action-gap survives? | Finite 20–50-instance killer admissible? |
|---|---|---|---|
| Range index | No: the paper reports production traces, but this pass found no public official trace/artifact. | No | No |
| Evolving graph snapshots | Real-world datasets reported, but not sufficient to define a CPU same-object residual. | No | No |
| Serverless snapshots | Representative Java/Python/Node workloads reported, but no distinct mechanism. | No | No |
| Log-structured GC | Production traces reported, not publicly frozen in the source found. | No | No |

No candidate passes both required columns. Consequently no `PROPOSE_STAGE0` action-gap certificate or finite natural killer is emitted.

## Source URLs

- <https://www.usenix.org/conference/fast26/presentation/zhao>
- <https://www.usenix.org/conference/osdi26/presentation/zhang-yunmo>
- <https://www.usenix.org/conference/osdi26/presentation/holmes>
- <https://www.usenix.org/conference/fast26/presentation/bian>
