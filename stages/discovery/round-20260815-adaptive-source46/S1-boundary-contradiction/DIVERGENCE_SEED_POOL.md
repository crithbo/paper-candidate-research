# Source46 divergence seed pool

Offline seeds are source-agnostic prompts only; they are neither opportunity families nor novelty claims.

| Seed | Boundary tension | Non-generic test | Preflight result |
|---|---|---|---|
| S01 | AArch64 MOPS fault/restart semantics versus compiler memmove lowering | A surviving action must preserve overlap and architectural restart semantics with a MOPS-specific guarantee, not merely choose a loop threshold. | selected as RQ01 |
| S02 | Hexagon HVX packet/register state versus call lowering | A survivor needs an HVX packet-state/ABI theorem, not generic register allocation or packet scheduling. | selected as RQ02 |
| S03 | OpenMP target map completion versus host-visible release | A survivor must construct a fixed mapping/release trace rather than retry or online orchestration. | locator control |
| S04 | RISC-V vector `vtype` state across calls | Must avoid the prior `vstart`/RVV active identities and offer more than caller-save placement. | rejected at seed level |
| S05 | CUDA graph update visibility | Must avoid prior CUDA graph identities and generic controller behavior. | rejected at seed level |
| S06 | LLVM ifunc resolver/form lowering | Existing terminal identity. | rejected at seed level |
