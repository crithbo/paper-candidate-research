# Candidate-grade deep reviews

## R1 — Tady constrained disassembly output: NOT_ADMITTED_UNFROZEN

**Paper/artifact evidence.** The USENIX Security 2025 artifact appendix identifies a public authors' GitHub repository and Zenodo snapshot, fixed at artifact commit `014cd1d`; it describes a neural disassembler with hybrid attention and PDT-based error detection/pruning. That is a valid first-party lead, but its stated limitation/architecture is not absence evidence for a current native disassembly constructor.

**Proposed action and witness.** A whole-binary constructor would choose a complete, non-overlapping set of instruction boundaries/basic blocks and a valid control-flow graph for fixed bytes. A minimal witness would require a binary whose byte sequence admits two syntax-valid but globally different CFG interpretations, both accepted by a fixed oracle.

**Why not admitted.** This assignment could not freeze an upstream-maintained native reader/verifier plus the complete current union (neural scoring, PDT pruning, decoding flags, thresholds and nondefault paths) from first-party current source. Without that action catalog, neither a union-external action nor a fair direct subtractor can be named. The natural carrier would be the public binary datasets described by the artifact; full cost would include decode, graph construction, verifier, CPU/RSS and output size. A finite 72-hour killer would enumerate those current paths and test the witness with a native oracle. It is withheld for missing action closure, **not** because code, results, resources, or AI readiness are missing.

## R2 — Gecko compartmentalized build layout: STRUCTURAL_DROP

The USENIX Security 2025 artifact appendix identifies the public authors' source and says its artifact combines compiler compartmentalization/instrumentation with shadow-compartment recovery. The output is an application-specific recovery system. Any residual framed as selecting compartments/layouts changes cross-component runtime policy and instrumentation pipeline; it is not a fixed native reader/checker constructor. A natural ArduPilot build and its compiler output could supply a carrier, and full cost would include build/runtime/recovery overhead, but that cannot convert controller/pipeline glue into N2. 72-hour killer: trace every candidate decision to instrumentation/recovery policy rather than a standard-format/reader action. Predicate already met.

## R3 — Application-integrated far-memory placement: STRUCTURAL_DROP

The 2025 first-party article explicitly concerns data management across local and remote memory tiers. Its candidate action is per-object placement/migration in response to accesses; it is an online controller. Same-function semantics, natural application traces, CPU/RSS/remote-traffic full cost, and a finite trace killer are possible, but the exact object is outside the assignment's direct whole-output constructor scope. No direct N2 residual is retained.

No grounded brief was formed.
