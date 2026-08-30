# Command log

All timestamps are Asia/Shanghai. Read-only commands before directory creation are summarized here because no assignment directory existed yet. Exact acquisition/build/experiment commands will be appended before execution or immediately after return.

## 2026-08-11 preflight

1. Recomputed SHA-256 and line counts for `AGENTS.md`, `plan.md`, `registry.yaml`, `rules/ROLE_CANDIDATE_OWNER.md`, academic-research-suite `SKILL.md`, and `ars/academic-pipeline/WORKFLOW.md` using PowerShell `Get-FileHash` and `Get-Content`.
2. Read the required control, role, skill, workflow, topic-only Discovery/Stage0 files, and role-required templates with `Get-Content -Raw -Encoding UTF8` (the 639-line workflow was read in three explicit line ranges).
3. Located the current topic/lane/assignment records with `rg`; current registry still binds the exact assignment and write directory despite registry hash drift.
4. Recomputed all five upstream manifests with `Get-FileHash`: Discovery `5/5`, PRIMARY `4/4`, confirmation `2/2`, revision1 `4/4`, closing `2/2`, all PASS.
5. Probed PATH for `git`, `cmake`, `ninja`, `clang++`, `g++`, `cl`, `python`, `py`, and `flatc`. Only system Git was present; `py` reported no installed Python. This was a resource preflight, not a claim-bearing run.
6. Loaded the read-only Codex workspace dependency map. It exposes a bundled Python runtime at `C:\Users\15383\.cache\codex-runtimes\codex-primary-runtime\dependencies\python\python.exe`; no C/C++ compiler was listed.
7. Created only the authorized assignment directory and its subdirectories. A PowerShell expression initially created an empty sibling directory named `initial+`; it was immediately verified to contain no files and removed, then the intended subdirectories were created beneath `initial`. No scientific artifact was lost.

## Claim-bearing boundary

- first_claim_bearing_observation_started: `false`
- preclaim_gate_status: `PASS` at `2026-08-11T08:47:00+08:00`; the runs below are gate validation only.
- resource_attempt_recorded: `false`

## 2026-08-11 pinned acquisition and source audit

1. Windows `curl.exe` failed before transfer with Schannel `SEC_E_NO_CREDENTIALS`. This was recorded as a TLS route failure and not treated as scientific evidence. `git -c http.sslBackend=openssl` and the bundled read-only Python HTTPS client were then used as public routes.
2. GitHub release metadata pinned `Windows.flatc.binary.zip` (`1,412,094` bytes, SHA-256 `FFF9445C...DDC8`) and official llvm-mingw `20260616` (`187,504,083` bytes, SHA-256 `B9B68A4D...CA35`).
3. Downloaded the FlatBuffers exact-commit archive (`3,541,549` bytes, SHA-256 `BDA1AE95...E482`) and flatc asset, rejecting any size/hash mismatch.
4. The first llvm-mingw transfer ended `24,979` bytes short. The `.part` file was rejected; one safe retry produced the exact advertised size and SHA-256. No partial archive was extracted.
5. `scripts/extract_frozen.py` extracted only safe ZIP members under the assignment. No system/global installation or environment mutation occurred.
6. Tool versions: `flatc version 25.12.19`; `clang version 22.1.8 (ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)`, target `x86_64-w64-windows-gnu`.
7. Recomputed Git blob IDs and SHA-256 for the builder, verifier, base/vector/buffer/reflection headers, `idl_gen_cpp.cpp`, and Apache-2.0 license. Exact values are in `SOURCE_PROVENANCE.yaml`.
8. Pinned official `tensorflow/tflite-micro` HEAD `18b9e6f2a8c5a9518e588f59c2ba16ef7ef9d551`. Its non-truncated recursive tree has `1,986` entries and `144` `.tflite` candidates. Before the gate, only the license and schema were downloaded.
9. Generated the pinned TFLite `.bfbs` and C++ object API header with:
   - `flatc --binary --schema --bfbs-comments -o inputs/tflite_schema schema.fbs`
   - `flatc --cpp --cpp-std c++17 --gen-object-api -o inputs/tflite_schema schema.fbs`
10. Source/generated audit found exactly four applicable force-vector-alignment sites (`16,4,4,16`), no `offset64`, identifier `TFL3`, and root `Model`. The complete disposition is in `NATIVE_ACTION_CATALOG.md`.

## 2026-08-11 native 56-byte witness

1. Generated `witness_generated.h` with pinned flatc.
2. The first successful compile produced a dynamically linked executable; the process exited `-1073741515` before output because a runtime DLL was unavailable. This was a local linkage preflight failure and produced no gate/scientific result.
3. Recompiled assignment-locally with:
   `clang++ -std=c++17 -O2 -DNDEBUG -static -static-libgcc -static-libstdc++ -I <pinned-flatbuffers-include> witness_replay.cpp -o witness_replay.exe`.
4. Native execution exited `0`: both stock-built buffers were exactly `56` bytes; unmodified generated reader/verifier passed; plan A addresses were root/left/right `12/48/32`; plan B `12/32/48`; frozen profile distances were `20/36`. Exact output is `results/preclaim_native_witness.json`.

## 2026-08-11 tiny exhaustive oracle and candidate quotient

1. Generated `tiny_oracle_generated.h` from `tiny_oracle.fbs` using pinned flatc. The first schema compile correctly rejected an erroneous vector-level `(key)` attribute; the schema was corrected to use the table key declaration, after which generation exited `0`.
2. Compiled `tiny_oracle_dp.cpp` with the same static native command and pinned include tree.
3. Two implementation-debug runs were non-gate runs: the first exposed that a table start is not required to have its widest field's alignment; the explicit assertion was moved to the reader-visible force-aligned vector address. The next exposed that plan uniqueness keys needed to include the fixed config arm. Both were corrected before gate evaluation; neither touched the object/action grammar or natural data.
4. Final native run exited `0` and returned `pass:true`. Across `DedupVtables(false,true) x ForceDefaults(false,true)`, the complete oracle enumerated `192 + 432 + 512 = 1,136` unique config-labelled action paths. Every stock verifier, generated reader, identifier, alias/value/key-order and applicable native alignment check passed. The exact candidate frontier equalled the exhaustive frontier in all three cases and observed strict raw-prefix merges after last-use forgetting. Exact output is `results/preclaim_tiny_oracle.json`.
5. The same executable separately ran generated/direct default baselines for all three roots, including the generated direct helper containing `ForceVectorAlignment`; all passed.

## Pre-claim gate decision

The gate is closed `PASS` only for: atomic action mapping, native codec parity, comparator semantics, common-denominator/full-cost registration, 56-byte witness, and tiny exact oracle equality. No official natural model had been downloaded or measured at this point; therefore no claim-bearing scientific observation preceded the gate.

## 2026-08-11 natural corpus freeze

1. After gate PASS, froze `inputs/corpus_selection.tsv`: 24 public natural `.tflite` buffers from nine families at official tflite-micro commit `18b9e6f2a8c5a9518e588f59c2ba16ef7ef9d551`; split 11 training / 13 held-out by disjoint family before outcomes.
2. Ran `scripts/freeze_corpus.py` with the bundled Python runtime. It downloaded exact raw-commit URLs, checked every advertised byte count and Git blob SHA-1 before writing, computed SHA-256, and produced `inputs/natural_corpus_manifest.json`. Result: `pass:true`, `count:24`, `bytes:34572`.

## 2026-08-11 native natural harness

1. Compiled the pinned native harness assignment-locally:
   `clang++ -std=c++17 -O2 -DNDEBUG -static -static-libgcc -static-libstdc++ -I <pinned-flatbuffers-include> -I inputs/tflite_schema scripts/natural_native_harness.cpp -lpsapi -o scripts/natural_native_harness.exe`.
2. The first accepted compile exposed two public-API signature errors (`StartVector` alignment argument and `EndVector` return type); these were compile-time only and corrected before any run.
3. A one-model post-gate harness debug run passed the stock verifier but failed the canonical identity/presence digest for all custom-direct arms. The rows were not written into the frozen natural result. Inspection found a C++ vector-reference invalidation in recursive graph extraction; it omitted logical graph records and was a mechanical same-object implementation defect, not candidate evidence.
4. Corrected the extractor to assemble recursive nodes in local values and commit them by index after recursion. Recompiled with the identical compiler/flags. Replaying the same already-frozen model then produced eight eligible native outputs; no object, beam width (`8`), transition cap (`20000`), profile, metric or comparator changed.
5. Ran `scripts/run_natural_corpus.py`. It invoked the native executable without a shell for all 24 frozen models, retained per-model stdout/stderr, and required exactly eight arms. Result: `pass:true`, `models:24`, `arms:192`, orchestration wall `3.026 s`.
6. All 192 rows had `eligible=verify=equality=identifier=alignment=1`. The exact consolidated rows are `results/natural_results.csv`; per-model raw outputs and profile-extraction records are retained.
7. Ran `scripts/analyze_results.py` without adding or tuning arms. It compared FB-RCFDP with the best eligible complete-union row model by model and produced `results/per_model_residual.csv` plus `results/summary.json`.
8. Decisive held-out deltas (candidate minus best union, positive is worse): raw bytes `+2.362% p50 / +4.180% p90`; weighted distance `+165.980% / +283.061%`; warm reader `+0.499% / +1.154%`; cold reader `+0.691% / +1.711%`; builder wall `+49.454% / +78.125%`. Candidate planning wall was `43.683 / 104.179 ms` p50/p90 and two held-out models fell back.
9. Candidate strict quotient telemetry: 886 distinct-raw merges / 156,163 expanded transitions, active on 22/24 models. This proves non-singleton natural state compression but does not rescue the absent p50/p90 primary/full-cost residual.
10. Owner result: `RECOMMEND_STAGEA_STOP_TO_INDEPENDENT_GATE`; evidence ceiling `BOUNDED_NATURAL_NATIVE_STAGEA_NEGATIVE__OWNER_NONFINAL`. No Stage B action was started.
