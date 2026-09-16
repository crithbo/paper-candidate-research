# Source and collision matrix

| Family | Primary/current source | Current union fact | Conclusion |
|---|---|---|---|
| Tree-sitter | [official generator documentation](https://tree-sitter.github.io/tree-sitter/cli/generate.html) | state splitting, conflict reporting and compatible-state merge behavior are documented current generator actions | absorbed |
| Open Babel | [official SMILES documentation](https://openbabel.org/docs/FileFormats/SMILES_format.html); [official CLI documentation](https://openbabel.org/docs/Command-line_tools/babel.html) | canonical-SMILES format/options are current native semantics | witness not frozen |
| HarfBuzz | [official shaping documentation](https://harfbuzz.github.io/); [upstream source](https://github.com/harfbuzz/harfbuzz) | native shaping contract includes font/script/language/features and glyph-buffer production | absorbed |
| ICU | [official collation API](https://unicode-org.github.io/icu/userguide/collation/api.html); [official architecture](https://unicode-org.github.io/icu/userguide/collation/architecture.html) | native keys preserve a fixed collator ordering; attributes and partial/merged keys are exposed | absorbed |

No absence inference is made from old documentation, issues, or future work. The evidence is affirmative current-source/interface evidence.
