# Command log

- Assignment SHA-256 matched `008D1FA2B834BA0A8FBF5CBD593A9400576F4FEC28F4C3A3D5B44B0DC796AA8D`.
- Resume1 handoff/manifest matched; manifest recalculation passed 14/14.
- No other candidate or queue material was read.

## Phase 1 — READ_ONLY_PREFLIGHT

- Non-admin DISM feature queries returned 740; no state changed.
- An escalated sandbox invocation still lacked a Windows UAC administrator token and returned 740; OS identity was read successfully.
- WSL status returned 50 and no distribution was present.
- Before system actions: Windows 11 Home 10.0.26200.9168 x86_64; last boot 2026-08-21 20:49:19 +08:00.
- Pending reboot keys: CBS absent, Windows Update absent; PendingFileRenameOperations was already present. This was recorded but not modified.

## Phase 2 — ENABLE_WSL_AND_VIRTUAL_MACHINE_PLATFORM

The frozen script was launched once with Windows UAC `RunAs`. It first audited all named features, then issued only these authorized commands with `/NoRestart`, then audited again:

1. `dism.exe /English /Online /Enable-Feature /FeatureName:Microsoft-Windows-Subsystem-Linux /All /NoRestart` → 3010; state Disabled → Enabled.
2. `dism.exe /English /Online /Enable-Feature /FeatureName:VirtualMachinePlatform /All /NoRestart` → 3010; state remained Enabled.

Forbidden feature names `Microsoft-Hyper-V-All`, `Microsoft-Hyper-V`, and `Containers` returned `0x800f080c` (unknown on this Windows Home image) both before and after. No enable command targeted them.

Post-enable WSL runtime still returned status 50 and no distribution because restart is pending. The lane did not restart.

## Stop accounting

- Ubuntu installation: not started.
- Research network/download: 0 B.
- Triton/LLVM/solver: not acquired.
- PRE_CLAIM/mutants/builds/GPU: 0.
- Docker/Podman, Hyper-V/Containers, drivers, registry, global/user/machine PATH/environment: unchanged.
- Scientific revision: not consumed. Stage B: false.
