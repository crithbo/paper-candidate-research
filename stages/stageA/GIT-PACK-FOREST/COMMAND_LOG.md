# GIT-PACK-FOREST Command Log

All commands used `<LEGACY_LOCAL_PROJECT_ROOT>\stages\stageA\GIT-PACK-FOREST` as the candidate working directory unless the command explicitly reads a frozen upstream path under `<LEGACY_LOCAL_PROJECT_ROOT>`. No E-drive path was used. Files were written only inside this candidate directory.

Runtime aliases below expand to the recorded installed runtimes:

```powershell
$PYTHON='<LOCAL_USER_HOME>\.cache\codex-runtimes\codex-primary-runtime\dependencies\python\python.exe'
$NODE='<LOCAL_USER_HOME>\.cache\codex-runtimes\codex-primary-runtime\dependencies\node\bin\node.exe'
$GIT=(Resolve-Path 'tools\mingit-2.55.0\cmd\git.exe')
```

## Frozen input and rule reads

```powershell
Get-Content -Raw AGENTS.md
Get-Content -Raw plan.md
Get-Content -Raw registry.yaml
Get-Content -Raw rules\ROLE_CANDIDATE_OWNER.md
Get-Content -Raw templates\STAGEA_REPORT.md
Get-Content -Raw templates\STAGEB_REPORT.md
Get-Content -Raw templates\Q1_COMPARATOR_MATRIX.md
```

The academic-research-suite skill, experiment workflow, study-manager, code-runner, experiment-plan, output-format, stall-detection and reproducibility instructions were read in full before execution. The assigned discovery, Stage 0 PRIMARY and confirmation directories were read; no other candidate directory was read.

Manifest recomputation results:

- Discovery: 4/4, manifest `736638AED4B1C05137301A03C0D6FEF0FFA50E08CE7B11CA60AA5ADBC9980C12`, handoff `68E38B40BFEC320519BB6CB92712E207FEAF12732B992ABE46AEF5208E66EDF5`.
- PRIMARY: 4/4, manifest `5BE1D727E9904794272B7593475841A1DB645B6D836F82036766F45ECA59214A`, handoff `1FCD7ED16FBE38AC846FF0D669CCD8D3468C0F59F0B6A84C09124B952C19F226`.
- Confirmation: 5/5, manifest `712E5D2ADF5813C6B1E92D98100699892D7ECEA40264495F5B0BA2F9EC4D29B4`, handoff `CB038C2BD9C533D703AFBBB9F8383809DF1FD0FD29EE8B6556D4248013EE4E2F`.

The updated `AGENTS.md`, `ROLE_CANDIDATE_OWNER.md` and `STAGEA_REPORT.md` were reread after the mainline added `PRE_CLAIM_CONTRACT_FIDELITY_GATE`.

## Toolchain acquisition

Initial Windows Schannel attempts failed before any claim-bearing observation:

```text
SEC_E_NO_CREDENTIALS (0x8009030e)
```

OpenSSL/Node download succeeded:

```powershell
& $NODE scripts\fetch_binary.mjs --url https://github.com/git-for-windows/git/releases/download/v2.55.0.windows.1/MinGit-2.55.0-64-bit.zip --output tools\MinGit-2.55.0-64-bit.zip --sha256 31497E7968196332263459EE319D2524E3EBC5786AB895E2ABAD34FFDD4F4EBF --bytes 38830800
Expand-Archive -LiteralPath tools\MinGit-2.55.0-64-bit.zip -DestinationPath tools\mingit-2.55.0
tools\mingit-2.55.0\cmd\git.exe --version --build-options
```

Observed Git version: `2.55.0.windows.1`; official asset bytes/hash matched. Frozen Git source acquisition used the installed system Git only as a downloader:

```powershell
& 'C:\Program Files\Git\cmd\git.exe' -c http.sslBackend=openssl -c http.version=HTTP/1.1 clone --depth 1 --branch v2.55.0 https://github.com/git/git.git tools\git-source-v2.55.0
```

The source resolved to `e9019fcafe0040228b8631c30f97ae1adb61bcdc`; `diff-delta.c` SHA-256 was `A7318C006CDED6394DAB8DA932C4BFCAACB8CD44BAEF61F96B790199E8768F9A`. An earlier attempt to use MinGit's `cmd\git.exe` for this clone failed because `git-remote-https` was not found on that exec path; the clean OpenSSL system-Git acquisition succeeded, so no blocker was raised.

## Corpus acquisition

```powershell
& $PYTHON scripts\acquire_corpus.py --git $GIT --root .
```

Attempt history before claim-bearing observation:

1. The first attempt exposed a pipe deadlock in batched object reading. It was terminated and the reader was changed to bounded `communicate()`.
2. The second attempt completed 13 repositories, then the Lua clone stalled with a zero-byte temporary pack. The timeout worker was fixed to terminate the process tree and bounded-join; cloning was frozen to HTTP/1.1.
3. The failed Lua repository was moved, after resolved-D-root verification, to immutable `work\resource_attempts\lua.git-timeout1` (27,306 bytes).
4. A clean retry of the same URL/ref with HTTP/1.1+OpenSSL succeeded. No URL, object, commit-selection policy or semantics changed.

Final corpus lock: 20 repositories, 7,016 objects, 50,091,889 canonical bytes, SHA-256 `22985F5747AC66717BF35557951FE542AEE43BB6FE4B141DCB819EB1B418A1DB`.

## Algorithm and pack preflights

```powershell
& $PYTHON scripts\smoke_test.py --git $GIT --root .
& $PYTHON scripts\smoke_validate.py --git $GIT --root .
& $PYTHON scripts\selftest_algorithms.py
```

Results: natural 115-object REF_DELTA pack strict-valid; 115/115 canonical equality; Edmonds implementation matched brute force on 50 random four-node graphs.

Git 2.55 native delta parity:

```powershell
& $PYTHON scripts\validate_git_delta_parity.py --root . --git $GIT --limit 40
```

Final result: 38/38 byte-exact `diff-delta` programs and 38/38 byte-exact frozen Git zlib 1.3.2 level-6 streams across 19 repositories. `zlib1.dll` SHA-256: `93E9243A44C29200EEACAF9658EFE2558581770E4B11CA4B500E18E424A6E3B5`.

Small witness and RSS preflight:

```powershell
& $PYTHON scripts\preclaim_witness.py --root . --git $GIT --label preclaim-witness-native-codec --result-name PRECLAIM_WITNESS_NATIVE_CODEC
& $PYTHON scripts\preflight_rss.py --root .
```

The first RSS preflight failed because the ctypes `HANDLE` return type was not declared. After declaring `GetCurrentProcess.restype=c_void_p` and `GetProcessMemoryInfo` argument types, the safe retry passed with 29,061,120 OS peak RSS after an 8 MiB allocation. No natural claim-bearing run had started.

## Retained non-claim controls

```powershell
& $PYTHON scripts\run_pilot.py --root . --git $GIT
& $PYTHON scripts\run_pilot.py --root . --git $GIT --replay
& $PYTHON scripts\run_pilot.py --root . --git $GIT --native
& $PYTHON scripts\run_pilot.py --root . --git $GIT --native --replay
& $PYTHON scripts\run_pilot.py --root . --git $GIT --native --run-label claim-initial
& $PYTHON scripts\run_pilot.py --root . --git $GIT --native --replay --run-label claim-replay
& $PYTHON scripts\run_pilot.py --root . --git $GIT --native --run-label final-initial
& $PYTHON scripts\run_pilot.py --root . --git $GIT --native --replay --run-label final-replay
```

These outputs are controls only. The first command predated the `--native` fail-closed guard and used the legacy delta program. Later control generations were successively rejected for missing OS RSS, omitted index-construction cost, or zlib 1.3.1/1.3.2 version mismatch. All were retained and are explicitly classified in `RESULTS.md`.

## Claim-bearing runs

```powershell
& $PYTHON scripts\run_pilot.py --root . --git $GIT --native --run-label codec-final-initial
& $PYTHON scripts\run_pilot.py --root . --git $GIT --native --replay --run-label codec-final-replay
```

Both returned exit 0, 20/20 correctness, 0/832 outside edges, p50/p90 residual 0, size residual p50 -0.5529550688191515 and p90 -0.06840419683919774, and zero primary-benefit repositories.

## Aggregation

```powershell
& $PYTHON scripts\aggregate_results.py
```

Final aggregation: `STOP`, 832 selected edges, 0 outside, scientific decision reproduced, 224/280 exact pack/index pairs, candidate 20/20 exact, deterministic simple 40/40 exact, conservative all-attempt CPU upper 7,773.765625 seconds, workspace 3,039,515,830 bytes.

## Final verification commands

```powershell
Get-FileHash -Algorithm SHA256 -LiteralPath inputs\corpus.lock.json,results\AGGREGATE.json,results\FULL_COST.json,results\REPRODUCIBILITY.json,results\codec-final-initial\SUMMARY.json,results\codec-final-replay\SUMMARY.json,results\GIT_NATIVE_CODEC_PARITY.json
& $PYTHON scripts\verify_manifest.py --root . --manifest HASH_MANIFEST.sha256
```

The last command is run after the package manifest is generated; its result is recorded in `MANIFEST_VERIFICATION.json`.
