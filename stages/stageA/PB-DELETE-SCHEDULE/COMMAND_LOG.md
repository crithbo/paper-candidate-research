# Command Log

Assignment: `STAGEA-L2-20260809-PB-DELETE-SCHEDULE-INITIAL`  
All project paths are under `D:\project\writing\reserch`.

## Input and preregistration gate

| Phase | Command/action | Result | Claim-bearing |
|---|---|---|---|
| Instructions | Fully read `AGENTS.md`, `plan.md`, `registry.yaml`, `rules/ROLE_CANDIDATE_OWNER.md`, Stage A templates, academic-research-suite `SKILL.md`, experiment workflow, code-runner role, and reproducibility protocol. | Complete. | No |
| Upstream hashes | PowerShell `Get-FileHash -Algorithm SHA256` plus each allowed upstream `HASH_MANIFEST.sha256`. | Discovery 4/4, Stage0 primary 4/4, confirmation 2/2; all named hashes matched. | No |
| Contract | Created `EXPERIMENT_CONTRACT.yaml` at `2026-08-09T17:18:58.6968344+08:00`. | Frozen before acquisition/performance. | No |

## Official acquisition and executable closure

Representative literal commands are shown below; byte/hash gates are in `SOURCE_MANIFEST.yaml`.

```powershell
curl.exe --fail --location --show-error --output certified_maxpre_experimental_data.zip https://zenodo.org/api/records/10630852/files/certified_maxpre_experimental_data.zip/content
Get-FileHash certified_maxpre_experimental_data.zip -Algorithm MD5
Get-FileHash certified_maxpre_experimental_data.zip -Algorithm SHA256
tar.exe -xf certified_maxpre_experimental_data.zip -C artifact

curl.exe -L --fail --output toolchain\cakepb-6edb2f3585f1c3e1b925964c4f33e133f7279d02.retry.tar.gz https://gitlab.com/MIAOresearch/software/cakepb/-/archive/6edb2f3585f1c3e1b925964c4f33e133f7279d02/cakepb-6edb2f3585f1c3e1b925964c4f33e133f7279d02.tar.gz

toolchain\zig-x86_64-windows-0.16.0\zig.exe cc -target x86_64-windows-gnu -D__WIN32 -DCML_HEAP_SIZE=512 -DCML_STACK_SIZE=128 -O2 toolchain\cakepb-6edb2f3585f1c3e1b925964c4f33e133f7279d02\basis_ffi.c build\cake_pb_wcnf_v3_windows.S -o build\cake_pb_wcnf_v3.exe

cargo.exe build --release --locked --offline
```

The final Cargo command used `CARGO_TARGET_DIR=build\veripb-target-system`, the official Rust 1.97.1 GNU toolchain, Zig `cc/ar`, `CRATE_CC_NO_DEFAULTS=1`, and `CFLAGS_x86_64_pc_windows_gnu=-fno-sanitize=undefined`. `BUILD_PROVENANCE.md` records exact source-tree, derived-file, and binary hashes.

CakePB/VeriPB smoke command contract:

```powershell
build\veripb-target-system\release\veripb.exe --wcnf --force-checked-deletion --stats --elaborate build\smoke\bcp.kernel.v3.pbp artifact\certified_maxpre_experimental_data\examples\bcp-simp-nonunif-75_50.07.wcnf artifact\certified_maxpre_experimental_data\examples\bcp-simp-nonunif-75_50.07.augmented.pbp artifact\certified_maxpre_experimental_data\examples\bcp-simp-nonunif-75_50.07.output.wcnf
build\cake_pb_wcnf_v3.exe artifact\certified_maxpre_experimental_data\examples\bcp-simp-nonunif-75_50.07.wcnf build\smoke\bcp.kernel.v3.pbp artifact\certified_maxpre_experimental_data\examples\bcp-simp-nonunif-75_50.07.output.wcnf
```

Final result: VeriPB accepted forced checked deletion and elaborated; CakePB printed both verification markers and exited 0.

## Bounded MSE23 range acquisition

1. Official HEAD: `Content-Length: 3140560006`, `Accept-Ranges: bytes`.
2. Explicit HEAD range `3140428934-3140559999` returned `206`, length `131066`, and exact `Content-Range`.
3. Two hard-capped tail requests recovered the EOCD and entire 85,688-byte central directory with 559 entries.
4. The applied script command was:

```powershell
C:\Users\15383\.cache\codex-runtimes\codex-primary-runtime\dependencies\python\python.exe scripts\extract_mse23_zip_subset.py
```

Result: 50 records, 162,548 member bytes transferred, manifest SHA-256 `64E86F1313E0B3CAB561D3080E665BB4180E332EF9A34BE532D7719F1CF7C9F3`. Each request required exact 206/Content-Range/byte count and each member required central CRC, XZ decode, and SHA-256.

## Claim-bearing execution

```powershell
C:\Users\15383\.cache\codex-runtimes\codex-primary-runtime\dependencies\python\python.exe scripts\prepare_corpus.py
C:\Users\15383\.cache\codex-runtimes\codex-primary-runtime\dependencies\python\python.exe scripts\measure_packaged_preprocessing.py
C:\Users\15383\.cache\codex-runtimes\codex-primary-runtime\dependencies\python\python.exe scripts\run_stagea_probe.py
C:\Users\15383\.cache\codex-runtimes\codex-primary-runtime\dependencies\python\python.exe scripts\hash_source_trees.py
```

Results:

- corpus: accepted 30, eligibility-excluded 8, minimum checked deletions 153;
- legal choice: 24/30 (`0.80`);
- final full-cost rows: 240; contract failures 0;
- dual replay proof/kernel hash mismatches: 0;
- recommendation: `STOP_RECOMMENDED`.

## Exact child-process records

The following JSONL files are the authoritative literal command log for every corpus, preprocessing-cost, legality, verifier, and replay child process. Each row records the argument vector without shell reconstruction, working directory, environment overrides, start time, duration, timeout, return code, peak RSS, and stdout/stderr paths.

- `runs/corpus/CORPUS_COMMANDS.jsonl`
- `runs/preprocess_cost/PREPROCESS_COMMANDS.jsonl`
- `runs/probe/PROBE_COMMANDS.jsonl`

The final scientific logs sum to 63.589 seconds of child-process wall time. Earlier compilation, smoke, and superseded accounting attempts are disclosed in `FAILURE_LOG.md`; no failed attempt was used as a scientific result.

## Delivery validation and hash closure

The unqualified `python` command and the Windows `py -3` launcher were unavailable in the final shell, so the already recorded bundled interpreter was used directly:

```powershell
C:\Users\15383\.cache\codex-runtimes\codex-primary-runtime\dependencies\python\python.exe scripts\validate_delivery.py
```

Result after correcting the stale documented VeriPB binary hash to the hash already embedded in the frozen corpus manifest: 46/46 checks passed. The final `HASH_MANIFEST.sha256` was then generated by recursively hashing every delivery file except the manifest itself, sorting by relative POSIX path, and writing uppercase SHA-256 records; `validate_delivery.py --manifest` is the read-only closure check.
