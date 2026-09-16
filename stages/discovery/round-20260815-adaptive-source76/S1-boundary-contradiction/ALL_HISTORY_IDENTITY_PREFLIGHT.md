# All-history five-field identity preflight

Bounded lookup of `registry.yaml`, `plan.md`, and Discovery text for `track_caller`, `track caller`, and `caller location` returned no exact historical identity. This is `NO_MATCH__NOT_NOVELTY_EVIDENCE`.

Five-field signature considered: object = fixed Rust indirect call after `#[track_caller]` coercion; action = provenance-preserving call representation; endpoint = documented caller-location hint at the callee; guarantee = Rust function-pointer/trait-object ABI soundness; full-cost = compiler CPU/RSS, text/data bytes, dynamic-call overhead, and diagnostic provenance. It is only RELATED to broad ABI, panic, and metadata work, so no historic exclusion was made.
