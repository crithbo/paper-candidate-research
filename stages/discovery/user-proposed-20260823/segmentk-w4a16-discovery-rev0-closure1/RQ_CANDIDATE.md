# Discovery Research Question Candidate — SEGMENTK-W4A16

## Identity

- RQ candidate ID: `RQ-S6-SEGMENTK-01`
- Discovery lane / assignment: S6 / `DISCOVERY-S6-20260823-SEGMENTK-W4A16-DISCOVERY-REV0`
- Divergence seed: `S6-SEGMENTK-01` in `DIVERGENCE_SEED_POOL.md`
- Tentative public object: vLLM v0.26.0 dense M=1 GPTQ-sequential W4A16,
  target gfx1151, uint4b8 symmetric `G=32`, FP16 activation/scale/output and
  FP32 accumulation.
- Exact anchor: vLLM commit `568afb3a13806beb53bb2e6bd518269357b237c0`;
  `triton_w4a16.py` blob asserted in the assignment as
  `bc0a587b676309da6c3c4d63e092086ee7a5f78e`.
- Stable envelope: same packed layout, output, numeric contract and target;
  no cross-vendor requirement.
- Decision consequence: determine whether a *new Topic* may be created.  This
  assignment cannot make a raw or Stage 0 decision.

## Primary RQ

For the exact gfx1151 dense M=1 W4A16 object, does a `BLOCK_K∈{64,128}`
segment-staged per-group metadata pipeline remain outside all current dense,
MoE and RDNA-hybrid vLLM actions, with a local scale/nibble/coverage invariant
and a plausible static cost frontier?

## Scope and answerability

- In scope: source-visible grouped-scale loading, K-tile width, metadata
  staging, packing/nibble mapping, tails and default/native scheduling.
- Out of scope: QGroup guard/repair, QRefine, new Topic creation, autotuning,
  kernel execution, local IR production, models and cross-vendor claims.
- Minimum source route: official tagged dense kernel plus the named RDNA hybrid
  source; comparator paths only where a same-object tuple is source-visible.

## Pre-evidence selection

- Selected for evidence lookup: `YES`
- Primary route: official vLLM tagged source pages/raw views for the exact two
  named files; official vLLM release/tag metadata for commit binding.
- Fallback: transport-only GitHub tag page, not a mirror or unpinned branch.
- Alternative/null: current code either clamps `BLOCK_K` to `G`, or already
  stages multiple groups at the proposed granularity.
- Forbidden outcome-aware reformulation: do not replace `G=32`, M=1, gfx1151,
  GPTQ sequential packing or the proposed segment action after inspection.

## Pre-RQ closure nomination

- Nomination: `ORDINARY_CLOSURE`
- Requested model route: `TERRA_HIGH_ORDINARY`
- Packet result: `NOT_RUN` at card creation; final outcome is recorded in the
  investigation report, not treated as raw.
