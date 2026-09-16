# ROCKSDB-DICT-COVER user review packet

## Outcome

The assignment is `BLOCKED_USER_ACTION_REQUIRED`, not PASS, STOP, revision, or reserve. The first claim-bearing observation was never reached, so the evidence ceiling is `RESOURCE_FAILURE_ONLY__NO_SCIENTIFIC_INFERENCE` and the scientific revision remains unconsumed.

## What happened

All required upstream hashes were independently rechecked. A portable pinned toolchain was acquired inside the assigned directory, pinned Zstd built, and pristine RocksDB compiled 367/367. The frozen 20-manifest acquisition then began. `nvd-2015` and `nvd-2016` completed, but the official `nvd-2017` response ended at 7,686,831 bytes while declaring 7,706,425 bytes. The one-attempt preparation script failed closed with exit code 1 and did not retry.

## Why no scientific conclusion is allowed

No bottommost-compaction SST was created. No candidate or baseline selector ran. The unchanged trainer never received natural input. No dictionary, match, equality, SST-byte, CPU, RSS, read, or frontier value exists. Consequently the failure says nothing about whether the mechanism is absorbed, useful, correct, fast, or publishable.

## Exact blocker

- Partial file: `inputs/raw/nvd-2017.json.gz`
- Observed size: `7,686,831` bytes
- GET expected size: `7,706,425` bytes
- Missing: `19,594` bytes
- Partial SHA-256: `972E334A0D7B2B8F97B95A7ACD4DEB7ED4F8F370F41ED88DE244F015ECD82E32`
- This partial is inadmissible and must never be promoted to input.

## Minimum unblock action

Restore a reliable HTTPS path or provide the complete official NVD 2017 feed (and a reliable path or complete files for the remaining frozen NVD/PyPI sources). Mainline should then issue a new clean resume subdirectory using the exact frozen contract. This initial package must not be overwritten.

## Review checklist

- [ ] Accept that this is a resource-only blocker with no scientific inference.
- [ ] Verify `HASH_MANIFEST.sha256` passes for the delivered package.
- [ ] Provide/restore byte-complete official inputs or authorize a clean resume after the network issue is resolved.
- [ ] Keep Stage B disabled and `stageb_user_approval_id=null`.
- [ ] Return lane 1 to `IDLE_REUSABLE_AWAITING_MAINLINE` after mechanical acceptance.

## Key files

- `EXPERIMENT_CONTRACT.yaml`: exact frozen but unexecuted scientific contract.
- `RESULTS.md`: explicit all-N/A claim-bearing result table.
- `USER_BLOCKER_PACKET.md`: actionable resource specification and resume entry.
- `COMMAND_LOG.md`: preparation commands and failure.
- `handoff.yaml`: machine-readable disposition.

