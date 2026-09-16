# Finite-fidelity review of three raw families

## D1 — SysDiver symbolic-scalar construction

- **Exact object / oracle:** fixed Windows kernel driver binary, versioned analysis policy and driver findings; the current SysDiver analysis/reporter is the stock output oracle.
- **Candidate action / guarantee:** construct a bounded, type-and-path dependency quotient of scalar flows and emit a certificate allowing every retained finding to be replayed by the same checker. The intended target-specific guarantee is no loss of reported scalar defects within a declared bounded dependence class.
- **Comparator and full cost:** current SysDiver current-main plus its `asiaccs2026` artifact baseline; analyzer CPU/RSS/temp, constraint/certificate bytes, finding precision/recall and report latency.
- **Finite falsifier:** two paths that share the proposed quotient but yield different checker findings falsify the certificate.
- **Decision:** `STRUCTURAL_DROP__GUARANTEE_IS_ANALYSIS_ABSTRACTION_NOT_NATIVE_CONSTRUCTOR_RESIDUAL`. The candidate reduces to an ordinary static-analysis abstraction/refinement decision, without a distinct same-object N2 construction identified. This is not a resource/readiness inference.

## D2 — deepSURF Rust fuzz-harness construction

- **Exact object / oracle:** fixed Rust library revision, target API and fuzzing crash/reachability semantics; the artifact's compiler modification, harness generation and fuzzer path are the native baseline.
- **Candidate action / guarantee:** select a joint API-state sequence and type-safe input generator that is complete for a bounded API-dependency class, with a certificate that every generated call sequence is compiler/legal-harness accepted.
- **Comparator and full cost:** deepSURF's static-analysis-plus-LLM harness route and standard Rust fuzz harnesses; generation CPU/RSS/temp, harness bytes, compile cost, fuzzer execution and coverage/crash-oracle cost.
- **Finite falsifier:** one API sequence within the bounded class that is legal in the stock target but excluded by the generated state constructor.
- **Decision:** `STRUCTURAL_DROP__GENERIC_HARNESS_GENERATION_OR_WRAPPER`. The promise is a fuzz-harness/controller construction rather than a target-specific direct algorithm; fixed function semantics plus generic state construction leave no eligible N2.

## D3 — QWED formal-artifact verification construction

- **Exact object / oracle:** fixed formal task artifact, expected result and checker verdict; QWED's strict-mode verification response is the stock oracle.
- **Candidate action / guarantee:** jointly construct normalized proof-trace fragments and a reusable certificate DAG while maintaining the exact strict verifier verdict; guarantee is certificate acceptance and bounded trace-size dominance.
- **Comparator and full cost:** current strict verifier/certificate path, any native formal backend it invokes, verification CPU/RSS, trace/attestation bytes and latency.
- **Finite falsifier:** a pair of merged fragments for which strict-mode verifier acceptance changes.
- **Decision:** `NOT_ADMITTED_UNFROZEN`. The official public material makes the hard boundary clear, but no source-pinned native producer/action union or primary same-object direct-collision subtraction was closed. A finite plan exists—pin verifier commit, enumerate certificate/proof producer paths and strict/default controls, then replay the merge witness—but it cannot yet support a brief.

## No-brief rationale

The finite-fidelity correction was applied: D3 is not rejected because its union or proof is incomplete. It is nevertheless not brief-ready because the required complete action and comparator cannot yet be named with sufficient fidelity. D1/D2 are structurally ineligible proposed residuals.
