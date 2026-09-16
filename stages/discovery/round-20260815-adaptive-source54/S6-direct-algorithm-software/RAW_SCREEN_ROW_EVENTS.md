# Raw-screen events

| Event | Candidate | Disposition | Reason |
|---|---|---|---|
| E01 | GCC IPA-RA whole-call-graph allocation/caller-save construction | `EXCLUDED_BEFORE_RAW__GENERIC_REGISTER_ALLOCATION_KERNEL` | Current official option exposes the native caller-save action; the proposed residual is target-agnostic interprocedural RA, forbidden as a generic solver/kernel. |
| E02 | RISC-V RVC exact identity | `EXCLUDED_BEFORE_RAW__FROZEN_DIRECT_COLLISION` | Exact terminal record; no external delta. |
| E03 | GHC worker/wrapper, LLVM global merge, OpenMP mapping, template scheduling, layout seeds | `RQ_BACKLOG__NOT_SELECTED` | Non-evidence backlog; none was promoted or researched this cycle. |

No raw, deep review, or brief is created.  No scientific disposition rests on implementation/result/resource/readiness absence.
