# Reproduce the resource state

Use only absolute paths recorded in `COMMAND_LOG.md`. First verify `HASH_MANIFEST.sha256`, then compare `TOOL_MANIFEST.tsv` and `SOURCE_ASSET_MANIFEST.tsv`. Run each verified tool from `verified/tools` with that directory prepended only to the child process environment so the three registered DLLs resolve.

The successful natural small-witness route uses exact Clang in HIP device-only mode, the compiler-owned `__clang_hip_runtime_wrapper.h`, the local official HIP/CLR include sysroot, GFX1100, O3 and no device library. Exact `llc` emits MIR with `--stop-before=machine-scheduler`; the four parity commands replay identical MIR with `--start-before=machine-scheduler --stop-after=greedy,2 --verify-machineinstrs`, explicit wave32 and the frozen flags.

Do not treat this reproduction as authorization to run the corpus probe. The natural-set gate remains failed.
