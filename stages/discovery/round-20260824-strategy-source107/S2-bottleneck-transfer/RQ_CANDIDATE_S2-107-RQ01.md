# Discovery Research Question Candidate

- Assignment/lane: `DISCOVERY-S2-20260824-SOURCE107-SINGLE-GPU-LLM-SOFTWARE-V1` / `DISCOVERY_S2`
- Seed: `S2-107-01` in `DISCOVERY_DIVERGENCE_SEED_POOL.md`.
- Exact public anchors, retrieved 2026-08-24: PyTorch `torch.compile` stable API (`https://docs.pytorch.org/docs/stable/generated/torch.compile`), CUDA Graph API (`https://docs.pytorch.org/docs/stable/generated/torch.cuda.graph.html`), and CUDA Graph Trees (`https://docs.pytorch.org/docs/stable/user_guide/torch_compiler/torch.compiler_cudagraph_trees.html`).
- Stable object/guarantee: one version-pinned PyTorch CUDA inference function; identical outputs and legal capture semantics.
- Frozen primary RQ: Can a legal `torch.compile`/CUDA-Graph capture-cache action reduce request-level full cost (capture, graph/cache workspace memory, recompile/guard, host and replay) beyond current native controls for a fixed single-GPU LLM software carrier?
- Precommitted primary route: PyTorch first-party API/source documentation. Fallback: matching official versioned PyTorch documentation.
- Closure result: `EARLY_FATAL__CURRENT_NATIVE_DIRECT_COVERAGE`; no alternate RQ authorized.
