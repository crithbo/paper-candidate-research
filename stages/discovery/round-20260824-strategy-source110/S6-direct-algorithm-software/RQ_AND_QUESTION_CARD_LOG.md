# RQ Closure

- RQ01: public llama.cpp CPU/backend graph split, endpoint same graph output/backend legality; `LOCATOR_ONLY__EXACT_COMMIT_AND_DISTINCT_ACTION_UNFROZEN`.
- Contrary/full cost: current scheduler already assigns backends, splits graphs, allocates buffers and copies tensors; costs include split, copy, allocation, synchronization and execution.
- Stop: one official API and implementation locus; no distinct action frozen.
- Exact-repeat seeds excluded before lookup; no raw/deep/brief.
