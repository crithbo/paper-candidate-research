# Reproduction

All paths below are relative to this assignment directory. Run from PowerShell with no global installation.

1. Verify the frozen inputs and tools against `SOURCE_PROVENANCE.yaml` and `inputs/natural_corpus_manifest.json`.
2. Regenerate tiny/TFLite headers with `toolchain/flatc-v25.12.19/flatc.exe` and the commands recorded in `COMMAND_LOG.md`.
3. Compile the two native gate executables with assignment-local clang 22.1.8 and the exact static commands in `COMMAND_LOG.md`.
4. Run `witness/witness_replay.exe` and `witness/tiny_oracle_dp.exe`; compare stdout with `results/preclaim_native_witness.json` and `results/preclaim_tiny_oracle.json`.
5. Compile `scripts/natural_native_harness.cpp`:

   `toolchain/llvm-mingw-20260616-ucrt-x86_64/bin/clang++.exe -std=c++17 -O2 -DNDEBUG -static -static-libgcc -static-libstdc++ -I sources/flatbuffers-7e163021e59cca4f8e1e35a7c828b5c6b7915953/include -I inputs/tflite_schema scripts/natural_native_harness.cpp -lpsapi -o scripts/natural_native_harness.exe`

6. Use the bundled read-only Python runtime to run `scripts/run_natural_corpus.py`, then `scripts/analyze_results.py`. The exact runtime path is recorded in `COMMAND_LOG.md`; standard Python 3.11+ is also sufficient for orchestration.
7. Run `scripts/build_hash_manifest.py`, then `scripts/verify_hash_manifest.py`. Verification must report every listed artifact PASS.

The generated result CSV contains 192 rows. Expected invariant: all eight arms for all 24 models have `eligible=verify=equality=identifier=alignment=1`. Expected owner killer is recorded in `results/summary.json`.
