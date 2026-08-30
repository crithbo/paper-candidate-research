# Environment

- Assignment: `STAGEA-L2-20260809-PB-DELETE-SCHEDULE-INITIAL`
- Workspace and only write root: `D:\project\writing\reserch\stages\stageA\PB-DELETE-SCHEDULE`
- Host: Microsoft Windows NT `10.0.26200.0`, AMD64; processor identifier `AMD64 Family 25 Model 97 Stepping 2, AuthenticAMD`.
- PowerShell: `5.1.26100.8875`.
- Python: bundled CPython at `C:\Users\15383\.cache\codex-runtimes\codex-primary-runtime\dependencies\python\python.exe`.
- C/C++/assembly compiler: official Zig `0.16.0`, asset SHA-256 `68659EB5F1E4EB1437A722F1DD889C5A322C9954607F5EDCF337BC3684A75A7E`.
- Rust: `rustc 1.97.1 (8bab26f4f68e0e26f0bb7960be334d5b520ea452)`; Cargo `1.97.1 (c980f4866141969fab6254a680546a277789d6f0)` from the publisher-signed stable channel manifest.
- MaxPre executable SHA-256: `8B1C5CD5752A69CC2A0D949173C53E6586756675872F28E585593BC82E2BABF9`.
- VeriPB executable SHA-256: `2E38A50D8D85CD3D1AC4D870F449A53CB42A177D37E2A3FAA9876A0EE1B5D9F4` (`3.0.2`, exact release commit `c648bac06be995b82bd218e248f005140fc8ce11`).
- CakePB WCNF executable SHA-256: `19B0820803CBD6274B9A4712BA0D74AE35C6BCAF28AF0CAF12A226B5AE336953` (repository commit `6edb2f3585f1c3e1b925964c4f33e133f7279d02`; HOL4/CakeML commits recorded in `SOURCE_MANIFEST.yaml`).
- CakePB runtime: `CML_HEAP_SIZE=512`, `CML_STACK_SIZE=128` MiB.
- VeriPB build environment: `CRATE_CC_NO_DEFAULTS=1`, target `x86_64-pc-windows-gnu`, Zig C compiler with `-fno-sanitize=undefined`; locked Cargo dependency graph, offline final rebuild.
- GPU/exclusive hardware: neither requested nor used.
- WSL distribution, Docker, Podman, native MSVC/GCC/Clang/CMake: unavailable and not required after the portable closure.

## Resource accounting

- Final candidate-directory footprint before hash closure: `2,979,675,449` bytes (`2.775 GiB`), below the `4,294,967,296`-byte ceiling.
- Final scientific-pipeline child-process wall-time sum from JSONL command logs: `63.589 s` (`0.017664 h`). Acquisition, compilation, failed portability attempts, and orchestration also remained far below the `4 CPU-hours` ceiling.
- Peak memory is recorded per run in `FULL_COST_MATRIX.csv`; the configured CakePB heap was 512 MiB, so the experiment stayed below 4 GiB without an exclusive device.

## Portability scope

The official sources were preserved. Derived Windows build copies contain only build/ABI portability changes, itemized and hashed in `BUILD_PROVENANCE.md` and `SOURCE_TREE_HASHES.json`. No checker rule, proof semantics, MaxPre deletion rule, output emitter, or candidate mechanism was added by these patches.
