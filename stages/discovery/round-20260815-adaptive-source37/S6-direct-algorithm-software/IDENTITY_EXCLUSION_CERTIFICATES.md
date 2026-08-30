# Source37 exact-identity exclusion certificate

## Certificate IE-01

| Required decisive field | Source37 touched line | Prior identity | Equivalence finding |
|---|---|---|---|
| object | fixed RISC-V MachineFunction with Zilsd pairs | `RISCV-ZILSD-PREALLOC-PAIR-FORMATION-POSTALLOC-REPAIR` (Source36) | same |
| endpoint | legal paired 64-bit load/store construction | same | same |
| action / estimator | pre-allocation reschedule/pair formation plus post-allocation repair | same | same |
| mechanism | Zilsd paired access formation subject to register constraints | same | same |
| comparator / guarantee | current LLVM Zilsd optimizer and code-generation cost | same | same |

**Disposition:** `EXCLUDED_BEFORE_RAW__EXACT_IDENTITY`. This is a precise object/action/endpoint equivalence, not a broad RISC-V or LLVM genealogy rule. It does not state terminal containment and does not revive any STOP.

## Related-only note

LoongArch LSX/LASX and earlier LLVM target families share a toolchain but not a decisive exact object, action or endpoint. They are `RELATED_ONLY__NOT_IDENTITY` and remain eligible for ordinary review if later evidence closes their card.

