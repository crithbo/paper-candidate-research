# FLATBUFFERS-PROFILED-WHOLE-BUFFER-LAYOUT Stage 0 Revision 1 Closing Review

## 1. Closing 裁决

- assignment：`STAGE0-C1-20260811-FLATBUFFERS-PROFILED-WHOLE-BUFFER-LAYOUT-REVISION1-CLOSING-V8.7`
- mode：`STAGE0 REVISION1 CLOSING CONFIRMATION`
- decision：`CONFIRM_STAGE0_PASS`
- quality tier：`TIER_B_Q2_VIABLE`
- novelty route：`N2`
- structural paper potential：`PASS__FORMAT_SPECIFIC_EXACT_REUSE_CLOSURE_DP_IF_SUCCESSFUL`
- current evidence readiness：`STATIC_CERTIFICATE_READY__IMPLEMENTATION_NATIVE_REPLAY_NATURAL_GAIN_NOT_OBSERVED`
- latest collision：`SEARCH_BOUNDED_OPEN`
- confidence：`0.86`
- evidence ceiling：`PINNED_SOURCE_PLUS_STATIC_ACTION_STATE_AND_BYTE_CERTIFICATE__NO_NATIVE_EXECUTION_OR_NATURAL_RESULT`
- revision budget：`1/1 CONSUMED`
- Stage A/B：`UNAUTHORIZED_AND_NOT_STARTED`

本 closing 确认 revision1 已把旧的“caller order 新动作”收缩为一个可审计的 known-action N2：在声明的标准 canonical C++ builder grammar 内，对 child/table 顺序、vtable/string reuse、alias、alignment、current position 与固定 vector semantics 做 FlatBuffers-specific suffix quotient，并返回 exact Pareto frontier。它没有声称新 native action、polynomial/FPT bound、实现、自然收益或 Q1 parity。

这足以形成条件性二区论文核。当前 native builder 已吸收所有单纯 order/config/hot-first 主张，但未在已核材料中提供同一 complete grammar、同一 profile objective、同一 exact reuse-aware quotient 与 certified frontier。generic ILP、完整 Cartesian-product oracle 或理论表达能力不能单独判死；它们是 ceiling/subtractor。若后续没有 strict quotient compression 或 held-out full-cost Pareto residual，候选会在 Stage A 的预登记 killer 上停止。

## 2. 独立性与复审范围披露

本会话没有参与该题 PRIMARY，也没有撰写 revision1。它曾执行 original-PRIMARY 的 cross-confirmation，并给出 `CONFIRM_REVISE_ONCE`；因此对旧缺口有先验上下文，不宣称全链盲审独立。本 closing 只裁 revision1 新提交的 grammar、state certificate、formal guarantee、56-byte witness、current-union boundary 与 finite killer，没有把旧 confirmation 的判断当作新证据。

## 3. 冻结输入与机械完整性

### 3.1 Assignment controls

assignment 开始时完整读取并复算：

| Item | Frozen SHA-256 | Start verification |
|---|---|---|
| `AGENTS.md` | `66231F71EF6AB250A1AD9FF576D5840978F09EFC03BF5D2F0527D47F4D82B063` | exact |
| `plan.md` | `38322375B100868C99B92D4330418DA1F61B765239D1E28E351AE465EBBD4764` | exact |
| `registry.yaml` | `DFC49ABCE63D2EE991AC0FF930C76B5031F7CC08482BDFBEC6B62A72D09AA9AC` | exact |
| `rules/ROLE_STAGE0_REVIEW.md` | `741EC3544797FF8A5BF337E1E3448B5F683823E5229F818F162834400581626E` | exact |

落盘前只读复核观察到主线已更新 `plan.md` 与 `registry.yaml`，当前哈希分别为 `DBED3A8ED5CD380A7FC4E69111C736A7066593216392BFAD1AD12388791456D6`、`B44A4449C40A06380526E15497A7D358EB6E7D90AB24D7A7DB07077A6E3FED36`。本 closing 保持 assignment-start 冻结合同，不重读漂移内容、不据此改变裁决，也未修改共享控制文件。

### 3.2 Revision1 package

| File | Recomputed SHA-256 | Manifest |
|---|---|---|
| `REVISION_REPORT.md` | `E52DDC20C73E07A03CF6FB091F9ED369973172EED0E44D3E940D31F2720A540C` | exact |
| `REVISION_AUDIT.md` | `783BC703A39FF31A0C2C1D2F8F173AE72412A436BE43FC46B32A83050392FE85` | exact |
| `CLAIM_MATRIX.md` | `1B24297EE3E7590DE5E6163456B4007879A6A3B46172552EC3D778C23FF0A7FA` | exact |
| `handoff.yaml` | `37F33001F45986D03E56DB116A8975BC39CB4B37B2C692C7F898554268C4405C` | exact |
| `HASH_MANIFEST.sha256` self | `42E862898EC82E9AF8E9503468D9DBFCC28B7332268C219979B6F68ABFEB63D3` | `4/4 PASS` |

没有运行 builder、verifier、候选程序、实验或 benchmark。机械 hash 与静态 byte parsing 不是 candidate observation。

## 4. Current-source reality check 与完整动作边界

核验对象为 peeled FlatBuffers source commit `7e163021e59cca4f8e1e35a7c828b5c6b7915953` 的 C++ builder；同时查看 current master 同一路径，不从传输或检索未命中推断 absence。

权威表面：

- [pinned `flatbuffer_builder.h`](https://github.com/google/flatbuffers/blob/7e163021e59cca4f8e1e35a7c828b5c6b7915953/include/flatbuffers/flatbuffer_builder.h)
- [current master `flatbuffer_builder.h`](https://github.com/google/flatbuffers/blob/master/include/flatbuffers/flatbuffer_builder.h)
- [official binary internals](https://flatbuffers.dev/internals/)

源码确认：construction backwards；`NotNested()` 要求 descendants 先于 table/vector/string parent；`Align`/`PreAlign` 取决于 current buffer size；`ReferTo` 取决于 retained offset 与 current 32-bit-region size；`EndTable` 对此前 raw vtable bytes 做 exact equality reuse；`CreateSharedString` 使用 builder-wide content pool；vectors 通过 reverse physical writes 保持 logical order；`ForceDefaults`、`DedupVtables`、finish/alignment 等为现有 arms。

### 4.1 Closing action audit

| Required surface | Closing finding | Status |
|---|---|---|
| child construction order | dependency-ready node order显式枚举；current caller已可表达 | `PASS_KNOWN_ACTION` |
| per-table field order | `MAKE_TABLE(i,pi)`原子化完整 permutation，slot/required/union固定 | `PASS_KNOWN_ACTION` |
| vtable dedup/history | state保留 future-matchable exact raw bytes与 retained offset | `PASS` |
| shared strings | state保留 future-queryable content/key与 exact offset；普通 string不被隐式合并 | `PASS` |
| alias identity | identity-labelled DAG、last-use live offset map与 explicit reuse固定 | `PASS` |
| alignment/current position | exact `p` 与 `mu`进入 transition；padding/finish由 pinned equations决定 | `PASS_WITH_SCOPE_CEILING` |
| vector/key order | logical/key order固定；只允许保持该顺序的 reverse write/helper | `PASS` |
| raw byte/dead-object escape | `PushBytes`/`PushFlatBuffer`、unchecked payload、dead nodes明确排除 | `VALID_CANONICAL_NORMALIZATION` |

“complete”只对声明的 canonical generated/direct standard builder family成立，不覆盖整个低层 API 的任意字节程序。`ForceVectorAlignment`、`ForceStringAlignment`、64-bit-region/`Offset64` 等 current surfaces若由冻结 schema/generated expansion触发，必须进入该 action expansion；若不是 frozen object 的必要语义，则必须在 Stage A preclaim catalog 中明确冻结或作为同信息有限 comparator arm，不能静默遗漏。该 scope ceiling与 revision 已声明的 fixed schema/exact expansion相容，不构成第二次 revision，也不允许把结果外推到任意 FlatBuffers builder program。

## 5. Reuse-closure frontier 与 hidden-history attack

revision state 为 `(D,p,mu,A,H_V,H_S,E,C)`。Closing 对 history/identity 的最强攻击如下。

| Potential hidden dependence | Retained certificate fact | Finding |
|---|---|---|
| future action legality | identity-specific completed ideal/ready frontier `D` | sufficient for declared DAG grammar |
| offset and padding | exact `p`, `mu`, live `Offset.o` map `A` | sufficient for `Align`/`PreAlign`/`ReferTo` |
| cross-subtree vtable reuse | exact raw vtable signature plus retained offset `H_V` | sufficient under pinned exact-byte `EndTable` search |
| builder-wide shared-string reuse | content/key plus retained offset `H_S` | sufficient for final-byte/share decision |
| aliases with several future parents | last-use-aware identity entries in `A` | prevents premature duplication/forgetting |
| vector and schema-key constraints | frozen action preconditions in `D` | no semantic reorder introduced |
| profile edges closing after both endpoints | unresolved identity endpoint/address records `E` | exact distance can be charged once |
| old prefix bytes | `p/mu` plus only future-queryable reuse records | safely forgettable after last future query |

The certificate is a suffix congruence, not a local-subtree similarity claim. Two prefixes may merge only when all listed exact components agree; vtable/string entries may be forgotten only after no remaining action can query them, aliases only after last unbuilt parent, and profile endpoints only after last incident event is charged. No identity-equivalence or arbitrary register/bank-style permutation is used.

The safe-forgetting predicate may conservatively retain more state; this hurts compression but not soundness. A future implementation must produce an auditable last-use/query certificate. Any pair of equal normalized states with different stock-legal suffix action, bytes, reuse decision or incremental declared cost is a decisive oracle mismatch.

One claim-ceiling clarification is necessary: actual allocator capacity, reallocation count, wall time and RSS are not proven Markov costs of this state. The exact static theorem applies to frozen byte distance, final bytes, deterministic action count, and only a temporary-byte proxy explicitly defined as a function of retained state/action. Actual construction/planning memory and reallocations remain full-cost measurements, not consequences of the static Pareto proof.

## 6. Path–plan bijection、guarantee 与 generic-collapse attack

### 6.1 Bijection

For the declared grammar, each action ID fixes node, field permutation, sharing/alias choice, config arm and public-call expansion. A path therefore expands to one canonical call plan. Conversely, scanning an admitted plan at closed boundaries recovers the unique action sequence. Independent actions that commute are different call plans, so their separate paths do not violate bijection even if they produce equal bytes; the tiny oracle may later deduplicate byte images only for validation/reporting.

### 6.2 Guarantee and complexity

The action graph is finite and acyclic because each accepted transition completes a frozen object/field action and no dead/repeated writes are allowed. Suffix congruence permits within-state Pareto dominance; Bellman/shortest-path induction gives exact unpruned frontier over the declared grammar.

The complexity statement is honest but weak: `O(R*g*poly(n))` time and `O(R*poly(n))` space, with exponential worst-case `R` that can equal the explicit Cartesian-product oracle. The package does not claim polynomial time, FPT, approximation ratio, or scalability.

### 6.3 Why this is not yet generic solver collapse

The nontrivial residual is not “enumerate topological orders”. It is the FlatBuffers-specific observable quotient containing exact current position/alignment, retained offset identities, raw-vtable equality history, shared-string history and unresolved profile endpoints, plus a last-query forgetting theorem. A generic ILP/CP solver must explicitly reconstruct the same native state to obtain the same guarantee; its mere theoretical expressiveness is not a deployable equal-quality baseline and cannot automatically absorb the N2.

The residual remains conditional. If implementation only enumerates caller order, calls an off-the-shelf solver without the certified state merge, or shows no strict prefix-to-normalized-state compression on natural instances, it collapses to generic scheduling/exhaustive search and fires `BELOW_Q2_STOP__NATIVE_ACTION_OR_GENERIC_LAYOUT_SCHEDULING_ABSORPTION`.

## 7. Independent 56-byte witness check

The two hex strings each contain 112 hex digits = 56 bytes. Static little-endian parsing gives:

- byte `0..3`: root uoffset `12`;
- byte `4..11`: root vtable `[8,14,4,8]`;
- root table starts at `12`, with field slots at `16` and `20`;
- the second-built Child has vtable at `26` and table at `32` with `[6,10,4]`;
- the first-built Child has vtable at `42` and table at `48` with `[6,8,4]`;
- both child soffsets point backward to their vtables, and both root uoffsets land on the stated child table starts.

Plan A encodes `(left,right)=(48,32)` and Plan B `(left,right)=(32,48)`. The scalar values remain attached to the same logical identities. Component sizes are `14 + 16 + 22 + 4 = 56`: first Child 14, second Child 16 including two alignment bytes, root segment 22 including its two alignment bytes, finish 4.

For the explicitly frozen proxy endpoint `addr(root-table-start)` and `addr(right-table-start)`, Plan A distance is `|12-32|=20`; Plan B is `|12-48|=36`; final bytes tie at 56. Thus Plan A strictly dominates Plan B only for the declared static pair.

Disposition：`WITNESS_STATIC_PASS`。它证明 stock-legal action/objective divergence，不证明 native code已生成这些 bytes、stock verifier已接受、cache misses或wall-clock改善、自然频率或 candidate 相对 complete oracle获胜。Stage A 首个 claim-bearing observation前必须用 unmodified public builder/verifier/accessors 重放。

## 8. Strongest union、collision 与公平性

公平 union 至少包括：

1. generated Object API `Pack` / generated default plan；
2. stable legal topological order；
3. same-profile hot-first ready-node heuristic；
4. every applicable frozen current config/alignment/sharing arm under the same object contract；
5. local subtree/order DP as a subtractor；
6. tiny complete native-composition oracle as correctness/optimality ceiling；
7. generic precedence ILP/CP as methodological subtractor with its own encoding/planning full cost；
8. `FB-RCFDP` with the certified reuse-closure merge.

Current FlatBuffers source directly absorbs any claim of new order, new alias action, vtable/string sharing, alignment knob, generated packing path or simple profile heuristic. The bounded first-party/paper search did not locate an equal-object profile-aware complete-grammar reuse-closure optimizer with the same exact guarantee; this is not an absence proof. Status remains `SEARCH_BOUNDED_OPEN`, and a later direct same-object/equal-guarantee source or paper remains fatal.

The objective profile must be frozen from training traces using logical identity endpoints, not offsets copied from a reference serialization. Test objects/traces must be held out. Oracle and candidate receive identical object, profile and action catalog; oracle cannot be presented as deployable baseline, while generic solver planning time/RSS cannot be omitted.

## 9. Natural Stage A route and full-cost killers

The frozen route is finite and same-object:

1. reproduce both 56-byte plans through stock public calls and pass unmodified verifier/accessor/identity digest;
2. enumerate small schemas/DAGs covering alias, equal/different vtables, shared strings, vectors, keyed vectors, defaults, applicable alignments and finish modes;
3. require `100%` candidate–oracle frontier/action-catalog agreement;
4. use source-builder-backed 20–50 official TFLite/LiteRT objects plus 20–50 from a second public FlatBuffers application; reject binary unpack/repack when it loses identity provenance;
5. freeze chronological/model-family training/held-out profile splits;
6. report planner and builder CPU/wall/RSS, state/frontier counts, backpointers, reallocations/temp bytes, final bytes, verifier, load/mmap, reader latency/throughput, cache/TLB, fallbacks and end-to-end amortization.

Pre-registered killers:

- any stock reader/verifier/accessor/identity mismatch;
- any omitted applicable canonical action or candidate–oracle frontier mismatch;
- any two merged states with a divergent legal suffix/cost;
- no strict canonical-state compression beyond complete enumeration on natural objects;
- frontier/planning explosion beyond the frozen finite budget;
- current native/profile heuristic union covers the same frontier;
- no held-out full-cost Pareto residual after all planning/profile costs.

These killers are Stage A research tests, not missing Stage 0 results. No resource blocker is presently established because the proposed first checks are finite CPU/static/native-replay work with public sources.

## 10. Q2 paper shape、claim ceiling 与 final rationale

### 10.1 Structural paper potential

If the certificate implements faithfully, compresses natural action space nontrivially, and yields held-out full-cost Pareto residual, the contribution is a credible narrow N2 systems/algorithm paper: exact optimization over a real zero-copy format's canonical builder language with reuse-sensitive state, formal suffix guarantee and native semantic validation. This is enough for `TIER_B_Q2_VIABLE`; breadth, theory and evidence are not yet Q1-level.

### 10.2 Current evidence readiness

Readiness is static only. No implementation, native byte reproduction, verifier execution, oracle equality, state compression, natural benefit, cache effect or runtime improvement has been observed. These facts lower evidence ceiling but do not invalidate conditional Stage 0 potential.

### 10.3 Permitted claim

- the canonical standard-builder grammar, equality contract and finite actions are statically defined;
- the proposed state contains the declared suffix-observable FlatBuffers histories;
- path–plan/suffix/forgetting lemmas define an exact frontier proposition over that grammar;
- the two hand-derived byte images are internally consistent and show 20-vs-36 static distance divergence.

### 10.4 Forbidden claim

- optimization over arbitrary low-level FlatBuffers byte programs or all language implementations;
- polynomial/FPT/approximation guarantee or practical scalability;
- exact allocator/RSS/runtime optimality from the current state;
- native witness verification, natural headroom, cache/runtime benefit or current-literature absence;
- Q1 parity or authorization of Stage A/B.

### 10.5 Why PASS, not HOLD or STOP

No static contradiction was found in the new certificate or 56-byte witness. The current-source action caveats are bounded claim-scope and preclaim catalog obligations, not evidence that the same-object proposition is undefined. No direct equal-guarantee absorber, formal impossibility, or unavoidable generic collapse was established. Conversely, revision1 now gives a nontrivial format-specific state/guarantee and a finite falsifier, so `INCONCLUSIVE_POLICY_HOLD` is not warranted.

Final decision：`CONFIRM_STAGE0_PASS / TIER_B_Q2_VIABLE`。Only mainline may register the state and route any later candidate assignment. This closing creates or authorizes neither Stage A nor Stage B.

## 11. Non-decisional repair vector

`STAGE0_REPAIR_VECTOR = NO_MATERIAL_REPAIR`

Closing only tightened the claim ceiling for per-object forced-alignment/64-bit surfaces and actual allocator/runtime costs; it did not alter the scientific decision or design a second revision.
