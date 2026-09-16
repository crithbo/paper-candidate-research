# CUDA/GPU Discovery Wave 27

Discovery-only batch, 2026-08-02. It starts from parallel-algorithm and theory gaps—not CUDA API behavior. Fourteen non-synonymous objects were screened against public implementations/benchmarks. Only `GPU-APSPGEMM-ROWCERT` retains a paper-kernel residual and therefore owns a Stage 0 proposal directory. No GPU experiments, downstream directories, or control-file changes were made.

Historical exclusions applied: ragged radix top-k, set intersection, segmented carry/reduction, dynamic BFS repair, and reproducible reduction are not reintroduced under a new name.
