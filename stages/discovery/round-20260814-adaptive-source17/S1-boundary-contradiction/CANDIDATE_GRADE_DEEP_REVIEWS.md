# Pre-outcome D1 review

## D1 — StableHLO/VHLO cross-version portable-artifact conformance

- Exact object and guarantee: one portable StableHLO artifact and its specified operation semantics across two compatible libStablehlo versions; non-portable text/bytecode and numerical-accuracy claims are out of scope.
- Problem evidence: [StableHLO compatibility](https://openxla.org/stablehlo/compatibility) guarantees five-year backward and two-year forward semantic compatibility within stated constraints. [VHLO](https://openxla.org/stablehlo/vhlo) specifies add-only versioned operations/types/attributes and producer-side downgrade failure for unsupported features.
- Current native union / strongest subtractor: the maintained VHLO conversion machinery plus the compatibility suite are the current complete semantic-conformance union, not merely a tool baseline. The [checklist](https://openxla.org/stablehlo/vhlo_checklist) requires versioned conversion/serialization tests; the [interpreter](https://openxla.org/stablehlo/interpreter_status) is a stock semantic oracle route.
- Two-plan witness: a producer may serialize through current target-version downgrade or a consumer may upgrade an older VHLO payload; both are legal only when they preserve the compatible program semantics.
- Residual test: this pair already is the native compatibility mechanism. A second converter either reimplements the current conversion/verification union, changes the portable-artifact guarantee, or is a generic serialization wrapper. No target-specific N1/N2/N3 action survives.
- Full-cost and finite falsifier: versioned compatibility corpus; target serialization/deserialization CPU-RSS, artifact bytes, converter time, oracle runtime and semantic equivalence. One artifact whose output differs under the fixed interpreter/semantic oracle kills any claimed conformance guarantee. This was not run.
- Disposition: `DROP__CURRENT_VERSIONED_CONVERSION_AND_COMPATIBILITY_UNION_ABSORBS`.

No clean brief is generated. This is a direct current-union result, not a conclusion based on implementation availability or resource absence.
