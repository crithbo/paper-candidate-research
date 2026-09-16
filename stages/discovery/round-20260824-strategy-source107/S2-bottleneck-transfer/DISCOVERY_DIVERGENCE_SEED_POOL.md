# Source107 S2 seed pool

Offline, non-evidence seeds: (1) torch.compile/CUDA Graph capture can shift overhead to cache/static-shape memory; (2) vLLM graph capture can shift kernel savings to host/capture lifecycle; (3) a fixed graph-replay policy might require a non-generic full-cost action. Selected pre-lookup RQ: on one version-pinned PyTorch/vLLM carrier, does a legal capture/cache action survive current native graph/cache controls and change request-level full cost? No result-aware replacement is allowed.
