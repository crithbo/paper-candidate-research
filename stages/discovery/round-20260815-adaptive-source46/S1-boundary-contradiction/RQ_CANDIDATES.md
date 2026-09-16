# Converged RQ candidates

## RQ01 — AArch64 MOPS lowering under architectural restart

For a fixed AArch64 program using an overlap-preserving copy/move endpoint and fixed architectural fault/restart behavior, is there a MOPS-specific whole-region constructor that chooses legal MOPS/ordinary copy segments with a correctness or Pareto guarantee beyond current lowering and ordinary threshold selection?

Required discriminator: the constructor must preserve the same overlap, memory, and restart endpoint; it cannot change fault semantics, use a wrapper, or merely tune the MOPS threshold.

## RQ02 — Hexagon HVX packet/call-state construction

For a fixed Hexagon HVX function/call graph and HVX ABI-visible result, is there an HVX-specific joint packet/register/call-boundary construction with a target-specific guarantee beyond stock instruction selection plus register allocation plus packet scheduling?

Required discriminator: the proposed state must be semantically observable at the same ABI endpoint; a generic ILP, packetizer policy, or register-pressure heuristic is not a contribution.
