# Bounded non-evidence seed portfolio

| ID | Engine | Boundary prompt | Pre-evidence disposition |
|---|---|---|---|
| S01 | observability inversion | Go last-use liveness versus finalizer-visible resource release | selected |
| S02 | producer-consumer seam | compiler pointer map versus runtime finalizer queue | merged into S01 |
| S03 | ownership mismatch | `unsafe.Pointer` foreign resource use versus Go reachability | unselected; safety-rule focus risks a generic checker |
| S04 | counterfactual | implicit KeepAlive after FFI/syscall boundary | merged into S01 |
| S05 | state transition | AddCleanup versus finalizer resurrection lifecycle | unselected; changed cleanup primitive/guarantee |
| S06 | constraint split | runtime GC reachability versus user-visible descriptor lifetime | merged into S01 |

None of these seeds asserts an absent compiler feature, a performance result, or novelty.
