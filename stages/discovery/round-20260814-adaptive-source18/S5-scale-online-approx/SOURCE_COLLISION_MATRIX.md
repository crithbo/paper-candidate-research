# Source/collision matrix — S5 Source18

| Family | Same-object signature | Current source union and flags | Strongest subtractor | Result |
|---|---|---|---|---|
| QEMU TCG code-cache recourse | `FIXED_QEMU_TCG_GUEST_AND_TARGET_CPU_STATE__SAME_EXCEPTION_HOSTPC_MAPPING__SAME_GUEST_VISIBLE_EXECUTION` | shared TCG code buffer; full flush on capacity; page-based invalidation; jump/cache/page-list repair; quiescence; `tb-size`, `thread=single|multi`, `icount` interactions | capacity full-flush plus granular invalidation union at equal information and full cost | `PROPOSE_STAGE0__FINITE_FIDELITY_GAP` |
| GHDL event routing | `FIXED_VHDL_DESIGN__SAME_TIME_DELTA_AND_ASSERTION_OUTPUT` | runtime time/delta/assert controls | stock runtime scheduler | `DROP__GENERIC_SCHEDULER` |
| Yosys/ABC | `FIXED_RTL__SAME_NETLIST_EQUIVALENCE` | historical current union | prior family | `DROP__HISTORICAL_ACTIVE` |
| OpenROAD | `FIXED_LEF_DEF__LEGAL_PLACEMENT` | native placement/legalization | DRC/legalizer | `DROP__GENERIC_SOLVER` |
| QEMU flags | `SAME_QEMU_TCG_OBJECT` | `tb-size`, threading/trace options | same union | `DROP__CONFIG_SELECTOR` |
| Btrfs relocation | `SAME_FILESYSTEM_OBJECT` | balance/relocation union | stock checker | `DROP__GENERIC_MIGRATION` |

The QEMU row makes no implementation-absence claim.  Stage 0 must pin a current QEMU commit and recheck whether a semantically equivalent bounded relocation action already exists before any performance or novelty conclusion.
