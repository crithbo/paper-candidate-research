# Raw screen row events

QEMU/CRIU/Firecracker, Wave349 rows, and all registry-reviewed storage-commit families were excluded before screening.

| ID | Fresh CPU-ready family | Native recovery/atomicity surface | Guarantee-first result |
|---|---|---|---|
| R01 | Linux kdump/kexec crash capture | Crash kernel loads after a kernel crash and exposes `/proc/vmcore` for analysis. | `NOT_ADMITTED_UNFROZEN`: capture-kernel selection is configuration; no same-object two-action publication construction was frozen. |
| R02 | Xen live migration | Hypervisor saves/restores guest state across host transfer with pause/switchover boundaries. | `NOT_ADMITTED_UNFROZEN`: complete current union and non-controller guarantee were not closed; no implementation/result inference made. |
| R03 | systemd offline system updates | Early-boot generator sees `/system-update`, runs an update unit, then removes marker and reboots; failure can revert a snapshot. | `STRUCTURAL_DROP`: grouping is package-manager/update policy and changes the update object. |
| R04 | Debian dpkg interrupted transaction recovery | Package database/status and maintainer-script recovery provide a native interrupted-update path. | `NOT_ADMITTED_UNFROZEN`: source/config union and a same-package semantic two-action witness were not closed. |
| R05 | RPM transaction/rollback | RPM records transaction progress and supports recovery-oriented package operations. | `NOT_ADMITTED_UNFROZEN`: candidate action is transaction ordering/batching, which is generic until a target-specific invariant is frozen. |
| R06 | UEFI capsule update processing | Firmware validates a capsule then applies it at a boot-time update boundary. | `NOT_ADMITTED_UNFROZEN`: public CPU-only checker/replay route and fixed same-device semantics were not closed. |
| R07 | Linux kernel signed-module load/unload | Signature verification gates publication of a module into kernel execution state. | `STRUCTURAL_DROP`: no stock crash/replay contract or recovery-preserving alternate grouping action. |
| R08 | Android A/B OTA slot activation | Verified update writes an inactive slot then changes boot selection; fallback preserves bootability. | `NOT_ADMITTED_UNFROZEN`: current source/default union and non-controller same-image construction remain unclosed. |

No family was promoted merely for having a retry, scheduler, update flag, package manager, or generic ordering decision.
