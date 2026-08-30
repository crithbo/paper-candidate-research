# Question card QC01

| Field | Frozen value |
|---|---|
| exact identity | Zicond Version 1.0.0 + LLVM RISC-V Zfinx/Zdinx FP select lowering |
| same-object contract | same floating-point select semantics, feature set, ISA legality, ABI and codegen endpoint |
| claim endpoint | branchless target-native select form |
| candidate action | use a CZERO-based sequence instead of branch lowering |
| current source locus | `RISCVTargetLowering::lowerSELECT`, identified by upstream commit b20d35 |
| direct falsifier | upstream source emits the same Zicond FP-select construction for the fixed object |
| full-cost | code bytes, compiler CPU/RSS, dependency chain/temporary pressure, static throughput and runtime cycles |

**Known direct fatal:** SRC03 covers the same target, object, action and result contract. Any remaining variation is a target-cost tweak or ordinary heuristic threshold, which is forbidden. Disposition: `EXCLUDED_BEFORE_RAW__DIRECT_CURRENT_COLLISION_AND_GENERIC_TUNING_REMAINDER`.
