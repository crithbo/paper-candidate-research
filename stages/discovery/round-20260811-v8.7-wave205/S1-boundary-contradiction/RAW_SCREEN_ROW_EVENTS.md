# RAW_SCREEN_ROW_EVENTS

| ID | Unique family | Atomic seam | Initial status |
|---|---|---|---|
| R01 | Intel AMX tile state | tile configuration/data, XSAVE, signals and compiler `tilerelease` | deep |
| R02 | Intel CET shadow stack | CALL/RET shadow-state, exception and unwinding | deep |
| R03 | Arm MTE tag-fault state | tagged allocation, synchronous/asynchronous fault and unwinding | deep |
| R04 | RISC-V Zicfiss | `ssp`, shadow push/pop/check and software-check exception | deep |
| R05 | Arm PAC return state | signed LR, SP modifier, authentication failure and unwind | raw structural drop |
| R06 | CHERI/Morello capability state | capability tag/bounds and purecap ABI/context state | raw structural drop |

All six are distinct from Wave187 V-state, Wave190 SME ZA, and Wave197 `vstart` objects.

