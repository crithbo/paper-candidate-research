# Source30 Current-union / collision matrix

| Family | Current action union / contrary | Disposition |
|---|---|---|
| `ARM-MVE-MULTIBLOCK-TAILPRED-LOOP-CONSTRUCTION` | LLVM has `MVETailPredication` then `ARMLowOverheadLoops`; controls include enabled/disabled/force tail-predication and low-overhead-loop disable. Source states tail predication currently supports only a single basic block. | bounded open; conditional Stage0 brief |
| `AARCH64-MOPS-EXPANSION` | no bounded non-generic action skeleton beyond target instruction selection | structural early exclusion |
| `LOONGARCH-ADDRESS-MATERIALIZATION` | target lowering/fixup family is too close to reviewed linker-layout work | early identity exclusion |
| `COOPERATIVE-MATRIX-REGION-LOWERING` | target identity/current producer union not frozen | locator-only |

The MVE candidate does not make an absence claim beyond the cited single-block restriction. Its N2 uses native actions in a new target-specific joint region constructor; complete collision/union and witness remain finite Stage0 debt.
