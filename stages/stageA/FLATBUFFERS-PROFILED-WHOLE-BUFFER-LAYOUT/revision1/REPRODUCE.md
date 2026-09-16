# Reproduction entry point

This package is self-contained with respect to the frozen revision inputs and reuses only the read-only pinned compiler, FlatBuffers source, TFLite schema and 24-model corpus in `..\initial`. It performs no network access, installation, global environment change, corpus discovery or configuration search.

Run from:

`<LEGACY_LOCAL_PROJECT_ROOT>\stages\stageA\FLATBUFFERS-PROFILED-WHOLE-BUFFER-LAYOUT\revision1`

Use bundled Python 3.12.13 at `<LOCAL_USER_HOME>\.cache\codex-runtimes\codex-primary-runtime\dependencies\python\python.exe`, also recorded in `SOURCE_PROVENANCE.yaml`. Every `python` shorthand below denotes that executable. The exact native build commands are frozen in `COMMAND_LOG.md`; both outputs must be placed under `scripts\`.

## Strict order

1. Read-only verify the fixed initial manifest (`11,519/11,519`) and independent-gate manifest (`5/5`) using the hashes in `CONTINUITY.md`.
2. Compile `scripts\trace_collector.cpp` and `scripts\natural_native_harness.cpp` with the pinned initial llvm-mingw compiler and include roots using the exact commands in `COMMAND_LOG.md`.
3. Freeze the training-only profile:

   `python scripts/freeze_training_trace.py`

   Require `PASS`, exactly 11 training models, 704 requests, 23,936 ordered events, 34 endpoints, and both `heldout_files_opened=false` and `initial_result_files_opened=false`.
4. Run the suppress-objectives revised fidelity gate:

   `python scripts/run_preclaim_gate.py`

   Require `preclaim/GATE_RESULT.json` status `PASS`, `objective_rows_emitted=0`, 8/8 eligible arms with one canonical digest, collector/replay checksum 15,744, positive profile hits, the 56-byte witness PASS and the 1,136-path tiny oracle PASS. Stop before natural evaluation on any mismatch.
5. Only after step 4 PASS, run the unchanged natural evaluation:

   `python scripts/run_natural_corpus.py`

   Require 24 models, 8 arms/model, 192 rows and every same-object eligibility field equal to one.
6. Derive the registered statistics and independently recompute them:

   `python scripts/analyze_results.py`

   `python scripts/audit_corrected_results.py`

7. After all narrative files and `handoff.yaml` are final, create and verify the assignment-wide manifest:

   `python scripts/build_hash_manifest.py`

   `python scripts/verify_hash_manifest.py`

## Expected bounded result

- Revised preclaim gate: `PASS` before any corrected objective row.
- Corrected outputs: `192/192` eligible and same-object.
- Useful residual action fraction: `0/1,146`.
- Owner decision: `STOP_RECOMMENDED__OWNER_NONFINAL`.
- Evidence ceiling: `CORRECTED_TRACE_PROFILED_SAME_OBJECT_24_MODEL_STAGEA_NEGATIVE__OWNER_NONFINAL`.
- Scientific revision: consumed at the timestamp in `results/SCIENTIFIC_REVISION_CONSUMPTION.json`.

Exact trace artifacts, native stdout/stderr, raw rows, summaries and recomputation records are retained. The owner decision is not a final state transition; independent Stage A gate review and mainline acceptance remain required.
