# Source / collision matrix

| Family | Current contract / union | Direct collision status | Decision ceiling |
|---|---|---|---|
| x86 strict FP environment | LLVM current LangRef gives `strictfp` and constrained FP intrinsics for non-default environment; dynamic rounding is represented explicitly and strict exceptions are supported. | No paper-derived novelty assertion made; current-union primitive is already expressed. | `EXCLUDED_BEFORE_RAW__KNOWN_FATAL` because proposed residual is only generic placement. |
| PowerPC MMA accumulator | Existing active Stage 0 object is exact on object/action/endpoint/guarantee/cost class. | Active identity is a direct project collision. | `EXCLUDED_BEFORE_RAW__ACTIVE_IDENTITY`. |
| AArch64 SVE FFR | AAPCS64 current source says FFR is caller-saved. | No paper-derived novelty assertion made; ABI primitive directly establishes ordinary caller-preservation obligation. | `EXCLUDED_BEFORE_RAW__KNOWN_FATAL` because no non-generic construction/guarantee was specified. |

`SEARCH_BOUNDED_OPEN` is not used as a novelty conclusion; no family reached raw or brief.
