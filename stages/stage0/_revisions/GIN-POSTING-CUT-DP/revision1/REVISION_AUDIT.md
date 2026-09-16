# GIN-POSTING-CUT-DP Revision 1 — Source, Action and Reproducibility Audit

## 1. Audit scope

- cutoff：`2026-08-10`
- exact source pin：PostgreSQL `REL_18_STABLE` commit `a4c41bbcc7b0aed721950303338d75b09eddc295`
- role：independent Stage 0 PRIMARY revision audit
- network/source status：`BOUNDED_CURRENT_SOURCE_CHECK_COMPLETED__SEARCH_BOUNDED_OPEN`
- experiments/benchmarks：`NONE`
- code or database mutation：`NONE`

本 audit 只核验决定原子 gate 的 current source semantics、动作边界、比较器完整性和静态可复现性。它不把搜索未命中写成“证明不存在”。

## 2. Input integrity

### 2.1 Discovery package

| File | SHA-256 | Result |
|---|---|---|
| `GIN-POSTING-CUT-DP_TOPIC_BRIEF.md` | `9715270E28906B28E976A74C990D127A10AA787133697960E9C5BFD94C2D83E6` | PASS |
| `SOURCE_COLLISION_MATRIX.md` | `C2A2BA42CCAD31C77501406598EFFDE54C8B336545AA002926AE811ED5BBB41B` | PASS |
| `DISCOVERY_LOG.md` | `2402C3B37ACA74E546AF3CD455B2973ABE10F53F17AB37A702224BD661A929AE` | PASS |
| `handoff.yaml` | `A1BBFE63F661DA9ED45F468B05EC853AE1F5E8CC55DDD2395A7EAE95EE726B33` | PASS |
| manifest self | `7CF1DF10736DCF06D63E6CD0FDEE37666452ADC56969F3E77CC01EED1A9FA698` | PASS, 4/4 |

### 2.2 PRIMARY package

| File | SHA-256 | Result |
|---|---|---|
| `STAGE0_REPORT.md` | `23BD55D4C1ED8E767559F8D3E8B5805FFC60D83F21930259B0E6617277255F6E` | PASS |
| `Q1_COMPARATOR_MATRIX.md` | `EFC26297B5C889958D13879DA5D15ABC69AD9CFF4EC604D77A68171AE9D78AE5` | PASS |
| `SOURCE_AUDIT.md` | `4A2EF1E5854A369C1FBA59CBDAF5DAF8C8DFCA0786258D2734D2615E6AE3A5E2` | PASS |
| `handoff.yaml` | `DB3A42F6D270DA34B0D7B1CD9B554CE44EB212F534B7AEACB27A5CA07E490F8F` | PASS |
| manifest self | `6C05232FE21B5B13460008AA616BBC84D81047D446E1CCF5F621DECCA3FC4E13` | PASS, 4/4 |

### 2.3 Confirmation package

| File | SHA-256 | Result |
|---|---|---|
| `CONFIRMATION_REVIEW.md` | `9F9221F11F4F60FDC24A4AE359627A095014CA3FBA4B706BA22901F79BC7223F` | PASS |
| `handoff.yaml` | `D9AAB893C6CE0F50BF1326EF5731189E8F32A87152FD633895EC0E5830175789` | PASS |
| manifest self | `B77FF85C66E97B5C9A791E8668856EF5CD066ACF4F4E7B339C4A9FAA86F1230C` | PASS, 2/2 |

## 3. Current-upstream pin and semantic facts

### 3.1 Pin correction

PRIMARY 的旧观察点 `545e2a9d74c3ccca3189e56a515a5793b782eb9b` 不再作为 current head。confirmation 对官方仓库只读核验得到 `a4c41bbcc7b0aed721950303338d75b09eddc295`，并确认两个观察点间决定 gate 的 `README`、`gindatapage.c`、`ginget.c`、`ginfast.c`、`ginutil.c` 与 `gin_private.h` 不变；`gininsert.c` 的变化只涉及 parallel worker tuple-count 初始化/注释。revision 全部 source claims 绑定新 pin。

### 3.2 Authoritative surfaces and verified claims

1. [PostgreSQL 18 GIN documentation](https://www.postgresql.org/docs/18/gin.html)：官方对象为 key B-tree，entry 可含 posting list 或指向 posting tree；`fastupdate` 使用 pending list，查询与维护成本必须计入。
2. [PostgreSQL 18 CREATE INDEX](https://www.postgresql.org/docs/18/sql-createindex.html)：current build/concurrent/parallel 配置是公平部署 baseline；它们不是 candidate action 的证据。
3. [Official source tree at the pinned commit](https://github.com/postgres/postgres/tree/a4c41bbcc7b0aed721950303338d75b09eddc295/src/backend/access/gin)：exact provenance anchor。
4. [PostgreSQL current source reference for `gindatapage.c`](https://doxygen.postgresql.org/gindatapage_8c.html)：
   - `GinPostingListSegmentMaxSize=384`、target 256、min heuristic 128；
   - `dataLocateItem` uses `low/high/mid` binary search over internal `PostingItem.key` right bounds；last item is treated as right infinity after `dataIsMoveRight` chooses the page；
   - `GinDataLeafPageGetItems` advances whole compressed segments while `next->first <= advancePast`, then decodes from the selected segment through page end；
   - `dataIsMoveRight` compares the search TID to page right bound；
   - native build/insertion paths repack compressed segments and split pages, but no source surface observed here takes a complete logical query trace and runs the frozen complete-tree DP.
5. [PostgreSQL current source reference for `ginget.c`](https://doxygen.postgresql.org/ginget_8c.html)：`scanGetItem` advances scan keys in lock-step; after the first exact key yields a candidate TID, it sets `advancePast` to the previous offset before checking later keys. `entryGetItem` returns the first item strictly greater than that threshold, and `entryLoadMoreItems` steps right only when `advancePast==curItem`, otherwise it descends from the root. This directly supports the two-key witness event rather than assuming a synthetic physical call trace.

The Doxygen page is used only to corroborate line-level current semantics. Exact revision provenance remains the pinned official commit plus confirmation's hash/diff record; it is not silently substituted by a moving `master` page.

### 3.3 Transport limitation

A direct `raw.githubusercontent.com` fetch attempted during this review failed locally with Windows Schannel `SEC_E_NO_CREDENTIALS`. This is recorded as transport-only. It does not support any absence claim, does not lower the topic, and does not create a user blocker because the decisive exact-pin semantics and diff were already available in the accepted confirmation package and authoritative current source reference.

## 4. Current native action catalog

| Surface | Current action | Candidate subtraction |
|---|---|---|
| Inline posting list / posting-tree conversion | chooses representation based on entry size/history | absorbs representation novelty |
| Compressed leaf segments | native codec, max/target/min policies, append/repack | absorbs codec and ordinary local segmentation claims |
| Bulk/parallel build | serial/parallel external sort and native page construction | deployment baseline; left/full construction has no trace-objective guarantee |
| Incremental insertion | balanced split or append-oriented behavior, native parent propagation | deployment baseline; may incidentally create non-full layouts |
| `fastupdate` + pending list | defers entry updates and cleans pending pages | full-cost baseline, not per-key complete-tree solver |
| VACUUM/cleanup/REINDEX | maintenance and rebuild paths | full-cost baseline and semantic constraint |
| reloptions/resources | finite legal config/action union | trace-tuned fair union, not arbitrary complete hierarchy action |
| Reader | root descent, right-bound binary search, right link, segment skip/decode | exact cost semantics candidate must preserve |

Current source therefore directly subtracts “new searchable segment”, “new split rule”, “new posting-tree representation” and “configuration chooser”. Residual is narrower: an offline exact algorithm over standard pages that treats ordered internal grouping as an optimization action and prices it using the same logical events and reader semantics.

## 5. Action completeness audit

### 5.1 Catalog closure

- segment action：finite native encoder arcs over consecutive TIDs;
- leaf action：finite concatenations within native payload capacity;
- internal action：finite contiguous child groups with capacity and fixed equal-depth predicate;
- right bound：derived from the last child, never optimized independently;
- sibling links/block ids：canonical post-construction metadata;
- height：finite outer domain `0..H`;
- reader action：deterministic automaton, not a new runtime controller.

Result：`COMPLETE_FOR_DECLARED_NATIVE_DECODABLE_REBUILD_CLASS`。

### 5.2 Non-product residual

The decisive witness keeps segments, leaves, page count, bytes and height fixed and changes only parent grouping. Because pinned `dataLocateItem` comparison count depends on the target child's position inside an internal page, the cost is not determined by leaf-local partition plus a fixed full-pack parent pass. This is a complete-tree action divergence, not a renamed scalar frequency.

### 5.3 Guarantee audit

- algorithm：acyclic shortest path over finite open-frontier + reader signature states;
- guarantee：exact global optimum over declared `T(H)` and frozen weighted vector proxy;
- no pruning/ratio claim；
- no wall-clock, natural-gain or all-native-history optimality claim；
- complexity explicitly depends on `n,m,H,C_0,K_l,phi,F` and may be exponential/pseudopolynomial.

Result：`FINITE_AUDITABLE_GUARANTEE_CLOSED`。

## 6. Comparator and collision audit

| Comparator/collision | Object/guarantee relation | Verdict |
|---|---|---|
| Current PG18 build/dynamic union | same format/function; finite heuristic outcomes; no complete-action exact guarantee | strongest deployment union |
| Trace-tuned legal config/path union | same trace and full-cost; selects among current outcomes | mandatory baseline, not fatal |
| Local partition DP + native parents | same trace; exact local leaf action only | strongest action subtractor; witness exceeds it |
| Generic PEF/sorted integer partition | related interval DP, normally different codec/object | methodological subtractor |
| Exhaustive complete-tree oracle | same action/guarantee but nondeployable exponential ceiling | oracle only, not fatal union |
| Same-object prior complete GIN hierarchy solver | not found in bounded search | `SEARCH_BOUNDED_OPEN`; a future hit can be direct fatal |

No `DIRECT_FATAL` is registered. This is not a proof of absence; closing review and Stage A must preserve latest-collision monitoring.

## 7. Reproducibility and command ledger

Read-only operations used:

1. `Get-Content -Raw -Encoding UTF8` for current control, role, skill and frozen candidate packages.
2. `Get-FileHash -Algorithm SHA256 -LiteralPath ...` for Discovery/PRIMARY/confirmation integrity.
3. `rg -n` over the frozen candidate directories for source-symbol cross-checks.
4. official-source web search/open for current PostgreSQL source reference and function bodies.
5. one failed `curl.exe` raw-source read; no file written and no scientific inference drawn.

Not executed：PostgreSQL build、database creation、index serialization、query、benchmark、solver、GPU、download/install、existing project mutation。

## 8. Evidence/readiness separation

- `STRUCTURAL_PAPER_POTENTIAL`：PASS candidate for `TIER_B_Q2_VIABLE` because the exact object, complete action, non-product witness, finite exact guarantee, current source boundary and falsifiable comparator route are all statically coherent.
- `CURRENT_EVIDENCE_READINESS`：low-to-medium. No implementation, native page output, oracle comparison, natural trace, performance or full-cost result exists.
- `CLAIM_CEILING`：static algorithm proposition and action non-vacuity only.
- `RESOURCE_STATUS`：no user action presently required; lack of results is ordinary Stage A readiness, not a blocker and not a STOP reason.

## 9. Audit disposition

`RECOMMEND_STAGE0_PASS_FOR_CLOSING_REVIEW`。Closing sentry should attack the path—tree bijection, reader-event frontier sufficiency, symbolic witness arithmetic and comparator coverage. It must not reinterpret missing implementation or natural benefit as a Stage 0 failure.
