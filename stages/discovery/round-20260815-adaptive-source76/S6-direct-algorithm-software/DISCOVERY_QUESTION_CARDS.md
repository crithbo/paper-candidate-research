# Discovery question cards

## QC-S76-01 — Flex DFA and table construction

- Exact public identity: Flex scanner generator current project/manual; fixed lexer specification, start conditions and emitted scanner behaviour.
- Carrier: `IMPLEMENTATION_CARRIER_ONLY`; versioned Flex regression specs/tests would be needed later.
- Same-object contract: all inputs retain longest-match then first-rule priority, token actions and scanner API. Any transformed rule order, action code or lexer language fails same-object.
- Proposed contribution: METHOD_ALGORITHM/N2; a joint state partition/transition representation/table emission construction with exact semantic equivalence and generated-size/scanning-cost guarantee.
- Full cost boundary: automaton construction CPU/RSS, generated source/table bytes, table initialization/load, scanning CPU/RSS/latency and action dispatch; no measurements were performed.

### Identity preflight

Bounded exact terms `flex scanner dfa table`, `lex scanner dfa`, `fast lexical analyzer` found no all-five-field registry/plan identity. The result is `NO_MATCH__NOT_NOVELTY_INFERENCE`; all Source76 held/terminal identities, including LLVM Mach-O compact-unwind, are different and untouched.

### Current union and anti-collapse result

- The first-party Flex repository identifies Flex as a scanner generator for C/C++ lexical patterns. Its manual fixes rule priority: if two rules match the same input, the first listed rule wins.
- Current configuration union includes full and fast tables (`-f/-F`) and table-compression variants (`-C...`); manual material describes explicit space/time tradeoffs and states `REJECT` is incompatible with `-f/-F`.
- A legal two-output witness cannot survive the target-specific discriminator. Semantics-preserving state/transition reduction is standard DFA minimization/equivalence-class or table-compression construction; selecting any `-C` representation is a configuration choice. Changing rule order, actions or REJECT behaviour changes the fixed scanner object.
- Decisive falsifier: for a proposed pair of representations, minimize the fixed output-labelled DFA / use the documented table alternatives. If equivalence is maintained, the contribution is the generic automaton/table kernel; if not, longest-match/priority semantics changes.
- Direct result: `EXCLUDED_BEFORE_RAW__CURRENT_TABLE_UNION_PLUS_GENERIC_OUTPUT_DFA_KERNEL`. It is not based on unavailable source, implementation, result or resources.
