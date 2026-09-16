# Source / collision matrix

| Locator | Anchor | Current union | Contrary / collision | Result |
|---|---|---|---|---|
| L01 AArch64 MOPS | Arm A64 guide located; exact MOPS chapter not pinned | LLVM current lowering has default-true `-aarch64-use-mops` for memcpy/memset/memmove and dedicated tests | LLVM upstream commit documents the same flag plus scalar/library fallback | Simple primitive-missing premise absorbed; a stronger region algorithm remains unspecified, so `LOCATOR_ONLY` rather than an absence claim. |
| L02 RISC-V Zfa | ratified Zfa 1.0 instruction/contract page | LLVM current RISC-V guide lists Zfa supported and `-march` feature pathway | same current union is direct contrary to an unsupported-form claim | no frozen non-generic algorithm or direct-paper collision; `LOCATOR_ONLY`. |

`SEARCH_BOUNDED_OPEN`: primary-paper routes returned no decision-ready direct collision within the two-route cap. This is not a global absence claim.

