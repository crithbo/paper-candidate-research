# Pre-evidence RQ candidates

## RQ-S68-01 — ELF RELR construction

For a fixed ELF program, relocation semantics, ABI and stock dynamic-loader behavior, could a target-specific relocation grouping/layout constructor improve link+load full cost beyond current RELR generation without changing the loader contract?

## RQ-S68-02 — Mach-O chained-fixup construction

For a fixed Mach-O image, fixup semantics and stock dyld behavior, could a target-specific chained-fixup construction improve link+load full cost without changing image/loader semantics?

## RQ-S68-03 — ReadyToRun image construction

For a fixed managed assembly, runtime version/options and observable program behavior, could a target-specific AOT/image construction improve compile+startup full cost without changing CoreCLR loader/JIT fallback semantics?

These are primary RQs only; all need ordinary current-source closure before raw.
