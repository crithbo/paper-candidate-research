# Rule Audit Report

## Identity

- `audit_id`: `RULE-AUDIT-20260810-DISCOVERY-PRESTAGE0-QUALITY-AND-PARALLELISM-R7`
- `trigger`: 用户批准执行反证优先检索、失败核复用、pre-brief adversarial check、Stage0 修正反馈和现有并行方案适配。
- `requested_by`: 用户直接请求
- `date`: 2026-08-10（Asia/Shanghai）
- `write_directory`: `stages/rule-audit/RULE-AUDIT-20260810-DISCOVERY-PRESTAGE0-QUALITY-AND-PARALLELISM-R7/`
- `shared_files_modified: false`

## Executive conclusion

当前最可行的质量改进不是增加 raw Discovery lane，而是把现有两条热槽按 backlog 在 `BREADTH` 与 `DEPTH_REDTEAM` 间切换，并把候选级深审改成反证优先：先寻找具名 decisive subtractor、第一方 current family、generic kernel 和 natural carrier 缺口，再决定是否形成 Stage0 brief。

R5 已证明六个审计窗口 brief 全部需要 Stage0 材料性 source/action correction；v8.8 又在两个 sentinel 上未显式命名决定性吸收者，并把一个尚未冻结的控制错误归为结构性淘汰。因而应提高 `CLEAN_STAGE0_BRIEF`，而不是把 Stage0 PASS 率设为配额。

用户已经批准本包的分阶段执行。P0 遥测/兼容字段可由主线在安全边界立即落盘；P1/P2 行为必须保持 dormant，直到另行完成 v8.8 resolution、独立 blind backtest 和两波 noncanonical shadow。只有冻结的 exact patch 与全部验收指标一致时，主线才可按本次预批准切生产；任何范围扩张必须重新请示用户。

## Question and scope

- User/process question: 如何在不降低 Q2、same-object、latest collision、强基线、自然证据、full-cost、复现和证据诚实门的前提下，提高 Discovery 送入 Stage0 的 brief precision，并适配并行方案。
- Rules inspected: `AGENTS.md`、`plan.md`、`registry.yaml`、`rules/ROLE_RULE_AUDIT.md`、`rules/ROLE_MAINLINE.md`、`rules/ROLE_DISCOVERY.md`、`rules/ROLE_DISCOVERY_BACKTEST.md`、`rules/ROLE_STAGE0_REVIEW.md`、`templates/TOPIC_BRIEF.md`。
- Evidence inspected: R4 scheduling report/pilot telemetry；R5 audit/proposal/P0 implementation；v8.8 independent auditor failure kernel；registered funnel and current hot-pool state。
- Method: academic-research-suite 的 source verification、contradiction-first、可复现检索、claim ceiling 与阶段独立性规范。
- Out of scope: 本审计不执行 R6、不启动 repack/replay/shadow、Discovery/Stage0/A/B、实验、下载或自动化，不修改共享文件或候选状态，不复活 STOP。

## Current authoritative behavior

1. `ROLE_DISCOVERY` 已要求机会包、三遍发现法、current upstream reality check、原子动作与有限 fidelity plan，但没有把“先找杀死候选的具名 subtractor”定义为候选级深审的机械产物。
2. `ROLE_MAINLINE` 已完成 R4：`BASE_ACTIVE_SEATS=4`、maintenance coexistence burst=1、两条 Discovery 热槽、StageA 决定性工作优先。当前没有证据支持扩大永久并行数。
3. R5 P0 已定义七个漏斗单位和五种 raw disposition；R5 P1/P2 因 v8.8 `NOT_CALIBRATED` 尚未启动。
4. Stage0 独立性正确；Stage0 应发现细微碰撞和 Q2 shape 缺陷，但不应反复成为第一次阅读 sibling repo、generic kernel 或 decisive source semantics 的位置。

## Evidence of a problem or correct behavior

| Observation | Source/artifact | Classification |
|---|---|---|
| 六个 R5 brief 全部由 Stage0 补出材料性 source/action correction。 | R5 audit/registry | Repeated Discovery depth defect |
| v8.8 C01/C02 未命名 key 要求的 decisive subtractor；source token 不能代替动作/保证层面的吸收判断。 | V8.8-R3 auditor | Method/schema/execution signal requiring resolution |
| v8.8 C04 把未冻结机会写成 `STRUCTURAL_DROP`。 | V8.8-R3 auditor | Structural-vs-unfrozen calibration defect |
| R4 两周期在 active 2→3 与 ready=0 控制下均无 duplicate/shared-write/rule-drift。 | R4 telemetry | Current total concurrency sufficient |
| 当前 Stage0/candidate/gate 无 ready backlog；扩大 raw lane 只会放大浅层纠错。 | plan/registry/R4 | No permanent lane expansion basis |

## Parallelism adaptation

### Two hot Discovery slots

- `qualified_depth_backlog=0`: `BREADTH + BREADTH`，两条必须是正交 source mode，不得围绕同一 anchor 生成同义题。
- `qualified_depth_backlog>=1`: `BREADTH + DEPTH_REDTEAM`。breadth 保持 recall；depth 完成 source-role passport、collision-first query pack、failure-kernel lookup 和 pre-brief adversarial check。
- 有 resource-ready StageA owner/gate work 时：Discovery 降为最多一条；若存在合格 depth backlog，保留 `DEPTH_REDTEAM`，否则保留正交 breadth。
- 不新增第三条 raw Discovery。R4 已有的 post-calibration supply-starved third-lane 条件继续存在，但 R7 不放宽它。

### Depth trigger and release

只有同时满足以下条件才进入 depth backlog：具名 unique opportunity family；exact object 与 preliminary atomic action 可表达；至少一个 current/generic/contrary/carrier source role 未闭合；没有已知 `DIRECT_FATAL`。完成 canonical brief、`STRUCTURAL_DROP`、`NOT_ADMITTED_UNFROZEN` 或 `RESOURCE_BLOCKED` 后释放 depth slot。

### Backtest and shared-writer concurrency

- 同一 packet 的 PACKER→EXECUTOR→AUDITOR 仍严格串行、角色独立并复用既有长期 lane。
- maintenance burst 只能服务 ready authorized science；不能用于额外 raw Discovery，也不能让本审计成为第二共享 writer。

## Proposed quality controls

1. `COLLISION_FIRST_QUERY_PACK`: exact object/action；same output/guarantee；first-party sibling/source/flags；generic kernel；one-hop forward/backward genealogy。
2. `DECISIVE_SUBTRACTOR_RECORD`: 找到吸收者时必须具名，并逐 facet 比较 object、action、information、guarantee、cost 和 claim；动作空间重叠本身不得自动判算法吸收。
3. `FAILURE_KERNEL_LOOKUP`: 只读取 registry/history 中已登记失败核作为 query expansion；不得继承旧 STOP、不得使用未登记跨题记忆、不得把结构相似当直接证据。
4. `PREBRIEF_ADVERSARIAL_CHECK`: 只检查 object/guarantee、current union、generic kernel、natural carrier 四面；不做 Q2 verdict，不要求实现或结果。
5. `STAGE0_REPAIR_VECTOR`: Stage0 独立报告 Discovery 是否遗漏 cutoff-available current source、first-party feature、generic kernel、atomic action、natural carrier、full-cost 或 Q2 shape；它是反馈遥测，不改变裁决。
6. `RELATIVE_DEPTH_PRIORITY`: top-k 机会按 natural/formal headroom、object/action clarity、absorption risk、source completeness、finite StageA killer、AI core fraction 排序；只改变深审顺序，不成为录取门，高价值人工核心题仍可 reserve。

## Risk analysis

- False-negative risk: medium。反证优先可能把 action overlap 误写为 absorption；以 facet matrix、positive controls、unfrozen status 和 independent Stage0 防护。
- False-positive/weak-paper risk: reduced。具名 subtractor、first-party family 和 generic kernel 更早闭合。
- Scientific-integrity risk: reduced。未找到只能写 `SEARCH_BOUNDED_OPEN`，失败核只作 query expansion。
- Resource/time risk: medium but bounded。只对 top-k depth family 深读，不扩大 raw lanes，不运行实验。
- State-migration risk: low。无新 candidate state；新增字段均可选或遥测。
- Terminal-revival risk: zero。历史 STOP 只作冻结 failure-kernel control。

## Recommendation

- Decision: `BACKTEST_REQUIRED` with `USER_APPROVED_STAGED_IMPLEMENTATION`.
- Minimum effective change: P0 先增加 `STAGE0_REPAIR_VECTOR` 和 dormant mode/telemetry；P1 在独立 backtest 中测试 collision-first、failure-kernel、prebrief check；P2 用两波 shadow 测试一 breadth/一 depth 调度；通过后按冻结 patch 切 production。
- Why smaller is insufficient: “多读文献”不能保证读到 decisive sibling/generic kernel；单纯增加 lane 会复制浅层遗漏。
- Non-relaxable gates preserved: Q2、same-object、latest collision、fair current strong baseline、natural evidence、full-cost、reproducibility、claim ceiling、STOP non-revival、independent Stage0/StageA 与逐题 StageB 用户门全部保留。

## Validation and rollback

- Dependency: R7 行为 backtest 不得早于另行完成的 v8.8 resolution；不得修改被冻结的旧 V8.8-R3 packet。
- Regression set: R5 六个材料性修正案例、AIGER 非致命正控、已登记 structural/unfrozen/resource controls。
- New blind holdout: 至少 8 个 cutoff-frozen cases，包含不少于 3 个 positive opportunity shapes、3 个 structural negatives、2 个 unfrozen/resource controls；executor 不得看到 identity/outcome/key。
- Historical acceptance: 所有已知 cutoff-available material corrections 被找回；AIGER 保持 proposal-eligible；action-overlap false fatal=0；terminal revival=0。
- Blind acceptance: positive shape recovery≥2/3；structural negatives abstain=3/3；unfrozen/resource controls 不因缺实现/资源被结构淘汰=2/2；所有 structural decision 都有具名 subtractor 与 facet match。
- Shadow acceptance: 两波中 Stage0 补出的 cutoff-available minimum-set omission=0；one-breadth floor 保留；duplicate/shared-write/rule-drift=0；StageA ready science 不因 depth 调度等待；不设置 Stage0 PASS 配额。
- One-failure stop: 任一独立 auditor 返回 `NOT_CALIBRATED/CONTAMINATION_UNKNOWN`，立即停止；不得自动第二次 revision、repack 或生产 cutover，回用户裁决。
- Rollback: `DISCOVERY_QUALITY_MODE=OFF`、`DISCOVERY_DEPTH_RESERVATION=0`，恢复现行两条正交 rotating breadth；遥测字段可保留，不需要候选状态回滚。

## Mainline handoff

- User approval already present: `YES__STAGED_EXACT_SCOPE`，见 `USER_APPROVAL_IMPLEMENTATION_DIRECTIVE.md`。
- Files proposed for change: `rules/ROLE_MAINLINE.md`、`rules/ROLE_DISCOVERY.md`、`rules/ROLE_STAGE0_REVIEW.md`、`templates/TOPIC_BRIEF.md`；registry/plan/history 只由主线登记状态和哈希。
- Registry migrations proposed: 无 candidate state migration；增加 method/scheduling/repair-vector telemetry only。
- Existing topics affected: none retroactively；ACTIVE/BLOCKED/HOLD/STOP/PASS 不重裁。
- Shared files modified: `false`。

