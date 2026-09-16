# Candidate-grade deep reviews

## R01 — Zstd dictionary construction: `STRUCTURAL_DROP__CURRENT_DICTIONARY_CONTEXT_UNION`

The fixed object is lossless compression/decompression with the exact dictionary requirement. Zstd's current construction includes sample training, dictionary loading, CDict/DDict digestion, context reuse, and parameter binding. A new dictionary changes the required decoder artifact; a different compression level/trainer option is configuration. The natural `github-users` API sample family and byte-exact decompression provide a finite route/oracle. Full cost charges training, dictionary and digest bytes, context setup, encode/decode and deployment storage. A 72h killer would replay current trainer/context forms on 20 fixed sample partitions and fail on expressibility or non-identical decode. No union-external constructor survives.

## R02 — Zstd bounded-memory stream: `STRUCTURAL_DROP__CURRENT_MEMORY_BOUNDED_CONTEXT_UNION`

The same function is bit-exact frame decoding under a fixed context-memory budget. Current Zstd exposes context creation/reset/reuse, dictionaries/prefixes, compression parameters, streaming operation, and memory-size estimators. A window/hash/log threshold is a parameter choice; omitting needed state alters decode/budget semantics. Full cost includes context creation/reset, peak allocation, streaming copies, frame metadata, encode/decode. The finite killer fixes source/message partitions and hard cap, then rejects any action already representable through the current context/parameter union. The alleged N2 is absorbed.

## R04 — RE2 bounded recognition: `STRUCTURAL_DROP__CURRENT_BOUNDED_DFA_NFA_CONSTRUCTION`

The fixed contract is RE2 syntax and identical language-recognition/match semantics under its memory budget. Current RE2 bounds parser, compiler and execution memory, flushes a DFA cache on budget exhaustion, and falls back to NFA. Altering `max_mem` is configuration; removing fallback changes operational guarantee; changing syntax changes object. A finite corpus route is compiled RE2 patterns and texts with native match oracle. Full cost includes compilation, cache memory/rebuilds, NFA fallback, match time and result. The 72h killer rejects any static construction that replayed current DFA/NFA behavior; no union-external action is frozen.

## R05 — DRAT certificate schedule: `STRUCTURAL_DROP__CURRENT_DELETION_CERTIFICATE_UNION`

The object is a fixed DIMACS formula plus a DRAT proof accepted as an UNSAT certificate. DRAT-trim's certificate model already permits additions and deletions; deletions are specifically present to reduce validation costs, and supported modes/core extraction comprise the current checker union. A deletion/order heuristic is not a new complete constructor; changing proof format/checker acceptance changes the certificate guarantee. Natural SAT-competition inputs have a native acceptance oracle. Full cost includes proof bytes, emission, checking CPU/memory, core/trace artifacts. The finite killer checks certificate validity and full-cost Pareto against current deletion traces. Direct absorption closes the line.

These deep outcomes derive only from same-object action/guarantee absorption, never from missing implementation, result, resource, or AI readiness.
