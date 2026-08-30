# Unique opportunity families

Eight nonduplicate families were screened. The strongest recovery oracle routes were Linux kdump and systemd offline updates:

| Family | Frozen native object/oracle | Why no certified action-divergence guarantee exists yet |
|---|---|---|
| Linux kdump/kexec | Fixed crash-kernel configuration, crash event, vmcore capture, crash-tool inspection oracle. Kernel documentation specifies `CONFIG_KEXEC`, `CONFIG_CRASH_DUMP`, and `/proc/vmcore`. | The apparent alternatives are choosing a capture kernel or configuration. They do not give two whole same-object recovery/publication constructions. |
| systemd offline updates | Fixed update payload, early-boot marker, system-update target, success/failure reboot/rollback observable state. | The two apparent paths are update-manager policy paths; any regrouping changes package/update semantics or becomes a controller. |
| Xen, dpkg, RPM, UEFI capsule, Android A/B | Natural recovery or verification surfaces exist. | The mandatory current-union, forced legal witness, or target-specific certified guarantee was not closed. |

No candidate-grade deep review was allowed without the complete certificate.
