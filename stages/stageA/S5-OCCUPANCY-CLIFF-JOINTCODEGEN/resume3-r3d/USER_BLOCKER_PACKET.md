# User Blocker Packet

## Exact blocker

The exact LLVM tools are ready, but the frozen preclaim gate requires 8–16 complete natural GFX11 pre-scheduler MIR objects from at least eight natural source directories. Unmodified ROCm examples yielded valid device IR from only five directories under the available portable Windows environment; one was carried through exact MIR and verifier as the mandatory small witness.

Normal MinGW compilation fails official HIP LP64 assertions (`sizeof(long)==8`) on Windows LLP64. MSVC targeting requires the missing MSVC SDK header `vcruntime_exception.h`. Linux targeting requires a Linux C/C++ sysroot. RTC/device-only mode cannot legally compile full examples with unguarded host HIP API calls, and trimming those calls would change the frozen input.

## Minimum user action

Provide or authorize exactly one of:

1. A portable, immutable Linux x86_64 build environment/sysroot able to execute or host-build exact LLVM commit `1f112d...` and compile ROCm examples commit `269e906...`, with URL/path, byte size, SHA-256 and license; or
2. A portable MSVC Build Tools/Windows SDK header bundle compatible with exact Clang, with path/version/hash/license; or
3. Eight to sixteen complete natural GFX11/wave32 pre-machine-scheduler MIR files derived from the frozen ROCm commit, each with source path/hash, derivation command, exact LLVM attribution and verifier replay metadata.

The smallest likely route is option 3. No AMD GPU is required. Expected additional storage is under 2 GiB for MIR delivery or under 6 GiB for a portable sysroot; expected CPU is under 2 hours because exact LLVM tools are already built.

## Resume boundary

Mainline must create a new immutable resume directory and freeze the supplied resource hash. Resume at `PRE_CLAIM_CONTRACT_FIDELITY_GATE.complete_natural_mir_set`; reuse the exact verified tools by registered hash; do not rebuild unless the new environment makes the Windows binaries unusable.

## What was not inferred

No candidate/baseline corpus comparison, scientific negative result, STOP, reserve or archive recommendation was produced. The scientific revision is still available.
