# Fair-control matrix

| Dimension | Candidate under frozen implementation | Same-information simple selector | Fairness disposition |
|---|---|---|---|
| Program/object | Frozen Altis Pathfinder and BFS structures | Identical | same object |
| Pre-phase information | Region tuple and current coefficient tuple | Identical | same information |
| Action set | B0–B3 | B0–B3 | identical |
| Action cost equations | Inherited `action_cost` | Identical independent evaluation | identical |
| Decision | Lexical-tie-broken per-region `argmin` | Lexical-tie-broken per-region `argmin` | identical action rule |
| Extraction/decision cost | `total_bytes × planner_overhead_fraction` | Same charge | conservative parity |
| Future information | None beyond coefficient tuple already supplied | None | deployable within model |
| Fallback | Best single policy when mixing is not beneficial | Same comparison available | no candidate advantage |
| Page/full-cost unknowns | Unidentified | Shared unidentified completion | cannot create differential residual |
| Outcome metric | Candidate-only residual versus selector | Reference denominator | strict `> 1e-15` required |

The selector is implemented independently in `REVISION_PROBE.py`; the validator rejects any row where selected plans or full costs differ. A lower-cost lookup implementation would only strengthen absorption, so equal planner charge is the candidate-favorable control.

