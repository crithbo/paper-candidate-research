# RAW_SCREEN_ROW_EVENTS — Wave287

| event | current primary observation | impact |
|---|---|---|
| E01 | Ratified Zicfiss defines `SSPUSH`/`SSPOPCHK`, x1/x5 legality, compressed forms, regular-plus-shadow return-address handling and stack switching/unwinding support. | exact ISA/semantic action set is fixed. |
| E02 | LLVM current ShadowCallStack documents hardware Zicfiss selection using `-fcf-protection=return`; LLVM review includes Zicfiss prologue and tail-call test output. | stock LLVM already expresses instrumentation/call/tailcall actions. |
| E03 | GCC r15 adds Zicfiss and shadow-stack prologue generation including `SIBCALL_RETURN`. | GCC is a current same-object direct comparator. |
| E04 | LLVM RISC-V frame lowering includes `emitSCSPrologue`, CFI and ordinary frame/callee-save machinery. | prologue/epilogue/unwind state is in fair union. |
| E05 | Linux current Zicfiss docs cover ELF/psABI/runtime interfaces. | runtime and relocation contract cannot be omitted. |
