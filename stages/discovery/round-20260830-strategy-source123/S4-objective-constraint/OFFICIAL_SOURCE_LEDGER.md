# SOURCE123 S4 Official Source Ledger

## Frozen boundary

- Calls: `24/24 search/open`; three in-page `find` operations were used only to locate already-open source text.
- Source policy: official project documentation/source/issues and primary paper pages only for claim-bearing statements.
- Network payload was not persisted to project files; exact connector byte telemetry was unavailable.
- No download, build, experiment, or source-code checkout occurred.

## Claim-critical sources

| ID | Role | Exact source | Verified fact used | Limit |
|---|---|---|---|---|
| V1 | VERSION | https://github.com/vllm-project/vllm/releases | Latest frozen release at lookup was `v0.28.0`, released 2026-08-26, commit short ID `2cf0a69`. | Release page does not by itself establish file-level behavior. |
| V2 | CURRENT / ANCHOR | https://github.com/vllm-project/vllm/blob/v0.28.0/vllm/config/compilation.py | Exact release-tag source exposes `cudagraph_capture_sizes`, `max_cudagraph_capture_size`, modes, warmups, and LoRA specialization. The default size pattern is fixed/dense and comments explicitly identify startup-time and memory pressure. | File-level tag page opened, but the connector did not expose a full commit hash beyond the release commit short ID. |
| V3 | CURRENT | https://github.com/vllm-project/vllm/blob/main/vllm/v1/cudagraph_dispatcher.py | Current dispatcher maps an uncaptured token count upward to a captured size, creates keys for capture sizes crossed with LoRA cases and runtime modes, and falls back to `NONE` outside valid keys. | Exact `v0.28.0` dispatcher page returned a transport internal error; current-main source was read and this exact-tag check remains bounded Stage 0 debt. |
| V4 | CURRENT DOC | https://github.com/vllm-project/vllm/blob/main/docs/design/torch_compile.md | Official docs state that vLLM determines a set of sizes by default and permits users to override it with `cudagraph_capture_sizes`. | Documentation describes mechanism, not optimality. |
| V5 | CURRENT DOC | https://github.com/vllm-project/vllm/blob/main/docs/configuration/conserving_memory.md | Official memory guide says CUDA Graphs consume extra GPU memory and recommends reducing capture sizes or disabling graphs to trade inference speed for memory. | No quantitative curve is supplied. |
| V6 | CURRENT DOC | https://github.com/vllm-project/vllm/blob/main/docs/design/cuda_graphs.md | Official design identifies `CudagraphDispatcher` as the source of truth, lists memory/performance/capture-time modes, and notes that `FULL_AND_PIECEWISE` is generally fastest but uses most memory and capture time. | Mode selection is adjacent to, not identical with, size-set selection. |
| V7 | CANONICAL CARRIER | https://docs.vllm.ai/en/stable/benchmarking/cli/ | Official benchmark supports ShareGPT, BurstGPT and reproducible random datasets; it labels the built-in harness as feature/regression oriented and recommends GuideLLM for production benchmarking. | Canonical benchmark evidence cannot be generalized automatically to production. |
| V8 | CANONICAL CARRIER SOURCE | https://docs.vllm.ai/en/latest/api/vllm/benchmarks/datasets/datasets/ | Official dataset API includes `BurstGPTDataset`, `ShareGPTDataset`, deterministic `RandomDataset`, and timed-trace support. | Dataset availability does not establish the candidate mechanism. |
| V9 | DIRECT SUBTRACTOR / UPSTREAM CONTRARY | https://github.com/vllm-project/vllm/issues/20098 | The upstream RFC documents that default eager capture can take more than 10 seconds, many graphs may be unused, and proposes lazy capture; discussion explicitly considers keeping one or two eager sizes and reducing the capture set. It was closed as not planned with no linked implementation. | Issue evidence is not peer-reviewed and does not prove absence outside the bounded upstream search. |
| V10 | STRONG SUBTRACTOR | https://arxiv.org/abs/2604.06664 | Foundry materializes CUDA Graph execution context offline, builds topology templates, specializes other sizes on demand, reports up to 99 percent cold-start reduction, preserves serving throughput, and records a substantial archive footprint. | Different action/assumptions: offline SAVE/LOAD, deterministic allocation and stored archives; not a drop-in current vLLM size-set selector. |
| V11 | METHOD ADJACENT | https://arxiv.org/abs/2501.09398 | A primary CUDA Graph study models creation overhead versus replay benefit for iterative applications and finds an optimal iteration batch size. | Different object and action; warns that generic overhead/replay optimization is not novel by itself. |

## Verification classification

- `V1–V8`: first-party project source/documentation, current and claim-critical; discipline-relative Grade A for implementation facts, not for scientific novelty.
- `V9`: first-party issue/RFC, Grade B/C gray evidence; usable as current-union and contrary evidence only.
- `V10–V11`: primary paper/preprint pages; existence and contents verified at official arXiv pages. Venue/peer-review status was not established.
- No source is used to assert global novelty. Final collision class is `SEARCH_BOUNDED_OPEN` with a strong direct subtractor and a strong orthogonal paper subtractor.

## Current-upstream reality result

The exact current configuration surface and dispatcher action exist. The bounded official-source search found a fixed heuristic/default, manual override, padding/fallback dispatch and adjacent/lazy alternatives, but no integrated result-independent optimizer that selects a capture-size portfolio under a joint startup-time, graph-memory and finite-horizon serving-cost contract. This is an absence-within-bound statement only.

