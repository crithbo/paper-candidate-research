# Divergence seed pool

Generated offline before evidence lookup; seeds are non-evidentiary.

| Seed | Engine | Perspective | Sketch | Selection |
|---|---|---|---|---|
| S01 | JANUSIAN_TENSION | systems maintainer | `pthread_atfork` can prepare locks before fork yet must restore parent/child state. Could same-endpoint registration/order construction reduce fork synchronization cost? | Selected |
| S02 | CONSTRAINT_MANIPULATION | library author | Can handlers be partitioned by independent resource sets while preserving parent/child callback observations? | Merged into S01 |
| S03 | PROBLEM_REFRAMING | runtime developer | Can `_Fork` provide the same post-fork state with no callbacks? | Not selected: explicitly different contract |
| S04 | NEGATION_OR_INVERSION | operating-systems engineer | Can callback execution be delayed to a child safe point? | Not selected: changes child visible state |
| S05 | ABSTRACTION_LADDER | compiler researcher | Can a generic lock/lifetime solver order all atfork callbacks? | Not selected: generic shell |
| S06 | COMPOSE_DECOMPOSE_SIMPLIFY | performance reviewer | Can libraries use a coordinator around atfork registration? | Not selected: wrapper/controller |
