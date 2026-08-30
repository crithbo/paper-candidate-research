# ARROW-IPC-STREAM-JOINT-DICTIONARY-EVOLUTION — Stage 0 Revision 1

- Assignment: `STAGE0-P1-20260811-ARROW-IPC-STREAM-JOINT-DICTIONARY-EVOLUTION-REVISION1-V8.7`
- Mode: `PRIMARY / SCIENTIFIC_REVISION_1_OF_1`
- Atomic gate: `NATIVE_INPUT_ACTION_COMPLETE__NONPRODUCT_ARROW_DICTIONARY_LATTICE_CERTIFICATE`
- Recommendation: `RECOMMEND_STAGE0_PASS_FOR_CLOSING_REVIEW`
- Conditional quality tier: `TIER_B_Q2_VIABLE`
- Confidence: `0.76`
- Evidence ceiling: `STATIC_ALGORITHM_AND_FORMAT_CERTIFICATE__NO_IMPLEMENTATION__NO_NATURAL_RESULT`
- Stage A/B authorization: `false / false`

## Single atomic proposition, falsifier, and result

**Proposition.** On the complete dominance-reduced family of legal caller-defined flat-dictionary `RecordBatch` inputs, the native Arrow transition kernel has an exact reset-prefix decomposition: once the native replacement branch is eligible and selected, its emitted dictionary/cost is independent of the predecessor dictionary, whereas no-event and delta retain equality/prefix dependence. A reset-prefix factorized min-plus dynamic program (`RP-FDP`) can therefore represent the exact product-state value function as a dominance-pruned lower envelope of separable components, return the same optimum or finite Pareto frontier as the explicit Cartesian-product oracle, and use output-sensitive state/time bounded by the surviving separable rank rather than materializing every dictionary tuple.

**Mechanical falsifier.** The proposition fails if any admitted native plan is missing from the finite catalog or native mapping; if the separable envelope differs from exhaustive product enumeration on the frozen small instance; if replacement retains an unmodeled dependence on the old dictionary; if the claimed envelope rank is only the explicit tuple count under another name; or if no natural window exhibits a strict state/time residual after complete construction and full-cost charging. Failure uses `BELOW_Q2_STOP__CURRENT_INPUT_CONTROL_OR_GENERIC_PRODUCT_SEGMENTATION`.

**Revision result.** The proposition is now statically defined, same-object, finite, and falsifiable. It states an exact algorithm and an instance-sensitive complexity guarantee rather than a better objective value than the oracle. It also supplies a legal comparator-separating construction and a reset-equivalence certificate. Implementation, proof completion, and natural benefit remain Stage A work and are not claimed here.

## 1. Frozen same object

Input is a fixed ordered sequence of `N` logical rows and a fixed Arrow schema with `F >= 2` flat, non-nested dictionary fields. Each field has a fixed dictionary index type and capacity, ordered flag, metadata, null positions, and logical values. Output is one standard Arrow IPC **stream** accepted by the pinned stock C++ `RecordBatchStreamReader`.

Equality is:

1. reader acceptance;
2. byte-identical logical schema metadata and field/index types;
3. equal total row count and row order after concatenating returned batches;
4. equal decoded logical values and null positions.

Record-batch cuts, physical dictionary arrays, dictionary order, matching indices, and legal no-event/delta/replacement histories are decision variables. Primary isolation fixes Arrow commit `42694575d0219f6a3a78b1f344bb071a60df6a4e`, metadata V5, 8-byte alignment, non-legacy framing, no body compression, fixed threading, absent or identical record-batch custom metadata, and one matched `emit_dictionary_deltas` setting per arm. Schema/index changes, nested dictionaries, shared dictionary-id changes, reader/codec/transport changes, and external postprocessing are excluded.

## 2. Complete finite native action catalog

For field `f`, let `U_f` be the finite set of non-null logical values occurring in the frozen rows; when native validation permits a null dictionary value and the logical sequence contains null, add one distinguished physical null token. Let `C_f` be the fixed index-type capacity. Candidate cut boundaries are every row boundary `0..N`; a plan chooses an increasing subsequence beginning at `0` and ending at `N`.

For a batch interval `[i,j)`, let `R_f(i,j) subseteq U_f` be its required non-null values. A dominance-reduced physical dictionary action is an injective ordered sequence `D` over the extended finite alphabet, with `|D| <= C_f` and `R_f(i,j) subseteq set(D)`. Non-null row indices are fixed by the inverse map. For a logical null, the finite catalog includes every natively legal realization that still decodes null (index validity null, and a reference to the distinguished null dictionary entry when the pinned validator accepts it). Thus logical null positions are frozen without falsely assuming a unique physical null encoding.

This catalog is complete for nondominated plans under the frozen nonnegative ledger:

- an element outside `U_f` is never decoded and can be deleted from every affected suffix dictionary without hurting coverage or prefix legality;
- a duplicate, including a repeated null entry, can be co-deleted and indices remapped without changing decoded values;
- deletion cannot increase body bytes, 8-byte-padded length, construction work, or live dictionary memory.

Permutations of distinct values remain in the catalog because they can affect prefix-delta legality. Thus the reduction does not silently canonicalize away a useful Arrow history.

For consecutive dictionaries `P,Q`, the pinned writer action is deterministic:

- `NO_EVENT` when `P=Q` by value;
- with deltas disabled, `REPLACE(Q)` for every change;
- with deltas enabled, `DELTA(P,Q)` exactly when the flat `Q` is longer and begins with all of `P`; otherwise `REPLACE(Q)`.

The first dictionary is emitted before its first dependent batch. Every plan maps directly to a schema-equal sequence of caller-built `DictionaryArray` record batches and public `WriteRecordBatch` calls. Both delta-policy arms use the same catalog and are evaluated separately and in the overall union; the candidate receives no hidden action.

## 3. Same-information comparators

1. **Current native/local union.** `WriteTable(max_chunksize)` over a finite grid and direct caller-defined record batches produced by fixed first-prefix, uniform, and stable-cut builders; both delta settings and all matched writer options. Arrow's equality/prefix/replacement policy remains unchanged.
2. **Independent-fields then optimal cut-pool merge.** Each field computes its complete local optimum/frontier. The baseline pools cuts appearing on those local frontiers, chooses the optimal legal shared subset under the global batch budget, and re-optimizes every field dictionary on that selected cut set. It is stronger than a greedy union but cannot introduce a compromise cut absent from every local frontier.
3. **Explicit Cartesian-product oracle.** At boundary `i`, materialize every tuple `(D_1,...,D_F)` and every finite cost label; enumerate every next cut and legal local transition. This is action-complete and exact, but is an oracle/ceiling rather than a scalable deployment baseline.
4. **Generic ILP/shortest path.** An equivalent explicit formulation over the same catalog, information, constraints, and exact static costs. It may verify small instances but is not the candidate method.

The candidate may equal comparator 3's objective, never claim to beat it. Its residual is an exact implicit representation and output-sensitive computational guarantee.

## 4. Arrow reset-prefix relation

For a fixed interval and field, define the exact local transition kernel in the min-plus semiring:

`K_f(P,Q) = min(K_replace_f(P,Q), K_continue_f(P,Q))`,

where `K_replace_f(P,Q)` is finite only on the native replacement domain (`P != Q` when deltas are disabled; neither equality nor a proper-prefix delta case when deltas are enabled). On that eligible domain its emitted dictionary and cost depend only on `Q`, not on which eligible `P` reached it. `K_continue_f(P,Q)` is finite only for equality/no-event or a legal proper-prefix delta in the matched arm. Its cost includes exact static bytes/padding and the field-local construction/remapping/resource coordinates. This mask matters: RP-FDP does not invent a replacement option when the current writer would force no-event or delta.

The relation has two checkable properties:

- **Reset congruence.** If the chosen transition is replacement to the same `Q`, two predecessor dictionaries are future-equivalent after the event. Keeping only the lower accumulated label is exact.
- **Prefix sufficiency.** If the chosen transition is no-event/delta, future legality depends on the exact current ordered dictionary and fixed index type, not on the earlier message history. Event budget and Pareto resources are carried explicitly.

These are native reader/writer properties, not names attached to a generic state tuple.

## 5. RP-FDP and state sufficiency

Let the explicit product value at a cut be `V_i(Q_1,...,Q_F)`. RP-FDP stores it implicitly as a min-plus separable lower envelope:

`V_i(Q_1,...,Q_F) = min_r [ alpha_{i,r} + sum_f v_{i,r,f}(Q_f) ]`.

For a component `r`, a next cut `j`, and each field independently, compute

`v'_{f}(Q) = min_P [v_{i,r,f}(P) + K_f^{i,j}(P,Q)]`.

The shared record-batch/message term for `[i,j)` is added to `alpha`. Components from every predecessor cut are unioned; a component is removed only when it is pointwise no better than another component for every local state and every carried resource label. Backpointers recover a native plan.

Exactness follows from distributivity of min over the additive field kernels. The state is sufficient because the reader memo at a cut contains only current dictionaries and the fixed schema; the carried event/resource coordinates contain every nonlocal constraint. Replacement contributes a predecessor-independent value on its native eligibility mask, while equality/delta is a sparse ordered-prefix term. No product tuple is required unless the separable envelope itself reaches product rank.

For `d_f` admitted local states per boundary, `R` maximum nondominated separable-envelope size, `L` finite Pareto/resource-label width, and all `O(N^2)` candidate intervals, a direct implementation has:

- time `O(N^2 * L^2 * R * sum_f d_f^2)` for a finite Pareto/resource-label semiring, or the same bound without `L^2` for one fixed scalarization;
- memory `O(N * L * R * sum_f d_f)` plus backpointers.

The explicit oracle materializes `Theta(L * product_f d_f)` values per boundary and has product-sized transitions. RP-FDP is exact for all instances; its guarantee is output-sensitive. Pareto coordinates are combined by finite dominance convolution (hence the conservative `L^2` factor), while max-type peak-memory coordinates use `max` rather than an additive fiction. Worst case `R` may reach the product size, which is an explicit failure/no-gain boundary, not hidden. The nonempty residual regime is `R * sum_f d_f = o(product_f d_f)`, especially when replacement resets collapse many predecessor histories.

This is not a claim of a general worst-case polynomial algorithm and not an approximation claim. A later bounded-rank approximation would be a different contribution and is not smuggled into this revision.

## 6. Two-part minimal certificate

### 6.1 Independent planning versus joint cut

Use two flat UTF-8 dictionary fields and four nonempty ordered row regions with candidate internal cuts `b1,b2,b3`; require exactly one internal cut for the certificate. In the delta-disabled matched arm, minimal dictionaries on both batches make the cut-dependent dictionary payload equal to the payload of values whose occurrence interval crosses that cut, plus a cut-invariant metadata/base term.

Choose values with padded payload weights in units `u=8` bytes:

- field `A`: one value of weight `2u` occurs in regions 2–3; one value of weight `5u` occurs in regions 3–4;
- field `B`: one value of weight `5u` occurs in regions 1–2; one value of weight `2u` occurs in regions 2–3;
- each region also has any needed region-local value so both batch dictionaries are nonempty.

All strings are ordinary UTF-8 payloads whose lengths are chosen as 8-byte multiples, so padding cannot reverse the inequalities. Fixed schema/index buffers and the two record-batch/dictionary metadata bases are identical across the three one-cut plans and cancel. The exact cut-dependent excess is:

| cut | `A` | `B` | joint |
|---|---:|---:|---:|
| `b1` | `0` | `5u` | `5u` |
| `b2` | `2u` | `2u` | `4u` |
| `b3` | `5u` | `0` | `5u` |

The independent field frontiers choose `b1` and `b3`. Their optimal cut-pool merge cannot introduce `b2` and costs at least `5u`; the complete joint oracle and RP-FDP choose `b2` at `4u`. Every plan is a caller-defined stock-writer stream and decodes to the same rows. The certificate establishes joint optimization, not a natural gain.

The delta-enabled arm is still enumerated in the strongest union. If it dominates this certificate under the frozen constraints, the certificate is reported as an arm-specific action divergence only; Stage A must not turn it into an overall performance claim.

### 6.2 Product-state reset pruning

Immediately before a legal replacement for field `B`, let two equal-cost product predecessors differ only in the old ordered dictionary: `P=[x,z]` versus `P'=[z,x]`, both covering the same preceding batch. Both replace to `Q=[y]`. Native replacement serialization and all future legality depend on `Q`, not the order in `P/P'`; RP-FDP's reset congruence merges them. The explicit Cartesian oracle retains both tuples. The stock reader accepts both histories and returns identical logical values after indices are remapped.

This is a strict, checkable product-state merge. It does not claim that one merge alone yields a useful natural speedup.

## 7. Full-cost and claim ceiling

The formal DP optimizes or Pareto-tracks exact static coordinates only:

- dictionary and index construction/remapping operations;
- dictionary, record-batch, metadata, body, and 8-byte padding bytes;
- message/event/batch counts and time-to-first-batch byte proxy;
- temporary and peak live dictionary/index bytes;
- planner state, component, transition, and backpointer counts;
- equality-digest and fallback work as charged fixed procedures.

Stage A must measure candidate and comparator planning time/RSS, writer and reader CPU/wall/RSS, time to first complete batch, total decode latency, final stream bytes, and fallback. Measured runtime is not assumed additive and is not covered by the exact static theorem.

Current claim ceiling: existence of a coherent exact native-action algorithm, its stated instance-sensitive bound, and the two static certificates. There is no claim of completed proof, implementation correctness, natural rank compression, byte/latency improvement, or overall Pareto gain.

## 8. Finite Stage A preclaim route and killer

Before any claim-bearing natural run:

1. freeze the Arrow pin/options/compiler and two official NYC TLC monthly hashes/schema mapping;
2. implement a tiny complete catalog enumerator and explicit product oracle for the four-region certificate;
3. independently implement RP-FDP and require identical optimum/frontier and a reconstructable native plan for both delta arms;
4. serialize every selected plan using unmodified `WriteRecordBatch`; require stock-reader acceptance and schema/ordered value/null digest equality;
5. record exact product tuple count, envelope `R`, planner time/RSS, construction/remapping, bytes/padding, writer/reader costs, and fallback;
6. then sample finite natural windows from both months before any scale-up.

Kill the topic if the catalog misses a native nondominated action, either certificate is invalid, RP-FDP differs from the product oracle, the reset relation depends on hidden prior state, the natural windows have no strict envelope-state residual (`R * sum d_f >= product d_f` throughout), or the full-cost candidate has no non-dominated point against the complete native/independent controls. This is CPU/public and finite; no missing result is treated as current negative evidence.

## 9. Collision, quality, and revision disposition

Current Arrow directly absorbs action novelty and remains the deployment baseline. Explicit product DP/ILP absorbs the old vector-DP description. The checked source/paper set contains no direct same-object RP-FDP constructor or guarantee; status remains `SEARCH_BOUNDED_OPEN`, not an absence proof.

If its static theorem and natural residual later survive, the contribution is a focused N2 data-format/algorithm paper with credible `TIER_B_Q2_VIABLE` shape. Q1 parity remains implausible without broader theory and multi-format impact. The unique scientific revision is consumed by this artifact; no second revision is requested. Closing confirmation must either accept the gate or apply the frozen sentinel.
