# Current upstream audit — OTP-29.0.1 Mnesia

- Pin: `f26c7e590c5d1b3afa0dee38093442df117822e3` from the official OTP-29.0.1 tag.
- Deterministic tree-selected loci: `lib/mnesia/src/mnesia.erl`, `mnesia_schema.erl`, `mnesia_frag.erl`, and `lib/mnesia/test/mnesia_schema_recovery_test.erl`.
- Official Mnesia documentation was retained as current public-API/control context.

The files make current transform/schema/recovery/fragment paths and a recovery witness route visible. They do not by themselves establish a candidate-specific union-external epoch-tagged transformation or finite guarantee. `SEARCH_BOUNDED_OPEN` remains for direct collision beyond this current source union; no external project, paper, issue or general web search was used.
