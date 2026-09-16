# Candidate-grade deep review

## D1 — ANTLR serialized ATN state order / transition encoding: `STRUCTURAL_DROP`

**Same-object contract.** Grammar, accepted language, target runtime and recognizer results are fixed. Output must deserialize with the stock ATN deserializer at the frozen serialization/runtime version and parse identically.

**Action catalog.** The official serializer emits grammar/type data, state descriptors, rule/mode/set sections, transitions that explicitly name source/target states and arguments, and decision-state references. The official deserializer fixes a serialized version and Java-target 16-bit word encoding. ANTLR version checks also bind generated code to tool/runtime version behavior.

**Minimal witness test.** A different state order requires global regeneration of all IDs and references; it is generic graph numbering. Given a fixed integer stream, switching the word representation is local target encoding. Neither action provides a grammar-specific joint algorithm or formal guarantee. Any nontrivial change to states/transitions changes the recognizer object, not merely its serialization.

**Collision/baseline.** Existing serializer/deserializer and standard graph-numbering/encoding methods already cover the residual representation actions. A direct-paper novelty conclusion is unnecessary after the same-object action space collapses. Generic ILP, varint/frequency coding and generator modifications are excluded.

**Finite killer.** A 72-hour gate would pin a grammar/runtime, generate two outputs, require native deserialization and parse equality, then reject if all differences are state renumbering or 16-bit/integer coding. Ledger would include serialize/generated-code bytes, build/load/parse CPU-RSS-temp. Since that is the complete remaining action space, no Stage0 brief is admitted.

**Decision.** `STRUCTURAL_DROP` / `COMPLETE_ZERO_PROPOSALS`, not a failure inferred from missing implementation/results/resources.
