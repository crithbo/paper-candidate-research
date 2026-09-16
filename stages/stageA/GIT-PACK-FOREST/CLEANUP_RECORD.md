# Terminal artifact cleanup record

- Authorization: `UNBLOCK-AUTH-20260810-R1`
- Date: 2026-08-10 (Asia/Shanghai)
- Topic state before cleanup: `CONFIRM_STOP / BELOW_Q2_STOP`
- Reason: user authorized deletion of obsolete and unnecessary large files; project mainline rule requires terminal STOP detailed runs/downloads to be removed after preservation audit.
- Preserved: top-level reports, contracts, command log, review packet, handoff, prior manifest, scripts, input metadata, independent gate package, registry terminal kernel, and history summary.
- Prior manifest remains a historical record of the pre-cleanup package and is not expected to verify after cleanup.

Deleted targets after absolute-path validation:

| Target | Pre-delete bytes | Purpose/disposition |
|---|---:|---|
| `work/` | 2,780,825,858 | Cloned repositories and generated pack workspaces; terminal detailed run data |
| `tools/` | 195,186,450 | Reacquirable portable Git/tool extraction |
| `results/` | 61,998,347 | Detailed per-run outputs already summarized in retained reports and independent gate |

Total scheduled deletion: `3,038,010,655` bytes.

Recovery: not recoverable from this workspace after deletion. Public repositories/tools can be reacquired; the terminal scientific conclusion and compact evidence summary remain preserved.
