# Source115 S5 exact-upstream fault / negative-replication closure

Only public static source inspection was performed.  No repository, model, test corpus, issue attachment, or binary was downloaded; no build, test, reproduction, or patch was run.  Each issue below was checked against current official documentation, current upstream source, and the relevant default/non-default configuration surface before raw admission.

## RQ01 — llama.cpp hybrid/recurrent prompt-cache failure

- **Issue/reproducer locator:** [llama.cpp issue #21831](https://github.com/ggml-org/llama.cpp/issues/21831), open but labelled `bug-unconfirmed`, reports full prompt re-processing for hybrid/recurrent models on builds `b8025` and `b8769`; it explicitly says the first bad commit is unknown.  Its reported endpoint mixes cache reuse, conversation semantics, and latency.
- **Current documentation and flags:** the [current server README](https://github.com/ggml-org/llama.cpp/blob/master/tools/server/README.md) exposes `--ctx-checkpoints` (default 32), `--checkpoint-min-step` (default 8192), `--cache-ram`, unified-KV, idle-slot caching, `--parallel`, and context-shift controls.  These defaults/non-default flags can alter checkpoint and reuse behavior, so they are part of the exact object rather than incidental launch detail.
- **Current source locus:** [current `tools/server/server-context.cpp`](https://github.com/ggml-org/llama.cpp/blob/master/tools/server/server-context.cpp) and [current server development README](https://github.com/ggml-org/llama.cpp/blob/master/tools/server/README-dev.md) identify `server_slot`/`server_prompt_checkpoint` as the relevant implementation surface.  The public issue does not freeze a current master commit, a current upstream regression test, the exact model architecture/format, or a source-level failing assertion that ties this locus to its report.
- **Contrary evidence:** the documented checkpoint controls and the issue's unknown first-bad commit leave both intended fallback/reprocessing and a distinct current defect plausible.  A historical log line is therefore not sufficient evidence of a current fault.
- **Required same-object endpoint and full cost:** a valid negative-replication packet would have to freeze exact model/format, server commit, request/session sequence, all listed cache/checkpoint flags, correct-output criterion, reuse/latency endpoint, context/KV/host-memory cost, setup/load cost, and a current failing test or deterministic trace.  None is frozen together.
- **Finite stop:** one issue, current official server documentation, and the current source/development loci were boundedly inspected.  Do not search for or invent a replacement reproducer in this assignment.
- **Disposition:** `PRE_RQ_NONADMISSION__CURRENT_COMMIT_TEST_AND_SAME_FUNCTION_ENDPOINT_UNFROZEN`.

## RQ02 — OpenVINO GenAI long-prompt prefix-cache zero-output report

- **Issue/reproducer locator:** [openvino.genai issue #4047](https://github.com/openvinotoolkit/openvino.genai/issues/4047) reports zero output with `ContinuousBatchingPipeline` and `enable_prefix_caching=True` on long prompts for several June nightly revisions; the issue page is closed through `#4050`.  Its reported branch head is `f917bfda4dc`, not an identified current source revision.
- **Current documentation and flags:** the [current `SchedulerConfig` documentation](https://docs.openvino.ai/2026/api/genai_api/_autosummary/openvino_genai.SchedulerConfig.html) describes `enable_prefix_caching`, `cache_size`/`num_kv_blocks`, `dynamic_split_fuse`, and `cache_interval_multiplier`.  The latter is now adaptive for linear-attention state size, while larger values trade cache memory against reuse and `0` is valid only with prefix caching disabled.  This materially changes the configuration surface relative to the issue's under-specified current-state premise.
- **Current source locus:** [current `block_manager.hpp`](https://github.com/openvinotoolkit/openvino.genai/blob/master/src/cpp/src/continuous_batching/cache/block_manager.hpp) constructs `BlockAllocator`/`BlockManager` with `enable_prefix_caching`, records cache block tables, and constrains latest-prefix restoration to prefix caching.  [Current upstream usage documentation](https://github.com/openvinotoolkit/openvino.genai/blob/master/src/README.md) exposes `SchedulerConfig` as the continuous-batching configuration route.
- **Contrary/current result:** the issue's old nightly plus closed status cannot establish that the current source retains the same fault; current documentation adds decision-relevant cache-interval behavior.  The available static sources also do not provide an exact current failing test/commit/output oracle for the claimed zero-token endpoint.
- **Required same-object endpoint and full cost:** exact current commit and model IR/tokenizer revision; prompt/session bundle; `enable_prefix_caching`, `cache_interval_multiplier`, cache-budget, batching and split-fuse settings; output-validity oracle; cold/warm prefill and generation latency; device/host KV memory; and setup/compile/load accounting.  Without those, a proposed cache action would be a configuration guess or local patch.
- **Finite stop:** bounded issue → current official docs → current source/usage loci closure.  The unresolved mapping is not treated as a scientific failure or absence result.
- **Disposition:** `EXCLUDED_BEFORE_RAW__CLOSED_OLD_NIGHTLY_REPORT_WITH_CURRENT_CONFIGURATION_AND_CURRENT_TEST_UNFROZEN`.

## RQ03 — ExecuTorch dynamic-shape report

- **Issue/reproducer locator:** [ExecuTorch issue #3636](https://github.com/pytorch/executorch/issues/3636), closed, is a 2024 toy `Add` export/runtime report.  It neither defines a KV-cache object nor a scale/online decision endpoint.
- **Current documentation and source:** the [current export tutorial](https://github.com/pytorch/executorch/blob/main/docs/source/tutorials_source/export-to-executorch-tutorial.py) uses the `Dim` API and shows a range-constrained dynamic-shape export and legal in-range calls.  The [current XNNPACK partitioner documentation](https://docs.pytorch.org/executorch/stable/backends/xnnpack/xnnpack-partitioner.html) states that operators support dynamic input shapes unless otherwise noted, and the [current FAQ](https://docs.pytorch.org/executorch/stable/using-executorch-faqs.html) attributes bounded-tensor resize errors to export bounds/input mismatch and directs users to specify bounds.
- **Default/non-default configuration check:** current dynamic behavior depends on the export's explicit `dynamic_shapes`/`Dim` bounds and backend operator constraints; the closed issue's environment and guard range are not a current exact configuration.  The current main tutorial itself is a source-level, executable-contract counterexample to the broad old premise.
- **Full-cost and endpoint:** no frozen model, backend, device, shape distribution, same-function oracle, current test failure, repair action, or decision-changing negative endpoint exists.  Compilation/export time, runtime memory, fallback/delegation behavior, and output equivalence would all be decision-relevant if a carrier were later frozen.
- **Finite stop:** bounded historical issue plus current official main/tutorial/backend/FAQ closure; no new issue or carrier will be substituted after this result.
- **Disposition:** `EXCLUDED_BEFORE_RAW__CLOSED_TOY_ISSUE_AND_CURRENT_DYNAMIC_SHAPE_CONTRACT_NOT_SAME_OBJECT`.

## Denylist and current-union boundary

- The Source114 denylist entries concern simulator/estimator/admission/theory identities, not these distinct fault-object checks.  They are therefore `RELATED_ONLY`, not an exact-repeat basis.
- No item above establishes a global absence, a direction-level STOP, a deployment conclusion, or a claim that a current upstream defect does not exist.  They only show that the frozen RQs lack the required current same-object fault contract for raw admission.

## Funnel result

`offline_seed=4; provisional_RQ=3; valid_selected_RQ=0; pre_RQ_nonadmission_or_excluded_before_raw=3; raw=0; deep=0; clean_brief=0`.

`COMPLETE_ZERO_PROPOSALS__CURRENT_UPSTREAM_FAULT_CONTRACT_UNFROZEN_OR_SUPERSEDED`.
