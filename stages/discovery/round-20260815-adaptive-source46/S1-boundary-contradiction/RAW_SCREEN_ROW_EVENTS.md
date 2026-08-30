# Raw screen row events

| Signature | Event | Disposition | Basis |
|---|---|---|---|
| `AARCH64_MOPS__FIXED_MEMMOVE__RESTART_SEMANTICS__REGION_CONSTRUCTION` | current primitive check | `EXCLUDED_BEFORE_RAW__GENERIC_THRESHOLD_OR_LOWERING` | LLVM current instruction selector already selects native MOPS copy/move pseudos; candidate had no non-generic algorithm/guarantee. |
| `HEXAGON_HVX__FIXED_CALLGRAPH__PACKET_REGISTER_CALL_CONSTRUCTION` | current union check | `EXCLUDED_BEFORE_RAW__GENERIC_JOINT_SCHEDULING` | LLVM current packetizer expresses resource, call-dependence, and callee-save constraints; no HVX-specific semantic residual was defined. |

Accepted evidence-qualified raw: **0**. No deep review and no Stage 0 brief were produced.
