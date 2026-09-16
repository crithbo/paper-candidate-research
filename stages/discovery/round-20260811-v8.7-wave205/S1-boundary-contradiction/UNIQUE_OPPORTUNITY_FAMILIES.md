# UNIQUE_OPPORTUNITY_FAMILIES

## Exact objects and natural carriers

| ID | Same-object carrier / oracle | Whole-action question | Screening outcome |
|---|---|---|---|
| R01 AMX | public AMX matrix kernel plus signal/context-switch path; XSAVE state and output matrix oracle | jointly construct tile acquire/configure/use/release around calls without changing XSTATE or signal guarantee | existing compiler release/lazy OS ownership absorbs local action |
| R02 CET | ordinary C++ call/throw/catch program; hardware shadow-stack and DWARF/unwind oracle | construct whole call/unwind shadow-stack transition plan under identical CFI | CPU state machine and standard compiler/unwind path leave no non-wrapper action |
| R03 MTE | tagged allocator program with sync tag fault; address/tag/fault oracle | jointly choose tag-state lifetime and handler transitions with same detection guarantee | full current allocator/runtime union not source-pinned; no candidate admitted |
| R04 Zicfiss | non-leaf call chain; `ssp` and software-check trap oracle | construct complete push/pop/check/unwind state plan with identical backward-edge guarantee | ISA already fixes each protected call/return action; toolchain/runtime union not fully pinned |
| R05 PAC | PAC-ret function with exception frame; authenticated return oracle | change signing/auth placement while keeping modifier and failure semantics | attribute/prologue lowering or changed protection; drop |
| R06 Morello | purecap call/context test; capability-tag/bounds oracle | retain capability state across compiler/runtime boundary | target/ABI guarantee and current complete union are not closed; no native whole action frozen |

Full-cost for any future admissible item: compile time, code size, dynamic state-transition work, context/signal/unwind work, runtime, stack/RSS, and oracle cost.

