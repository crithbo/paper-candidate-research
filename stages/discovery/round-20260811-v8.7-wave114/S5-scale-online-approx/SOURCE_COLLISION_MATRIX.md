# Raw source / preliminary action-divergence matrix

The sources below are original/official records checked through 2026-08-11. They establish positive current algorithmic actions; no source is used for an implementation-absence claim, so v8.7 source/flag absence checking is `NOT_TRIGGERED`.

| Raw family / source | Current strongest same-object union | Natural carrier / full-cost precondition | Pre-deep result |
|---|---|---|---|
| [Dynamic set cover, transformation](https://arxiv.org/abs/2511.07354) and [full algorithm](https://arxiv.org/abs/2511.08485) | Dynamic set-cover algorithms plus worst-case recourse transformation. | Dynamic coverage/update logs; selected-set changes + update work + cover cost. | `NOT_ADMITTED_UNFROZEN`: direct action absorption. |
| [Fully dynamic k-median](https://wrap.warwick.ac.uk/id/eprint/190870/) | Dynamic clustering/sparsifier and recourse constructions. | Dynamic location-point streams; center changes + update cost + objective. | `NOT_ADMITTED_UNFROZEN`: active/covered clustering family. |
| [Dynamic spanner via APSP](https://drops.dagstuhl.de/entities/document/10.4230/LIPIcs.ICALP.2025.111) | Greedy low-recourse spanner plus approximate APSP. | Dynamic graph update streams; all H-edge changes + query/update cost. | `NOT_ADMITTED_UNFROZEN`: direct construction. |
| [Expander pruning](https://arxiv.org/abs/2504.00544) | Online pruning and dynamic sparsifier/spanner framework. | Edge-deletion streams; pruned volume + all reconstruction/update work. | `NOT_ADMITTED_UNFROZEN`: threshold residual only. |
| [Transitive reduction](https://drops.dagstuhl.de/entities/document/10.4230/LIPIcs.ICALP.2025.92) | Native fully dynamic exact reduction structure. | Directed update sequences; maintained edges + update work. | `NOT_ADMITTED_UNFROZEN`: no migration action frozen. |
| [Dynamic maximum depth](https://drops.dagstuhl.de/storage/00lipics/lipics-vol332-socg2025/LIPIcs.SoCG.2025.77/LIPIcs.SoCG.2025.77.pdf) | Dynamic geometry/depth data structures. | Geometric update streams would be needed; state/query/update cost. | `NOT_ADMITTED_UNFROZEN`: no finite same-object route. |

This bounded source record does not claim global novelty absence.
