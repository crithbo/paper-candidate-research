# Discovery log — Wave267

Wave243’s PCH/PCM row was revisited under a complete same-version ASTWriter/ASTReader contract. Record/block offsets, identifier/declaration/type IDs, module offset mappings, lazy loading and relevant reader options were jointly frozen. The minimal legal witness reduces all preserved-reader variation to generic packing/reordering; the only alternative changes the reader contract.

| funnel | count |
|---|---:|
| raw | 1 |
| repeat | 0 |
| unique | 1 |
| deep | 1 |
| grounded briefs | 0 |
| `PROPOSE_STAGE0` | 0 |

Result: `COMPLETE_ZERO_PROPOSALS__CLANG_PCH_PCM_GENERIC_LAYOUT_OR_CHANGED_READER_CLOSURE`.

