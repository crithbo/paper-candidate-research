# SOURCE_COLLISION_MATRIX

| Evidence role | First-party source | Frozen fact | Consequence |
|---|---|---|---|
| Paper direct subtractor | [Inside VOLT, CC'26 / arXiv](https://arxiv.org/abs/2511.13751) | VOLT centralizes SIMT analyses and optimizations in the middle end and supports host-runtime/ISA extensions. | Blocks a restatement of SIMT lowering as new N1/N2. |
| Current compiler upstream | [VOLT master](https://github.com/vortexgpgpu/Volt) | End-to-end OpenCL/CUDA front ends through PoCL/CuPBoP, LLVM-Vortex and Vortex; test carriers are published. | Freezes the compiler action union. |
| Current runtime/ISA upstream | [Vortex master](https://github.com/vortexgpgpu/vortex) | Full stack provides runtime/drivers and selectable simulator/RTL/FPGA backends; VOLT is the declared toolchain. | Prevents comparison to a partial compiler-only baseline. |
| Current configuration source | [VX_config.toml](https://raw.githubusercontent.com/vortexgpgpu/vortex/master/VX_config.toml) | Core/warp/thread, ISA, memory and cache settings are explicit; upstream requires reconfigure after TOML edits. | Config variation is object change/tuning unless separately frozen. |

No later first-party paper/current source found in this bounded check exposes a union-external, same-contract complete action. This is a bounded collision result, not an absence claim beyond the cited frozen sources.
