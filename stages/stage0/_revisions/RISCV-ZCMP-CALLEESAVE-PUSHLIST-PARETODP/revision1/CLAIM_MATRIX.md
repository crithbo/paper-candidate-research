# Claim Matrix — Zcmp Revision 1

| Gate obligation | Static evidence | Status | Falsifier / ceiling |
|---|---|---|---|
| Native pin | current-main abbreviated immutable commit locator, RV32/ILP32/Zcmp fixed class | PASS, static | full 40-hex/blob required before Stage A claim |
| Complete union | RA, CSR order, pushability, list/adjust, frame/CFI, late PushPop, expansion, libcall branch | PASS | omitted union action voids separation |
| Same-MF two plans | `%x,%y` cross one call; P vs S exact colors/lists/adjustments/spill | PASS, static | changed function/ABI/unwind invalidates witness |
| Native legality | only Zcmp prefix lists and legal 16/32 adjustments; stock CFI paths | PASS, static | assembler/unwind verification deferred to Stage A |
| Distinct coordinates | P 16-byte/no-spill vs S 32-byte/8-spill plan | PASS, static | actual output not claimed |
| Non-generic state | fixed list grammar + adjustment + CFI/future clobber state | PASS | generic coloring/frame map fails |
| Guarantee | exact FPT frontier for bounded width `w` | PASS, bounded | no general RA theorem |
| Strongest-union separation | current actions materialize chosen plan but no source-shown bounded Pareto enumerator/guarantee | PASS, static | any grid-covered point removed later |
| Stage A killer | fixed native replay and natural/full-cost route | PASS, frozen | not run here |

## Decision binding

The sole gate is closed only for the fixed RV32 bounded-interface contract. Closing review must reject a claim that the current compiler never finds Plan P, any generalization beyond fixed native grammar, or any replacement with generic RA/frame packing.
