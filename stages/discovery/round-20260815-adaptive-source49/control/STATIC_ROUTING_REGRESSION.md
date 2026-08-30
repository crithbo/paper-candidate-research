# Source49 typed-portfolio static routing regression

## Scope and claim ceiling

- Profile under test: `SOURCE49_TYPED_ACTIONABLE_RESIDUAL_PORTFOLIO_V1`, the first safe-boundary application of R37's one-cycle `SOURCE48_TYPED_ACTIONABLE_RESIDUAL_PORTFOLIO_V1` recommendation after Source48 was already frozen.
- This is a static routing regression over immutable prior dispositions, not a scientific backtest, novelty test or re-review.
- Expected invariant: six historical structural negatives remain excluded; the Source44 RVV raw remains a clean Stage0 review input at the Discovery boundary even though its later Stage0 revision ultimately STOPped.

## Regression cases

| Case | Frozen source | Typed residual and label-stripping expectation | Expected ownership route | Result |
|---|---|---|---|---|
| N1 Vulkan sparse binding | Source45 S2 handoff `94A156A9...E238` | `SYSTEM_ARCHITECTURE`; stripping Vulkan leaves generic binding/allocation composition, so `GENERIC_KERNEL` is first falsifier | `KNOWN_FATAL`, no brief | PASS |
| N2 OpenMP rectangular target transfer | Source45 S2 handoff `94A156A9...E238` | `COMPILER_TOOL`; stripping OpenMP leaves generic copy/packing over a current transfer API | `KNOWN_FATAL`, no brief | PASS |
| N3 Kokkos cross-space View materialization | Source45 S2 handoff `94A156A9...E238` | `SYSTEM_ARCHITECTURE`; stripping Kokkos leaves generic binding/copy/materialization | `KNOWN_FATAL`, no brief | PASS |
| N4 TVM TIRx TMA descriptor/issue | Source46 S2 handoff `B94919EB...F68A` | `COMPILER_TOOL`; current project already owns descriptor/issue constructor | `KNOWN_FATAL`, no brief | PASS |
| N5 MSCCL++ GPU collective movement | Source46 S2 handoff `B94919EB...F68A` | `SYSTEM_ARCHITECTURE`; stripping product names leaves generic collective scheduling and the current DSL owns movement actions | `KNOWN_FATAL`, no brief | PASS |
| N6 IREE HAL command buffer composition | Source46 S2 handoff `B94919EB...F68A` | `COMPILER_TOOL`; stripping IREE leaves generic command-buffer composition | `KNOWN_FATAL`, no brief | PASS |
| P1 RVV VXRM internal call-state transition | Source44 S1 handoff `DACF5A0A...F103` | `COMPILER_TOOL`; exact target state, call-edge transition and numerical/ABI endpoint survive naming, while generic dataflow remains the first Stage0 adversary | `CLEAN_BRIEF_WITH_STAGE0_DEBT` | PASS |

## Non-retroactivity

The later RVV Stage0 revision found that the exact recurrence reduces to generic five-state min-plus interprocedural dataflow and registered `BELOW_Q2_STOP`. That is a valid deeper Stage0 result and does not retroactively convert the Source44 routing decision into a Discovery false positive. The regression only confirms stage ownership: Discovery supplied a reviewable exact object/action/endpoint; Stage0 supplied the exhaustive generic-reduction attack.

## Acceptance

- Historical structural negatives rescued: `0/6`.
- Historical valid Stage0 denominator preserved: `1/1`.
- Scientific gates, lanes, model, capacity, budget and proposal quota changed: `0`.
- Static routing regression: `PASS`.
