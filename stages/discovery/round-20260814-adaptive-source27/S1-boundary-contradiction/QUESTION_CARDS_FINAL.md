# Final Question Card audit

## QC-L01 — OpenMP 6.0 offload completion/data lifetime

Official OpenMP material defines `target_data` as mapping variables to a device data environment for the region extent. Current Clang’s official offloading design names the producer and `libomptarget` plugin runtime, while current support documentation exposes existing GPU data-sharing modes and flags. The proposed “placement” remains either map/mode configuration, runtime policy, or a change to completion/lifetime semantics; no target-specific atomic construction survives.

- Required-field audit: INCOMPLETE for a new contribution (no non-generic atomic action).
- Disposition: `EXCLUDED_BEFORE_RAW__GENERIC_KERNEL_OR_CHANGED_GUARANTEE`.
- Reason: current chain already contains the producer/runtime boundary; varying map/mode/release placement is not a same-program N2 without changing the fixed semantic contract.

## QC-L02 — RISC-V psABI 1.1 call/unwind boundary

The official psABI 1.1 page freezes standard and vector calling-convention preservation, optional frame-pointer rules, call-entry/exit unspecified state, relocation model context, and the mandatory restoration of callee-saved registers. The proposed action can only be an unspecified frame/save/relocation optimisation unless it weakens recovery or changes the ABI; it therefore has no target-specific non-generic action skeleton.

- Required-field audit: INCOMPLETE for a new contribution (no surviving action beyond generic frame/shrink-wrap/RA class).
- Disposition: `EXCLUDED_BEFORE_RAW__GENERIC_KERNEL`.
- Reason: same-object contract itself rules out the claimed new boundary action; no absence claim, implementation failure, or result failure is involved.

