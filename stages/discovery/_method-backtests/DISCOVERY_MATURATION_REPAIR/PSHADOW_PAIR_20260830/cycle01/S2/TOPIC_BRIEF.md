# DMR-S2-TRANSFORMERS-LAYER-KV-RESIDENCY

## 中文摘要

- 研究机会：未形成。
- 为什么淘汰：Transformers v5.6.2 已实现并公开文档化逐层 KV offload、下一层异步预取，以及滑窗层是否 offload 的选择。
- 下一步：不进入 Stage 0；等待六 lane barrier。

- Status: `DROP`
- Quality tier: `BELOW_Q2_STOP`
- Opportunity origins: `O2`
- Contribution type: `SYSTEM_ARCHITECTURE`
- Discovery claim-pack mode: `OFF`
- Discovery RQ frontend mode: `PRODUCTION`

## Research question

Do current Transformers v5.6.2 layer class, sliding-window and offload semantics leave a per-layer residency/prefetch action beyond whole-cache selection?

## Current collision classification

`DIRECT_FATAL`: official v5.6.2 documentation specifies current-layer GPU residency, asynchronous next-layer prefetch and `offload_only_non_sliding`; the same-tag cache implementation performs per-layer prefetch/offload with the non-sliding selector. The frozen action is already native, so no residual is proposed.

## Non-relaxable quality audit

- Same-object: PASS.
- Latest collision: PASS; current official docs and same-tag source directly absorb the action.
- Strong fair baselines: not reached because raw admission failed.
- Natural input/evidence: not reached.
- Full-cost: not reached.
- Reproducibility: source loci are public and versioned.
- Evidence/claim honesty: no absence or novelty claim is made.

