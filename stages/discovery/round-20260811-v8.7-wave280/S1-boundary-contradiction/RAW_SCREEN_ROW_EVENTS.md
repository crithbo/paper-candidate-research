# RAW_SCREEN_ROW_EVENTS — Wave280

| event | current first-party fact | union implication |
|---|---|---|
| E01 | Arm ACLE/PCS defines streaming interface and ZA assertions; PCS contains ZA save-buffer rules. | PSTATE.SM/ZA and save-buffer semantics are fixed same-object contract. |
| E02 | LLVM `SMECallAttrs` explicitly decides streaming-mode change, lazy save, ZT0 and all-ZA preservation. | call-lowering actions are already target-specific and complete. |
| E03 | LLVM SME lowering has `SMSTART`, `SMSTOP`, `RESTORE_ZA`; source protects the call boundary from unsafe frame-index insertion. | mode/save ordering is in the current native pipeline. |
| E04 | LLVM AArch64 frame/prologue code models scalable SVE objects, callee saves, CFI and SME hazards. | frame/spill/unwind are part of the strongest union. |
| E05 | GCC's official SME attribute implementation states the ABI cooperative lazy-save scheme and allows full save/restore. | LLVM is not a weak baseline; GCC is a direct same-object competitor. |
