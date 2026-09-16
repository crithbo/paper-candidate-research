# CANDIDATE_GRADE_DEEP_REVIEW — VOLT/Vortex

## Current upstream reality and whole-action union

The [Vortex upstream README](https://github.com/vortexgpgpu/vortex) describes a full-stack RISC-V GPGPU with simulator, RTL and FPGA backends, software kernel/runtime/drivers, OpenCL/Vulkan/HIP interfaces, configurable cores/warps/threads and a single driver-script choice. It identifies VOLT as its LLVM-based SIMT compiler. The current [VOLT README](https://github.com/vortexgpgpu/Volt) defines the end-to-end compiler action as PoCL (OpenCL), CuPBoP (CUDA), LLVM-Vortex, and Vortex, and documents OpenCL/CUDA test locations.

The configuration is part of the object, not an omitted cost: Vortex's current [VX_config.toml](https://raw.githubusercontent.com/vortexgpgpu/vortex/master/VX_config.toml) fixes default core/warp/thread and ISA-extension values; the upstream README requires re-running `configure` after TOML changes so generated software/hardware headers cannot silently diverge. VOLT documents `--xlen=64`, `ENABLE_VORTEX=ON`, and `KERNEL_CACHE_DEFAULT=OFF` in its build path. Consequently the strongest fair same-information union is:

`{source frontend (PoCL or CuPBoP), LLVM-Vortex SIMT analyses/transforms, RISC-V/Vortex lowering, generated config headers, Vortex runtime/driver, selected SimX/RTL/FPGA backend}`.

## Six-dimensional action-divergence test

| Facet | Candidate residual | Current-union finding |
|---|---|---|
| Decision rule | Choose a different divergent-region lowering. | Central SIMT-aware IR transformations already decide/implement this class. |
| Information | CFG, work-item masks, target profile. | Same compiler IR and profile information are already consumed by VOLT. |
| Complexity/resource | New pass schedule or heuristic. | Pass ordering/heuristic is tuning unless it supplies a new whole action. |
| Quality/guarantee | Preserve source result and frozen Vortex semantics. | No stronger or different preserved guarantee is identified. |
| Full cost | Compilation, generated headers, code size, runtime/driver/backend, memory and output checking. | Any comparison must include all; no residual denominator is isolated. |
| Generalization/no-gain | Cross-profile divergence policy. | Changing profile/config changes the object; unchanged profile is already union-covered. |

## Natural oracle, latest collision, and finite killer

Oracle: bit/elementwise output equivalence for a branch-divergent OpenCL/CUDA kernel under the same frozen Vortex config, plus compiler success and driver completion. Strong baseline: the complete current union above, not bare LLVM or a hand-written kernel. Latest direct collision: the accepted CC'26 VOLT paper and the current VOLT master explicitly cover centralized SIMT-aware optimization and Vortex lowering.

If someone later asserts a new action, the <=72-hour StageA killer is finite: use one public divergent kernel from the documented test carriers, freeze `VX_config.toml` and xlen, enumerate the claimed action's emitted IR/lowering path, and reject it if it invokes an existing VOLT transformation/configuration path or changes source/Vortex observable semantics. This is a proposed falsifier only; no compilation, execution, hardware use, or benchmark was performed.

## Decision

`DROP` for direct current-union absorption. This is not a resource/AI/readiness judgment and does not create a Stage0 brief.
