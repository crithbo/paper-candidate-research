# Candidate-grade deep reviews

## D1 — AArch64 MOPS copy lowering

- Exact object: a fixed AAPCS64 caller and `memcpy` operation with the source program's observable bytes, calling convention and synchronous-fault behavior held constant.
- Current sources: Arm's [toolchain feature table](https://developer.arm.com/tools-and-software/open-source-software/developer-tools/gnu-toolchain/gnu-a) lists FEAT_MOPS; the current [LLVM monorepo](https://github.com/llvm/llvm-project/tree/main/llvm/lib/Target/AArch64) is the required backend/lowering pin. No claim is made that an action is absent without the corresponding source and flag closure.
- Native two-plan witness: scalar/vector copy and MOPS are instruction-legal plans for a successful copy, but their partial-progress/fault behavior is not automatically interchangeable.
- Strongest-union and fairness result: preserving the full synchronous-fault/restart contract turns this into an implementation/ABI semantic question; relaxing it compares different observable behavior. If the contract is restricted to successful copies, it degenerates to current target lowering/cost selection.
- Finite StageA killer had it survived: one public AArch64 compiler test plus an architectural emulator would check emitted MOPS/scalar sequence, bytes, fault/restart oracle, compile CPU/RSS, code bytes and dynamic cycles. It is not scheduled.
- Disposition: `DROP__SAME_OBJECT_GUARANTEE_SPLIT_OR_CURRENT_TARGET_LOWERING`; no non-generic N2 algorithm is frozen.

## D2 — PJRT donation/readiness boundary

- Exact object: one PjRT executable and argument/output buffer under fixed host mutation, readiness and result semantics.
- Current source: the [OpenXLA PJRT C++ API overview](https://openxla.org/xla/pjrt/cpp_api_overview) documents buffer semantics (share/copy/mutate) and asynchronous execution returning not-ready buffers.
- Native two-plan witness: an input may be copied/retained or donated where allowed; both are API-native actions.
- Six-dimensional check: the plans have different ownership and host-mutability guarantees. A proposed planner that merely chooses donation is an API selector/controller; retaining the ownership guarantee removes the apparent action divergence.
- Full-cost/falsifier if it survived: a public PjRT test/ML workload, ready-event oracle and accounting for compilation, transfer, device/host memory, latency and CPU would falsify any same-contract residual within 72 hours. This route is not authorized or run.
- Disposition: `DROP__OWNERSHIP_GUARANTEE_DIFFERS__DONATION_SELECTOR`; no clean brief.

Neither result relies on unavailable hardware, implementation effort or absent performance data.
