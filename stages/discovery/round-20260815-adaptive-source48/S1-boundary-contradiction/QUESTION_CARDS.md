# Question cards

## RQ01 — LoongArch TLS descriptor ABI

Fixed object: one LoongArch TLS program, ABI, relocation endpoint and observable value. LLVM current target lowering contains `lowerGlobalTLSAddress`; the residual has no target-specific construction or guarantee beyond ordinary form selection/relaxation. **Disposition:** `EXCLUDED_BEFORE_RAW__GENERIC_RELOCATION_LOWERING`.

## RQ02 — AMDGPU flat-scratch frame state

Fixed object: one AMDGPU kernel/call ABI and memory endpoint. LLVM documents flat-scratch prologue setup, ABI stack/frame registers and current `SIFrameLowering` emission. The residual has no mechanism beyond ordinary frame lowering, spill placement and RA. **Disposition:** `EXCLUDED_BEFORE_RAW__GENERIC_FRAME_SPILL_COMPOSITION`.
