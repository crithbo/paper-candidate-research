# Command Log

All commands ran from `<LEGACY_LOCAL_PROJECT_ROOT>`; every write target was under `stages\stageA\PARQUET-PAGE-COSEGMENT\resume1`. The old topic root was read-only. Commands used the bundled Python 3.12.13 runtime and the frozen vendor `PYTHONPATH` when PyArrow/DataFusion were required.

## Intake and continuity

1. Fully read `AGENTS.md`, `plan.md`, `registry.yaml`, `rules\ROLE_CANDIDATE_OWNER.md`, academic-research-suite instructions/pipeline, frozen Discovery/PRIMARY/confirmation, owner templates, and `PAUSE_CHECKPOINT.md`.
2. Recomputed the checkpoint/core hashes, all upstream manifests, 20 corpus hashes, and the old replay1 canonical tree. Result: PASS; tree `BB6EC296E6019CF476DBFAAAE778DA5D0EC2EB291DD353FDAA746E682AEBD64E`, 105 files, 143,771,739 bytes.
3. Invoked `scripts\resume_stagea.py validate-partial` against the old 2024-06 partial directory. Result: 15/15 PASS.
4. Invoked `scripts\resume_stagea.py prepare --replay replay1_remaining`. The input view contained 2024-06 through 2025-08 with source hashes unchanged.

## Replay1 continuation and application interruption

5. Invoked `scripts\resume_stagea.py run` on `inputs\replay1_remaining`. It closed 2024-06/07/08 and wrote only 15 boundary oracles for 2024-09 before the desktop application closed. No final process ledger was produced; after restart there was no live Python process.
6. Hash-verified the three complete results, confirmed the interrupted 2024-09 directory had no candidate/union/result, and wrote `INTERRUPTION_RECOVERY.yaml`.
7. Invoked `scripts\resume_stagea.py validate-oracles` for the 2024-09 set. Result: 15/15 PASS.
8. Invoked `scripts\resume_stagea.py prepare --replay replay1_tail`, then `run` on the new tail tree. Result: 12/12 complete, status `COMPLETED`; CPU `2,223,015,625,000 ns`, wall `2,283,532,688,100 ns`, peak RSS `321,269,760 B`.
9. Resolved replay1 as five immutable old results + three verified pre-interruption resume results + twelve new tail results. Result: 20/20 complete and equivalent.

## Independent replay2

10. Invoked `scripts\resume_stagea.py prepare --replay replay2`; 20 source hashes matched.
11. Invoked `scripts\resume_stagea.py run --corpus-dir inputs\replay2 --output-dir artifacts\replay2 --cost-output artifacts\replay2_run_cost.json`. Exit 0, 20/20 complete and equivalent; CPU `3,854,250,000,000 ns`, wall `3,938,743,437,700 ns`, peak RSS `336,072,704 B`.
12. No further claim-bearing experiment was run.

## Aggregation and validation

13. Compiled and ran `scripts\aggregate_results.py` over the resolved replay1 and replay2. Exit 0. Stable projection exact 20/20; output Parquet SHA exact 340/340; decision `STOP_NARROW_FROZEN_MECHANISM`.
14. Generated the owner reports, canonical handoff, and canonical SHA-256 manifest.
15. Recomputed every manifest entry, top-level hashes, file count, and directory sizes; exact final values were returned to mainline after the last immutable manifest generation.

## Failures and exclusions

- The only execution interruption was the explicit application close. It was recovered fail-closed from the last complete file boundary without rewriting verified results.
- A parent `INPUT_FREEZE.yaml` Discovery-handoff hash differs from the actual frozen manifest/registry value. This pre-existing, non-core provenance anomaly is recorded in `CONTINUITY_MANIFEST.yaml`; the parent file was not edited and no object/result changed.
- Bundled Python has no PyYAML module and installed Node has no YAML package. No dependency was installed: YAML was visually/structurally audited, while the canonical manifest and every content hash were generated and independently rechecked with the Python standard library. This limits parser-level YAML validation only; it does not affect experiment execution or the hash manifest.
- No network, download, package install, global PATH change, system install, GPU, exclusive device, Stage B, automation, or shared-control write occurred.
