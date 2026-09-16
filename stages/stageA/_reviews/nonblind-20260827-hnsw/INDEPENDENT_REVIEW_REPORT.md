# HNSW 非盲 Stage A 兼容性最小 probe 独立审查

## 中文摘要

- 审查范围仅为 `F0/P1A7` 的 fidelity、probe 构造、固定 oracle/grid、full-cost、delete-replace witness 和 evidence ceiling。
- 结论：`REJECT_PRECLAIM_FIDELITY__BOUNDED_CONTRACT_LOCAL_CORRECTION_REQUIRED__NO_GOLD_FINAL_DISPOSITION`。
- 三个固定 cell 的 JSON、probe binary 与本地 runtime DLL 均存在且参数格匹配；这不足以确认 contract fidelity。
- 决定性问题：harness 在 `markDelete(17)` 后用原 `base[17]` 重新插入同一向量，而非 contract 要求的 deterministic replacement vector；oracle 仍对未更新的 `base` 做扫描。`delete_replace_witness: true` 因而只是自报，不能证明旧向量已被替换或 live-set oracle 已更新。
- 同时，harness 在每个 query 内执行 exhaustive float64 oracle，却固定输出 `oracle_wall_seconds: 0`；三份 JSON 也未提供所要求的可审计 full-cost 分解（vector generation、normalization、oracle scan 等）。`full_query_wall_seconds` 混合了 HNSW 查询与 oracle 工作，不能作为同信息比较器的独立成本维度。
- 此报告不输出生产候选登记、正式 Stage A PASS/STOP、Stage B 或 gold final disposition；不会把非盲结果并入 blind 指标，也不会声称无偏 recall 或 75% 阈值结论。

## 审查边界

- Gate assignment: `NONBLIND-STAGEA-GATE-20260827-HNSW`
- Subject assignment: `NONBLIND-STAGEA-20260826-HNSW-P1A7-PROBE-RUNTIME`
- Review lane: `STAGEA-GATE`; reviewer did not implement or run the probe.
- Start authority: `MAINLINE_BOOTSTRAP_ACCEPTANCE.yaml`, `ACCEPTED__INDEPENDENT_REVIEW_START_AUTHORIZED`.
- Evidence ceiling: `MINIMAL_CANONICAL_PROBE__NONBLIND_COMPATIBILITY_ONLY__NO_PRODUCTION_CANDIDATE_OR_STAGEB`.
- Reviewer actions: static source/raw/hash inspection only. New experiment/probe, network, resource creation, production registration, Stage B and gold final disposition: all zero.

## F0 fidelity contract audit

| Required F0 property | Static result | Evidence |
|---|---|---|
| Fixed 10,000×16 float32 base and 1,000 query seeds | PARTIAL | Harness fixes `N=10000`, `D=16`, base seed `20260827`, query seed `20260828`. |
| Frozen normalization semantics | FAIL | F0 requires regenerate-on-zero; `gen()` directly computes `1/sqrt(s)` with no zero-vector branch. |
| Exhaustive squared-L2 float64 oracle with lowest-label tie break | PARTIAL | Oracle accumulates `double` and scans labels in ascending order with strict `<`, giving the first/lower label on exact ties. It does not accept a live-set/replacement view. |
| Exact three-cell HNSW grid | PASS | JSON cells are `(16,200,50)`, `(16,200,100)`, `(32,200,100)`; all declare `parameter_cells=3`. |
| Matched construction/query budget and no retry | NOT FULLY REPRODUCIBLE | P1A7 handoff declares three existing cells and no retry, but there is no per-cell command receipt index in the delivered P1A7 packet. |
| Delete-replace legality and equivalence | FAIL | Actual source re-adds `base[17]`, not a distinct deterministic replacement vector; the oracle scans the unchanged `base`; required live-label, replacement-query and old-vector nonretrievability checks are absent. |
| Full-cost dimensions | FAIL | Oracle scan executes inside the timed query loop but JSON writes `oracle_wall_seconds: 0`; required component-level full-cost accounting is absent. |

## Probe construction and fixed-output audit

The preserved executable hashes to `BF2224DAE8C9FB249B9C262793F5B961014447876ECBD5555294AC51F7D63198`, matching the P1A7 ACK. The runtime DLLs in `resources/build/probe/` exactly match their frozen local sources. The three output hashes are:

| Cell | SHA-256 | Grid | Recall@1 |
|---|---|---|---:|
| 1 | `BB76D372CF1A6B5C446AB4F0A817F3DD569DBE616D406F5DE95CF5EF416475AE` | M16 / efC200 / efS50 | 1.0 |
| 2 | `BFB22AF9A81E5FEADDDB187DA74CAA82C72E58A748A30D9C385C78FFBF2A0711` | M16 / efC200 / efS100 | 1.0 |
| 3 | `A1B3345F0E7E8DC90C3F36045434E1A07BC55EA607BAE2EEB07358EDB25AEAE3` | M32 / efC200 / efS100 | 1.0 |

These facts establish that the frozen executable produced three syntactically complete local outputs after the DLL correction. They do not establish a valid delete-replace witness or fair full-cost decomposition.

## Decisive source-level findings

1. The delete-replace path is `ix.markDelete(17); ix.addPoint(base.data()+17*D,17,true);`. F0 instead freezes a replacement vector and requires updating the brute-force oracle from the old vector to that replacement. Re-inserting identical data cannot test the stipulated semantic transition.
2. `oracle(base, qry.data()+i*D)` scans all original base vectors inside the loop. There is no live-label filter, no replacement data structure and no assertion for the three required witness checks.
3. `t2` begins before the HNSW query loop and every oracle call; `t3` ends after it. Thus `full_query_wall_seconds` contains both components while `oracle_wall_seconds` is literally emitted as zero.
4. Each JSON has only aggregate construction/delete/query time, index bytes, recall, zero oracle time and grid count. It omits separate vector-generation, normalization and oracle-scan costs despite F0 declaring all of them included and P1 requiring an auditable full-cost JSON.

## Evidence ceiling and independence

The packet correctly identifies itself as nonblind compatibility-only and the registry forbids production candidate state, Stage B and merging it into blind metrics. Those restrictions remain valid after this rejection. The observed `recall_at_1=1` values therefore have no scientific or production meaning in this review.

## Bounded next action for MAINLINE

If MAINLINE elects to continue, it must freeze a new assignment-local engineering correction before any rerun. That correction must keep the three fixed cells, seeds, dimensionality, HNSW artifact and nonblind ceiling unchanged while it:

1. generates and stores a deterministic replacement vector distinct from the original label-17 vector;
2. updates both HNSW and an explicit live-set oracle, and checks live count, replacement-label oracle agreement and old-vector nonretrievability;
3. implements the frozen zero-vector regeneration rule;
4. records separate wall-time components for generation, normalization, construction, delete/replace, HNSW queries and exhaustive oracle scans, with no zero placeholder for executed oracle work;
5. emits receipt-backed, component-level full-cost JSON and returns to an independent compatibility gate.

This is a fidelity/engineering route only. It is not authorization to run a new probe, consume a scientific revision, register a production candidate, enter Stage B or make a gold final disposition.

