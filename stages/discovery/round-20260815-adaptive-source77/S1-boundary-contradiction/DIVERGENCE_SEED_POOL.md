# Bounded non-evidence seed portfolio

| ID | Engine | Boundary prompt | Pre-evidence disposition |
|---|---|---|---|
| S01 | representation contradiction | Rust default enum niche layout versus a fixed C-facing ABI | selected |
| S02 | guarantee split | `repr(transparent)` delegation versus FFI-visible field layout | unselected; representation itself fixes the endpoint |
| S03 | abstraction ladder | rustc layout engine versus exported-type ABI | merged into S01 |
| S04 | counterfactual | optimize a Rust enum while preserving C struct/union observations | merged into S01 |
| S05 | constraint manipulation | packed/aligned C representation versus sound field access | unselected; changed alignment contract |
| S06 | producer-consumer seam | compiler niche encoding versus foreign reader interpretation | merged into S01 |

These prompts are not scientific claims or proposal denominators.
