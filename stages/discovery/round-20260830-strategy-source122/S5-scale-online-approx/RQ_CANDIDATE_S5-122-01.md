# RQ candidate S5-122-01

- Assignment: `DISCOVERY-S5-20260830-SOURCE122`
- Seed: `S5-122-01`
- Exact anchors: PyTorch recompilation docs, dynamic-shape docs, `torch/_dynamo/cache_size.py`, `convert_frame.py`, and Inductor `codecache.py` at current `main`/stable docs as of 2026-08-30.
- Stable object: one TorchDynamo frame's guarded compiled-code cache whose entries dispatch to Inductor artifacts.
- Immutable semantics: current PyTorch observable outputs/exceptions/side effects subject to the same guard legality; no approximate computation.
- Primary RQ: Can an online guard-implication-aware admission/compaction policy minimize cumulative compile + execution + artifact-memory cost by choosing static, symbolic-generalized, covered-entry retirement, or eager fallback better than current automatic-dynamic and fixed-limit policies?
- Contribution hypothesis: `COMPILER_TOOL / METHOD_ALGORITHM`, `N2`.
- Information contract: only prior signatures, guards, measured compile/runtime costs, artifact sizes, and current input signature; no future trace.
- Comparator set: PyTorch default automatic dynamic shapes; fixed recompile limits/eager fallback; `set_stance` modes; static-only and dynamic-from-start baselines; offline oracle ceiling.
- Full-cost boundary: compilation wall time, executed kernel/runtime time, guard dispatch overhead, code/cache bytes, CUDA Graph recording/pool bytes when enabled, and fallback execution.
- Minimum witness: a small exact frame with two shape dimensions whose guards create overlapping/covering specialization regions and whose static/dynamic artifacts have distinct cost profiles.
- Minimum falsifier: current source already implements guard-region coverage admission/retirement, or no safe same-semantics coverage relation exists.
- Pre-evidence selection: `YES`.
- Pre-RQ closure: `ORDINARY_CLOSURE`; nomination `NONE`.
- Disposition before evidence: `RQ_READY_FOR_ORDINARY_CLOSURE`.

