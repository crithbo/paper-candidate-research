# Claim / source matrix — S6-EGRAPH-LIVEEXTRACT

| Claim under confirmation | Primary/authoritative source independently checked | Sentry assessment |
|---|---|---|
| Sparse exact extraction is already a strong comparator | [FastOpt, OOPSLA 2024](https://doi.org/10.1145/3689801) | Supported as a must-run subtractor, not a full joint live scheduler. |
| Code-reuse/ILP extraction is relevant | [Julia EqSat, TACO 2026](https://doi.org/10.1145/3795883) | Supported; exact overlap is bounded by the candidate's fixed peak-live objective. |
| Same e-graph execution resources exist | [egg](https://github.com/egraphs-good/egg); [Cranelift egraph](https://docs.rs/cranelift-egraph/latest/cranelift_egraph/) | Supported. |
| Joint peak-live residual exists | No public non-dominated witness yet | Search-bounded only; gate correctly tests it. |
