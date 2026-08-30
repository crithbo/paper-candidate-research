# Exact-object analysis

## ANTLR serialized ATN state-order / transition encoding

- Fixed semantics: grammar, accepted language, target runtime and recognizer behavior.
- Native oracle: stock `ATNDeserializer`/recognizer succeeds and yields identical parsing results under the frozen runtime version.
- Current representation contract: serialized grammar type/max token type; state descriptors; rules/modes/sets; edges with source/target/type/arguments; and decision-to-state mapping. Java target applies the defined 16-bit word encoding.
- Divergence test: a state permutation is legal only after regenerating every source/target, rule/mode/decision and transition reference. This is generic renumbering, not a target-specific algorithm. Encoding a known integer sequence differently is local target representation, not a whole constructor.
- Result: no non-generic whole action remains under the fixed reader/version contract. A purported N2 collapses to graph numbering, word encoding or a generator patch.
- Natural corpus/full cost that would otherwise apply: versioned public ANTLR grammars, stock parse equality, serialization/generated-code bytes, generation/load/parse CPU-RSS/temp. A finite oracle cannot create a missing N2 action space.
