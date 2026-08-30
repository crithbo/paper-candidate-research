# Rule freeze — Wave 222

- Assignment: `DISCOVERY-S1-20260811-V8.7-WAVE222-X86-APX-REX2-REGALLOC-CODESIZE-JOINT-DEPTH`.
- Object: one fixed x86-64/APX program/function and target, preserving externally observable values, exceptions, ABI/frame/unwind legality.
- Method: `v8.7 + R5-P0`; `DISCOVERY_QUALITY_MODE=OFF`; no R7 behavioral semantics.
- Frozen provenance: plan `4B0365A8DFA17A64F00F44DD76652B2F4D919580A3B32018B485F003C58966CF`; registry `51FCB0AA49C6CC2E8ADFE7FEC1E37598830C95C14236E901A056BDE068332577`; ROLE_DISCOVERY `FCB9BD73C39F39D31F6C8154E6B48EA23187FF28BDF2BB3D9C59E3D28FA518A3`.
- Evidence cutoff: 2026-08-11. Evidence is official Intel APX material and first-party LLVM/GCC/binutils material.
- No compilation, assembler invocation, objdump, llvm-mca, benchmark, large download, automated workflow, Stage0/A/B work, or shared-file write occurred.

## Admission discipline

The desired contribution must be a complete non-generic N2 constructor, not a register-cost tweak, a threshold/flag choice, a generic ILP wrapper, or a changed ABI. A current implementation gap may not be asserted without a current source/flags/action-union check; an unclosed union results in `NOT_ADMITTED_UNFROZEN`.
