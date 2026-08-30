# Discovery Question Cards — S5 Source24

The cards below are front-end records only.  A complete card is necessary for raw admission, not sufficient for C0 or a brief.  Scores are deliberately omitted: this batch uses no Top-N or outcome-dependent replacement.

## Q1 — RISC-V ACT signature-preserving recourse

- Exact identity/version: RISC-V Architectural Certification Tests, upstream snapshot retrieved 2026-08-14.
- Carrier: `CANONICAL_FORMAL_ORACLE`; ACT assembly tests and Sail reference-model signatures.
- Problem/estimand: under a fixed ISA profile and a fixed DUT signature contract, can test-signature construction retain already certified extension fragments with a bounded recourse guarantee while preserving the exact self-checking test semantics?
- Contribution: `THEORY_FORMAL`, N2; endpoint is a target-specific certified recourse guarantee.
- Counterfactual: a valid construction could reduce regenerated assembly/signature work after a profile delta without accepting a different ISA result.
- Non-generic discriminator: all retained/generated fragments must be accepted by the ACT signature/self-checking contract; generic test ordering is excluded.
- Current union/subtractor: ACT's current compile → Sail signature → recompile self-checking pipeline; strongest subtractor is full regeneration.
- Falsifier/closure: one extension addition/removal, fixed Sail/DUT signature comparison and ledger of generated assembly, signatures, CPU/RSS/I/O; no claim-bearing run is performed here.
- Disposition: `FRESH_RAW_OPPORTUNITY`; fields complete, identity fresh in the bounded registry check.

## Q2 — hls4ml bit-exact FPGA implementation contract

- Exact identity/version: hls4ml upstream current snapshot retrieved 2026-08-14; public example-model identity must be pinned before any execution.
- Carrier: `IMPLEMENTATION_CARRIER_ONLY` for hls4ml; the candidate’s intended primary carrier would have to be an exact public trained-model plus held-out input/version.
- Problem/estimand: fixed model weights, input/output tensor contract, FPGA part and bit-exact output; can a target-specific implementation construction give a certified latency/area–error Pareto relation under limited recourse?
- Contribution: `SYSTEM_ARCHITECTURE`, N2; endpoint is a target-specific cross-layer guarantee.
- Counterfactual: a valid construction would improve the certified Pareto frontier without changing tensors, numerical tolerance or device contract.
- Non-generic discriminator: dataflow/parallel I/O, precision and reuse settings must preserve the frozen tensor contract and be checked by a stock output oracle.
- Current union/subtractor: hls4ml's documented model/layer configuration and supported backend union; strongest subtractor is the current fixed-model conversion under all same-contract configuration choices.
- Falsifier/closure: one public model/input/version, stock model output and synthesised-report checker, with compilation, RTL, resources, latency, bytes and host cost accounted.
- Disposition: `FRESH_RAW_OPPORTUNITY`; admissible only as a card-level system contract, not as a configuration-grid result.

## Q3 — BTOR2 bounded model-checking benchmarks

- Exact identity: BTOR2Tools/Boolector current source locator.
- Carrier: canonical formal oracle is plausible, but an exact public benchmark version and non-generic construction endpoint were not frozen.
- Disposition: `LOCATOR_ONLY__NOT_RAW_NOT_C0_NOT_SCIENTIFIC_STOP`.

## Q4 — CIRCT hardware IR compilation

- Exact identity: CIRCT current source.
- Disposition: `EXCLUDED_BEFORE_RAW__SOURCE13_UNFROZEN_IDENTITY`.

## Q5 — RISC-V unit-test repository

- Exact identity: `riscv-tests` current upstream.
- Missing field: distinct same-object theorem/guarantee beyond generic test selection.
- Disposition: `LOCATOR_ONLY__NOT_RAW_NOT_C0_NOT_SCIENTIFIC_STOP`.

## Q6 — OpenModelica Buildings N3 carrier

- Exact identity: Buildings 13.0.0 (2026-05-04).
- Missing field: non-controller decision consequence; Source23 already closed this facet.
- Disposition: `EXCLUDED_BEFORE_RAW__SOURCE23_SATURATED_FACET`.

## Q7 — Verible partial formatting

- Exact identity: current Verible formatter.
- Disposition: `EXCLUDED_BEFORE_RAW__SOURCE22_CURRENT_UNION_ABSORBED`.

## Q8 — OpenROAD repair primitive

- Exact identity: current OpenROAD resizer.
- Disposition: `EXCLUDED_BEFORE_RAW__SOURCE21_CURRENT_UNION_ABSORBED`.
