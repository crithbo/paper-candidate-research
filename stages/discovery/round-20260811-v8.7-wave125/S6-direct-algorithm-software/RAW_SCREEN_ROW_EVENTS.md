# Raw screen row events

| Row | Exact native output family | Initial whole-action witness | Result |
|---|---|---|---|
| R01 | re2c regular-language spec to generated scanner C | joint DFA state/transition code layout while preserving lexer behavior | DEEP |
| R02 | Ragel machine spec to generated parser/scanner C | global FSM state/code representation under same recognizer behavior | DEEP |
| R03 | GNU as assembly input to ELF relocatable object | section/fixup/relocation output grammar action | DEEP |
| R04 | libyaml document tree to YAML stream | not frozen: style/anchor decisions lack an exact semantic/output contract | RAW_UNFROZEN |
| R05 | RapidJSON DOM to JSON stream | not frozen: formatting is a generic serializer and no nontrivial whole N2 named | RAW_UNFROZEN |
| R06 | cmark-gfm Markdown AST to HTML | not frozen: renderer extensions/output policy change target semantics | RAW_UNFROZEN |

Only R01–R03 met the assignment-local witness-first threshold for deep review.
