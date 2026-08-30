# Budgeted-quality raw screen

| id | fixed quality/correctness guarantee | current complete action union | minimum purported witness | disposition |
|---|---|---|---|---|
| R01 | bit-exact lossless decompression with identical required dictionary | sample training, dictionary, CDict/DDict, context reuse, compression parameters | a joint dictionary/recourse construction beyond current trainer/context state | `DEEP_DIVE_REQUIRED` |
| R02 | bit-exact Zstd decoding with a hard context-memory bound | streaming context, parameter table, dictionary/prefix, memory estimators, reset/reuse | a non-parameter memory-bounded state construction | `DEEP_DIVE_REQUIRED` |
| R03 | bit-exact Brotli decoding with same bitstream/format rules | encoder modes/window/quality/context construction | only encoder-quality/config changes found | `NOT_ADMITTED_UNFROZEN__PARAMETER_ONLY` |
| R04 | same RE2 syntax and language-recognition/match semantics under memory bound | DFA cache budget/flush, NFA fallback, parser/compiler/execution budget | a static regex-program construction beyond current bounded DFA/NFA union | `DEEP_DIVE_REQUIRED` |
| R05 | same CNF UNSAT certificate validity accepted by DRAT-trim | addition/deletion trace, core extraction, forward/plain/check modes | a checked certificate schedule with size/check-cost gain outside deletion union | `DEEP_DIVE_REQUIRED` |
| R06 | fixed CNF UNSAT semantics with LRAT checker acceptance | proof-format/checker construction insufficiently frozen in first-party current source | no complete action witness | `NOT_ADMITTED_UNFROZEN__CONTRACT_INCOMPLETE` |

No generic heuristic/ILP, wrapper, threshold scan, changed decoder/checker semantics, or changed quality object is admitted.
