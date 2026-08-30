# Command log

All timestamps use Asia/Shanghai. Commands are recorded before execution or immediately after return. No command may write outside this assignment directory.

Every `python` shorthand below denotes the read-only bundled Python 3.12.13 executable `C:\Users\15383\.cache\codex-runtimes\codex-primary-runtime\dependencies\python\python.exe`; scripts were invoked from the revision root and wrote only inside it.

## Read-only intake and upstream verification

1. Fully read `AGENTS.md`, `plan.md`, `registry.yaml`, `rules/ROLE_CANDIDATE_OWNER.md`, academic-research-suite `SKILL.md`, `ars/academic-pipeline/WORKFLOW.md`, role-required templates, the fixed initial owner package, and the fixed independent gate package.
2. Recomputed the four initial owner hashes and six independent-gate hashes: all exact.
3. Ran the initial read-only manifest verifier with the bundled Python runtime: `manifest_verify=PASS entries=11519` and manifest SHA-256 `6AD1305983AA337B35267BDA31DD543129952F2B650573D125257775DE3F2C2A`.
4. Independently parsed and verified the gate manifest: `5/5 PASS`, manifest SHA-256 `2C9ECD72A92ECEF7DB4BA8E08EDB6EAE3137D565383D70A45248209E2C1A09A6`.
5. The assignment-dispatch control hashes matched at first read. Later shared-control hashes drifted while mainline updated task status; exact observed values and their non-scientific disposition are frozen in `CONTINUITY.md`.

## Pre-execution claim-boundary snapshot

- revised preclaim gate: `PENDING`
- first accepted corrected natural claim-bearing observation: `NOT_STARTED`
- scientific revision consumed: `false`
- Stage B: `false`

This was the state before trace collection and is retained as the preregistration checkpoint. The final gate/run state is recorded below: gate `PASS`, first accepted corrected observation obtained, scientific revision consumed, Stage B still `false`.

## Preregistered next operations

1. Build an assignment-local trace collector and revised native harness with the pinned initial compiler/includes, without installing anything.
2. Run the collector only on the 11 frozen `train` entries. Freeze the request/event trace, endpoint mapping, count estimator, source hashes, and request program before any corrected natural objective row.
3. Re-run the unchanged 56-byte witness and tiny exhaustive oracle, then run a suppress-objectives arm-executability check. Close the revised preclaim gate only if every fidelity item passes.
4. Only after gate PASS, run the unchanged 24-model/8-arm natural evaluation and accept the first corrected row as the scientific revision consumption point.

## Native build

Used only the read-only pinned initial toolchain and headers; outputs were written under `revision1/scripts`:

`initial/toolchain/llvm-mingw-20260616-ucrt-x86_64/bin/clang++.exe -std=c++17 -O2 -DNDEBUG -static -static-libgcc -static-libstdc++ -I initial/sources/flatbuffers-7e163021e59cca4f8e1e35a7c828b5c6b7915953/include -I initial/inputs/tflite_schema revision1/scripts/trace_collector.cpp -lpsapi -o revision1/scripts/trace_collector.exe`

`initial/toolchain/llvm-mingw-20260616-ucrt-x86_64/bin/clang++.exe -std=c++17 -O2 -DNDEBUG -static -static-libgcc -static-libstdc++ -I initial/sources/flatbuffers-7e163021e59cca4f8e1e35a7c828b5c6b7915953/include -I initial/inputs/tflite_schema revision1/scripts/natural_native_harness.cpp -lpsapi -o revision1/scripts/natural_native_harness.exe`

Both compiled with exit code `0`. Final source/executable SHA-256 values are recorded in `SOURCE_PROVENANCE.yaml`.

## Training-only trace freeze

Ran with the bundled read-only Python runtime:

`python scripts/freeze_training_trace.py`

Result: `PASS`, 11 training models, 704 requests, 23,936 ordered accessor events, 34 mapped endpoints, `heldout_files_opened=false`, `initial_result_files_opened=false`. `TRACE_FREEZE.yaml` SHA-256: `4F6B2CE063D1FFA31B249DB3379ECB83BF46AA9116A189ACC6371706A5F2F832`. The exact unsmoothed counts were frozen before any corrected natural objective row.

## Revised preclaim fidelity gate

Ran `python scripts/run_preclaim_gate.py`.

Attempt 1 correctly failed closed because the checker compared native stdout against owner-enriched JSON fields (`native_exit_code`, compiler/source metadata) that the executable itself does not emit. All trace/arm/full-cost checks passed; no objective row was emitted. The immutable result is `preclaim/GATE_RESULT_attempt1_fail.json`. The checker was mechanically corrected to require that every native stdout field equals the frozen expected payload and to record the actual process exit code; no scientific contract or algorithm changed.

Attempt 2 passed. Before natural execution, the gate was further hardened to assert that trace-derived names hit the reflection graph rather than silently producing zero weights. The prior PASS is retained at `preclaim/GATE_RESULT_attempt2_pass_before_profile_hit_assert.json`.

Final preclaim run: `PASS`; 8/8 arms eligible with one canonical digest, 704 frozen requests, collector/native replay checksum `15,744`, 19 positive profile fields and applied weight sum `13,376` on the suppress-objectives carrier, unchanged 56-byte witness PASS, unchanged 1,136-path tiny oracle PASS, and `objective_rows_emitted=0`. Final gate result SHA-256: `E7D49295E65C085CA00B0F3284D994223C48941CDD989A6B548EE26A8E9ED1A1`.

## Corrected claim-bearing natural run

After final gate PASS, ran:

`python scripts/run_natural_corpus.py`

Result: `PASS`, 24 frozen models, 8 frozen arms/model, 192 rows, orchestration wall `3.3709234 s`. Every row had `eligible=verify=equality=identifier=alignment=1`. The first accepted eight-row model was `00_quantize_quantize0`; `results/SCIENTIFIC_REVISION_CONSUMPTION.json` froze the consumption point at `2026-08-11T09:34:45.650613+08:00`. Scientific revision is therefore consumed.

## Frozen analysis and recomputation

Ran `python scripts/analyze_results.py`, then `python scripts/audit_corrected_results.py` without changing any trace, input, arm, plan bound, metric or success rule.

Primary analysis result: owner `STOP_RECOMMENDED__OWNER_NONFINAL`; useful residual fraction `0/1,146 = 0`; no raw-byte or trace warm/cold metric was better at both held-out p50 and p90. Candidate remained on the whole-executable-arm full-cost frontier at both aggregate quantiles, but this cannot qualify without a primary benefit.

The separate mechanical audit independently reproduced `192/192`, `0/1,146`, all six held-out paired p50/p90 values, and both aggregate frontier arm sets exactly. Audit result SHA-256: `18644A13AEB65393C6CB1AE5AA84BAB7A71F4D2A7F746BE22C978BFF0EBB25AC`.

## Packaging and final mechanical verification

No experiment, input, profile, arm, parameter, result or decision is changed during this step. The following assignment-local commands complete the immutable handoff:

`python scripts/build_hash_manifest.py`

`python scripts/verify_hash_manifest.py`

The manifest builder excludes only `HASH_MANIFEST.sha256` itself and enumerates every other regular file recursively. The verifier fails closed on a malformed line, duplicate path, coverage difference or content-hash mismatch. Its successful stdout and the manifest's self-hash are reported in the final lane response; the verified manifest is not edited afterward.
