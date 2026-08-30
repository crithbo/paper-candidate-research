# RAW_SCREEN_ROW_EVENTS

| Row | Event | First-party basis | Initial whole-action sketch | Disposition |
|---|---|---|---|---|
| R01 | Arm SME ZA call-state seam, carried from Wave187 `NOT_ADMITTED_UNFROZEN` for finite closure | Arm `aapcs64` 2025Q4 source; Arm ACLE main; Arm LLVM 22 report; LLVM source/test entrypoints | A caller with active/dormant ZA executes a chain of streaming, streaming-compatible, and non-streaming callees, then returns or unwinds while preserving the prescribed PSTATE.SM/ZA, TPIDR2 and observable matrix result. | `CANDIDATE_GRADE_DEEP_REVIEW` |

This is a re-examination of an unfrozen seam, not a revival of a terminal topic. No paper limitation or future-work sentence was treated as a gap.

