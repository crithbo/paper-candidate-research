# Frozen Contract and Fair-Control Matrix

| Dimension | Original trace order | Stable legal order | Greedy earliest-ready legal order | Candidate dependency-frontier order |
|---|---|---|---|---|
| Input WCNF | Frozen, identical | Same hash | Same hash | Same hash |
| Output WCNF | Frozen, identical | Same file/hash | Same file/hash | Same file/hash |
| Objective | Frozen | Same; VeriPB/CakePB equioptimal | Same; VeriPB/CakePB equioptimal | Same; VeriPB/CakePB equioptimal |
| Checked deletion set | Frozen | Identical commands | Identical commands | Identical commands |
| Deletion rule/emitter | Existing MaxPre only | No new rule/emitter | No new rule/emitter | No new rule/emitter |
| Semantics | Sequential checked deletion | Sequential checked deletion | Sequential checked deletion | Sequential checked deletion; batch is an ordered partition, not parallel semantics |
| Information | Original proof | Target IDs, trace IDs, witness support | Same | Same |
| Determinism | Frozen trace order | Fixed target-ID/trace-ID tie break | Fixed shortest-command earliest-ready choice | Fixed dependency-frontier score and trace-ID tie break |
| Legality | Forced checked VeriPB + CakePB | Same; invalid proposal falls back | Same; invalid proposal falls back | Same; invalid proposal falls back |
| Full cost | Preprocess + both checkers + certificate/I/O | Adds extraction, graph, ordering, own legality/fallback | Same accounting | Same accounting |
| Replays | Two | Two | Two | Two |

## Dependency frontier

Vertices are existing checked deletion commands in a maximal contiguous checked-deletion block. The graph preserves original order when adjacent commands share explicit witness variables or deleted IDs. Only adjacent commands exposed at this graph frontier are proposed for swapping. Every proposed proof is still a fully sequential proof and must pass forced checked deletion in VeriPB and independent CakePB equioptimal verification.

## Legal-choice gate

The preregistered rate is the fraction of 30 complete natural traces having at least one non-original dependency-frontier order accepted by both checkers. Result: `24/30 = 0.80`, above the `0.20` killer. The six failures were complete FRB traces with no contiguous graph-frontier pair, not split examples or resource failures.

## Full-cost Pareto gate

Candidate residual must exist at both p50 and p90 against every baseline in both full time and certificate bytes, with at least one strict improvement. The candidate failed this requirement against all three baselines. Because original trace order alone strictly absorbs the candidate at both percentiles, the STOP conclusion does not depend on the higher fallback rates of stable or greedy scheduling.
