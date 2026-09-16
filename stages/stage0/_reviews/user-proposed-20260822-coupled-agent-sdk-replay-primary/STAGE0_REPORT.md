# COUPLED-AGENT-SDK-REPLAY-REV0 — Independent Stage 0 PRIMARY

## 中文摘要

- 结论：`REVISE_ONCE`。
- 为什么：冻结 SDK 已有 conversation/event/agent-state fork，但 workspace 仍被共享；CoARSE 的边缘正确性构想可定义，却尚未静态证明它在交替 token、tool、workspace transition 上提供一个非通用、target-specific algorithm/guarantee，而非 Gumbel coupling 与 generic paired statistics 的组合。
- 下一道门：`NATIVE_SDK_COUPLED_BRANCH_TRANSITION__NONPRODUCT_MARGINAL_CORRECTNESS_AND_CONSERVATIVE_FRONTIER_CERTIFICATE`。
- 是否需要用户操作：否；仅由主线投递独立 confirmation。

- Lane id: `STAGE0-BATCH-GATE`
- Assignment id: `STAGE0-P4-20260822-COUPLED-AGENT-SDK-REPLAY-PRIMARY`
- Input freeze SHA-256: `116432C5ABB4432D96CCDB8CDB12866649967B70BF923EED8A43599059088FB4`
- Cross-assignment contamination declaration: 未读取任一旧 CoupledAgentReplay 科学复审，也未读取/复活 PatchYield 或 PatchValue。
- Decision: `REVISE_ONCE`
- Quality tier: `TIER_B_Q2_VIABLE` only if the sole gate closes; current `STRUCTURAL_PAPER_POTENTIAL=CONDITIONAL_TIER_B`.
- Confidence: `0.69`
- Evidence ceiling: `E1_STATIC_SOURCE_PREFLIGHT__SEARCH_BOUNDED_OPEN__NO_CLAIM_BEARING_RESULT`
- Novelty route: `N2` (agent-level coupling algorithm)
- Stage semantics: 条件性论文潜力审查，未建立任何效果、方差节约或性能结果。

## Structural paper potential vs current readiness

若算法能给出交替 SDK transition 下的 marginal-correctness induction、明确 fallback、非平凡 direct-effect/variance-frontier 性质和完整成本比较，固定 16 个真实 SWE-bench state 也可形成可信 Q2 的 measurement/method paper。现有 readiness 为静态 source preflight：冻结 SDK 与 Qwen config 可审计，模型采样/分支恢复尚未执行。缺实现、硬件或正结果不是 STOP；本题目前的缺口是方法 kernel 的形式闭合。

## Frozen object and claim

冻结 object 是 OpenHands SDK `ddac55697…092a`、Qwen2.5-Coder-7B-Instruct `c03e6d…e242`、SWE-bench Verified 16-task list、首次 native tool observation 之后且下一模型调用之前的 state boundary。I0/I1 是 pre-evidence freeze 中字节冻结的两个 native prompt interventions；decoder 为 `temperature=0.6, top_p=0.95, top_k=0`，native terminals absorbing，hidden evaluator online invisible。

可接受主张仅为：在该 object 上，CoARSE 用共同 Gumbel exogenous field 对两臂各自 logits sampling，并对 token/tool/workspace transitions 施行 keep-shared/split/fallback，条件性保持每臂 native marginal，估计 `E[Y(I1)-Y(I0)]`。不主张通用 agent causality、任意模型、生产部署或已证实的 variance/sample gain。

## Current source / same-object audit

冻结 `LocalConversation.fork()` 通过 JSON round-trip 复制 agent、复制 events 并 deep-copy `agent_state`，但以 `workspace=self.workspace` 创建 fork；metrics 可 reset 或 copy。`ConversationState` 还含 workspace reference、event log、persisted `agent_state`、execution state 与 file store。故 native SDK fork 是强同对象基线，却不能作为两条 mutable filesystem/process/tool 分支的 SUTVA 证明。

冻结 Qwen config 指明 `Qwen2ForCausalLM`、vocab 152064、`transformers_version=4.44.0`；官方 Transformers generation 文档的 sampled generation/score route足以表明有限 public logits/sampling adapter 的存在。它不等于已经实现或运行 common-Gumbel sampler。

## Named baselines and fairness contract

1. independent real branch rollouts：同 object、独立 noise 的正确 marginal estimator；
2. current SDK `fork()` + per-branch external copy/reset：native action baseline；
3. CAR：SCM intervention/re-execute comparator；
4. Coupled Token Generation / Counterfactual Token Generation：token-level shared-exogenous-randomness comparator；
5. ordinary same-seed, common-random-number paired estimator and a coupled-token-only adapter。

所有可部署比较器获得相同 fixed state、I0/I1、decoder distribution、tool grammar、terminal rule和 16 个固定 tasks。完整成本包括两臂 logits/inference、shared-noise book-keeping、state copy/reset、workspace/process/tool/test、fallback/restart、evaluator、storage/RSS/wall、failed/uncomparable pairs和固定 error 的样本数。不得把同 seed 或 shared prompt 当作 correct coupling，也不得用 hidden evaluator 作分支控制。

## Collision analysis

CAR 是最强 agent-level subtractor：它覆盖 agent SCM intervention 与 stochastic forward replay。因此“分叉并作 paired difference”本身没有 residual。Coupled/Counterfactual Token Generation 覆盖 divergent token sampling 与共享 SCM random field。因此 token coupling 也不是 residual。冻结 source/current union 未在审阅范围内显示同一 SDK object 上，针对 tool/workspace transitions 的 complete keep-shared/split/fallback action plus conditional marginal-correctness guarantee，故不是 `DIRECT_FATAL`；这是 `SEARCH_BOUNDED_OPEN`，不是 absence claim。

若去掉 method name 后只余“common random numbers + copy environment + paired mean”，则直接落入 generic composition，触发修订失败哨兵。唯一可保留的 N2 kernel 是一个可证明、native-transition aware 的 state-coupling automaton：它仅在 conditional byte identity 和 immutability 已被验证时共享，否则分离或以独立合法 continuation 保守 fallback。

### Eight-predicate direct-coverage audit

| Predicate | Independent evidence / locator | Result |
|---|---|---|
| Same object/function/protocol | frozen local SDK sources; CAR/token papers are broader/different level | FAIL for direct coverage |
| Same scenario/workload | fixed coding state/SWE-bench only candidate | UNKNOWN/PARTIAL |
| Same or weaker information | generic CAR/token work does not establish this SDK state catalog | UNKNOWN |
| Atomic action covered | SDK fork covers conversation action; token work covers Gumbel subaction | PARTIAL |
| Same/stronger legality, quality and guarantee | no inspected source gives tool/workspace keep/split/fallback marginal theorem | FAIL |
| Same non-worse full-cost boundary | full two-branch state-copy/fallback cost absent from subtractors | FAIL |
| Comparable scale/platform/version/config | frozen exact pin/model/task set is narrower | PARTIAL |
| Sufficient full-text/implementation/reproduction depth | bounded source/paper review only | UNKNOWN |

No direct fatal follows because all eight are required. The matrix is a narrowing argument, not a novelty claim.

## Sole revision gate

`NATIVE_SDK_COUPLED_BRANCH_TRANSITION__NONPRODUCT_MARGINAL_CORRECTNESS_AND_CONSERVATIVE_FRONTIER_CERTIFICATE`

The revision must submit one static certificate that simultaneously:

1. maps the frozen native fork catalog (events/agent/agent-state copied; workspace shared; every external process/tool/evaluator field classified copy/reset/read-only/forbidden alias);
2. defines two state containers at the post-tool boundary and a no-cross-branch information rule;
3. pins the public Qwen logits/sampling adapter semantics and proves each branch's Gumbel-Max marginal is its native categorical law after prompt divergence;
4. gives an induction over model token → observation → tool/workspace transition → terminal, with exact keep-shared predicate, split restoration rule and independent-valid fallback;
5. gives either a target-specific direct-effect theorem or a conservative certified frontier/no-gain condition that cannot be reduced to generic paired mean; and
6. fixes a tiny static legality oracle plus full-cost/no-benefit Stage A killer.

Failure sentinel: `STOP__GENERIC_TOKEN_COUPLING_OR_NONISOLATED_SDK_BRANCH`.

## Q1/Q2 paper shape and Stage A killer

The natural carrier is not synthetic: the fixed public coding tasks and first-post-tool states. A Q2 shape requires clear method semantics, same-object full-cost baselines, a state-transition legality witness, variability/no-gain stratification, and honest scope. Q1 potential is not justified yet; current status is `PARITY_CONDITIONAL` for Q2.

The shortest future Stage A preclaim killer is one legal fixed state with two independently writable SDK containers. It must exercise one divergent-logit step, one immutable keep-share decision, one mutable split and one fallback; then statically check per-arm state manifests and sample-law contract before any terminal evaluator call. Kill if state cannot be copied without changing object, any shared mutable alias remains, sampling hook changes marginals, or the theorem reduces to generic coupling/paired statistics. No such work is authorized here.

## Dual-axis score

- Academic value: `44/70` (important and falsifiable, but non-product theorem unresolved).
- AI executability bonus: `22/30` (official source/model routes and bounded static gate; actual evidence requires controlled execution).
- Total: `66/100`.
- AI class: `AI_CORE_CONDITIONAL`; estimated `ai_core_fraction=0.60`.

## Discovery repair vector

`OMITTED_CURRENT_SAME_OBJECT`, `OMITTED_FIRST_PARTY_FEATURE`, `CLAIM_MECHANISM_UNCLEAR`, `EFFECT_OR_GUARANTEE_UNCLEAR`. The correction is material to the gate, but does not alter the independent current decision to `REVISE_ONCE`.
