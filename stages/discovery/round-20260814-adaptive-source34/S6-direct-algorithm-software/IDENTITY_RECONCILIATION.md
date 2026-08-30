# Source34 identity-containment reconciliation

This is an append-only mechanical reconciliation. It starts no new search,
does not revise the scientific zero-proposal conclusion, and does not revive
any terminal topic.

## Compared signatures

| Source34 scheduling signature | Registry terminal identity | Result |
|---|---|---|
| `RISCV-ZCMP-ABI-FRAME-PUSHPOP-JOINT-CONSTRUCTION` | `RISCV-ZCMP-CALLEESAVE-PUSHLIST-PARETODP` | `EXCLUDED_BEFORE_RAW__TERMINAL_IDENTITY_CONTAINMENT` |

## Frozen comparison

The registry terminal identity fixes an RV32 `MachineFunction`, ABI/frame,
Zcmp rlist and spill choices, and a bounded frontier certificate. Source34's
description fixes the same function/ABI/frame and proposes joint callee-save
representation plus legal push/pop realization. It supplies no frozen new
object, action or guarantee: “unwind/debug” is an existing ABI-frame
correctness condition, not a distinct opportunity-family action or endpoint.

The fail-closed default therefore applies. The Source34 entry is a renamed or
superordinate description of the terminal opportunity family. Its previous
`NOT_ADMITTED_UNFROZEN` scheduling label is mechanically replaced by
`EXCLUDED_BEFORE_RAW__TERMINAL_IDENTITY_CONTAINMENT`; it must not be queued for
closure or reintroduced as a Stage0 candidate.

## Non-effect

- `COMPLETE_ZERO_PROPOSALS` remains unchanged.
- No scientific negative inference was drawn from source availability,
  implementation, result or resource state.
- The independent AArch64 MOPS structural control remains unchanged.

