# ROCKSDB-DICT-COVER Stage A results

## Disposition

`BLOCKED_USER_ACTION_REQUIRED`

- Evidence ceiling: `RESOURCE_FAILURE_ONLY__NO_SCIENTIFIC_INFERENCE`
- Claim-bearing observation before failure: `no`
- Scientific revision consumed: `no`
- Stage A killer evaluated: `no`
- Scientific STOP/PASS/reserve inference: `none`

## Claim-bearing result table

| Required observation | Status | Value |
|---|---|---|
| Production bottommost-compaction SST | not executed | N/A |
| Candidate retained actions | not executed | N/A |
| Current/raw/prefix/reservoir/stratified/grid baselines | not executed | N/A |
| Unchanged FastCover dictionary effect | not executed | N/A |
| Strict reader/checksum/full-scan equality | not executed | N/A |
| Full-cost build/write/RSS/SST/read ledger | not executed | N/A |
| p50+p90 frontier extension | not executed | N/A |

No zero, negative, positive, or missing value in this table is a scientific observation. The run stopped before the first SST was created.

## Resource/preparation observations (non-scientific)

- Required frozen upstream manifests verified: Discovery `4/4`, PRIMARY `4/4`, confirmation `5/5`.
- Official RocksDB commit `1dfa7297933df05237ac11376d6cb69d32591b1d` and Zstd commit `82d322c4973d9e2968d94047a40892bc6d9a9bdf` were acquired.
- Pinned Zstd built successfully as a static library; pristine RocksDB built `367/367` and linked successfully with Zstd. This establishes toolchain availability only.
- Natural inputs `nvd-2015` and `nvd-2016` were converted before failure. They were not passed to RocksDB or inspected for compression outcomes.
- The `nvd-2017` HTTP response ended after `7,686,831` bytes despite a GET `Content-Length` of `7,706,425`, leaving a `19,594`-byte short partial asset. The preparation script exited with code `1` and performed no retry.

## Exact partial hashes

| Artifact | Bytes | SHA-256 | Admissible? |
|---|---:|---|---|
| `inputs/raw/nvd-2015.json.gz` | 4,190,045 | `36D62C93A5F15ACDCBA69513F3CA86D44A35E10ACD44258E5A49AFE1EB24B0C0` | preparation input only |
| `inputs/manifests/nvd-2015.kvman` | 4,198,525 | `2D3CC2D0F4024C78C033C5427AD85F056FC5850E95B1AE45F07B3A545F28FE76` | frozen but unexecuted |
| `inputs/raw/nvd-2016.json.gz` | 5,159,096 | `E3A4B0B68C30065FB24417DDF1240E8149B3F99F433F4A262B776090A24E930F` | preparation input only |
| `inputs/manifests/nvd-2016.kvman` | 4,200,397 | `5D0D1C16FDE026E8FA96F739F5C2A0E91A72F5CF05003F6A9722E7033C73A80D` | frozen but unexecuted |
| `inputs/raw/nvd-2017.json.gz` | 7,686,831 | `972E334A0D7B2B8F97B95A7ACD4DEB7ED4F8F370F41ED88DE244F015ECD82E32` | **no; incomplete** |

The assignment therefore has no claim-bearing result and must resume from a clean, mainline-authorized subdirectory after the data blocker is removed.

