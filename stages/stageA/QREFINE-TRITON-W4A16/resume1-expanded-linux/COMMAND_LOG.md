# Command log

- Lane: `CANDIDATE-EXECUTION-LANE-1`.
- Assignment: `STAGEA-L1-20260822-QREFINE-TRITON-W4A16-RESUME1-EXPANDED-LINUX`.
- Assignment SHA-256 matched `F0684E81787E1037125125850630DC96C24D34DE3532A39A860D37BE7E4C26C4`.
- Unique write directory was empty at the start. Initial package remained read-only.

## Immutable continuity

- Initial handoff SHA-256 matched `4EF72E9CEE857F585AA04967EB3896FFAA58EC34CC6617E4493D7652521506AB`.
- Initial manifest self SHA-256 matched `E6C0E60E67817D709587DF223B302D1DA1D90A6E7D9CAD0DD0F843F149753007`.
- Recalculated initial manifest entries: 30/30 valid, 0 errors.

## Read-only Linux executor preflight

One bounded read-only probe inspected PATH executables, WSL status/distributions, relevant services, AppX packages, known portable roots, Git Bash, and executable/image-like files in the immutable initial resource tree.

- `wsl.exe --status`: exit 50; stderr: `未安装适用于 Linux 的 Windows 子系统。可通过运行 wsl.exe --install 进行安装。`
- `wsl.exe --list --quiet`: exit 1; no distributions.
- `LxssManager` and `WslService`: not found.
- Docker/Podman binaries and services: not found.
- QEMU, proot, Multipass, Lima, nerdctl and colima: not found.
- Known portable Linux roots and initial Linux executable/image assets: none.
- `vmcompute` was running, but no assignment-allowed WSL/Docker/Podman executor existed; a service alone is not an executor.
- Git Bash exists under `C:/Program Files/Git`, but it is a Windows/MSYS shell and cannot execute Linux ELF/manylinux Triton artifacts.
- The first AppX query used an invalid array argument and returned a PowerShell parameter error; the immediate read-only mechanical correction queried each pattern separately and found no matching package. No scientific or resource action depended on the failed query.

## Enforced stop

- Exact 356,721,745-byte LLVM download: not started.
- Network requests/download bytes: 0/0.
- Builds, solver runs, mutant runs, GPU runs: 0.
- WSL/VirtualMachinePlatform, Docker/Hyper-V, driver, registry, PATH or reboot changes: none.
- PRE_CLAIM gate: not reached; fail-closed at its resource prerequisite.
- Scientific revision consumed: false. Stage B: false.
