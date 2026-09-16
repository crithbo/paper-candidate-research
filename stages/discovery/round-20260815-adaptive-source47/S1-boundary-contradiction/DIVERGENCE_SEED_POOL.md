# Source47 divergence seed pool

Seeds are offline prompts only, not opportunity-family or novelty assertions.

| Seed | Seam | Non-generic discriminator | Status |
|---|---|---|---|
| S01 | AArch64 LSE2 CASP lowering / pair-atomic ABI cost | Must preserve the same C/C++ pair-atomic endpoint and yield a CASP-specific guarantee, not choose a target flag or generic fence/RA policy. | selected RQ01 |
| S02 | PowerPC HTM abort / C++ exception and ABI transition | Must give a PowerPC-HTM-specific recovery invariant beyond generic abort handling or runtime wrapping. | selected RQ02 |
| S03 | RISC-V Ztso atomic lowering | Terminal/generic historical control. | excluded seed |
| S04 | Wasm exception-tag materialization | Bounded historical identity without external delta. | excluded seed |
| S05 | AArch64 MOPS copy/move lowering | Source46 exact identity without external delta. | excluded seed |
| S06 | CUDA graph update visibility | Historical graph identity control. | excluded seed |
