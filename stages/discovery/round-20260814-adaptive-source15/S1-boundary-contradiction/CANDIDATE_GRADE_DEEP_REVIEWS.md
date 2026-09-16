# Candidate-grade deep reviews

## D1 — HIPRTC code-object linking before module load

- Exact object: fixed HIP kernel source, target architecture, public code object, module function and kernel output semantics.
- Current source reality: the [HIPRTC API](https://rocm.docs.amd.com/projects/HIP/en/latest/doxygen/html/hiprtc_8h.html) exposes create/compile/get-code/get-bitcode and explicit link state (`hiprtcLinkCreate`, `hiprtcLinkAdd*`, `hiprtcLinkComplete`). [ROCm's HIP runtime reference](https://rocm.docs.amd.com/projects/HIP/en/latest/reference/hip_runtime_api_reference.html) supplies module-management and runtime-compilation routes. No absent feature is asserted.
- Legal plans: direct compile-to-image versus bitcode/data input through the documented linker may produce a loadable image for the same kernel.
- Fair-union analysis: the plans differ only in exposed compilation/link composition; a policy selecting either is a controller. A proposed cross-image merging algorithm would need to change its input/code-object ownership/lifetime or become a generic linker optimization. No target-specific guarantee survives.
- Prospective finite killer: a public HIP sample plus the HIPRTC/module API would check code-object legality, loaded symbol/output, compile/link CPU-RSS, code bytes, module-load latency and kernel runtime. This is a StageA route only and was not executed.
- Disposition: `DROP__CURRENT_RUNTIME_LINK_COMPOSITION_OR_GENERIC_LINKER`.

## D2 — ROCR code-object lifetime and executable freeze

- Exact object: one ROCR executable, compatible code object, agent and fixed kernel output/lifetime contract.
- Current source reality: current [ROCR documentation](https://rocm.docs.amd.com/_/downloads/ROCR-Runtime/en/master/pdf/) states that a code object must outlive an executable into which it is loaded and that destruction beforehand is undefined; it also documents executable freeze/load interfaces.
- Legal-plan test: loading then freezing versus altering ownership/freezing order is not a pair of plans with the same native lifetime contract—the latter can invalidate the executable or use an unfrozen object.
- Strongest-union result: retaining the lifetime/freeze guarantee removes the alleged action divergence. Retargeting to an external ownership manager is a wrapper/controller and violates the frozen object.
- Full-cost/falsifier had it survived: a public ROCr sample or compiler-runtime test would use loader/status checks plus code-object bytes, compile/load CPU-RSS, module memory, launch latency and output equivalence. Not run.
- Disposition: `DROP__LIFETIME_GUARANTEE_CHANGED_OR_WRAPPER`.

The two structural decisions arise only from explicit current contracts—not from unavailable hardware, implementation effort or lack of measured gain.
