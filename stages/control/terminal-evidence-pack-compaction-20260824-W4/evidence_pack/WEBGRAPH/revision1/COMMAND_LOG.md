# WEBGRAPH-REFERENCE-FOREST revision1 command log

- Lane: `CANDIDATE_EXECUTION_LANE_1`
- Assignment: `STAGEA-L1-20260810-WEBGRAPH-REFERENCE-FOREST-REVISION1-V8.7`
- Unique write root: `D:\project\writing\reserch\stages\stageA\WEBGRAPH-REFERENCE-FOREST\revision1`
- Cross-assignment contamination: `false`
- Network budget/observed: `0 B / 0 B`
- Stage B: `false`; approval: `null`

## 2026-08-10 — intake and immutable contract

1. Read `AGENTS.md`, `plan.md`, the assigned registry block, `rules/ROLE_CANDIDATE_OWNER.md`, the required Stage A/Q1/user/handoff templates, and the academic-research-suite experiment execution/reproducibility protocols.
2. Read only the WEBGRAPH initial owner package and its independent gate package. No queued or other candidate evidence was read.
3. Recomputed independent gate hashes: report `3094E0CD...F7DE1`, handoff `886AF273...3306`, manifest self `ED8A7553...1FBB`; manifest entries `2/2 PASS`.
4. Confirmed `revision1` did not exist before this assignment.
5. Frozen `REVISION_CONTRACT.yaml` and `RESOURCE_SCOPE_FREEZE.yaml` before implementation and before any claim-bearing revision run.

All commands below use process-local environment only. Exact commands, exit codes, elapsed/CPU/RSS, produced files and hashes are appended before delivery.

## Mechanical implementation/build record

6. Copied only the parent candidate source, candidate harness, frozen offline Cargo cache, and the already-frozen baseline/reader executables into `revision1`. No initial file was modified.
7. Replaced the vector-keyed `BTreeMap` frontier with dense base-4 IDs, two rolling frontier arrays, compact `(u16 predecessor, u8 delta)` backpointers, and lexicographic prefix ranks. The only secondary objective is `(sum depth, max depth, lexicographic delta vector)`.
8. First offline build attempt (`cargo build --release --offline --locked`) failed before any executable/run because `lender::prelude::*` made the iterator `.copied()` call ambiguous (`E0271`, `E0599`). This is a mechanical compiler error, not evidence and not a revision-consumption event. Replaced that loop with direct indexed iteration; no algorithm, object or contract changed.
9. A first tiny process attempt exited `-1073741515` before execution because the portable runtime DLL directory was absent from process-local `PATH`; the audit file was not created and the independent validator therefore returned `ENOENT`. Retained this failed attempt. Added only the frozen topic-local `clang64/bin` and `usr/bin` to that process environment.
10. Tiny attempt 2 passed: candidate/baseline `148/148` bits; independent exhaustive validator enumerated `38,372` legal forests and matched the frozen secondary optimum `(sum=3,max=1,lex=[0,0,0,0,1,2,0,4,0])`. All native writer/offset/EF/sequential/random checks passed.
11. Complete 2,048-case non-claim-bearing replay passed. Every baseline/exact primary pair matched the parent audit; strict cases remained `531`, exact-worse remained `0`, and `case-0043` remained `561 -> 560`. Dense state count was 256 in every chunk; maximum rolling-array/backpointer storage was `12,288/24,576 B` for these 24-node chunks.
12. Both natural objects were replayed before revision consumption. Exact graph-bit totals remained `8,763,554` and `875,555`; baseline totals/hashes remained exact; all semantics/checksums passed. The first validator attempt deliberately retained a failed `pass=false` because it incorrectly demanded byte-for-byte equality to the parent's payload residual, although the gate freezes graph-bit totals and only strict positive persisted residual under legal equal-bit tie changes. The measured new strict residuals were `72,761 B` and `127 B`. The validator condition was mechanically corrected to `residual_bytes > 0`; no observation or configuration changed.

## Scientific revision and claim-bearing matched pairs

13. Wrote immutable `SCIENTIFIC_REVISION_CONSUMPTION.yaml` at `2026-08-10T19:42:31.8755069+08:00`, immediately before the first claim-bearing CNR matched pair. The file records the preclaim result/source/executable/contract hashes. `scientific_revision_consumed=true` from this point.
14. Executed `scripts/run_claim_matched_pairs.ps1` with the frozen parent and revision roots. It ran CNR pairs 0–10 followed by Wiki pairs 0–10; even pairs used baseline→candidate and odd pairs candidate→baseline. Every variant performed full build/write/EF/semantic validation and one fixed-seed 100k reader run. Exit status: `0`; completed pairs: `22/22`; variant builds/readers: `44/44` each.
15. Executed `scripts/analyze_claim_matched_pairs.mjs`. It verified 44 raw rows, exact bits, stable four-file hashes and equal checksums, excluded pair 0, computed lower-median p50 and nearest-rank p90, and produced `matched-pair-summary.json` plus `full-cost-ratios.tsv`. Fidelity was valid. Ten frozen ratio cells exceeded 1.05; decision: `STOP_NARROW_FROZEN_MECHANISM`.
16. Executed `scripts/analyze_secondary_depths.mjs`. The allowed tie-break reduced parent exact total chain depth by 9,712 (CNR) and 118 (Wiki), but revision exact depth remained 52,194 and 288 above final BvCompZ. This mechanism analysis is post-run and was never read by selection.

## Exact reproducibility commands

All commands were run from `D:\project\writing\reserch` with no network:

```powershell
cargo.exe build --release --offline --locked --manifest-path <revision1>\implementation\candidate-harness\Cargo.toml --target-dir <revision1>\build\candidate-target
powershell.exe -NoProfile -ExecutionPolicy Bypass -File <revision1>\scripts\run_preclaim_structural.ps1 -ParentRoot <parent> -RevisionRoot <revision1>
node <revision1>\scripts\validate_preclaim_structural.mjs <parent> <revision1> <revision1>\results\preclaim\structural\validation.json
powershell.exe -NoProfile -ExecutionPolicy Bypass -File <revision1>\scripts\run_preclaim_natural.ps1 -ParentRoot <parent> -RevisionRoot <revision1>
node <revision1>\scripts\validate_preclaim_natural.mjs <parent> <revision1> <revision1>\results\preclaim\natural\validation-attempt2.json
powershell.exe -NoProfile -ExecutionPolicy Bypass -File <revision1>\scripts\run_claim_matched_pairs.ps1 -ParentRoot <parent> -RevisionRoot <revision1>
node <revision1>\scripts\analyze_claim_matched_pairs.mjs <revision1> <revision1>\results\claim\matched\matched-pair-summary.json
node <revision1>\scripts\analyze_secondary_depths.mjs <parent> <revision1> <revision1>\results\claim\matched\secondary-depth-summary.json
```

No Stage B command, network command, system installer, global PATH mutation, automation or project write was executed.
