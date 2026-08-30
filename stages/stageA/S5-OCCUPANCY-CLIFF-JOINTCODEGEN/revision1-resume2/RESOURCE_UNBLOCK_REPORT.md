# S5 resource-unblock report

## Outcome

`RESOURCE_READY = true` for the single frozen bootstrap asset only. One clean local copy passed exact byte-count and SHA-256 validation before it was moved into `verified/`.

This result does **not** mean that Stage A is ready, that an exact-commit LLVM toolchain exists, that natural MIR exists, or that any scientific claim passed. No archive was extracted and no executable content was run.

## Authorization boundary

- Assignment: `RESOURCE-UNBLOCK-L2-20260810-S5-R1`
- Authorization: `UNBLOCK-AUTH-20260810-R1`
- Topic: `S5-OCCUPANCY-CLIFF-JOINTCODEGEN`
- Mode: `RESOURCE_UNBLOCK_ONLY`
- Sole write directory: this `revision1-resume2` directory
- Source asset mutation: forbidden and not performed
- Claim-bearing execution: forbidden and not performed
- Scientific revision: not consumed
- Stage B, system installation, global environment changes, and automation: forbidden and not performed

## Material passport

| Field | Frozen/observed value |
|---|---|
| Asset | `llvm-mingw-20260616-ucrt-x86_64.zip` |
| Upstream project/release | `mstorsjo/llvm-mingw`, release `20260616` |
| Official URL | `https://github.com/mstorsjo/llvm-mingw/releases/download/20260616/llvm-mingw-20260616-ucrt-x86_64.zip` |
| Role | Bootstrap asset only; not the evaluated exact-commit LLVM toolchain |
| Expected bytes | `187504083` |
| Expected SHA-256 | `B9B68A4D276E16FA25802AABA458E4638F64B3884C290AACCDC2D87083B6CA35` |
| Read-only source by contract | `D:/project/writing/reserch/stages/stageA/ROCKSDB-DICT-COVER/tools/archives/llvm-mingw-20260616-ucrt-x86_64.zip` |
| Verified destination | `verified/llvm-mingw-20260616-ucrt-x86_64.zip` |
| Provenance rule | Official HTTPS URL + frozen release size/SHA-256; detached signature not required under the recorded mainline scope correction |
| License handling | No redistribution or extraction analysis was performed; upstream public-release provenance is recorded, while license contents were outside this resource-only validation |

## Verification

| Gate | Source | Temporary copy | Final verified copy | Result |
|---|---:|---:|---:|---|
| Byte count | `187504083` | `187504083` | `187504083` | `PASS` |
| SHA-256 | `B9B68A…B6CA35` | `B9B68A…B6CA35` | `B9B68A…B6CA35` | `PASS` |
| Extracted | no | no | no | `PASS` |
| Executed | no | no | no | `PASS` |

Verification Status: `VERIFIED_EXACT_SIZE_AND_SHA256`

The temporary `.copying` path was removed only by a same-scope move after both gates passed. The final source/destination closure rehashed both files and confirmed equality. The source asset remained present with the same length and hash.

## Cost ledger

- Clean local copies: `1`
- Official downloads used: `0/2`; network bytes `0`
- Added verified-file storage: `187504083` bytes (plus small text metadata)
- Copy wall time: `0.055857 s`
- Temporary hash gate wall time: `0.379695 s`
- Post-move dual hash closure wall time: `0.904118 s`
- Timed core total: `1.339670 s`
- Build/tool/scientific CPU-hours: `0`
- GPU/exclusive-device cost: `0`

## Evidence and readiness ceiling

- `asset_ready: true`
- `resource_ready: true` — means this one frozen archive is ready only
- `stagea_ready: false`
- `claim_bearing: false`
- `scientific_revision: false`
- `scientific_pass: false`
- `evidence_ceiling: RESOURCE_VALIDATION_ONLY__NO_SCIENTIFIC_INFERENCE`
- `stageb_authorized: false`

The unchanged future scientific contract would still require separate mainline authorization to extract/use the bootstrap, obtain/build the exact LLVM commit, obtain 8–16 complete natural MIR regions, and run legality, full-cost, and replay gates. None of those steps belongs to this assignment.
