# Rule freeze — Wave319

- assignment: `DISCOVERY-S1-20260811-V8.7-WAVE319-BTRFS-LOGTREE-COMMIT-RECOVERY-INVARIANT-DEPTH`
- sole write boundary: this directory.
- verified frozen SHA-256: `AGENTS.md=66231F71EF6AB250A1AD9FF576D5840978F09EFC03BF5D2F0527D47F4D82B063`; `plan.md=8A3AE8F81754D4C91B4FDA9324814A118DD729262BDE1353C4FD0B30CB11537D`; `registry.yaml=B74A21132B0DB7021959BABD5A28249D3B22A09B076ABC3119EFB36947D2347B`; `ROLE_DISCOVERY=FCB9BD73C39F39D31F6C8154E6B48EA23187FF28BDF2BB3D9C59E3D28FA518A3`.
- production rule: v8.7 + R5-P0; `DISCOVERY_QUALITY_MODE=OFF`; R7 dormant/non-canonical.
- rule application: exact same Btrfs filesystem state, versioned update/fsync trace, crash cut, mount/recovery and stock observable semantics. Current source/docs/default and non-default entrances are a fair union. No experiment, benchmark, download, Stage0/A/B, or shared-control write was performed.
