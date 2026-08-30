# RAW_SCREEN_ROW_EVENTS

| row | family | minimum same-object action-divergence witness | result |
|---|---|---|---|
| R01 | LLVM RVV LMUL-group/mask/spill/vset Pareto construction. | A live `VRM8` group occupies an aligned eight-register block while a masked operation needs `v0`; spilling a fractional-EMUL temporary can use whole-register `vs1r/vl1r` with no new vtype setup or a typed partial spill/reload that saves bytes/traffic but may force a `vset*`. Current vector RA runs before `RISCVInsertVSETVLI`; a joint trace decision can choose the group/spill representation from the future vtype context. | `CANDIDATE_GRADE_DEEP_REVIEW` |

The witness fixes the action class and semantic contract. It makes no performance measurement claim.
