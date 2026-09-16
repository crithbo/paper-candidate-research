# Source34 question cards

## QC-01: RISC-V Zcmp push/pop frame construction

- **Exact identity:** fixed LLVM `MachineFunction`, RISC-V ABI, callee-save
  requirement, exception/unwind/debug semantics, ISA feature set and observable
  function behavior.
- **Current-source locus:** LLVM's RISC-V target documents and source expose
  `PushPopKind` (`None`, standard Zcmp, vendor Xqccmp), frame-state fields and
  a `riscv-push-pop-opt` pass.
- **Proposed whole action:** jointly decide frame representation, save-register
  subset realization and legal push/pop pair realization, regenerating required
  frame/unwind state.
- **Non-generic discriminator:** standard Zcmp has constrained register and
  frame semantics; an admissible algorithm would have to preserve ABI and
  unwinding rather than merely reallocate registers.
- **Strongest current union debt:** current frame lowering, push/pop optimizer,
  register allocation, target flags/defaults and vendor Xqccmp paths have not
  been exhaustively source-pinned in this small source-only cycle.
- **Natural carrier / oracle:** LLVM RISC-V tests and public C/C++ compilation
  corpus; stock assembler, disassembler and ABI/unwind validation route.
- **Full cost:** compile CPU/RSS/temp, code bytes, stack frame bytes, unwind
  metadata and later run latency where hardware is authorized.
- **Minimum falsifier:** current union already represents every frozen joint
  action, or state erasure leaves generic prologue/register selection.
- **Finite closure:** pin RISCVFrameLowering and push/pop optimizer paths;
  enumerate Zcmp legal encodings and one ABI-equivalent two-plan witness;
  subtract direct Zcmp and frame-lowering literature.
- **Disposition:** `NOT_ADMITTED_UNFROZEN`. This is not a scientific drop and
  not a clean brief.

## QC-02: AArch64 MOPS whole-memory-operation selection (contrary control)

- **Exact identity:** fixed memory-operation semantics, target features and
  observable program behavior.
- **Current-source locus:** LLVM AArch64 SelectionDAG source exposes a
  `aarch64-use-mops` switch (default true) for memcpy/memset/memmove; GCC
  documents MOPS as a target feature.
- **Disposition:** `STRUCTURAL_DROP__CURRENT_UNION_ABSORPTION_OR_SELECTOR`.
  The remaining action is a target code-generation selector among already
  emitted alternatives, with no source-supported independent whole-constructor
  guarantee in this cycle.

