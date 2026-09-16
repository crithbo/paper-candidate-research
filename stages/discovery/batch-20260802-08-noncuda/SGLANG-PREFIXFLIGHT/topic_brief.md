# SGLANG-PREFIXFLIGHT — Deadline-aware prefix-cache retention with prefill/decode interference accounting

- Status: `PROPOSE_STAGE0`
- Primary lane: LLM serving / runtime scheduling
- Discovery date: 2026-08-02

## Research question

在 SGLang RadixAttention 的页粒度 prefix cache 中，能否以请求 deadline、可复用 token 量和预填充—解码干扰为共同成本，联合决定 prefix 保留/逐出与 batch admission，使同等吞吐或 SLO 下的 p99 优于可用的 LRU/LFU/priority eviction 与 prefix-aware scheduling union？

## Importance and group fit

前缀复用是 agent/RAG、多轮服务的自然工作负载；SGLang 已提供 radix cache、页对齐、多个 eviction policy、continuous batching 和 prefill/decode disaggregation。缺口假设是现有逐出只看 cache 价值，而 admission 只看当前排队优先级，未把“保留 prefix 将减少未来 prefill 但占用可服务 decode 的 KV pages”放进同一 deadline ledger。

## Exact object

固定版本的 SGLang runtime RadixCache；请求输入为公开 ShareGPT-style conversation traces（tokenize 后冻结）和公开模型。每一调度 epoch 的动作是：对完整 page-aligned prefix 选择 retain/evict，并选择接纳的 prefill/decode request 集；成本包括 tokenization、KV page 容量、recompute/prefill、scheduler CPU、prefill/decode interference、warm-up 和未命中 fallback。禁止把未对齐 partial page 当成可共享容量。

## Strongest fair baseline

SGLang 现有 eviction options（至少 LRU、LFU、priority）+ 原生 prefix-aware scheduling；加上 matched cost-aware retention-only 与 admission-only 控制器的 union。所有方法相同 page size、KV budget、模型、trace、batch/SLO、prefix hash 和预热边界。

## Mechanism hypothesis

cache entry 的价值不等于预计命中 token 数：当 decode deadline 紧时，保留大 prefix 会通过 KV page pressure 拉高 p99；当 queue 中的 sibling prefix 即将到达时，保留又能减少 prefill。一个以“未来可免 prefill—当前 decode stall”的边际差为信号的联合 lease/admission 机制应只在二者冲突时改变决策。

## Competing mechanisms

- Mechanism A: deadline-aware prefix lease + admission 的联合边际账本；特异预测是高共享但 deadline 紧的 prefix 被逐出，而低共享的 decode 仍获准入。最强反例：hit-count/size 已完全排序所有动作。
- Mechanism B: retention-only（LRU/LFU/size or reuse-cost aware）；特异预测只改变 victim，不改变当前 batch。
- Mechanism C: admission-only prefix-aware priority；特异预测只改变 batch，不保留不同 cache state。
- Preferred mechanism and why: A 的收益需在 B+C union 后仍存在，故可以避免把 cache policy 与 scheduler 拼接误报为贡献。

## Candidate paper claim

在公开多轮对话 trace 与冻结 page/KV/SLO 合同下，prefix 的 deadline-aware lease 与 admission 联合决策产生可重复的 token-reuse—decode-p99 Pareto 点；收益由 prefill savings 与 KV pressure 的反向作用共同解释。

## Current collision subtraction

`SEARCH_BOUNDED_OPEN`。SGLang 已覆盖 radix prefix sharing、page alignment、若干 eviction 选项和 prefix-aware scheduling，构成强 deployment baseline；本提案不声称 prefix caching 首创。Stage 0 必须用近期 prefix-cache / cache-aware scheduling 文献核验是否已有同一联合 ledger 与相同成本边界；如有则 `DIRECT_FATAL`。

## Decisive falsifier

在一个冻结自然 trace 上，matched B+C union 已达到与 A 无显著差异的 p99/throughput Pareto，或 A 的决策能由单一 eviction/ranking 独立表达，则停止。

## Executable evidence path

SGLang 开源 runtime 已暴露 RadixCache、排队策略与命令行 cache policy。可从 tokenized trace replay 建立离散事件 simulator，先由 simulator 复现策略排序；仅在可用平台时再用 runtime 进行小规模确认。

### 72-hour first evidence

从公开 trace 截取混合共享率子集，记录原生 runtime 或 faithful queue simulator 的 page occupancy、matched tokens、prefill/decode service time；实现 A/B/C 并做一组 page budget sweep。第一证据为 union 之后的 order inversion 或其缺失。

### AI core fraction and critical path

`ai_core_fraction: 0.78`。AI 可完成 trace normalization、token replay、策略 simulator、账本和统计；真实多 GPU 扩展不是决定性首证据。`AI_CORE_EXECUTABLE`。

### Semantics-preserving open alternatives

可先用单机公开模型/trace 与离散事件模型验证决策机制；任何真实 runtime 结果要明确区分 simulation 与 measured serving。

## Dual-axis score

- Academic value: `55/70`（重要性 13/15；headroom 11/15；机制 15/20；推广性 10/12；独立性 6/8）
- AI executability bonus: `26/30`（artifact 7；核心 7；本机路径 6；72h 3；重放 3）
- Total: `81/100`

## AI and researcher boundary

AI 可以执行 simulator 级 killer；不得把其结果提升为大规模生产系统或多节点证据，也不得虚构公开 trace 的代表性。
