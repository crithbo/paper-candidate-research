# Raw screen row events

| event | result | evidence |
|---|---|---|
| source/semantic pin | pass | Arrow format v25 and C++ IPC API checked at 2026-08-11; Apache Arrow `main/cpp/src/arrow/ipc` directory exposes dictionary, options, reader and writer sources. |
| stream legality union | pass | Stream schema is fixed; dictionary keys must precede use; stream permits replacement and delta. File has different replacement rules and is excluded. |
| writer union | pass | Current C++ API: default changed-dictionary handling is full replacement; delta is emitted when enabled/compatible, otherwise replacement; nested dictionaries never delta for read-path compatibility; `WriteTable(max_chunksize)` supplies fixed chunking. |
| natural carrier | pass | NYC TLC official Yellow Taxi 2025 monthly trip records; categorical fields such as VendorID/RatecodeID/payment type are defined in the official 2025 data dictionary. |
| residual witness | pass, conditional | Two categorical columns jointly have an early batch with overlapping dictionaries and a later batch where one is strict extension while the other is unrelated: legal stream histories differ in coordinated cut/replacement/delta state while materializing identical rows. |
| decision | PROPOSE_STAGE0 | A grammar/state constrained joint constructor is outside the documented current per-change delta-or-replacement policy and fixed max-chunk writer entry. Positive cost claim remains untested. |
