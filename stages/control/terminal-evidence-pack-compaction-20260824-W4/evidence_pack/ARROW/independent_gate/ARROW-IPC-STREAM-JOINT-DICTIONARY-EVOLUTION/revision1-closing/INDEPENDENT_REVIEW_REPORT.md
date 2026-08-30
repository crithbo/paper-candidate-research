# ARROW-IPC-STREAM-JOINT-DICTIONARY-EVOLUTION Stage A Revision 1 独立终审

- Review lane id: `STAGEA-GATE-REVIEW-LANE-1`
- Assignment id: `STAGEA-G1-20260811-ARROW-IPC-STREAM-JOINT-DICTIONARY-EVOLUTION-REVISION1-CLOSING-V8.7`
- Owner assignment id: `STAGEA-L1-20260811-ARROW-IPC-STREAM-JOINT-DICTIONARY-EVOLUTION-REVISION1-V8.7`
- Decision: `CONFIRM_STOP`
- Quality tier: `BELOW_Q2_STOP`
- Confidence: `0.99`
- Evidence ceiling: `BOUNDED_FROZEN_RP_FDP_SCIENTIFIC_NEGATIVE__NO_GENERAL_ARROW_IMPOSSIBILITY_CLAIM`
- Pre-claim contract fidelity gate: `PASS`
- Scientific revision: `1/1 CONSUMED`
- Stage B authorized: `false`
- `stageb_user_approval_id`: `null`
- Cross-assignment contamination: `false`

## 权威裁决

独立审查确认窄机制科学 STOP。唯一允许的 statewise signature-aware 修订已经真实关闭初轮 fidelity defect；在 fidelity 有效后，冻结的 32 个 NYC 自然窗口在两次执行中均出现 `0/32` useful、`0/32` strict、`30` 个 `∞` 与 `2` 个 `2.0` rank ratio。余下仅 8 个 Adult 窗口，即使全部理想，也最多得到 8 useful 与 8 strict，无法达到预登记的 `10/40` 与 `20/40` success rule。30 个已观察的 `∞` 还使 40-window median 在任何 8 个余项下保持 `∞`；owner 写的“至少 2.0”是正确但非紧的保守下界，`median >= 1` product-sized killer 已不可逆触发。

因此，缺少 8 个 Adult 完整运行不会阻止依据冻结合同形成 STOP。Adult window 0 的 4 GiB 终止不是本裁决的必要前提，也没有被当作单独科学 STOP。STOP 只适用于冻结的 RP-FDP representation、Arrow 25.0.0 object/action catalog、固定 40-window corpus、rank/full-cost contract；不得外推到全部 Arrow IPC dictionary evolution、其他 joint optimizer 或一般不可能性。

## 冻结与机械完整性

本 assignment 开始时，控制输入匹配主线冻结哈希：

| 输入 | SHA-256 |
|---|---|
| `plan.md` | `FA7FC9E5DC7D2C863627862555C8A05EE114ECBBE3631D401682FBFCEA2370D8` |
| `registry.yaml` | `7F802B3A446703A4EFA5B736CC9F7376D8F1339D3C35BB6DF5AA8D3F7FEE15A8` |
| `rules/ROLE_STAGEA_REVIEW.md` | `7403DD87FD0091BA836F782EE215AFDFB231BB5AFBF37570571B09EC524E94A8` |
| `AGENTS.md` | `66231F71EF6AB250A1AD9FF576D5840978F09EFC03BF5D2F0527D47F4D82B063` |

Owner canonical manifest 采用双空格分隔格式。独立复算结果为 `614/614 PASS`、0 missing、0 hash mismatch，覆盖 `122,533,243` bytes；manifest self SHA-256 为 `E0F2AF062D840B460D558010FEF7C9F73593EBFAE3655F0D25DF56AAF3A91A36`，handoff SHA-256 为 `9DC1070335710CDF9B335FD116225770AC23108D8ABA84566EA1E10EA39407B6`。

## Claim、对象与 revision 一致性

对象没有漂移：固定 ordered categorical rows、flat dictionary schema、Arrow 25.0.0 IPC stream、stock writer/reader、caller cuts、ordered physical dictionaries、null semantics，以及 delta-disabled replacement 和 delta-enabled no-event/prefix-delta/replacement 分支均保持不变。自然 carriers、16/16/8 分配、deterministic offsets、两 delta arms、static objective、rank 定义、threshold、strongest union 与 full-cost ledger 也未改变。

唯一算法变化与 gate 一致：

1. `component_dominates()` 对 equal-cost label 增加 full plan signature 的 statewise 顺序约束；
2. component dedup fingerprint 从 cost-only 改为完整 statewise `(cost, full signature)` projection；
3. component structural signature 只用于完整 projection 已相等后的稳定排序。

静态 diff 未发现 mechanism pivot。`natural_stagea.py` 的后续变化只把原合同中已经冻结的 above-cap disposition 落实为：省略 product、记录原因、candidate superiority 强制为 false。它没有改变 solver、object、input、threshold、cost dimension 或 feasible-window comparator。Attempt 1 的 32 个 NYC 结果与 restart 后的 32 个 NYC 结果走相同 feasible path；该 harness correction 是机械合同一致性修复，不是第二 scientific revision。

`SCIENTIFIC_REVISION_STATE.yaml` 在第一次 corrected solver execution 前记录 `2026-08-11T06:17:02+08:00` 消耗 `1/1`，第一次执行 `scripts/revision_exactness.py` 随后 exit 0。这个 consumption point 与初轮独立 gate 冻结的规则一致。不存在未登记 second revision 或 mechanism pivot。

## Corrected fidelity 复核

独立解析 `artifacts/preclaim_revision_exactness/results.json` 得到：

| Adversary | Delta | Boundary exact | Projection hash equal | State count equal | Label count equal | Live branches |
|---|---:|---:|---:|---:|---:|---|
| Observed window-11 tie | false | `17/17` | `17/17` | `17/17` | `17/17` | INITIAL, NO_EVENT, REPLACEMENT |
| Frozen minimal delta tie | true | `11/11` | `11/11` | `11/11` | `11/11` | DELTA, INITIAL, NO_EVENT, REPLACEMENT |

Delta-enabled adversary 在 corrected execution 前已经用 uncorrected solver 冻结，freeze SHA-256 为 `CB345BBD781E9CBC2CDB585576D6685402EE8DD18EAC6843E7EBDEFE4F84BF62`，原 solver 在 boundaries 6 与 10 暴露 equal-cost signature mismatch。修正后比较的是每个 boundary/state 的完整 `(cost, deterministic full plan signature)` labels，不是 final optimum-only 或 hash-only shortcut。

完整原 preclaim 同时报告 26 raw actions → 14 non-increasing representatives、6/6 tiny arms every-boundary exact、七种 native event branches、stock reader equality 与 4u<5u crossing witness。自然 feasible windows 的 runner 又直接比较完整 boundary projection 与 final signature；两次执行均为 `32/32` RP/product exact。由此，初轮 backpointer fidelity failure 已真实关闭。

## Rank killer 独立重算

从两棵 immutable window JSON 树逐文件重算，而非采信 summary：

| 执行树 | Windows | Useful | Strict | `∞` | `2.0` | RP/product exact | Native equivalent | Deterministic stream |
|---|---:|---:|---:|---:|---:|---:|---:|---:|
| `natural_primary` | 32 | 0 | 0 | 30 | 2 | 32 | 32 | 32 |
| `natural_primary_attempt1_contract_abort` | 32 | 0 | 0 | 30 | 2 | 32 | 32 | 32 |

冻结定义为 eligible noninitial boundary 上的 `R * sum(local state counts) / product(local state counts)` 最大值；无 eligible boundary 时 fail-closed 为 `∞`。两个有限窗口的最大值均为 `2.0`。两次执行的 decision-bearing nonvolatile projections 为 `32/32` identical；timing/Pareto residual 明确不要求 byte-identical。

不可逆上界：

- `max useful = 0 + 8 = 8 < 10`；
- `max strict = 0 + 8 = 8 < 20`；
- 40 个值中已有 30 个 `∞`，故标准 median 的第 20/21 个位置仍为 `∞`；
- 因而 success rule 不可能成立，且 `median >= 1` killer 必然成立。

这是一项冻结自然对象上的决定性机制负证据，不是因样本未跑完、实现慢或资源不足而停止。

## Adult 与 resource/blocker 分类

独立从冻结 `adult.zip`、固定 offsets 与原 `reduced_states` 计数公式静态重算 8 个 Adult window 的 product upper states：

`15,782,560; 31,312; 4,225; 26,810,900; 4,466,200; 127,205; 637,982; 4,466,200`。

全部高于冻结 cap `4,096`。原合同明确允许 above-cap product omission，并强制 zero candidate-superiority claim；因此 Adult residual upper bound 为 `0/8`，无法达到 independent-carrier `2/8` 条件。这一结论来自冻结公式与输入，不依赖 Adult solver 完整运行。

Adult window 0 的 corrected RP-FDP 在 owner 记录中达到 3,553.5 MiB RSS / 4,305.1 MiB private 并在 4 GiB boundary fail closed。该事件发生在 corrected preclaim PASS 和 32 个 NYC claim-bearing observations 之后，故不属于“所有 claim observation 前的下载/权限/工具链 blocker”。但包内没有独立 raw monitor trace；精确 memory samples 只在 command narrative 与 generated summary 中留存。因此本终审把它标为 **censored supplementary scale observation**，不把它作为 STOP kernel，也不据此提出 user blocker。

## Full-cost 与 strongest-union 公平性

Strongest union 是同 rows/schema/options/information/native action catalog 下的 current grid、independent complete frontiers + optimal cut-pool merge，以及 feasible exact product。所有 arm 的 planning cost 都包含在 end-to-end wall 中，并报告 CPU、RSS、temporary、I/O、writer、reader、validation 与 fallback；共同 input preparation 以同一 share 计入。

两次 32-window 执行中，每个 arm、每个 delta setting 的 stream-byte sum 都是 `30,104 B`。Primary 中 corrected RP-FDP planning p50 median 为约 `113–114 ms`，高于 grid `13 ms`、independent `29 ms`、product `38–39 ms`；candidate maximum window p90 temporary 为 `1.23–1.27 MB`，高于 product `0.64 MB`、independent `0.58 MB` 与 grid `0.047 MB`。

Per-window p50+p90 Pareto residual labels 为 `8/32` 与 `6/32`，受 timing noise 影响且 replay 不稳定。它们不能被夸大成“32/32 absorbed”，但也不能支持 PASS：两次均未达到 aggregate threshold，且所有 Adult windows 按冻结 above-cap rule 不具 candidate-superiority eligibility，独立 carrier 条件必然失败。STOP 的首要核是 rank/product killer；full-cost 结果是相符的次级负证据。

## Workload、reproducibility 与 claim ceiling

- Same-object：PASS on all completed native streams。
- Natural evidence：两个公开 NYC 月份、固定非易变字段与 deterministic windows；Adult 只形成静态 cap 上界和 censored resource observation。
- Reproducibility：owner manifest 614/614；两次 32-window nonvolatile projection 32/32；exactness adversaries every-boundary/state exact。
- Latest collision：沿用冻结 Stage 0 current-source audit；本 bounded closing 未新增外部检索，也不据此提出新 absence claim。
- Evidence honesty：完整 Adult performance、40-window timing distribution、一般 Arrow lower bound 和一般 algorithm impossibility 均不成立。

Allowed claim 仅为：**在冻结 object/corpus/threshold 下，corrected signature-aware RP-FDP 具有 product-sized representation，无法满足预登记 rank success/product killer，并无法满足 independent-carrier full-cost support；该窄机制停止。**

## Q1/Q2 终审

- Clear problem：是。
- Non-trivial proposed algorithm：是，但自然 compression premise 被冻结 probe 否定。
- Credible current evidence：足以支持窄负结论，不支持正论文路线。
- Executable remaining paper gap：不存在不改变机制的非空 Stage B 路线。
- Q1/Q2 status：`PARITY_NOT_PLAUSIBLE`；冻结机制为 `BELOW_Q2_STOP`。

`PASS` 不成立；`INCONCLUSIVE_POLICY_HOLD` 也不成立，因为 fidelity 已闭合且无需 Adult 完整运行即可由预登记数学上界决定 killer。唯一 revision 已消耗，不允许第二 revision。

## 权限与范围边界

本报告不修改主控、不启动 Stage B、不授权 projects 或自动化。`stageb_user_approval_id=null`。STOP 后若研究新算法、换表示、换 corpus/question 或降低 exactness guarantee，必须使用新 topic ID，不得改名复活本题。

Lane post-handoff state: `IDLE_REUSABLE_AWAITING_MAINLINE`。
