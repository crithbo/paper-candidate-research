# Resume 1 Command Log

All persistent writes are confined to `D:\project\writing\reserch\stages\stageA\S5-OCCUPANCY-CLIFF-JOINTCODEGEN\revision1-resume1`. The immutable `revision1` directory was read and hashed only.

## Preflight and frozen-input checks

1. Recomputed initial `handoff.yaml`: `40DEA3218CA18A240F7DF317C7DA7654E2E0658B0C68BA0EB4351C440C5C156B`.
2. Recomputed initial `STAGEA_REPORT.md`: `0A211A8F280EAEB977C04512C2A82577E4DBD444B099FFC6C4FC5442BDC14704`.
3. Recomputed revision1 `handoff.yaml`: `51EEB138E89AB43EC76ECD5C4A1DE24A986C0BEB372EE7AAD800A0736DABADB6`.
4. Recomputed revision1 `HASH_MANIFEST.sha256`: `48E78E80EADA239362E9242B4EACABCA00CE5D7B3F359B0E8B2B5456ED7D25F1`.
5. Verified initial manifest `14/14` and revision1 manifest `13/13`, with zero missing or mismatched files.

## Clean-source verification commands

The network checks used Python 3.12.13 `urllib.request` against the following read-only API endpoints:

- `https://api.github.com/repos/mstorsjo/llvm-mingw/releases/tags/20260616`
- `https://api.github.com/repos/mstorsjo/llvm-mingw/commits/170b7e1ec4ad1d9264e6ba320cd4d02f96299c60`
- `https://api.github.com/repos/mstorsjo/llvm-mingw/git/ref/tags/20260616`
- `https://api.github.com/repos/mstorsjo/llvm-mingw/git/tags/fab5381668217fceb3c160882fd9070d01486d60`
- `https://api.github.com/repos/llvm/llvm-project/commits/1f112d62e1fa2c4f1a04887abd72da1ed61cf791`
- `https://api.github.com/repos/ROCm/rocm-examples/commits/269e9068d6fd6e68b1cc5a76eb77744f88af42ec`

The attestation query was also repeated through authenticated GitHub CLI:

```powershell
gh api 'repos/mstorsjo/llvm-mingw/attestations/sha256:b9b68a4d276e16fa25802aaba458e4638f64b3884c290aaccdc2d87083b6ca35'
```

Observed result: `HTTP 404 Not Found`. The release tag and target commit both report `reason=unsigned`; the release has no detached signature asset. Exact LLVM and ROCm commits each report `verified=true`, `reason=valid`.

## Mainline scope correction before execution

Before any final handoff/manifest was generated, mainline clarified that the frozen release asset need not independently publish a detached signature or attestation. The accepted provenance chain is the official HTTPS release URL, exact release-API byte count, frozen SHA-256, and valid signed identities for the exact LLVM and ROCm commits. This correction was applied before download and is not conditioned on an experimental result.

The sole actual download attempt is performed by `scripts/download_verified.py`. It refuses pre-existing destination/partial files, uses one HTTP request with no retry, preserves a partial file on failure, and renames to the final asset only after exact byte-count and SHA-256 checks pass.

## Sole actual download attempt

```powershell
& 'C:\Users\15383\.cache\codex-runtimes\codex-primary-runtime\dependencies\python\python.exe' 'D:\project\writing\reserch\stages\stageA\S5-OCCUPANCY-CLIFF-JOINTCODEGEN\revision1-resume1\scripts\download_verified.py' --root 'D:\project\writing\reserch\stages\stageA\S5-OCCUPANCY-CLIFF-JOINTCODEGEN\revision1-resume1'
```

Exit code: `1`. Exact output:

```json
{"expected_bytes": 187504083, "partial": "D:\\project\\writing\\reserch\\stages\\stageA\\S5-OCCUPANCY-CLIFF-JOINTCODEGEN\\revision1-resume1\\downloads\\llvm-mingw-20260616-ucrt-x86_64.zip.part", "received_bytes": 133887242, "response_length": 187504083, "sha256": "4ec2b9f6de4fadfd6864041faeefbc1df2fa07508dda80b850dbff501f40cb4e", "status": "FAILED_BYTE_COUNT"}
```

Independent post-command checks reproduced the partial byte count and SHA-256. The pre-acquisition manifest still verified `4/4`. No retry was issued. Because the byte-count gate failed, no archive extraction, executable launch, source checkout, build, corpus fetch, MIR derivation, baseline, candidate, verifier, full-cost probe, or double replay command was run.

## Final mechanical validation

A read-only validator checked required artifacts, both manifest layers, all four upstream freeze hashes, partial byte/hash identity, absence of accepted/extracted assets, JSON state, blocker semantics, Stage B boundary, scope-correction record, and download-script syntax. Result: `25/25 PASS`, `0 FAIL`. The check ledger is preserved in `VALIDATION.md`.
