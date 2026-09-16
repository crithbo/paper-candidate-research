# PPC-MMA current-source and collision audit

## Scope

Independent static audit on 2026-08-14. Official LLVM source/documentation and primary publications only. No candidate build, compiler run, benchmark, hardware test or implementation was performed.

## Current upstream reality check

| Source | Locator | Decisive finding |
|---|---|---|
| LLVM `PPCRegisterInfo.cpp` | `getRegAllocationHints`, current raw source lines 507–574 | ACC/UACC/VSR hints are only applied after `isISAFuture()` check. For ISAFuture the function explicitly returns because WACC differs from Power10 ACC and the hint logic does not apply. |
| LLVM `PPCRegisterInfo.cpp` | `lowerACCSpilling` / `lowerACCRestore`, lines 1199–1276 | ACC/UACC spills lower through de-prime/prime and paired VSR load/store operations; these are current native actions but do not create a cross-family selector. |
| LLVM `PPCInstrInfo.cpp` | `ppc-fma-rp-reduction`, lines 72–78; `shouldReduceRegisterPressure`, lines 550–603 | flag defaults on, but the pressure reducer is restricted to PPC64 + P9Vector + medium code model and only float/double FMA. |
| LLVM `PPCInstrInfo.cpp` | `getMachineCombinerPatterns` / `reassociateFMA`, lines 694+ | combiner is aggressive-opt-level gated and transforms FMA patterns; not an MMA accumulator binding/spill constructor. |
| LLVM main history | official GitHub commits page | current history observed with `ba5bccfe01368f76e74d6ff4c35f1330e155b4ba` visible at 2026-08-12. |

The raw source was read from official `main`. A direct `git ls-remote` and `curl` request failed locally with Windows Schannel `SEC_E_NO_CREDENTIALS`; retry was read-only and did not change this. This transport outcome is documented for provenance only and is not used to infer any source absence or scientific conclusion.

## Direct source links

- [current PPC register info](https://raw.githubusercontent.com/llvm/llvm-project/main/llvm/lib/Target/PowerPC/PPCRegisterInfo.cpp)
- [current PPC instruction info](https://raw.githubusercontent.com/llvm/llvm-project/main/llvm/lib/Target/PowerPC/PPCInstrInfo.cpp)
- [LLVM Doxygen: PPCRegisterInfo](https://llvm.org/doxygen/PPCRegisterInfo_8cpp_source.html)
- [LLVM Doxygen: PPCInstrInfo](https://llvm.org/docs/doxygen/PPCInstrInfo_8cpp_source.html)
- [LLVM commit history observation](https://github.com/llvm/llvm-project/commits/main)
- [Pereira & Palsberg, Register Allocation by Puzzle Solving](https://llvm.org/pubs/2008-06-PLDI-PuzzleSolving.html)
- [A matrix math facility for Power ISA processors](https://arxiv.org/abs/2104.03142)

## Action-space conclusion

The action set in the brief is not merely incomplete; it is a disjunction of distinct current target/semantic domains. WACC is explicitly separated from ACC/UACC hinting under ISAFuture. The FMA pressure reducer has a separate P9 floating-point condition. A fair same-object candidate could choose one domain only, but that is a material new exact object. Therefore no primary-paper direct collision search can rescue this ID; the structural contradiction is in the official implementation contract.

## Literature search classification

`SEARCH_BOUNDED_OPEN` for an exact same-object paper claiming a joint accumulator frontier. No absence conclusion is needed for the STOP: the current-source object/action mismatch is sufficient.

