# Rule freeze — Wave 240

- Assignment: `DISCOVERY-S1-20260811-V8.7-WAVE240-LLVM-AMX-TILECONFIG-LIVERANGE-SPILL-JOINT-N2-DEPTH`.
- Method: `v8.7 + R5-P0`; `DISCOVERY_QUALITY_MODE=OFF`; R7 behavior was not used.
- Frozen controls: plan `421821C824020415A21FA3D225ED887A3C9ED27622D02248C10D45541EC75E56`; registry `1FC700788EDBCF2CAE722BA6523CDFE81640B6E939A671141AE0EF5CBC0AAB81`; ROLE_DISCOVERY is the current authoritative file read for the assignment.
- Exact object: one LLVM x86 AMX MachineFunction with fixed tile shapes, liveness, ISA, ABI, program values and exceptions. No altered tile shape, ABI/ISA, external wrapper, hardware-only claim, generic ILP, scalar cost tweak, or custom rewriter is admissible.
- Only primary LLVM/Intel material and original research were consulted. No compilation, test, benchmark, large download, Stage0/A/B creation, automation, or shared-control modification occurred.
