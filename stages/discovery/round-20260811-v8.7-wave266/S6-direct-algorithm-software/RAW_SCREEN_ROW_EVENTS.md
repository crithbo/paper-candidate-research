# Raw screen-row events

| Event | Result |
|---|---|
| Native contract | GNU MO uses sorted original-string descriptors and parallel translation descriptors; plural/context and charset are format-defined. |
| Current action union | `msgfmt` offers alignment, byte order and optional hash-table omission; the format supports hash or binary search. |
| Legal witness | One catalog can be compiled with and without a hash table, or with legal string alignment, while stock lookup returns the same translations. |
| Residual test | Original-string order is fixed lexicographically; hash entries point into that sorted table; remaining offset/layout freedom is writer formatting or generic hash/string packing. |
| Decision | `STRUCTURAL_DROP`. |
