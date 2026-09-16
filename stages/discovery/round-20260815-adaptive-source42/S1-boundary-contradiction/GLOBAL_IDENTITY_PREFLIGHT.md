# Global five-field identity preflight

Frozen lookup surface: `registry.yaml`, `stages/discovery`, `stages/stage0`, and `stages/stageA`, using the Source42 regression’s five-field rule. Text/signature queries were run only as locators; no non-match is a novelty or absence conclusion.

| Source42 RQ | Historical comparison | Object | Action/estimand | Endpoint | Guarantee | Full cost | Frozen direct collision | Disposition |
|---|---|---|---|---|---|---|---|---|
| RQ01 MLIR async token lifetime | Source30 S1 `MLIR_GPU_ASYNC_TOKEN__FIXED_DEPENDENCY_SEMANTICS__WHOLE_REGION_OWNERSHIP` | `RELATED_ONLY` (generic async dialect/runtime vs GPU token) | `RELATED_ONLY` | `RELATED_ONLY` | `RELATED_ONLY` | `RELATED_ONLY` | no | `RELATED_ONLY_DO_NOT_EXCLUDE` |
| RQ02 Wasm EH/tail call | Wave250 S1 Wasm tail-call stackification | `RELATED_ONLY` | `RELATED_ONLY` (typed EH/tail representation vs stackification) | `RELATED_ONLY` | `RELATED_ONLY` (exception/trap condition absent from prior endpoint) | `RELATED_ONLY` | no | `RELATED_ONLY_DO_NOT_EXCLUDE` |
| RQ03 LLVM preallocated/invoke | bounded all-history locator search for `preallocated` + `invoke` | `NONE` | `NONE` | `NONE` | `NONE` | `NONE` | no | `NO_MATCH` — not novelty evidence |
| RQ04 CUDA async copy/barrier | Source22 S1 `CUDA_MBARrier_PHASE_TOKEN__ASYNC_COPY_COMPLETION__FIXED_PHASE_SEMANTICS` | `EXACT` | `TERMINAL_CONTAINS` | `TERMINAL_CONTAINS` | `EXACT` | `TERMINAL_CONTAINS` | no | `EXCLUDE_EXACT_OR_TERMINAL` |
| S05 LLVM statepoint exceptional relocation | Source41 S1 raw | `EXACT` | `EXACT` | `EXACT` | `EXACT` | `EXACT` | no new delta | `EXCLUDE_EXACT_OR_TERMINAL` |

Evidence locators consulted from the frozen local surface:

- Source30 S1 `RAW_SCREEN_ROW_EVENTS.md` and `SOURCE_COLLISION_MATRIX.md` (generic MLIR GPU token action, not a five-field identity match).
- Wave250 S1 `RAW_SCREEN_ROW_EVENTS.md` and `CANDIDATE_GRADE_DEEP_REVIEWS.md` (Wasm tail-call stackification, not the same typed EH/tail representation endpoint).
- Source22 S1 `RAW_SCREEN_ROW_EVENTS.md` (`CUDA_MBARrier_PHASE_TOKEN__ASYNC_COPY_COMPLETION__FIXED_PHASE_SEMANTICS`, terminal containment of RQ04).
- Source41 S1 `handoff.yaml`/question-card materials (exact statepoint family, cooled without external delta).

No relation is ambiguous after the five-field comparison. `RELATED_ONLY` rows remain eligible for ordinary evidence screening; `NO_MATCH` does not support a newness, absence, or quality claim.
