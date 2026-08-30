# CURRENT UPSTREAM REALITY / ACTION MATRIX — WAVE13

## Frozen audit record

Audit date: `2026-08-09`.  The attempted direct `git ls-remote` checks for LLVM, ROCm/llvm-project, and Triton failed locally with Windows Schannel `SEC_E_NO_CREDENTIALS`; no missing feature was inferred from that transport failure.  Version-bearing official release evidence and current `main` source/doc pages were instead inspected.  Where the current mutable branch cannot be tied to a full SHA through the available official page, this record says so explicitly rather than inventing one.

| Upstream | Frozen version / current source locus | Source and configuration/flag reality checked | Contrary evidence retained |
|---|---|---|---|
| Triton | Release `v3.7.0` commit `5f3f125`; patch `v3.7.1` commit `f797708`; current `main` AMD driver inspected 2026-08-09 (full `main` SHA not exposed by the readable page). | `triton.Config` exposes `num_warps`, `num_stages`, `num_ctas`, `maxnreg`, and IR override.  Current Gluon API exposes warp specialization, barriers, shared-memory descriptor, `num_warps`, and `num_ctas`.  Current AMD driver has `create_tdm_descriptor`; release notes enumerate TDM load/store, async copy/wait, WMMA, stream/pipeline/LDS-layout improvements, multi-CTA, and AMD warp specialization. | The same current release identifies `gfx1250` as **RDNA4**.  Its AMD TDM support is not evidence of NVIDIA TMA semantics.  Therefore neither `gfx1250 = CDNA5` nor `AMD TDM = NVIDIA TMA` is used. |
| LLVM / ROCm compiler | ROCm LLVM documentation labelled `22.0.0git`, checked 2026-08-09; docs describe current upstream-facing AMDGPU backend.  A full mutable-HEAD SHA was unavailable because the local TLS query failed. | `-mcpu=<target-id>` / `--offload-arch=<target-id>` encode processor plus optional target features; ROCm passes them via target-feature, `-mattr`, and linker `-plugin-opt=-mattr`.  Checked non-default/alternative controls include explicit target features, `-mwavefrontsize64` / `-mno-wavefrontsize64`, `-mcumode`, GPU max threads per block, and `-ffast-math`. | A supposed fixed hardware-action gap is invalid unless these target and code-generation controls are included in the baseline union.  The current representation already carries processor/features, so a mere representation wrapper is not N1. |
| AMD official hardware boundary | HIP compiler docs `7.2.53211` and current hardware-implementation documentation, checked 2026-08-09. | GFX identifier is an architecture-family-specific compiler/hardware target; HIP docs distinguish RDNA and CDNA examples.  The hardware page assigns DME hardware specifically to CDNA3/CDNA4 in its stated scope. | Do not extrapolate that statement to assert a CDNA5 mapping for gfx1250, and do not rename a vendor-specific data-movement interface into NVIDIA TMA. |

## Baseline-residual subtraction

### A. Descriptor-aware tiling/data movement

- Exact object: AMD/HIP Triton kernels with repeated tiled transfer and WMMA chains.
- Strongest deployable same-information action union: target-feature/target-ID compilation; TDM descriptor creation; layout choice; async copy/wait; LDS allocation; barrier/wait placement; WMMA selection; warp pipeline/specialization; multi-CTA configuration; register and stage limits.
- Proposed residual tested: globally couple descriptor, LDS layout, transfer/wait, WMMA, and co-execution schedule.
- Result: every named primitive is already a native action or configuration locus; a higher-level chooser is forbidden.  No complete atomic action gap certificate.

### B. WMMA reuse/co-execution under register and occupancy constraints

- Exact object: same AMD/HIP Triton kernel and native output semantics.
- Strongest union adds: `num_warps`, `num_stages`, `num_ctas`, `maxnreg`, target wavefront/CU mode, launch/thread bound, plus current persistent/4- and 8-warp / multi-CTA schedules.
- Proposed residual tested: globally select reuse and producer/consumer co-execution under those constraints.
- Result: only an autotuning/selector formulation remains.  It is not a union-external N2 construction and is disallowed by assignment.

### C. Cross-backend descriptor abstraction

- Exact object requirement fails: preserving AMD TDM semantics and NVIDIA TMA semantics demands backend-specific native representation/legality.  Collapsing them would change the object or make a wrapper.
- Result: no same-object N1/N2/N3 route.

## Required negative checks satisfied

- Current source, current official documentation, configuration/feature controls, and contrary evidence were checked for every absence-style hypothesis.
- No old issue, stale release note, or future-work statement is used to establish a current gap.
- No natural workload is fabricated; the natural carrier does not overcome direct action-union absorption.
