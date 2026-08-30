# Full Cost Ledger

All costs below use the frozen same-object boundary. Unavailable measurements are not estimated.

## Resource and build

| Component | Wall | CPU | Peak memory | Bytes / notes |
|---|---:|---:|---:|---|
| Exact LLVM source/tool/bootstrap acquisition | not separately timed end-to-end | not provided | not provided | 522,866,746 successful response bytes including the official Embench archive |
| Exact LLVM+LLD build | 1,360.158400 s | ≤2,720.316800 s conservative two-job bound | 3,471,986,688 B working set; 3,570,847,744 B private | 2,160/2,160 steps; follow-up no-work exit 0 |
| Exact `llvm-extract` continuation target | 3.248211 s wrapper wall | this run did not expose exact CPU; no estimate | not provided | 2/2 Ninja steps; binary 14,282,752 B |
| Resume directory at close | n/a | n/a | n/a | 6,773,058,740 file bytes, below the 35 GiB authorization |

The build instrumentation JSON has `exit_code: null`; the successful 2,160/2,160 Ninja transcript and an independent follow-up no-work exit 0 are retained. No system install, global PATH change or source patch occurred.

## Canonical corpus and common preparation

| Component | Wall | CPU | Peak RSS/working set | Output |
|---|---:|---:|---:|---|
| Clang frontend, 23 source modules | 3.909120 s | 0.250000 s | 4,280,320 B | 1,936,598 LLVM IR bytes |
| Exact pre-greedy generation, manifest modules | 24.641107 s | exact child CPU not collected; no estimate | not collected | 24 directory entries were initially processed; canonical manifest filtering retained 23 |
| Exact `llvm-extract` + regenerated pre-greedy MIR, 5 initial eligible functions | 0.883188 s | 0.390625 s | 23,097,344 B | 5 exact single-function inputs |

The extra 24th pre-greedy entry was a duplicate CRC smoke artifact. It produced no eligible function. `CANONICAL_ELIGIBILITY.json` filters exclusively by the 23-entry `MODULE_FREEZE.json` and reproduces the identical five-function initial eligible set.

## Claim-bearing pilot

| Component | Count | Wall | CPU | Peak working set | Artifact bytes |
|---|---:|---:|---:|---:|---:|
| Candidate planners, including result-independent final eligibility attempt | 5 | 1.022293 s | 0.687500 s | 18,804,736 B | included below/logged |
| Candidate native continuation pipelines | 11 | 4.029076 s | 1.671875 s | ≤23,273,472 B | included in 651,252 B total |
| Complete current-union native pipelines | 72 | 26.146138 s | 11.156250 s | ≤23,273,472 B | included in 651,252 B total |
| All five-step native pipelines | 83 | 30.175214 s | 12.828125 s | 23,273,472 B | 651,252 B |

Each five-step pipeline is `llc + MachineVerifier`, `llvm-mc`, `ld.lld -r`, `llvm-readobj`, and `llvm-objdump`. Candidate full construction adds the entire per-function planner cost. There were zero native candidate fallbacks or verifier failures among the 11 accepted plans. `freeecc` was excluded before candidate-versus-union outcome because exact single-function replay contained no cross-call scalar virtual register.

## Paired primary and cost result

Nearest-rank summaries over the four retained natural functions:

| Candidate minus strongest union | p50 | p90 |
|---|---:|---:|
| complete function text bytes | 0 B | 0 B |
| complete native frame bytes | 0 B | 0 B |
| full construction CPU | +0.156250 s | +0.218750 s |
| full construction wall | +0.176621 s | +0.255073 s |

Runtime cycles/nanoseconds were unavailable because the frozen RV32 target object is not executable on this Windows host and no target runtime was part of the authorized exact toolchain. No estimate is made. This absence does not create the negative result: the candidate has no registered static primary benefit and is already dominated before runtime is considered.
