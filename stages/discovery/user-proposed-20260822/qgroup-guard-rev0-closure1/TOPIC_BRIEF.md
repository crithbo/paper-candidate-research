# QGROUP-GUARD-REV0 — grouped W4A16 schedule guard closure

## 中文摘要

- 研究机会：检验 grouped-W4A16 GEMV 的 K tile 是否会以错误 scale/zero metadata 解量化。
- 为什么可能值得做：若原生路径允许跨 group 的单 metadata-row tile，验证并修复该映射可形成同对象 correctness-first kernel constructor。
- 为什么淘汰：vLLM `v0.26.0` 的精确 Triton W4A16 路径已验证 K/组的合法性、以 tile 起点导出组索引，并在 tile 大于组时 clamp `BLOCK_K`；这正是题设原子 guard/repair 和同函数保证。
- 下一步：不创建 Stage0；以后只有固定新对象、不同原子多组 tile action、以及外部证据增量时才可作为新题提出。

- Status: `DROP`
- Quality tier: `BELOW_Q2_STOP`
- Opportunity origins: `OTHER_EVIDENCE_BACKED_ORIGIN`
- Domain tags: vLLM, Triton, W4A16, grouped quantization, compiler-kernel correctness
- Contribution route: `N2` (proposed, then absorbed)
- Discovery date: 2026-08-22
- Discovery method revision: v8.7 canonical
- Discovery claim-pack mode: `OFF`
- Discovery RQ frontend mode/revision: `OFF`
- Opportunity family ID: `QGROUP-GUARD-REV0`
- Contribution type: `COMPILER_TOOL`
- Local audit coordinates: `A3`, `C0`, `D1`, `E1_STATIC_PREFLIGHT`
- Discovery divergence seed ID/path: `S6-QGROUP-01`; `DIVERGENCE_SEED_POOL.md`
- Discovery RQ candidate ID/path: `RQ-QGROUP-01`; `RQ_CANDIDATE.md`
- Discovery question card ID/path: `QC-QGROUP-01`; `QUESTION_CARD.md`
- Front-end disposition before deep review: `NOT_EVIDENCE_QUALIFIED_RAW__DIRECT_CURRENT_UNION_ABSORPTION`
- Carrier kind: `IMPLEMENTATION_CARRIER_ONLY`

## Research question

After the current clamp and current native union, is there a distinct
same-object metadata-map verifier/repair with a target-specific finite
guarantee? **No.** The exact producer already enforces the requested invariant.

## Canonical research claim package

- Exact object and contract: a fixed grouped-W4A16 packed GEMV (`K` divisible
  by `G=128`) with identical output and metadata semantics.
- Natural/canonical scenario: public vLLM GPTQ/compressed-tensors W4A16 format
  carrier; no checkpoint is downloaded or executed.
- Intervention and atomic action: proposed tile group-map verification and
  repair of a cross-group tile.
- Named comparator: vLLM `v0.26.0` `TritonW4A16LinearKernel` and its WNA16
  loader/format path.
- Expected guarantee: each weight obtains its logical scale/zero group.
- Full-cost boundary: static schedule/analysis plus compile, code size, kernel
  runtime, occupancy and traffic were the required denominators had a residual
  remained; no competing constructor survives to price.
- Minimum falsifier: current source's group-index mapping plus clamp.
- Claim ceiling: source-level structural disposition only; no performance or
  fault measurement is claimed.

## Current collision classification

`DIRECT_FATAL: YES` — current vLLM code establishes same object, action,
legality endpoint and non-worse direct native realization.  The source makes
one group row per K tile and clamps a too-wide `BLOCK_K`; configuration checks
also reject unsupported/divisibility-violating instances.

`SEARCH_BOUNDED_OPEN: YES` for a hypothetical different multi-group tile
kernel, but it is outside this frozen guard/repair action and provides no
admissible residual here.

## Decisive falsifier

The exact tagged source comment explains that a tile larger than its group
would use the wrong scale row, and immediately clamps the tile to the group
size.  This is the candidate's proposed repair, already executable in the
current native union.

## Executable evidence path

### Current upstream reality check

- Checked tag: `v0.26.0` / release commit locator `568afb3`.
- Actual source: `triton_w4a16.py` and `compressed_tensors_wNa16.py`.
- Default/nondefault dimensions checked: group size, K/N shape, zero-point
  representation, `g_idx`, activation dtype, platform and tile selection.
- Contrary evidence: W4A16 issue reports are locator-only and are not used as
  a claim of absence or of this exact failure.

### Fidelity closure plan

- Status: `STRUCTURALLY_UNCLOSABLE` for this candidate, because the claimed
  atomic action is already in the native comparator.
- No Stage A plan is warranted; no resource failure, missing implementation,
  or missing result was used to reach this result.

## Non-relaxable quality audit

- Same-object: pass; exact grouped W4A16 linear-kernel semantics retained.
- Latest collision/current union: pass; official tag source directly absorbs.
- Strong fair baseline: pass; stock vLLM native path, with MLIR and CAKE as
  semantic/methodological subtractors.
- Natural input/evidence: limited to public format/source carrier; no natural
  performance assertion is made.
- Full-cost: no residual constructor remains; prospective denominator frozen.
- Reproducibility: exact source URLs and tag supplied; no execution required.
- Evidence/claim honesty: no absence, bug-count, or resource inference.
