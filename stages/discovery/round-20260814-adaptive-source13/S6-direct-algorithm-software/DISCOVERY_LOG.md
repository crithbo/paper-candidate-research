# Discovery log — Source13 compiler / architecture / accelerator rebalance

## Frozen scope

Assignment `DISCOVERY-S6-20260814-ADAPTIVE-SOURCE13` uses canonical v8.7 with
`DISCOVERY_CLAIM_PACK_MODE: OFF`.  The source mix is guidance, not an admission
quota.  All six scoped families are compiler/architecture or accelerator
construction objects; network security, attacks, exploit reproduction, protocol
security, and traffic-security topics were excluded before screening.

## Funnel

| Stage | Count | Outcome |
|---|---:|---|
| Unique raw families | 6 | Three CPU compiler/architecture and three accelerator compiler/architecture families. |
| Candidate-grade deep reviews | 2 | Hexagon VLIW construction; IREE LLVMGPU lowering configuration. |
| PROPOSE_STAGE0 | 0 | No clean brief. |
| Excluded as active duplicate | 1 | LLVM AMDGPU occupancy/register-allocation joint codegen is an active project family. |
| Structural drops | 4 | Generic scheduling/layout/controller residual, or no bounded target-specific guarantee. |
| Not admitted | 1 | RISC-V VSETVLI joint-state idea: source/collision and finite target-specific guarantee were not closed. |

## Current-source anchors and bounded search

The review used first-party LLVM documentation and current Doxygen source pages,
the upstream IREE and OpenXLA source trees, and the current LLVM AMDGPU guide.
The public LLVM Hexagon packetizer source explicitly calls itself a simple
DFA-based VLIW packetizer: it tests resource availability and dependencies inside
machine basic blocks [S1].  The same source exposes native switches for disabling
packetization and for selected packetization policy [S1].  LLVM's AMDGPU guide
documents current resource usage and occupancy inputs (VGPR/SGPR/LDS/workgroup
size), while LLVM's current `llvm-calc-occupancy` guide says it uses the same
occupancy mathematics as the backend [S2,S3].

This is enough to subtract known current actions; it is not evidence for an
unseen action, result, or implementation.  No action gap is inferred from an
issue, future-work sentence, missing installation, or unavailable accelerator.

## Deep-review conclusions

### D1 — LLVM Hexagon VLIW packet construction

* **Exact object:** fixed Hexagon MachineIR, subtarget, ABI, alias/dependence
  relation, and emitted ISA behavior.
* **Two-plan outline:** for a basic block containing two independently ready
  instructions that compete for a constrained slot, either legal bundle ordering
  can be emitted; both preserve program behavior while changing packet shape.
* **Current union:** Hexagon target scheduling, DFA resource reservation,
  dependence pruning, packetizer enable/disable and documented packetization
  controls; current source also contains a target global scheduler [S1,S4].
* **Residual test:** a whole-region choice over packet formation, latency and
  register pressure is a known VLIW scheduling / resource-constrained scheduling
  kernel.  Without a new Hexagon-specific finite state or guarantee, an exact or
  approximate solver would be generic scheduling in target clothing.
* **Disposition:** `STRUCTURAL_DROP__GENERIC_VLIW_SCHEDULING_KERNEL__NO_TARGET_SPECIFIC_GUARANTEE`.

### D2 — IREE LLVMGPU lowering-configuration / layout construction

* **Exact object:** fixed MLIR module, target GPU constraints, buffer/layout
  semantics and generated-kernel behavior.
* **Two-plan outline:** two valid lowering configurations can choose different
  tiling/distribution/layout actions while retaining tensor results.
* **Current union:** upstream LLVMGPU codegen pipeline and lowering configuration
  controls, with target architecture information and tuning configuration passed
  through the compiler [S5].
* **Residual test:** the only frozen freedom is layout/tiling selection under a
  target resource model.  A proposed cross-stage constructor is either an
  existing configuration/search controller or generic tiling/layout packing;
  no target-specific exact/FPT/certified guarantee was identified.
* **Disposition:** `STRUCTURAL_DROP__CONFIGURATION_OR_GENERIC_LAYOUT_KERNEL`.

## Natural routes, full cost, and finite killers

No program was built or run. For Hexagon, a finite Stage-A route would pin LLVM
Hexagon MIR tests plus a versioned public DSP workload; oracle is MIR verifier and
target semantics. Cost must include compilation CPU/wall/RSS/temp, code bytes,
packet count, and a target-appropriate latency/throughput proxy. The falsifier is
a concrete target-specific finite-state guarantee that cannot be reduced to
resource-constrained scheduling.

For IREE, a finite route would pin public MLIR/IREE benchmark modules and the
upstream compiler verifier; full cost includes compile CPU/wall/RSS/temp, output
bytes, host-side dispatch/launch cost, and target resource constraints. The killer
is a non-controller algorithm with a target-specific guarantee under unchanged
IR/kernel semantics.

## Sources

* [S1] LLVM current Doxygen, `HexagonVLIWPacketizer.cpp`:
  https://www.llvm.org/docs/doxygen/HexagonVLIWPacketizer_8cpp_source.html
* [S2] LLVM current AMDGPU backend guide:
  https://llvm.org/docs/AMDGPUUsage.html
* [S3] LLVM current `llvm-calc-occupancy` guide:
  https://www.llvm.org/docs/CommandGuide/llvm-calc-occupancy.html
* [S4] LLVM current Doxygen, `HexagonGlobalScheduler.cpp`:
  https://llvm.org/doxygen/HexagonGlobalScheduler_8cpp.html
* [S5] IREE upstream LLVMGPU codegen source tree, frozen as current-source
  inspection target on 2026-08-14:
  https://github.com/iree-org/iree/tree/main/compiler/src/iree/compiler/Codegen/LLVMGPU
* [S6] OpenXLA upstream GPU service source tree, frozen as current-source
  inspection target on 2026-08-14:
  https://github.com/openxla/xla/tree/main/xla/service/gpu
