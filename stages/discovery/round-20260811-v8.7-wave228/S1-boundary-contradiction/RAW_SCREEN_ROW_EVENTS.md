# RAW_SCREEN_ROW_EVENTS

| row | focused action | minimal native-legal witness | result |
|---|---|---|---|
| R01 | LLVM APX encoding-aware EGPR residency + REX2/EVEX/NDD form + spill/save construction. | Fixed MachineIR has three simultaneously live GPR values around a destructive integer op. APX form A assigns an EGPR and requires REX2/extended EVEX; form B stays legacy and needs a move/spill. Both are legal under the same APX target and ABI. | `CANDIDATE_GRADE_DEEP_REVIEW` |

The witness fixes a genuine architecture-level choice. It does not presume that LLVM lacks either endpoint.
