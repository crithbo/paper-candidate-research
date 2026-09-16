# Current native family and algorithm audit

## Provenance freeze

- Discovery manifest: `31EB791E2F8560CEC270B961124808706150A5151235E60409CD274C135C136D`, verified `8/8`.
- PRIMARY manifest: `6DDDBE932E186C6B3EF23A7D3D533B55A7B9AEEA502C03899BBDB57C4E52C60E`, verified `4/4`.
- Confirmation manifest: `2AACA5D373026AD73D38CECD93A3711142FFF0788D1D0EEC3B8E04DD90750E42`, verified `2/2`.
- Confirmation report: `1CBE9A8E31F2843EE3E44EF77365B73E7E3053EB5CB9B11F8C76CCE3061E8874`.
- Confirmation handoff: `B69D6F785EDF12CC4F642A1F42359BC5AEC60BD54ED28860EF4B0DF9F8FE5B51`.
- Rules: `AGENTS.md` `66231F71EF6AB250A1AD9FF576D5840978F09EFC03BF5D2F0527D47F4D82B063`; `ROLE_STAGE0_REVIEW.md` `741EC3544797FF8A5BF337E1E3448B5F683823E5229F818F162834400581626E`.

No prior score or PASS was inherited. The confirmation's current-source correction is binding.

## Current first-party surface retained

Pinned repository commit: `42694575d0219f6a3a78b1f344bb071a60df6a4e`.

| Surface | Frozen fact | Disposition |
|---|---|---|
| `RecordBatchWriter::WriteRecordBatch` | Caller supplies arbitrary schema-equal record batches. | Complete cut/input action belongs to baseline. |
| `CollectDictionaries` | Physical dictionary arrays are collected from caller batches. | Dictionary contents/order are not a new writer action. |
| `WriteDictionaries` | Equality gives no event; compatible flat prefix gives delta when enabled; otherwise stream replacement. | Defines the candidate's local transition kernel. |
| `WriteTable(max_chunksize)` | Convenience chunking path only. | Grid is included but never treated as action-complete. |
| `IpcWriteOptions` | Includes alignment, legacy, metadata, codec, savings threshold, threads, delta flag; stream ignores dictionary unification. | Matched controls; option tuning is not N2. |
| `RecordBatchStreamReader` / `DictionaryMemo` | Reader installs/replaces/appends dictionaries and returns record batches. | Stock acceptance and decoded equality oracle. |

Pinned blobs retained from the accepted audits: `writer.cc` `263689a648d08b6a37ab5bde2e717e2f2a9a5e9f`; `writer.h` `aefb59f3136e4c98419799eb31faf9700fc6efd2`; `dictionary.cc` `bb5539f2b4bb6137cbd4cbfda43db6204dff234d`; `reader.cc` `47ea70e43faca6218de4094c9d3ed75d916b48d0`; `options.h` `254a4693866e9be5c2b4b0a8d77392ad70c235b2`.

## Action completeness and reductions

The finite catalog includes every row cut and every injective ordered dictionary over values in the frozen sequence that covers the corresponding batch and fits the fixed index type. If logical nulls occur, it also includes the distinguished null dictionary entry and every pinned-validator-legal null index realization. It retains permutations and optional future values. It removes only values never decoded and duplicates, with a same-history co-deletion/reindexing dominance argument. The exact product oracle uses the identical catalog.

The candidate does not expose a new writer action. It computes a plan over already legal inputs. Native mapping is constructive: each chosen dictionary plus inverse indices forms a legal `DictionaryArray`; batches are passed directly to `WriteRecordBatch`; writer-local event selection is not patched.

## Nonproduct audit

The claimed residual is not objective superiority over the exact oracle. It is the exact separable-envelope identity

`V_i(Q) = min_r alpha_r + sum_f v_{r,f}(Q_f)`

and the native transition decomposition

`K_f(P,Q) = min(K_masked_replace_f(P,Q), K_equal_or_prefix_f(P,Q))`.

The replacement term is finite only where the pinned writer actually selects replacement. Its value then depends only on the new dictionary `Q`; the eligibility mask still depends on equality/prefix. This prevents the algorithm from inventing a replacement alternative in a forced no-event/delta case.

This provides:

- a checkable reset equivalence for predecessor dictionaries erased by replacement;
- exact local prefix dependence for no-event/delta;
- an output-sensitive exact algorithm with state proportional to nondominated separable rank `R`, not an explicitly materialized product; finite Pareto labels use dominance convolution rather than being assumed additive;
- a declared worst-case collapse to the product oracle when `R` becomes product-sized.

The method is therefore neither a threshold/grid nor the old vector-state DP. It uses general min-plus algebra, but the state/action kernel, reset relation, native mapping, and certificate are Arrow-specific. Whether this is practically useful is a later falsifiable result.

## Comparator mapping

| Comparator | Same input/action information | Same guarantee | Candidate residual |
|---|---:|---:|---|
| Native local writer plus input builders | yes | native legality only | global exact planner and bound |
| Independent fields + optimal pooled-cut merge | yes | exact within its generated cut pool | compromise cuts outside local frontiers |
| Explicit Cartesian product oracle | yes | exact global optimum/frontier | same optimum, implicit output-sensitive representation |
| Generic ILP/shortest path | yes | exact when completed | no solver relabeling; RP-FDP exposes reset-prefix factorization |

## Source and collision boundary

No new network retrieval was needed for the revision. It uses the independently pinned official Arrow sources and original-paper audit from PRIMARY/confirmation. The current conclusion remains `SEARCH_BOUNDED_OPEN__NO_DIRECT_FATAL_FOUND`. That status cannot support an absence claim and must be refreshed at later gates.

Checked paper roles remain:

- Liu et al., PVLDB 2023: format evaluation anchor, not this constructor.
- Raman and Swart, VLDB 2006: compression algorithm/system shape anchor.
- Hildebrandt et al., 2020 ArrowComp: different compression representation/mechanism.

## Reproducibility and full-cost boundary

The first claim-bearing observation is forbidden until the catalog, product oracle, RP-FDP, native serializer, stock reader, and logical digest agree on the small certificate. Runtime claims require end-to-end construction, planning, serialization, reader, memory, first-batch, total latency, verification, and fallback costs. Static exactness covers only the stated static/additive coordinates.

## Audit conclusion

`GATE_STATICALLY_CLOSED__PENDING_INDEPENDENT_CLOSING_REVIEW`. The revision supplies a finite proposition and failure path without claiming implementation, theorem completion, or benefit. The scientific revision is `1/1` and no pivot or second revision is available.
