# Raw screen-row events

| Event | Result |
|---|---|
| Native object | Glass is a copy-on-write disk backend built from B-tree tables. |
| Current union | Official docs and source expose configurable blocks, B-tree split/root behavior, incremental linear/non-linear updates, compaction, `FULL` and legacy `FULLER`. |
| Legal witness | Normal update leaves spare space; native compaction fills blocks while preserving search semantics. |
| Decision | `STRUCTURAL_DROP`: the witness is already native bulk/compaction freedom; remainder is generic B-tree layout. |
