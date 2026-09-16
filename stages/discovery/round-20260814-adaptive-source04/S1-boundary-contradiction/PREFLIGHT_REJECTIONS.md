# Action-promise hard-preflight probes — not counted as RAW_SCREEN_ROW_EVENT

| Distribution slot | Probe | Official source fact | Why it fails admission before raw counting |
|---|---|---|---|
| Compiler/ABI 1 | LLVM custom coroutine ABI / async context | LLVM exposes `coro.begin.custom.abi` and `coro.id.async`; a custom ABI generator can change lowering behavior. | A new generator creates a new ABI/object unless it only reimplements the current ABI; the latter is absorbed. No same-interface union-external action is named. |
| Compiler/ABI 2 | Clang coroutine wrapper lifetime | Current Clang attributes define wrappers and explicitly warn of temporary-reference lifetime issues. | Any repair is wrapper validation/instrumentation or changes source-language acceptance, not a complete fixed-function N1/N2. |
| Runtime protocol 1 | Linux userfaultfd write-protect / missing-page ordering | Kernel docs specify WP, MISSING, feature gates and explicit `COPY_MODE_WP`/`CONTINUE_MODE_WP` ordering. | Candidate action is fault-resolution policy/controller; no non-controller action divergence survives the fixed VM semantics. |
| Runtime protocol 2 | CHERI temporal revocation / barriers | Official CHERI material states temporal safety requires software revocation integration and may use barriers/tagging. | No pinned current compiler/runtime union or fixed target implementation was found; a general revocation algorithm cannot be admitted as a source-pinned same-object action. |
| ISA 1 | RISC-V Zacas versus LR/SC | Official RISC-V ISA and Sail sources define Zacas/CAS semantics. | Choosing Zacas versus LR/SC changes target-feature/ISA availability and implementation path; no same-target union-external action/guarantee follows. |
| ISA 2 | RISC-V atomic ABI mappings | LLVM documents A6S default and A6/A7 compatibility. | This is ABI/config mapping, expressly excluded by the assignment. |

The six probes meet the requested distribution only as **preflight probes**. They do not inflate raw, unique or deep counts because the contract's eligibility predicate failed.
