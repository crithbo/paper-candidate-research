# CANDIDATE_GRADE_DEEP_REVIEW

## D01 — WebAssembly legal binary representation versus validation

- **Exact object / same-function contract:** a fixed WebAssembly module, accepted by the Core 3.0 binary grammar and validator, with identical abstract module and execution behavior. The [official binary specification](https://webassembly.github.io/spec/core/binary/conventions.html) states that some phrases have multiple legal encodings and that decoders support all alternatives; the [validation algorithm](https://webassembly.github.io/spec/core/appendix/algorithm.html) is a sound/complete single-pass formulation.
- **Atomic action and information:** choose a legal alternative encoding using only the module’s existing syntax/sections. It sees no downstream workload oracle.
- **Current union and collision:** specification-compliant encoders may already choose any allowed encoding; decoders/validators must accept them. A new representation selector is consequently a canonicalizer/emitter wrapper, not a complete new reader/writer/verifier mechanism. Changing acceptance to reject a legal encoding violates the frozen guarantee.
- **Natural route / full cost:** compiler-produced public `.wasm` modules; count serialization bytes, parser/validator/compiler time and memory, instantiation and execution, while checking acceptance and abstract-module equivalence.
- **72h finite killer / fidelity closure:** take one module with a non-minimal but legal integer encoding; the standard binary grammar/decoder validates it. If the proposed path rejects it, same-object fidelity fails; if it emits an allowed alternative, it is already inside the encoder action union. The oracle is the official grammar plus validator.
- **Decision:** `DROP__CANONICALIZER_OR_GUARANTEE_CHANGE`. No N1/N2/N3 survives without turning into a generic emitter/postprocessor.

## D02 — Avro writer-reader schema resolution

- **Exact object / same-function contract:** a datum/file with frozen writer schema, reader schema, and the result/error required by the official [Avro specification](https://avro.apache.org/docs/++version++/specification/). The specification makes the writer schema available and explicitly defines recursive matching, defaults, unions, promotions, and errors.
- **Atomic action and information:** a resolution traversal receives only the encoded datum and the two schemas. It may not choose a different reader schema, weaken default/error semantics, or inspect a future query workload.
- **Current union and collision:** current upstream carries the specified reader/writer model; candidate changes examined were traversal order, field materialization and schema preprocessing. Traversal-only changes are implementation choices in the native resolution union; materializing a different default, union branch, or error changes the required reader-visible result. No source-supported union-external complete algorithm was frozen.
- **Natural route / full cost:** public Avro container artifacts with schema evolution; include schema parse/canonical/fingerprint work, block codec I/O, decoding, allocation, output/error equivalence, and total elapsed time.
- **72h finite killer / fidelity closure:** a small writer/reader pair involving a missing defaulted field and a union branch gives a finite native resolution oracle. Any claimed action must reproduce the specified resolved datum/error; a mismatch is decisive, while a match under only different traversal is native-union-equivalent.
- **Decision:** `DROP__CURRENT_UNION_OR_SEMANTIC_CHANGE`, not a readiness drop.

## D03 — Lean elaborator-produced proof term versus kernel verifier

- **Exact object / same-function contract:** the same Lean declaration/theorem and a proof term accepted by Lean’s trusted kernel. The [official reference](https://lean-lang.org/doc/reference/latest/Elaboration-and-Compilation/) states that the kernel checks elaborator output against the type theory; the [upstream repository](https://github.com/leanprover/lean4) is the current implementation anchor.
- **Atomic action and information:** construct a proof term using the declaration, imported environment and prescribed transparency/options, without changing axioms, theorem statement or trusted kernel.
- **Current union and collision:** elaboration/tactic/proof search are already the producer-side space; any generic tactic selector or term pretty-printer is a controller/wrapper. A genuinely new proof-search algorithm might be a valid new object, but no complete, non-generic algorithmic action and same-object strong baseline were frozen in this batch. Claiming kernel acceptance after changing axioms/options would weaken the guarantee.
- **Natural route / full cost:** Lean/mathlib theorem sources; include elaboration/search, kernel check, generated-term size, memory, diagnostics and reproducible environment closure.
- **72h finite killer / fidelity closure:** one closed declaration with a fixed import snapshot; native kernel acceptance is the verifier oracle. The proposal fails if it requires a new axiom/options or merely dispatches an existing tactic; otherwise it must state a complete search recurrence before admission. This row does not meet that requirement.
- **Decision:** `DROP__UNFROZEN_COMPLETE_ACTION`, rather than `DROP` for missing implementation or results.

## Diagnostic conclusion

Three deep reviews were completed, meeting the 3--4 diagnostic target. None has a non-wrapper, union-external, fully frozen N1/N2/N3 action under the same reader/writer/verifier guarantee. No `STAGE0_BRIEF` and no `PROPOSE_STAGE0` are produced.
