# Rule freeze — Wave 228

- Assignment: `DISCOVERY-S1-20260811-V8.7-WAVE228-LLVM-APX-ENCODINGAWARE-REGALLOC-CLOSURE-DEPTH`.
- Frozen research object: LLVM upstream `main` revision `de8cb59` (current main observed 2026-08-11); one fixed x86-64/APX target, MachineIR/liveness, ABI, source-program values and exception semantics.
- GCC is a method subtractor only. Binutils is an encoding-legality oracle only; neither is part of the baseline union.
- Method: `v8.7 + R5-P0`; `DISCOVERY_QUALITY_MODE=OFF`; R7 behavioral semantics are dormant.
- Frozen controls: plan `8B0315C0E55892BB1DD972AA0664C1493899C38D0DEDB26A38B56B7AF6B28CE3`; registry `809346C3287C9D4EF81A2CC2B682A785A991D05E5B9A4A5FEF97EC368E20A8E5`; ROLE_DISCOVERY `FCB9BD73C39F39D31F6C8154E6B48EA23187FF28BDF2BB3D9C59E3D28FA518A3`.
- Only first-party Intel, LLVM, GCC and binutils material was used. No source clone, build, compiler execution, benchmark, large download, automation, Stage0/A/B work, or shared-control write occurred.

`de8cb59` is a source provenance pin, not evidence that a feature is absent or a result holds at every later revision.
