# Question cards

## RQ01 — AArch64 MOPS lowering

- **Exact object and endpoint:** a fixed AArch64 `memmove`/copy program, with the original overlap and architectural restart semantics unchanged.
- **Proposed contribution shape:** a MOPS-specific whole-region constructor selecting legal MOPS and ordinary segments with a correctness/Pareto guarantee.
- **Current source / contrary evidence:** current LLVM AArch64 GlobalISel directly maps `G_MEMMOVE` to `MOPSMemoryMovePseudo` under `+mops`; MOPS already represents the native copy/move primitive.
- **Minimum falsifier:** if residual choice is a size/alignment or local sequence threshold after native primitive selection, it is tuning/ordinary lowering rather than a target-specific N2.
- **Outcome:** `EXCLUDED_BEFORE_RAW__GENERIC_THRESHOLD_OR_LOWERING`. The proposed action has no specified non-generic state, recurrence, or guarantee beyond current primitive selection; no claim about performance or absent implementation is made.

## RQ02 — Hexagon HVX packet/call-state construction

- **Exact object and endpoint:** a fixed Hexagon HVX function/call graph retaining target, calling convention, and ABI-visible result.
- **Proposed contribution shape:** an HVX-specific packet/register/call construction with a target-specific guarantee.
- **Current source / contrary evidence:** current LLVM `HexagonVLIWPacketizer` is a MachineFunction pass after virtual-register removal, includes HVX resource mutations, call dependence checks, and callee-save restrictions; its TargetMachine adds the packetizer to the current pipeline.
- **Minimum falsifier:** if residual is simply choosing packets, register assignments, or schedule order under these current constraints, it is generic joint RA/packet scheduling rather than a distinct HVX semantic construction.
- **Outcome:** `EXCLUDED_BEFORE_RAW__GENERIC_JOINT_SCHEDULING`. The RQ did not identify an ABI-observable HVX state or a target-specific non-generic guarantee. This is not a result/implementation/resource judgment.
