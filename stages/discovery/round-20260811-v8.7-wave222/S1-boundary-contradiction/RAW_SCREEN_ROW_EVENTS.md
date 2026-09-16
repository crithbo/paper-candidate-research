# RAW_SCREEN_ROW_EVENTS

| row | exact candidate | minimum native-legal action-divergence witness | disposition |
|---|---|---|---|
| R01 | APX EGPR / REX2 / EVEX-NDD register allocation and encoding construction. | In one APX-enabled function, three live integer values span a destructive two-operand operation. Choice A keeps a value in an EGPR and uses a REX2/EVEX form; choice B uses a legacy GPR/form and introduces a move or spill/reload. Both retain the same values, target, and ABI. | `CANDIDATE_GRADE_DEEP_REVIEW` |

The witness establishes that the architectural action space has a real prefix-versus-register-pressure tradeoff. It does not establish that a new compiler action is outside the current compiler union.
