# User blocker packet

## Outcome

`BLOCKED_USER_ACTION_REQUIRED`. This is a pre-claim resource failure, not a scientific result. No mutant, solver, compiler build, GPU kernel, or claim-bearing observation ran; scientific revision remains unconsumed.

## Exact blocker

- Host: Windows x86_64, Python 3.12.13; no installed Triton, Z3/cvc5, CMake/Ninja/clang/MLIR toolchain, or WSL distribution.
- Official PyPI Triton 3.7.1 metadata publishes 12 manylinux wheels and no Windows wheel. The CPython 3.12 x86_64 wheel is 197,719,725 B and is not Windows-compatible.
- Triton v3.7.1 source exactly pins LLVM `1f126a6dea50d185c0781743a667390037ae88bd`.
- The exact official Ubuntu x64 LLVM package is `https://oaitriton.blob.core.windows.net/public/llvm-builds/llvm-1f126a6d-ubuntu-x64-1.tar.gz`, `Content-Length: 356721745`, last modified 2026-06-16, ETag `0x8DECBFDB1C678CF`.
- That single package exceeds the assignment's 134,217,728 B pre-download escalation boundary and also exceeds its 268,435,456 B total-network cap. It was not downloaded.

## Completed safely

- All frozen inputs were hash-verified and localized.
- Exact vLLM anchor and official Triton v3.7.1 source were downloaded and hashed within budget.
- The LLVM pin and both target backend capture boundaries were statically confirmed.
- Existing sm89 hardware was observed read-only. No gfx1100 device was observed.

## Not executed

- Observer identity/round-trip witness, exact module capture, operation inventory, primary solver freeze/replay, strongest-baseline executions, all 12 mutants, composition, schedule witness, and all Stage B work.

## Minimum user/mainline action

Freeze one new resume assignment and provide either:

1. a process-local, unmodified, executable Triton v3.7.1 environment at commit `f797708c0626e5f9840ca5b0a98790e2c7cb09ad`, with LLVM `1f126a6dea50d185c0781743a667390037ae88bd`, NVIDIA and AMD target-local codegen enabled, and an observer-capable post-`make_llir`/pre-`llvm.to_module` capture route; or
2. explicit expanded authorization and budget for an official Linux/WSL-compatible environment, including the 356,721,745 B LLVM package plus installation/build storage and CPU bounds. This route would also need separate permission for WSL/system changes if no portable Linux executor is supplied.

After observer fidelity passes, the resume assignment must also freeze one primary Z3 or cvc5 binary/version/hash and replay route. A matching gfx1100 resource may be supplied later for the AMD performance witness; its absence must not be used as scientific rejection of the validator.

Acceptable placement: a new assignment-local `resources/` tree or a mainline-registered immutable shared asset. Do not overwrite this directory.

Evidence ceiling: `RESOURCE_FAILURE_ONLY__NO_SCIENTIFIC_INFERENCE`.
