# UNIQUE_OPPORTUNITY_FAMILY — OPA Rego-to-Wasm artifact construction

Exact semantics: a fixed policy/data/input corpus and a fixed set of decision entrypoints, preserving each entrypoint's OPA defined/undefined result set and JSON result value through the documented Wasm ABI. The object is not a different policy, host evaluator, bundle postprocessor, `wasm-opt` pass, threshold, security model, or deployment controller.

Current complete union: OPA source at pinned `fcda76c...`; Rego compilation and Wasm codegen; `opa build -t wasm`; one or more specified `-e` values; `-O` semantic-preserving rewrite/inlining/pruning; capability/schema/bundle options; Wasm module and ABI globals/exports; `env.memory`; import callbacks; built-in ID map; input/data JSON parse and evaluation context; heap reset/stash/restore for repeated/incremental data; stock result decoding.

Natural public carrier: OPA's repository test/examples plus documented Rego and JSON policy/input format. Oracle: the stock OPA/Wasm evaluator's exact result set and ABI error/undefined behavior. Full cost: compile time, bundle/Wasm bytes, instantiation and import setup, JSON serialization/parsing, evaluation latency, Wasm memory/RSS, data-update/heap work and result validation.
