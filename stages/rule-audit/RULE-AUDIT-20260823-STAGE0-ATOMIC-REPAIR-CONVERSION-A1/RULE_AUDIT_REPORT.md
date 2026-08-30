# Rule Audit Report

## 中文摘要

- 发现的问题：现行规则已经限制每阶段一次 `REVISE_ONCE`、要求单一原子缺口、Stage A preclaim fidelity 与独立 gate，但缺少一个从 Stage 0 初始缺陷、修补内容、证据、修补参与者一路传到 Stage A 实现和独立 closing 的机器可读记录；现有 registry 也没有冻结原始修补分母和成熟度/资源删失。
- 对推进速度或研究质量的影响：Stage 0 修补后的表面通过率可能提高，但不能区分真实下游转化、构造无效、资源等待和 owner 自评；这会把失败推迟到 Stage A，并使“提高通过概率”无法被审计。
- 建议修改：先增加非裁决性的修补链与 conversion telemetry；任何把字段缺失变成 admission/repair/closing 硬门的行为变更先做独立 SHADOW/BACKTEST。
- 是否需要用户批准：用户已批准本范围提案；共享文件仍只由 MAINLINE 修改。行为改变的 production cutover 仍需回测通过和 MAINLINE 安全边界落盘。

## Identity

- `audit_id`: `RULE-AUDIT-20260823-STAGE0-ATOMIC-REPAIR-CONVERSION-A1`
- `trigger`: 用户询问并批准改进 Stage 0 后一次原子修补的真实下游转化
- `requested_by`: USER via RULE_AUDIT_SENTRY
- `date`: 2026-08-24
- `write_directory`: `stages/rule-audit/RULE-AUDIT-20260823-STAGE0-ATOMIC-REPAIR-CONVERSION-A1`
- `shared_files_modified: false`

## Question and scope

- User/process question: Stage 0 审查后按建议修补是否提高通过概率，以及应否采用更强规则。
- Rules inspected: `ROLE_MAINLINE.md`、`ROLE_STAGE0_REVIEW.md`、`ROLE_CANDIDATE_OWNER.md`、`ROLE_STAGEA_REVIEW.md`。
- Templates inspected: `STAGE0_REPORT.md`、`STAGEA_REPORT.md`、`INDEPENDENT_REVIEW_REPORT.md`、`HANDOFF.yaml`。
- Candidate examples inspected: 冻结的六例上限；未扩展第七例。
- Out of scope: 新科研结论、文献检索、实验、backtest 执行、共享规则/skill 直接修改、终态复活。

## Current authoritative behavior

现行 `ROLE_STAGE0_REVIEW.md` 已规定：`REVISE_ONCE` 仅适用于接近通过且能闭合一个原子缺口；每阶段最多一次；对象变化必须新 ID；direct fatal、same-object、强基线、自然证据、full-cost 与 claim ceiling 均不能放松。`ROLE_CANDIDATE_OWNER.md` 与 `ROLE_STAGEA_REVIEW.md` 已要求首次 claim-bearing run 前通过 `PRE_CLAIM_CONTRACT_FIDELITY_GATE`，构造无效结果不能支持 PASS/STOP；独立 gate 决定 Stage A 结论。

缺口不在科学门，而在跨阶段数据合同：Stage 0 的原子缺陷、允许修补范围、修补者、证据和 falsifier 没有 canonical ID；Stage A 模板没有强制映射该修补链；独立 review 模板没有逐项验证矩阵；主线遥测虽有 `stagea_pass_count` 等聚合项，却没有冻结 Stage 0 repair cohort、删失状态和 full-cost 转化分母。

## Evidence of a problem or of correct behavior

| Observation | Source/artifact | Repeated? | Classification |
|---|---|---:|---|
| Stage 0 修补后进入 Stage A，初始实现存在合同 NDV 偏差和 signature/full-cost 漏计；Stage A 原子修订后由独立 gate PASS | `S6-JS-PREFIXBOUND` Stage 0 revision、Stage A initial/revision/closing | yes | 规则方向正确；缺跨阶段 traceability |
| Stage 0 修补和 closing PASS；Stage A 初始实现 fidelity 不足，纠正后在自然对象/full-cost 下由独立 gate STOP | `ARROW-IPC-STREAM-JOINT-DICTIONARY-EVOLUTION` | yes | 合法真实负转化；不能把 Stage 0 PASS 当最终概率 |
| Stage 0 修补和 closing PASS；Stage A 初始 proxy 无效，修订后同对象 24 模型、完整成本下独立 STOP | `FLATBUFFERS-PROFILED-WHOLE-BUFFER-LAYOUT` | yes | 合法真实负转化；独立 closing 有效 |
| Stage 0 修补建议 PASS，但独立 closing 发现 strict-successor witness 与 reader state 证书错误；1/1 已耗尽后 HOLD 而非伪造 PASS/STOP | `GIN-POSTING-CUT-DP` | yes | closing independence 正确；修补证据逐项核验缺模板 |
| 直接 Stage 0 PASS；Stage A 修订构造无效，独立 closing 只能 HOLD | `S4-SLO-PAGEPACK` | control | 问题不限于 Stage 0 repair cohort |
| 直接 Stage 0 PASS；Stage A owner 给 STOP，但比较器成本与 arm rotation 构造无效，独立 gate HOLD | `PARQUET-PAGE-COSEGMENT` | control | preclaim/比较器 traceability 是通用缺口 |

冻结六例是目的性分层样本，不是概率估计样本。其中 4 例属于独立确认的 Stage 0 修补路径，结果为独立 Stage A PASS 1、独立 Stage A STOP 2、Stage 0 HOLD 1；该 `1/4` 只能说明结果分化，不能称为真实通过概率。完整分母目前跨 legacy/current registry 字段异构，必须先由 schema 固定后再计算。

## Risk analysis

- False-negative risk: 没有修补链时，合法的单一原子缺口可能因实现代理偏差在下游被误 STOP。
- False-positive/weak-paper risk: 只看 Stage 0 closing PASS 会显著高估最终转化；owner 自评和资源等待若进入分子会进一步膨胀。
- Scientific-integrity risk: 最大风险是 comparator、native semantics、metric denominator 或 full-cost 在 Stage A 与 Stage 0 修补合同漂移。
- Resource/time risk: 没有早期 traceability 会在较昂贵 Stage A 才发现本可在 preclaim 关闭的构造缺陷。
- State-migration risk: legacy 记录字段不统一；禁止用缺失值补零或重写历史终态。
- Terminal-revival risk: 提案不允许终态复活，历史案例只作过程证据。

## Recommendation

- Decision: `PATCH_RECOMMENDED`，其中 telemetry/optional trace fields 为非裁决 P0；任何 mandatory admission/repair/closing 行为改变均为 `BACKTEST_REQUIRED`。
- Problem classification: `TEMPLATE_GAP + TELEMETRY_SCHEMA_GAP`，伴随少量规则文字缺口；不是降低质量门或增加 revision 次数的问题。
- Minimum effective change:
  1. 新增 `ATOMIC_REPAIR_TRACE_V1`：冻结 defect、eligibility、allowed/forbidden delta、证据/falsifier、作者身份和独立 closer 排除集合。
  2. Stage A preclaim 与 independent review 逐项消费该 trace，并记录 `FULLY_ADDRESSED / PARTIALLY_ADDRESSED / NOT_ADDRESSED / MADE_WORSE / CANNOT_VERIFY`。
  3. 主线按原始独立确认的 Stage 0 `REVISE_ONCE` cohort 登记 downstream conversion，资源失败和 HOLD 单列，owner self-pass 不计分子。
- Why a smaller operational fix is insufficient: 仅提示 reviewer “更仔细”无法固定分母、阻止跨阶段字段漂移或证明 closer 未参与修补。
- Non-relaxable gates preserved: Q2、same-object、latest collision、强基线、自然证据、full-cost、复现、claim ceiling、每阶段一次 revision、STOP non-revival 与用户 Stage B 门全部不变。
- Skill disposition: 不修改 `academic-research-suite` 或项目 Discovery skill；本问题可由项目规则/模板闭合。

## Validation and rollback

- Historical cases/backtest required: 对任何 mandatory 行为使用隔离 PACKER→EXECUTOR→AUDITOR 回放冻结六例。
- Shadow-run plan: `ATOMIC_REPAIR_TRACE_MODE=SHADOW`；缺字段只记 telemetry，不影响裁决。
- Success criteria: 六例 canonical decision 6/6 不变；repair cohort/Stage A outcome 6/6 分类正确；0 次额外 revision、终态复活或资源失败科学化；修补者与 closer 冲突 100% 可检测；未知字段保留 `NOT_YET_MEASURABLE`。
- Failure criteria: 任一 PASS/STOP/HOLD 被字段缺失改变、direct fatal 获得修补入口、same-object/保证被降级、或 legacy 缺失被补零。
- Rollback condition: shadow 产生错误路由或不可兼容迁移时，将 mandatory mode 回退 `OFF`；保留非裁决 telemetry。

## Mainline handoff

- User approval already present: `USER_STAGE0_ATOMIC_REPAIR_DOWNSTREAM_CONVERSION_RULE_IMPROVEMENT_20260823`。
- Files proposed for change: 项目角色规则与四个项目模板；不改 skill。
- Registry migrations proposed: 只新增 append-only audit/telemetry 记录；不改既有候选状态。
- Existing active/blocked/hold/terminal topics affected: 不追溯改变；legacy 仅标 `LEGACY_PARTIAL / NOT_YET_MEASURABLE`。
- Shared files modified: `false`

