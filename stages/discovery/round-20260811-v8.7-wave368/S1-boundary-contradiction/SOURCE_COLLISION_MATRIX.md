# Source and collision matrix

| Family | First-party/current evidence | Finding |
|---|---|---|
| PCIe AER | Linux current PCI Error Recovery and PCIe AER HOWTO | The current API makes recovery a callback-result protocol; reset choice is already defined by driver/platform state. |
| NVMe | Linux current NVMe fault-injection documentation | Reinitialization can succeed or fail after reset; no complete same-object N2 construction was frozen. |
| DRM scheduler | Linux current DRM scheduler/recovery documentation | Documents stop/reset/resubmit/start as stock recovery sequence. |
| SCSI, devlink, CXL, reset controller, PA-RISC | Official Linux/kernel or architecture documentation routes | No absence/newness claim; incomplete rows remain unfrozen. |

No issue, future-work statement, old release, or missing resource was treated as evidence of a residual.
