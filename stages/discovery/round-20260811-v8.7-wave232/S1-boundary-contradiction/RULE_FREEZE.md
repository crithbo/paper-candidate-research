# Rule freeze — Wave 232

- Assignment: `DISCOVERY-S1-20260811-V8.7-WAVE232-LLVM-APX-N2-ALGORITHM-GUARANTEE-CLOSURE`.
- Pinned baseline: LLVM `main` revision `de8cb59` from Wave228; same MachineIR/liveness/APX target/ABI/program semantics. GCC is a method subtractor; binutils is a legality oracle.
- Method: `v8.7 + R5-P0`; `DISCOVERY_QUALITY_MODE=OFF`; R7 dormant.
- Frozen controls: plan `FDBE210D977CFCB13C03636779F680105817E044FF10A776B2F8F7DBB9D9DE6C`; registry `8AB9420D0E1886A6FB2D3BE953971455BEC3A951A540706F0868E39EF0FB6B69`; ROLE_DISCOVERY `FCB9BD73C39F39D31F6C8154E6B48EA23187FF28BDF2BB3D9C59E3D28FA518A3`.
- No compilation, assembly, objdump, llvm-mca, benchmark, download, Stage0/A/B creation, automation, or shared-control write occurred.

## Corrected N2 admission

N2 may optimize known legal actions. It need not invent an action outside LLVM’s union. Admission instead requires a complete non-generic algorithm, a same-information divergence from the strongest current composition, a clear guarantee/no-gain boundary, and a finite fidelity closure plan. This package uses that rule; it does not reuse Wave228’s atomic-action test.
