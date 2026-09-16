# Source104 S3 Research Question Cards

These are pre-raw screening cards. None is a Stage 0 brief or a scientific STOP.

## `S3-104-QC01` — event-causal agent replay

- RQ: `S3-104-RQ01`; carrier: `NATURAL` TraceLab public coding-agent corpus.
- Exact object: multi-turn agent trace replay for serving evaluation.
- Current loci: [NVIDIA AIPerf TraceLab replay](https://docs.nvidia.com/aiperf/dev/tutorials/datasets-inputs/replay-trace-lab-agentic-coding-traces) and [MLPerf agentic inference client](https://mlcommons.org/2026/07/agentic-inference-for-mlperf-inference/).
- Current-union finding: AIPerf preserves recorded timestamps/session order and explicitly reconstructs latent fields; MLPerf performs closed-loop, dependency-preserving multi-turn replay with declared delays.
- Minimum falsifier: current replay implements the frozen dependency class; satisfied.
- Disposition: `EXCLUDED_BEFORE_RAW`.
- Reason: No action survived beyond existing trace replay; a different object/action would require a new assignment.

## `S3-104-QC02` — provider/runtime cache semantics

- RQ: `S3-104-RQ02`; carrier: `IMPLEMENTATION_CARRIER_ONLY` plus TraceLab accounting.
- Exact object: public provider cache/accounting fields and their use in TraceLab-to-serving replay.
- Current loci: [TraceLab Prompt Cache Accounting](https://github.com/uw-syfi/TraceLab/blob/main/docs/prompt_cache_accounting.md) and [AIPerf replay fidelity contract](https://docs.nvidia.com/aiperf/dev/tutorials/datasets-inputs/replay-trace-lab-agentic-coding-traces).
- Current-union finding: TraceLab already normalizes Claude/Codex fields with explicit caveats; AIPerf identifies synthesized virtual IDs and unrecoverable cross-session identity.
- Minimum falsifier: current source provides the frozen semantic mapping/claim limit; satisfied.
- Disposition: `EXCLUDED_BEFORE_RAW`.
- Reason: The candidate is an existing accounting/replay contract without a new decision action.

## `S3-104-QC03` — minimum observable replay contract

- RQ: `S3-104-RQ03`; carrier: `CANONICAL_FORMAL_ORACLE` was not established.
- Exact object: TraceLab release fields and an unspecified replay estimand.
- Current locus: [AIPerf TraceLab documentation](https://docs.nvidia.com/aiperf/dev/tutorials/datasets-inputs/replay-trace-lab-agentic-coding-traces).
- Strongest skeptic: the public loader already specifies field-level reconstructed/not-recoverable boundaries, including no token-content hashes, heuristic subagent joins, and proxy API time.
- Minimum falsifier: no fixed non-generic estimand/checker can be stated after this subtraction; satisfied.
- Disposition: `EXCLUDED_BEFORE_RAW`.
- Reason: A generic schema-sufficiency checker does not form a paper contribution without a fixed guarantee, oracle, and decision endpoint.

## `S3-104-QC04` — sanitization claim-ceiling certification

- RQ: `S3-104-RQ04`; carrier: `IMPLEMENTATION_CARRIER_ONLY`.
- Exact object: TraceLab's public sanitizer/release/validator workflow.
- Current loci: [TraceLab README](https://github.com/uw-syfi/TraceLab/blob/main/README.md) and [sanitizer implementation](https://github.com/uw-syfi/TraceLab/blob/main/scripts/sanitize_round_trace.py).
- Current-union finding: current release already strips paths/tool inputs, documents retained fields, and provides validator categories for integrity/denominator/formula audits.
- Minimum falsifier: surviving proposal is only an unqualified schema/claim checklist; satisfied.
- Disposition: `EXCLUDED_BEFORE_RAW`.
- Reason: No new estimand, checker guarantee, or conclusion-changing held-out test was frozen.
