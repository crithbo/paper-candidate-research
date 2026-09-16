# Exact-object analysis

## Java StackMapTable frame placement and encoding

- Fixed semantics: same methods, bytecode, control-flow graph, verification types and JVM behavior.
- Native oracle: stock JVM verifier plus runtime behavior. A frame must apply at a bytecode instruction offset and must be compatible with the previous/implicit frame and verifier flow state.
- Current legal encoding union: `same_frame`, `same_locals_1_stack_item_frame`, its extended form, `chop_frame`, `same_frame_extended`, `append_frame`, `full_frame`, and their `offset_delta`/verification-type payloads.
- Action-divergence attempt: replacing one legal tag by another is merely local representation of the same adjacent frame states. Moving/removing a required frame changes verifier obligations or fails stock verification; adding arbitrary frames has no stated nontrivial global guarantee.
- Result: there is no frozen target-specific complete whole constructor beyond local frame serialization. The intended contribution collapses to excluded shortest/tag encoding or writer engineering.
- Natural carrier/full cost that would otherwise apply: versioned public Java classes; compiler writer CPU/RSS/temp/class bytes plus verifier/load CPU/RSS. A finite verifier gate exists, but it cannot repair the absent N2 object.
