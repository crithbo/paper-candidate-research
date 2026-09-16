# S5 Stage A R2A Command Log

- Assignment: `STAGEA-L1-20260811-S5-OCCUPANCY-CLIFF-JOINTCODEGEN-RESUME2-STAGEA-R2A`
- Authorization: `STAGEA-RESUME-S5-20260811-R2A`
- Lane: `CANDIDATE_EXECUTION_LANE_1`
- Sole write directory: this directory
- Stage B: not authorized
- Scientific revision at contract freeze: `false`

## Intake and immutable-input audit

The frozen `AGENTS.md`, `plan.md`, `registry.yaml`, and candidate-owner role hashes matched at assignment intake. The complete minimum S5 upstream chain, initial owner package, revision1 blocker, resume1 blocker, and resource resume2 package were read. Initial manifest verified `14/14`; resource resume2 verified `6/6`. The two failed-download manifests now omit only their deliberately cleaned partial archive entries; every remaining entry matches and the cleanup record explains deletion.

The read-only bootstrap archive was independently checked at `187,504,083` bytes and SHA-256 `B9B68A4D276E16FA25802AABA458E4638F64B3884C290AACCDC2D87083B6CA35`. ZIP central-directory audit found 9,736 entries, 740,825,211 uncompressed bytes, and zero rooted/path-traversal names. It contains bootstrap Clang/LLVM 22 but none of the three exact evaluated tools, so it is not treated as the frozen scientific toolchain.

No claim-bearing command has run. Scientific revision remains unconsumed.

## Bootstrap extraction and smoke

The already verified read-only ZIP was expanded directly into `tools/` without copying or modifying its source. Central-directory checks preceded extraction.

- extraction wall: `176.968 s`
- extracted files: `9,483`
- extracted bytes: `740,825,211`
- bootstrap Clang: `22.1.8`, upstream commit `ca7933e47d3a3451d81e72ac174dcb5aa28b59d1`
- bootstrap registered targets: AArch64, ARM, NVPTX and X86; no AMDGPU
- required evaluated tools inside archive: `llc=0`, `FileCheck=0`, `llvm-calc-occupancy=0`

The bootstrap identity therefore failed the exact-evaluated-tool condition by design and was used only as a prospective compiler for an exact-commit build.

## Scoped build-driver acquisition

Two frozen PyPI files were downloaded once through `scripts/download_verified.py`, with byte and SHA-256 gates before acceptance:

| Asset | Bytes | SHA-256 | Result |
|---|---:|---|---|
| `cmake-4.1.0-py3-none-win_amd64.whl` | 37,551,115 | `76E8E7D80A1A9BB5C7EC13EC8DA961A8C5A997247F86A08B29F0C2946290C461` | PASS |
| `ninja-1.11.1.4-py3-none-win_amd64.whl` | 296,461 | `4617B3C12FF64B611A7D93FD9E378275512BB36EFF8BABFF7C83F5116B4F8D66` | PASS |

The first wheel-extraction invocation created an empty destination but hit a PowerShell array-construction error (`Join-Path` received an object array). No wheel was extracted or executable run. The corrected invocation used the same already verified wheels and produced CMake `4.1.0` and Ninja `1.11.1.git.kitware.jobserver-1`. The initial Ninja smoke path was also wrong; a read-only search found the exact wheel path and its version smoke passed. Both command-construction errors are preserved and had no scientific effect.

## Exact-source acquisition attempts

Repository: `https://github.com/llvm/llvm-project.git`; exact commit only: `1f112d62e1fa2c4f1a04887abd72da1ed61cf791`; sparse cone: `llvm/`.

1. The bundled minimal Git failed before network transfer: `git: 'remote-https' is not a git command` and `fatal: remote helper 'https' aborted session`.
2. Installed Git 2.53 was invoked without installation or global configuration. Its unfiltered exact-SHA fetch stalled with no pack growth. After repeated no-progress checks, only that process was interrupted; a 41-byte stale `.git/shallow.lock` was verified to have no owning Git process and removed inside the assignment directory.
3. One explicit reduced-transfer retry used the same official origin and SHA with `--filter=blob:none --depth 1`. Commit fetch succeeded and `FETCH_HEAD` equals the frozen SHA.
4. Sparse checkout then failed while retrieving required blobs. Exact terminal output:

```text
error: RPC failed; curl 28 Operation too slow. Less than 1 bytes/sec transferred the last 120 seconds
error: 5450 bytes of body are still expected
fetch-pack: unexpected disconnect while reading sideband packet
fatal: early EOF
fatal: fetch-pack: invalid index-pack output
```

Final exact-source state is deliberately preserved: the commit object and `FETCH_HEAD` exist, `HEAD` and the `llvm/` worktree do not. No configure or build command ran. On-disk source/Git state is `187,851,937` bytes, including two failed temporary pack files. No further retry, mirror, tarball, version substitution, or corpus fetch was attempted.

## Fail-closed boundary

At `2026-08-11T13:16:31.1153127+08:00`:

- assignment directory: `13,459` files; `1,053,455,557` bytes before final reports
- tools: `827,744,021` bytes
- verified wheel downloads: `37,847,576` bytes
- exact-source/Git state: `187,851,937` bytes
- exact required executables: `0/3`
- natural complete MIR: `0/8 minimum`
- baseline/candidate/verifier/replays: `0/0/0/0`
- build/scientific CPU-hours: `0`
- GPU/exclusive-device use: `0`
- claim-bearing observation: `false`
- scientific revision consumed: `false`

The preclaim gate is `FAIL_CLOSED_RESOURCE_TOOLCHAIN`. No scientific PASS, STOP, reserve or mechanism inference is made.

## Mechanical validation boundary

The first complete-tree manifest pass verified `13,466/13,466` entries with zero hash mismatches, missing paths, or extra paths. `TOOLCHAIN_PROBE.json` parsed as JSON and `scripts/download_verified.py` parsed through Python AST without execution. Authored deliverables contained zero forbidden drive-path references. The bundled Node runtime did not provide the optional `yaml` module (`MODULE_NOT_FOUND`), so no third-party YAML parser claim is made; YAML files were instead reviewed structurally and their exact bytes are covered by the canonical manifest. This parser absence is a validation boundary, not an additional resource blocker and not a scientific observation.
