# Rule freeze — Wave 236

- Assignment: `DISCOVERY-S1-20260811-V8.7-WAVE236-LLVM-RVV-LMUL-RA-SPILL-JOINT-PARETO-DEPTH`.
- Method: `v8.7 + R5-P0`; `DISCOVERY_QUALITY_MODE=OFF`; R7 behavior is not used.
- Frozen controls: plan `4DBAA0282278FFAAB61116185E1E2E3E818FA94B688D2A0D966379976B7C54F6`; registry `18178EEA8EE1615A9481854AC65B37344BF9144DE4E932B20FF0D6FEDE904393`; ROLE_DISCOVERY is the current authoritative file read for this assignment.
- Object: same LLVM RVV MachineIR/liveness, same ABI/VLEN/target/subfeatures, and identical output/exception behavior. LMUL/SEW/vtype transitions must remain ISA-legal; no changed ABI or VLEN semantics.
- No experiment, benchmark, large download, compiler execution, Stage0/A/B creation, automation, or shared-control write occurred.

N2 is allowed to optimize known legal actions. A new RVV primitive is not required. Generic ILP, scalar tuning, a changed ABI/VLEN contract, or a local wrapper is not admissible.
