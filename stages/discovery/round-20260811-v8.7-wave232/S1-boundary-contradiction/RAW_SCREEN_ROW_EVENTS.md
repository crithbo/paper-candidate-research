# RAW_SCREEN_ROW_EVENTS

| row | opportunity family | static same-object divergence witness | result |
|---|---|---|---|
| R01 | APX prefix-pressure joint form/allocation on a bounded hot trace. | For 32-bit low-GPR values `a,b,c`, `t = a+b` while `a` remains live: current APX strategy prefers EVEX-NDD then can compress only if the source is killed. Here it is not. A legal alternative copies `a` then uses destructive `add`. The actions preserve values/ABI; the former has one EVEX-NDD form (about 6 bytes), the latter `mov32+add32` (4 bytes when low registers need no REX). | `CANDIDATE_GRADE_DEEP_REVIEW` |

The byte lengths are a static encoding-class certificate to be verified by assembler/objdump at StageA; they are not a measured performance claim.
