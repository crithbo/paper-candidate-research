# Discovery log

2026-08-15 — Applied the one-cycle `ANCHOR_FIRST_ENTRY_REBALANCE_V1`: froze the exact public RISC-V Zawrs Version 1.01 anchor before writing RQ01, then checked the official ISA semantics and current LLVM/GCC support surfaces.

The semantic boundary is real: Zawrs waiting depends on a reservation set and has timeout/interrupt behavior. Under a fixed atomic/ISA endpoint, however, the surviving intervention is an ordinary retry/wait placement policy. No target-specific structural state, non-generic decision, or formal guarantee was source-supported. It was therefore excluded before raw as a generic-policy shell. No conclusions were drawn from absent implementation, missing hardware, or missing empirical result.

No MIPS FCSR material, selective-depth nomination, audit output, build, experiment, download, or shared-file write was used.
