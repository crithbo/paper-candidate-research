# Source and collision audit — AARCH64-HWASAN-STACKTAG-REGISTER-PRESSURE-PARETODP

Check date: 2026-08-14. All web evidence below is primary or authoritative. No source retrieval failure is treated as evidence of absence.

## Frozen-input integrity

| Input | Expected SHA-256 | Recomputed SHA-256 | Result |
|---|---|---|---|
| Topic brief | `F20DAFB65B69BF770B196583DC7792E353C094D49442186A50B7EA84BD972056` | `F20DAFB65B69BF770B196583DC7792E353C094D49442186A50B7EA84BD972056` | PASS |
| Collision matrix | `D3743B60552C218F953097F535FFA26824A81190202997E018418869770DBACE` | `D3743B60552C218F953097F535FFA26824A81190202997E018418869770DBACE` | PASS |
| Discovery log | `636E4D35A356549C44301343D758696B779E63C1DF2C49454938A9368E937616` | `636E4D35A356549C44301343D758696B779E63C1DF2C49454938A9368E937616` | PASS |
| Discovery handoff | `1B39FBF1AC4BE84809D0A62534094918E23510E539870C3C265A36E5E4287A75` | `1B39FBF1AC4BE84809D0A62534094918E23510E539870C3C265A36E5E4287A75` | PASS |

## First-party current-source audit

| Source | Exact checked finding | Classification |
|---|---|---|
| [Clang HWASan design](https://clang.llvm.org/docs/HardwareAssistedAddressSanitizerDesign.html) | Every tagged object is aligned; shadow and pointer tag must match at access. For stack, non-promotable allocas are aligned/tagged and a single base tag plus `ReTag(BaseTag,M)` is used to avoid register pressure from M live pointers. | direct primitive-action subtractor |
| [current HWAddressSanitizer.cpp](https://raw.githubusercontent.com/llvm/llvm-project/main/llvm/lib/Transforms/Instrumentation/HWAddressSanitizer.cpp) | `getStackBaseTag`, `getAllocaTag`, `instrumentStack` and `tagAlloca` implement current base/XOR or call-derived tag paths, alloca tag replacement, lifetime tag/untag and alignment/padding. | same-object current implementation |
| [current AArch64StackTagging.cpp](https://raw.githubusercontent.com/llvm/llvm-project/main/llvm/lib/Target/AArch64/AArch64StackTagging.cpp) | `StackInfoBuilder`, `alignAndPadAlloca`, `irg_sp`, finite `NextTag`, `tagp`, lifetime handling, stack-safety and initializer merging are current legal action paths. | same-object current implementation |
| [MemoryTaggingSupport.cpp](https://raw.githubusercontent.com/llvm/llvm-project/main/llvm/lib/Transforms/Utils/MemoryTaggingSupport.cpp) | Defines interesting static, non-promotable, non-safe allocas and common lifetime/exit handling. | action-grammar boundary |
| [Clang command-line reference](https://clang.llvm.org/docs/ClangCommandLineReference.html) | Documents HWASan ABI option (currently unused) and experimental aliasing; these modes cannot be silently used to change the frozen object. | default/non-default boundary |
| [Serebryany et al., arXiv:1802.09517](https://arxiv.org/abs/1802.09517) | Primary domain anchor for compiler-based AArch64 memory tagging. | paper genealogy / subtractor |

## Collision conclusion

`CURRENT_NATIVE_PRIMITIVE_ACTION_COVERAGE=CONFIRMED`.

The discovery statement “no direct source found” is narrowed: current upstream directly implements the claimed base-tag/ReTag rationale and the stack tag/lifetime primitive actions. It does **not** independently prove that every possible fixed-contract joint frontier is covered; therefore the decision is one atomic `REVISE_ONCE`, not a claimed literature `DIRECT_FATAL`.

## Search boundary

`SEARCH_BOUNDED_OPEN`: this review did not infer absence of target-specific tag-assignment/frontier literature. The decision relies on current first-party source coverage and the candidate’s missing action separation. Any revision must search only for sources capable of changing the sole gate.

