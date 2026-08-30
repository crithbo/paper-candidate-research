# Source116 S5 merged-patch / test-lineage residual closure

Static public-source closure only.  No source tree, model, trace, test artifact, or patch was downloaded; no build, experiment, reproduction, or local patch was run.  A merged patch is treated only as a locator, never as novelty or proof of a current residual.

## RQ01 — llama.cpp checkpoint-lineage residual after merged PR #19408

- **Merged patch locator:** [llama.cpp PR #19408](https://github.com/ggml-org/llama.cpp/pull/19408), `server: improve context checkpoint logic`, merged one commit into `master` on 2026-02-08.  The PR identifies merged commit `eb449cd`, references the earlier failure #19394, and describes the intended scope as recurrent/OpenCode-friendly checkpoint logic.
- **Parent/current source and flags:** the accessible current [server README](https://github.com/ggml-org/llama.cpp/blob/master/tools/server/README.md) defines `--ctx-checkpoints` (default 32), `--checkpoint-min-step` (default 8192), `--cache-ram`, unified-KV, idle-slot-cache, parallel and context-shift controls.  The current [server context source](https://github.com/ggml-org/llama.cpp/blob/master/tools/server/server-context.cpp) is the relevant implementation locus.  These flags determine whether a cache/checkpoint effect is expected or an actual residual.
- **Test / residual closure:** PR metadata provides checks but no frozen parent revision, changed test path, current test identity, or current same-object failing endpoint in the accessible public material.  A later issue or historical log cannot fill those missing fields, because Source115 explicitly excludes issue-only or old-release fault claims.
- **Full-cost and finite falsifier required:** exact model/format, parent/current commits, a patched test plus current regression test, session/request sequence, all checkpoint/cache flags, output-equivalence oracle, warm/cold prefill and decode time, KV/host memory, and load/setup cost.  A current test reproducing the same endpoint under that fixed tuple would falsify the residual premise; none is frozen here.
- **Disposition:** `PRE_RQ_NONADMISSION__MERGED_PATCH_PRESENT_BUT_PARENT_CURRENT_TEST_AND_SAME_OBJECT_RESIDUAL_UNFROZEN`.

## RQ02 — vLLM hybrid prefix-cache / PD lineage

- **Candidate lineage locator:** [vLLM issue #46453](https://github.com/vllm-project/vllm/issues/46453) names merged PR #44243 as the origin of a per-group Mamba prefix-hit path and contrasts it with an open follow-up.  This is only a locator: the issue does not freeze the merged PR's parent, merge commit, changed test or a current commit.
- **Current source/test and contrary:** the current [hybrid KV-cache design](https://github.com/vllm-project/vllm/blob/main/docs/design/hybrid_kv_cache_manager.md) specifies that prefix hits are intersected across groups, documents the limited supported hybrid cases, and says Mamba prefix support remains work in progress.  Current [scheduler tests](https://github.com/vllm-project/vllm/blob/main/tests/v1/core/test_scheduler.py) exercise prefix-caching and scheduler behavior.  These sources establish a current configuration/test surface but do not bind it to one merged #44243 patch test or to a fixed current fault endpoint.
- **Default/non-default flags and full cost:** the object would need exact model architecture, prefix-cache enablement, KV connector/PD role, per-group cache state and eviction pressure, batching/token budgets, plus output equivalence, request completion/failure, CPU/GPU KV memory, transfer, prefill/decode and queue costs.  The available locator omits this reproducible tuple and cannot distinguish a generic hybrid-cache design limitation from a residual beyond the patch.
- **Finite stop:** the merged-patch endpoint and changed test were not retrievable as an auditable first-party pair; the public current docs/test loci were inspected as the contrary/current route.  No new RQ or substitute patch will be introduced after this result.
- **Disposition:** `PRE_RQ_NONADMISSION__MERGED_PATCH_PARENT_CHANGED_TEST_AND_CURRENT_EXACT_ENDPOINT_UNFROZEN`.

## RQ03 — SGLang tree/radix-cache candidate

- **Candidate patch locator:** [SGLang PR #26836](https://github.com/sgl-project/sglang/pull/26836) proposes throttling an idle-time tree-cache sanity check and supplies a local test claim, but its current status is **Open**, not merged.  Its CI entries were not passing in the inspected page.
- **Contract failure before raw:** Source116 requires an exact *merged* patch plus parent/current source and changed test.  An open PR, however plausible its root-cause narrative, cannot satisfy the anchor contract; treating it as merged would also violate the no issue-only/local-patch route.
- **Current residual/full-cost boundary:** no merged commit, parent/current test lineage, current config/default flag set, same-function output endpoint, or full cost tuple was frozen.  Therefore no robustness action or fault claim is admissible.
- **Disposition:** `EXCLUDED_BEFORE_RAW__PATCH_NOT_MERGED__NO_PATCH_LINEAGE_ANCHOR`.

## Scope, denylist and result

- The initial offline list was mechanically corrected before any source lookup so its three evidence routes are exactly `llama.cpp`, `vLLM`, and `SGLang`, as frozen by `anchor_portfolio`.  No off-portfolio source was used in the closure.
- The Source115 denylist holds generic issue-only, old-release and generic negative-replication identities.  Each selected route was distinct as a prospective patch lineage, but failed independently before raw; no exact repeat or STOP inference is asserted.
- A8 was not read.  Neither this closure nor the zero result is a global claim that no residual exists.

`offline_seed=4; provisional_RQ=3; valid_selected_RQ=0; pre_RQ_nonadmission_or_excluded_before_raw=3; raw=0; deep=0; clean_brief=0`.

`COMPLETE_ZERO_PROPOSALS__MERGED_PATCH_TEST_LINEAGE_OR_CURRENT_RESIDUAL_NOT_CLOSED`.
