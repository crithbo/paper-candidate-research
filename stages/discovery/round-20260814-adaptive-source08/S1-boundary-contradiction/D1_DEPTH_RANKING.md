# Frozen D1 ranking and depth allocation

The ranking was frozen before depth. `D1_WITNESSABLE` count is **3**, meeting the contractual condition for depth slot 3; D01–D03 were therefore precommitted.

| Rank | Card | Guarantee survival | Witness concreteness | Bounded source closure | Controller/generic risk | Depth allocation |
|---:|---|---:|---:|---:|---:|---|
| 1 | C01 LLVM DWARF call-site | High | High | High | Medium | `D01_PRECOMMITTED` |
| 2 | C03 Wasm GC rec-group | Medium | High | Medium | Medium | `D02_PRECOMMITTED` |
| 3 | C05 RISC-V Zacas | High | High | High | High | `D03_PRECOMMITTED` |
| — | C02, C04, C06 | insufficient non-controller residual at raw | — | — | High | raw only |

No depth slot is replaced after D01–D03 outcomes.

