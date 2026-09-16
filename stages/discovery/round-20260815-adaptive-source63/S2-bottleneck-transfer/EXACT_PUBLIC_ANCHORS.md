# Exact public anchors

| RQ | exact public anchor | frozen object and endpoint | source role |
|---|---|---|---|
| RQ-S63-01 | QEMU 9.2.4 `Dirty Bitmaps and Incremental Backup` | one qcow2 node and its dirty bitmap; stock QMP incremental-backup/migration endpoint | primary official semantics |
| RQ-S63-02 | QEMU 10.0.3 `VFIO device migration` | one VM and VFIO device; stock migration/recovery endpoint | primary official semantics |
| RQ-S63-03 | QEMU master `Migration` documentation (11.0.90) | one VM state and migration destination; stock QMP migration endpoint | primary official semantics |

All anchors are official QEMU documentation.  They identify a current action locus and do not establish novelty or a paper-quality residual.
