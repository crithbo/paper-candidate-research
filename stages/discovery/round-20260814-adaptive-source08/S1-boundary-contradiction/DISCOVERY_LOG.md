# Discovery log — Source08 R18V2

## Result

Six residual-survival cards were frozen before depth. Three D1 witnesses existed at that checkpoint, hence D01–D03 were precommitted. D02 and D03 fail structurally; D01 produces one conditional, attackable v8.7 clean brief: `LLVM_DWARF_CALLSITE__PARAMETER_RECONSTRUCTIBILITY__REGALLOC_SPILL_DEBUG_EMISSION__FIXED_OPTIMIZED_CODE`.

## Funnel

| Unit | Count | Notes |
|---|---:|---|
| Raw / survival cards | 6 | C01–C06; distinct from Source01–07 identities |
| D1 witnessable before depth | 3 | C01, C03, C05 |
| Precommitted deep reviews | 3 | D01–D03, no backfill |
| Structural drops | 2 | Wasm GC rec grouping; Zacas lowering |
| `PROPOSE_STAGE0` briefs | 1 | LLVM DWARF call-site reconstructibility |

## Next step

Mainline may send only the brief to independent Stage0. Its first attack should test whether current LLVM allocation/pass composition already expresses the claimed Pareto point; it must not treat this Discovery potential as a positive result.

