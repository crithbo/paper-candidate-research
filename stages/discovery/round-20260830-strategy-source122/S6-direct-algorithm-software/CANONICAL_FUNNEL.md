# Source122 S6 Canonical Funnel

- Frozen carrier candidates: 8
- Source calls used: 4/24; unused calls intentionally not spent after the pre-frozen portfolio yielded only two exact fixtures.
- Exact carriers: `llama.cpp/tests/test-backend-ops.cpp`, `llama.cpp/tests/test-quantize-fns.cpp`.
- Unresolved: the two Triton frozen test paths; no replacement.

## Primary RQ candidates after carrier closure

1. Does `test-backend-ops` expose a target-specific cross-backend coverage estimand whose failure predicts real-model backend regressions beyond CPU-reference operator parity?
2. Does `test-quantize-fns` expose a natural/canonical quantization-error distribution that changes a fixed format-selection decision beyond its synthetic cosine fixture and fixed thresholds?

## Gate

Both remain `LOCATOR_ONLY`: the first lacks a frozen real-model/canonical decision endpoint and is contradicted by project reports that some real-model issues evade the test; the second uses synthetic data and fixed error thresholds without a natural model/format decision carrier. No raw, deep review or brief is valid.

Disposition: `HONEST_ABSTENTION__ZERO_RAW_ZERO_BRIEF`.
