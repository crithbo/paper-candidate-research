# Raw screen event

| ID | exact object | proposed shift | status |
|---|---|---|---|
| M01 | Mach-O dylib export trie in `__LINKEDIT`, fixed exports/symbol attributes/ordinals, accepted by stock dyld and `llvm-objdump` | jointly minimize trie bytes, linker CPU/RSS, and loader export lookup/startup cost without changing the export contract | `DEEP_DIVE_REQUIRED` |

The row was not admitted from an old `-exported_symbols_order` discussion: that option is treated as a current-union obligation, not evidence that a new contribution exists.

