# Mechanical intake — COH-REGION-LIFECYCLE revision1 closing

- Lane: `STAGEA-GATE-REVIEW-LANE-2`
- Assignment: `STAGEA-G2-20260809-COH-REGION-LIFECYCLE-R1-CLOSING`
- Topic: `COH-REGION-LIFECYCLE`
- Writable root: this review directory only
- Candidate-owner participation: none
- Reviewer participation in initial candidate, initial gate, or revision execution: none
- Cross-assignment contamination: false

## Frozen-input verification

| Package | Entries recomputed | Manifest SHA-256 | Result |
|---|---:|---|---|
| Initial Stage A candidate | 17/17 | `5A8322590B24D9B0C53A4F93A06E1E2895830722047202EEA16D8B863816E513` | match |
| Initial independent gate | 8/8 | `05D88467E190D438B2E0F8CFB661563198E7717CEC3902FBE7281150A818B119` | match |
| Stage A revision1 | 23/23 | `0CB378BBEC7AEE26AD6E097D19DA58577785C6DF872FB799DA1E4B2FCDBCE329` | match |

The delivered revision handoff SHA-256 is `E11E8E70FB4E42F6D6A007B8C33D8AFAE47C8C7B5D2D550C72D0D41E24BBE8E9`, matching the assignment freeze.

## Reviewer operations

- Read-only inspection of the frozen brief, Stage 0 result, initial Stage A package, initial gate, and revision1 package.
- Static inspection of the inherited and revision selector implementations.
- Independent manifest recomputation and row-level CSV checks.
- Two bounded software replays into this review directory only.
- No network lookup, external upload, GPU/CUDA/Nsight command, GH200 access, device reservation, Stage B work, or candidate-file modification.

## Independent replay identity

| Artifact | Delivered run 1 | Delivered run 2 | Review replay 1 | Review replay 2 |
|---|---|---|---|---|
| `summary.json` | `FA290B1A…D3D02` | same | same | same |
| `selector_control.csv` | `B55C68AE…17F2` | same | same | same |

All four summaries and all four control tables are byte-identical within their artifact class.

