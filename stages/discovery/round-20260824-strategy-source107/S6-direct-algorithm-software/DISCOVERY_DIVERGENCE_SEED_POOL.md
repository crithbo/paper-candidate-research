# Source107 S6 Offline Seed Pool

Public single-GPU compiler/runtime artifacts only; CRFEPOCH Stage0/chat and group repository remain excluded.

| Seed | Carrier | Hypothesis | Risk |
|---|---|---|---|
| S6-107-01 | TorchInductor | target-native dynamic-shape kernel-plan construction beyond guard/cache selection | existing symbolic-shape/compile cache |
| S6-107-02 | Triton | legality-preserving irregular reduction/tile construction | current autotuning/tail masking |
| S6-107-03 | PRIVATE_TOOLCHAIN Stream | shared asynchronous resource construction for one fixed compiler/runtime path | native stream scheduling union |
| S6-107-04 | TVM MetaSchedule | nontrivial online reuse with a distinct quality/full-cost guarantee | structural-hash database reuse |
| S6-107-05 | Torch compile/CUDA graph | state transition construction outside graph capture/compile cache | generic cache lifecycle |
| S6-107-06 | MLIR/PRIVATE_TOOLCHAIN layout lowering | cross-dispatch layout action with exact semantic witness | ordinary fusion/transform propagation |

Selected before lookup: S6-107-01..04. These are non-evidence seeds; no external lookup preceded this file.
