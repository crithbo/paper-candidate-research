# Reproduce and resume

This package is a system recovery checkpoint, not a scientific experiment.

1. Verify `HASH_MANIFEST.sha256` and inspect `SYSTEM_CHANGE_LEDGER.yaml`.
2. The exact elevated transcript is `resources/logs/enable_wsl_vmp_norestart.log` with SHA-256 `3CB162E7...B2B4C`.
3. Do not rerun the enable script and do not install Ubuntu before the coordinated restart.
4. Mainline/user may perform the one approved Windows restart; this lane did not initiate it.
5. Resume only in a new immutable directory. First prove a later `LastBootUpTime`, re-audit allowed and forbidden features, and verify WSL runtime. Only then install Ubuntu 24.04 and prove Linux x86_64.
6. Research downloads and PRE_CLAIM remain downstream of executor proof; mutants remain downstream of PRE_CLAIM PASS.
