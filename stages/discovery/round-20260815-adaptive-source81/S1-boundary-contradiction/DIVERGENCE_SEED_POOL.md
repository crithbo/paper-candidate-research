# Divergence seed pool

The following bounded seed pool was generated offline before evidence lookup. It is non-evidentiary and not part of any scientific denominator.

| Seed | Engine | Perspective | Idea sketch | Pre-evidence disposition |
|---|---|---|---|---|
| S01 | JANUSIAN_TENSION | runtime engineer | FFM arenas provide timely off-heap reclamation but scope closure invalidates every associated segment. Could call-graph-aware scope construction lower peak memory without changing access semantics? | Selected |
| S02 | CONSTRAINT_MANIPULATION | foreign-function user | Can one shared arena be partitioned into shorter-lived confined arenas without changing downcall results? | Merged into S01 |
| S03 | PROBLEM_REFRAMING | API designer | Can an automatic arena provide the same predictable release endpoint as an explicit arena? | Not selected: changes deallocation/close guarantee |
| S04 | NEGATION_OR_INVERSION | VM implementer | Can close be delayed until a runtime safe point while retaining the same client observation? | Not selected: policy/controller and changed temporal endpoint |
| S05 | ABSTRACTION_LADDER | compiler researcher | Can generic region inference infer FFM arena scopes? | Not selected: generic lifetime-analysis shell |
| S06 | COMPOSE_DECOMPOSE_SIMPLIFY | performance reviewer | Can segment slicing and allocator reuse reduce memory while retaining arena scope? | Not selected: existing allocation API / ordinary reuse |

S01 was selected because it exposes a precise user-visible boundary: timely off-heap deallocation versus temporal accessibility of a fixed `MemorySegment` object.
