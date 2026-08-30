# Raw screen row events

| event | specification/source evidence | consequence |
|---|---|---|
| Object precondition | BAM indexing requires sorting by reference ID then leftmost coordinate. | fixed same-object input |
| BAI construction | Hierarchical bins, chunk offsets, near-chunk joining and 16kb linear index explicitly target query seeks. | strong current algorithmic union |
| CSI role | CSI generalizes BAI bin sizes/coordinate range; tabix uses related coordinate-sorted indexes. | parameter/format choice is baseline action |
| Admission | HTSlib source/default-nondefault union and latest direct collision matrix are not fully pinned. | `NOT_ADMITTED_UNFROZEN` |

BAI/CSI parameter selection, generic binning/packing, query control and external indexes are excluded.
