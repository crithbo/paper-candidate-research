# Rule Audit Report

## 中文摘要

- 发现的问题：Source116 与 Source117 均在 raw 前失败。Source116 的 merged-patch/test lineage 找到至少一个 merged-patch locator，但没有完整的 merged commit、parent/current source、changed test、flags、same-object current residual、full-cost 与 falsifier tuple；Source117 找到 ONNX QDQ、GGUF、StableHLO 等精确规范或实现边界，但没有自然模型/canonical fixture、same tensor/graph、current backend pair、固定 decision endpoint 与非通用 residual 的联合闭合。
- 对推进速度或研究质量的影响：exact-carrier ordering 提高了 locator 身份质量、可审计性和早期诚实排除能力，但没有改善本轮 raw/brief yield。把 exact carrier 当 novelty、fault 或 yield 代理会制造弱题；完全移除则会重新引入 issue-only、spec-only 和对象漂移。
- 建议修改：`NO_CHANGE`。merged-patch/test lineage 与 low-bit conformance carrier 均 `RETAIN` 为来源排序/语义载体，`DOWNGRADE` 为非 yield intervention；不安装新的 mandatory shared 行为，不实施 patch，不新增第二个 bounded change。
- 是否需要用户批准：否。本报告不改变共享规则、候选状态、资源或 Stage B 权限。

## Identity

- `audit_id`: `RULE-AUDIT-20260824-SOURCE116-117-PATCH-CONFORMANCE-A9`
- `trigger`: `SOURCE116_AND_SOURCE117_CONSECUTIVE_COMPLETE_ZERO_BRIEF`
- `requested_by`: `MAINLINE`
- `date`: `2026-08-24`
- `write_directory`: `stages/rule-audit/RULE-AUDIT-20260824-SOURCE116-117-PATCH-CONFORMANCE-A9`
- `shared_files_modified: false`

## Question and scope

- User/process question: 比较 merged-patch/test-lineage 与 low-bit conformance/interoperability 两轮，定位第一失败转换，评价 exact-carrier tuple 对 closure utility 与 yield 的不同作用，并对既有 pilots 给出 `RETAIN / DOWNGRADE / REMOVE`。
- Rules inspected: `AGENTS.md` 的连续零产出诊断、current-upstream reality、same-object、自然/canonical evidence、full-cost 与 proposal-only 边界；`rules/ROLE_RULE_AUDIT.md`。
- Registered examples inspected: A8 handoff；Source116/117 control、portfolio note、assignment-local denylist addendum；两轮 12 个 registry-registered handoff；两份 registered S1 raw-gate decision。
- Out of scope: Source118 的结果、handoff、输出或科学判断；网络检索；下载、构建、实验、queue、automation、backtest；共享/候选文件及状态修改。
- Claim ceiling: `PROCESS_DIAGNOSIS_AND_CHANGE_PROPOSAL_ONLY`。
- Evidence ceiling: `REGISTERED_SOURCE116_SOURCE117_A8_ARTIFACTS_ONLY`。

## Current authoritative behavior

1. `AGENTS.md` 要求连续两个完整六路零 brief 后先定位第一失败转换，再区分 source、rule、template、execution 与 resource 原因；整批零产出合法。
2. Source116 的 mandatory lineage contract 要求 merged PR/commit、parent/current version、changed source path、changed test/benchmark、original endpoint、current residual discriminator、full-cost 与有限 falsifier；patch 只是 locator，不是 novelty。
3. Source117 的 conformance contract 要求 exact format/spec/opset/quant scheme、current parser/lowering path、canonical fixture 或自然模型、same tensor/graph semantics、公平 current backend comparator、full-cost 与有限 falsifier；spec 或 fixture 只是 carrier。
4. A8 已接受 `NO_CHANGE`：merged-patch/test lineage 仅为 bounded source-ordering pilot，不是 admission、yield、novelty 或 fault-presence 规则。
5. Q2 minimum、Q1 priority、same-object、current collision、公平强基线、自然/canonical evidence、full-cost、reproducibility、claim ceiling 与 STOP non-revival 保持不变。

## Evidence and first failed conversions

### Funnel summary

| Cycle | Registered carrier/locator lower bound | Complete tuple | Raw | Deep | Clean brief | Dominant first failed conversion |
|---|---:|---:|---:|---:|---:|---|
| Source116 merged-patch lineage | at least 1 valid locator in S3; S4 separately records 1 merged-patch locator | 0 complete lineage tuple | 0 | 0 | 0 | `PRE_RQ_PATCH_LINEAGE_CLOSURE -> VALID_SELECTED_LOCATOR`; survivor also fails `-> RAW` |
| Source117 low-bit conformance | exact spec/source boundaries observed, but 0 registered valid selected locator across explicit funnel fields | 0 complete conformance packet | 0 | 0 | 0 | `PRE_RQ_CONFORMANCE_CARRIER_CLOSURE -> VALID_SELECTED_RQ_OR_LOCATOR` |

Handoff schemas are heterogeneous, so the report uses registered lower bounds rather than normalized conversion percentages.

### Source116 observations

- S1/S2 locate issue-level or local-fix references but do not close a complete merged patch + parent/current source + changed test + flags + current residual tuple.
- S3 preserves one valid locator, then fails raw because the same-object residual remains unfrozen.
- S4 records one merged-patch locator among five RQs, but zero complete tuples; four other locators are nonmerged or unlinked, and one current-source read timed out.
- S5 explicitly confirms that a merged patch does not automatically constitute a current residual; its three lineages remain incomplete.
- S6 has no valid locator. No build, reproduction, experiment or resource action occurred.

### Source117 observations

- S1 finds that ONNX QDQ、TorchAO and GGUF define precise contracts, but no current same-object cross-backend fault/residual tuple survives.
- S2 has one RQ but no selected seed or valid carrier because exact conformance fields are missing.
- S3's three RQs close honestly before raw: ONNX selector boundaries are not novelty; GGUF format metadata does not freeze universal same-graph semantics; StableHLO quantization semantics do not establish a current backend residual.
- S4 records five spec/test-only carriers and zero complete conformance packets.
- S5 lacks a natural model/canonical fixture, same-tensor semantics, current backend comparator, full-cost and decision endpoint.
- S6 has no valid locator. No build, experiment or resource action occurred.

### Defect classification

| Class | Finding | Basis |
|---|---|---|
| Exact carrier identity utility | `SHOWN` | Source116 finds a merged-patch locator; Source117 freezes exact spec/source boundaries |
| Raw/brief yield improvement | `NOT_SHOWN` | both cycles remain 0 raw/0 brief |
| Current-union or already-specified semantics | `SHOWN_CONDITIONALLY` | patch often represents a fixed historical identity; current low-bit specs already define key semantics |
| Exact residual/action/endpoint shortage | `SHOWN_FOR_BOTH` | complete lineage and conformance tuples are zero |
| Scientific rule defect | `NOT_SHOWN` | nonadmission follows missing same-object current residual, comparator, endpoint or full-cost |
| Template decision defect | `NOT_SHOWN` | heterogeneous counters reduce aggregation precision but canonical decisions remain auditable |
| Execution defect | `NOT_SHOWN` | both six-lane cycles completed and registered checks were performed |
| Aggregate resource cause | `NOT_SHOWN` | failures precede claim-bearing runs and resource actions |

## Exact-carrier tuple: utility versus yield

### Demonstrated utility

- Replaces issue/spec names with inspectable commit、path、test、opset、quant scheme or parser/lowering loci.
- Makes same-object and current-upstream checks fail at a precise missing field rather than at a vague “可能有问题”。
- Prevents historical fixes, format documents, selector flags or tests from being mistaken for novelty or current fault evidence.
- Improves provenance, denominator honesty and handoff auditability even when the correct result is zero.

### Yield result

- Source116 does not show an increase in valid complete tuples, raw or briefs; one locator remains insufficient.
- Source117 shows that even exact specs and current implementation boundaries do not create a natural same-object backend residual.
- Therefore exact-carrier tuple is a precision/closure intervention, not a demonstrated discovery-yield intervention.

### Disposition

`RETAIN_FOR_IDENTITY_AND_CLOSURE_QUALITY__DOWNGRADE_AS_RAW_OR_BRIEF_YIELD_INTERVENTION`.

It must not become a quota, admission shortcut, novelty presumption, fault-presence presumption or broad exclusion of topics without an immediately available carrier.

## Pilot dispositions

| Pilot or behavior | Disposition | Rationale |
|---|---|---|
| Merged-patch/test-lineage ordering | `RETAIN_FOR_EXACT_IDENTITY__DOWNGRADE_AS_YIELD_INTERVENTION` | improves locator auditability but produces 0 complete tuple/0 raw |
| Low-bit conformance/interoperability rotation | `RETAIN_STRATEGIC_FORMAT_SEMANTICS_ROUTE__DOWNGRADE_CURRENT_NAMED_SPECS_AND_BACKEND_PAIRS_NEAR_TERM` | high strategic value, but current named carriers do not close same-object residuals |
| Exact carrier tuple contracts | `RETAIN_AS_CLOSURE_AND_HONESTY_GATE` | precise missing-field diagnosis protects scientific integrity |
| Patch/spec/test as novelty or fault evidence | `REMOVE_KEEP_FORBIDDEN` | carrier identity is not contribution or current residual evidence |
| Current-upstream source/flags checks | `RETAIN_HARD_GATE` | prevents obsolete/fixed behavior from being claimed current |
| A5 explicit denylist | `RETAIN_ASSIGNMENT_LOCAL__MANDATORY_SHARED_NOT_INSTALLED` | A9 provides no evidence to bypass pending backtest requirements |
| Carrier/artifact-first ordering | `RETAIN_AS_ORDERING__NOT_AS_YIELD_OR_ADMISSION` | useful for auditability, insufficient for paper shape |
| Canonical raw gate, RQ frontend, honest abstention | `RETAIN` | no demonstrated false negative or decision defect |
| Quota, outcome-aware backfill, broad cooldown, gate relaxation, terminal revival | `REMOVE_KEEP_FORBIDDEN` | would inflate apparent yield or violate scientific/terminal policy |

## Risk analysis

- False-negative risk: low on registered evidence; no complete current residual with same-object action, comparator and endpoint was shown rejected for a mechanical-only reason.
- False-positive/weak-paper risk: high if exact patch/spec/test presence is mistaken for novelty, true fault or interoperable-semantics failure.
- Scientific-integrity risk: high if fixed historical patches or generic format differences are presented as current negative replication without a natural/canonical same-object carrier.
- Resource/time risk: exact tuple closure consumes static inspection effort but ends weak records earlier; its net yield benefit is unproven.
- State-migration risk: none; no state changes proposed.
- Terminal-revival risk: none; no terminal identity is renamed or reused.

## Recommendation

- Decision: `NO_CHANGE`
- Minimum effective change: none in A9.
- Why a smaller operational fix is sufficient: existing tuple contracts and raw gate correctly separate carrier quality from scientific contribution. The observed outcome supports retaining exact-carrier ordering for precision while rejecting any yield or admission interpretation.
- Future bounded change: `NONE_NEW_IN_A9`. Source118 is independently frozen and excluded; A9 does not stack another micro-rule or backwrite into it.
- Non-relaxable gates preserved: all Q2/Q1、same-object、collision、baseline、natural/canonical evidence、full-cost、reproducibility、claim ceiling、Stage B approval and STOP non-revival requirements remain unchanged.

## Validation and rollback

- Historical cases/backtest required: none for `NO_CHANGE`; any future mandatory shared behavior based on exact-carrier ordering would require separate prospective or historical validation.
- Shadow-run plan: none authorized or executed by A9.
- Success/failure criteria: future evaluation must separate exact locator/complete tuple rate from raw/clean-brief and independent Stage 0 outcomes.
- Rollback condition: not applicable; no patch is installed. If ordering cost outweighs closure benefit, retain carriers as optional sources without changing admission.

## Mainline handoff

- User approval already present: only A9 proposal-only START.
- Files proposed for change: none.
- Registry migrations proposed: none.
- Existing active/blocked/hold/terminal topics affected: none.
- Shared files modified: `false`.
- Source118 results read or influenced: `false`.

## Limitations

- Evidence is restricted to registered Source116/117/A8 artifacts; no network or external source verification was performed.
- Source118 was excluded, so no inference is made about profiler/telemetry allocation or outcomes.
- Heterogeneous funnel schemas prevent exact cross-cycle rate comparison.

