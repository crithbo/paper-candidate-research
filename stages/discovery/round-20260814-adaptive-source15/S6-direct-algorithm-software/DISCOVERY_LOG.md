# Discovery log — Source15 GPU/NPU native-semantics screen

## Scope and result

`DISCOVERY-S6-20260814-ADAPTIVE-SOURCE15` is canonical v8.7, with V9 OFF.
It seeks target-specific algorithms at native GPU/NPU semantic boundaries, rather
than generic scheduling, layout, or configuration search. Six non-security
families were screened. Network security, protocols, vulnerabilities, exploits,
and traffic-security categories were excluded before raw admission.

**Result: COMPLETE_ZERO_PROPOSALS.** The closest semantic candidates either have
their construction already expressed by current native passes or cannot supply a
same-contract two-plan witness without changing synchronization semantics.

## Current upstream anchors

LLVM's current AMDGPU source directory documents `AMDGPUAtomicOptimizer`, which
uses a single lane of a wavefront for an atomic operation to reduce contention
[S1]. The current AMDGPU guide fixes synchronization scopes and says ordinary
LLVM fences lack address-space information; AMDGPU recognises annotations for
local/global synchronization [S2]. The NVPTX guide defines mbarrier phase,
pending arrival, expected arrival and transaction state, including the atomic
completion transition [S3]. SPIR-V docs expose fixed memory-model, subgroup and
synchronization semantics [S4].

These are current first-party semantic anchors. No gap was inferred from a
missing option or unimplemented producer path.

## Funnel

| Stage | Count | Outcome |
|---|---:|---|
| Unique raw families | 6 | Four GPU/NPU native semantics and two CPU/ISA candidates. |
| Candidate-grade deep reviews | 2 | AMDGPU atomic/fence; NVPTX mbarrier phase. |
| Briefs | 0 | No target-specific N2 with exact/FPT/certified guarantee survives. |
| Structural drops | 4 | Current-union absorption or changed semantic contract. |
| Not admitted | 2 | No complete same-contract two-plan witness/guarantee frozen. |

## D1 — AMDGPU atomic aggregation with address-space synchronization

* **Object:** fixed AMDGPU kernel, atomic value/order/scope, local/global memory
  semantics, and observable result.
* **Two-plan outline:** independent same-address atomics are issued by all lanes
  or by one elected lane only when native transformation preserves the fixed
  atomic result and ordering.
* **Union:** `AMDGPUAtomicOptimizer`, target fence lowering, memory scopes, and
  local/global relaxation annotations [S1,S2].
* **Subtraction:** cross-boundary grouping is current atomic optimization, generic
  aggregation, or changes ordering/scope. No bounded target-specific state with a
  new exact/FPT/certified guarantee was frozen.
* **Disposition:** `STRUCTURAL_DROP__CURRENT_ATOMIC_OPTIMIZER_OR_CHANGED_MEMORY_CONTRACT`.

## D2 — NVPTX mbarrier phase/transaction construction

* **Object:** fixed NVPTX kernel, barrier address, arrival/expected count,
  transaction count, cooperative-thread behavior, and phase-visible output.
* **Two-plan test:** phase completion atomically changes state when both pending
  arrivals and transaction count reach zero [S3]. Moving arrival, transaction,
  or wait changes those native phase conditions unless equivalence is supplied.
* **Union:** official mbarrier intrinsics/state machine plus stock NVPTX lowering.
* **Disposition:** `NOT_ADMITTED_UNFROZEN__NO_COMPLETE_SAME_CONTRACT_TWO_PLAN_WITNESS`.
  This bounded result does not claim future proof is impossible.

## Natural routes, full cost and killers

For D1: version-pinned HIP/LLVM kernel panel, LLVM/AMDGPU semantics and output
equality oracle; cost includes compilation CPU/wall/RSS/temp, code bytes, atomic
instruction count, host launch and local/global synchronization cost. Killer: a
same-order/same-scope pair with a target-specific guarantee irreducible to the
current atomic pass or generic aggregation.

For D2: version-pinned CUDA/NVPTX cooperative kernel panel; oracle is phase,
arrival/transaction state plus output equality. Cost includes compile CPU/wall/
RSS/temp, PTX bytes, barrier/transaction count, host launch and synchronization
latency. Killer: two legal plans preserving every phase condition with an
NVPTX-specific non-scheduling guarantee.

## Sources

* [S1] LLVM current AMDGPU source directory:
  https://llvm.org/doxygen/dir_447ce995d6e35417de5ec3060e97c93e.html
* [S2] LLVM current AMDGPU memory synchronization/fence guide:
  https://llvm.org/docs/AMDGPUUsage.html
* [S3] LLVM current NVPTX mbarrier guide:
  https://llvm.org/docs/NVPTXUsage.html
* [S4] LLVM current SPIR-V target guide:
  https://www.llvm.org/docs/SPIRVUsage.html
