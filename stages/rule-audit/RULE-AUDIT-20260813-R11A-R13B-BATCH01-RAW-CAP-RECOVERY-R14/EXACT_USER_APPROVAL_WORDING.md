# Exact user approval wording

> 批准 `R11A-R13B-BATCH01-RAW-CAP-RECOVERY-20260813-R14A`：采用恢复方案 B。将 R13B Batch01 在 commitment 前发生的两次各 20 条 public locator preflight 合计 40 条 raw attempts 全部、永久计入 R13B `total_raw_ceiling=88`；将 Batch01 标记为 `INVALID_RAW_CAP_BREACH__NO_COMMITMENT__NO_SCIENTIFIC_INFERENCE`。两次失败事务及其全部未持久化返回内容整体 quarantine，不得重放、重建、引用、挑选、commit、做 private intersection、source qualification 或用于选择后续条目；不得伪造不存在的逐条身份或 first-24 chronology。
>
> R13B 计数冻结为：既有 4 raw 加此次 40 raw 等于 `raw_used=44`、`raw_remaining=44`；没有新增 commitment，故 `unique_used=4`、`unique_remaining=68`。不得忘记 overage、重置计数、把 nonpersisted 当作未消耗、创建 replacement/fifth batch、扩大 total/per-batch cap、预算、blind sample、科学/统计门或 production 权限。
>
> 主线可以只以 append-only 方式在既有 R13B control root 冻结 R14A recovery amendment、无身份/无内容的 aggregate quarantine ledger、resume gate 和 manifest，并更新主线拥有的 plan/registry bookkeeping。机械验证通过后，从原 `R13B-02` 恢复同一 Phase1 assignment，不新建 replacement Batch01。`R13B-02/03/04` 原 raw caps `24/24/12` 与 unique caps `20/20/8` 不变；每批有效 raw cap 必须是 `min(该批原 cap, 当时 global raw remaining)`，未用容量不得使后续批超过其原 cap，总 raw/unique 绝不超过 `88/72`。
>
> 每次后续 public preflight 前必须先 append-only 冻结 request reservation、请求数量、调用前 global remaining、公开 seed/profile 与 request-plan hash，并由主线验证数量未超限；返回顺序必须在任何语义筛选前 append-only 冻结，再按原 R13B 的 normalization、跨批去重、opaque commitment、主线私有 R12A intersection、nonmatch-only source qualification、checkpoint 与逐批主线门执行。任何计数/时序/隔离无法核验、对失败返回的重放或事后选择、碰撞/歧义、private leakage、cap/预算扩大、旧文件覆盖或未授权下游活动均 fail closed，且已消耗容量不得回滚恢复。
>
> 本批准不改变既有 24→30→36、六 strata、贡献类型、来源资格、盲隔离、科学/统计/Q2 硬门、PACKER→EXECUTOR→AUDITOR 独立性、两波 shadow 或 `DISCOVERY_CLAIM_PACK_MODE=OFF`；不授权 Phase2、Executor、Auditor、shadow、Discovery、Stage0/A/B/E2、实验、下载、自动化、外部服务或 production。若 44 条剩余 raw 在原批次数内不足以形成至少 24 个合格 blind families，按原 R13B `FAILED_NOT_DISPATCHABLE__BLIND_CORE_UNCLOSED__NO_SCIENTIFIC_INFERENCE` 结束，不得再请求 replacement batch 或容量重置。

## Why fresh approval is required

The approved R13B contract forbids reset, cap transfer and replacement batches but does not authorize invalidating a breached batch, charging all of its attempts, rebasing the remaining global counter and resuming at Batch02. This is a new, narrowly bounded assignment-local policy disposition. It does not change any scientific gate, but mainline cannot infer it from the generic R13B approval.
