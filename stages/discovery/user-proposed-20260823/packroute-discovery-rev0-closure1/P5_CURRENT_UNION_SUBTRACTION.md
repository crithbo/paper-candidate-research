# P5 — current-union subtraction

| Comparator | Relevant scope | Effect on PackRoute |
|---|---|---|
| TensorCast (primary paper, 2026) | Generic tensor lifecycle/materialization layer integrated with vLLM/SGLang. | Subtracts any claim to introduce generic ownership/lifecycle management. It cannot by itself establish or absorb a frozen native B12x/Marlin choice because that exact choice set is not closed. |
| MCAP / NVE (primary paper, 2026) | Deployment-time layer profiling for memory-constrained inference. | Subtracts generic claims about load-time precision/residency dispatch. It does not prove the stated backend-specific prepared-representation contract. |
| vLLM v0.25.1 + FlashInfer v0.6.13 | The frozen native union. | The version-pinned source route fails to close the declared B12x seam, so no residual outside this union may be asserted. |
| FlashInfer main B12x W4A16 API | A later current implementation surface. | Contrary/version-drift evidence only; it may not be borrowed into the frozen stack. |

Conclusion: no residual is admitted. This is not a direct-absorption conclusion,
because the exact native decision has not been established; it is a bounded
version-consistency backlog.

