# HWASan-only action and frontier audit

## Scope correction

This audit supersedes the PRIMARY’s mistaken use of `AArch64StackTagging` as a same-object action source. That pass is guarded by `SanitizeMemTag`; this revision freezes `SanitizeHWAddress` only. `tagp`, `irg_sp`, `settag`, and `NextTag` are therefore absent from both candidate and comparator action lists.

## Pinned native semantic chain

`fixed source/IR` → `sanitize_hwaddress` → `HWAddressSanitizer::sanitizeFunction` → `StackInfoBuilder` → `instrumentStack` → `getStackBaseTag` / `getAllocaTag` / `tagAlloca` → ordinary AArch64 instruction selection, RA, frame lowering and unwind → stock runtime/checker.

Pinned upstream: `e72ba6cf366a3180cbf5a8690d9e50665880ab76` on 2026-08-14. Frozen deployment is AArch64 Linux user-space; page aliases are not applicable (current source limits them to x86_64).

## Native grammar proof sketch

For a fixed function `F`, fixed flags and fixed analysis results:

1. `StackInfoBuilder(F)` deterministically yields the ordered `MapVector` of eligible allocas and their lifetime/CFG records.
2. Normal AArch64 HWASan obtains exactly one stack base from frame-pointer-derived entropy unless the excluded global runtime-call mode is selected.
3. The loop sets `N=I++`. `getAllocaTag` returns `base XOR retagMask(N)`; the source’s AArch64 mask list is explicitly chosen for a single Arm instruction and collision ordering.
4. `tagAlloca` and the lifetime/exit branches determine tag stores and UAR restoration from the same alloca record, size and CFG.
5. Backend allocation receives this already-fixed IR. It may optimize registers/frame layout but has no HWASan tag-plan choice.

Therefore the action relation has one HWASan policy outcome for this frozen object. The only apparent branches are global configuration modes, which are not two plans under one fixed report contract, and downstream generic codegen.

## No valid two-plan witness

| Proposed distinction | Fails because |
|---|---|
| different MTE `tagp` / `NextTag` plan | different `SanitizeMemTag` object |
| different `retagMask` permutation | no pressure/materialization delta; may alter fixed detection trace |
| runtime generated tag | nondeterministic runtime value and different compiler mode/full cost |
| altered alloca packing | physical offsets unknown to HWASan; becomes generic IR/frame planning |
| different RA spill choice | downstream generic target codegen, not HWASan-only N2 |
| disabled lifetime/short-granule/check action | weaker or changed protection contract |

## Frontier consequence

The candidate’s desired objective vector has no nontrivial HWASan action coordinate. Projecting it onto the fixed HWASan path leaves ordinary AArch64 code generation. Adding a generic external layout/RA solver does not restore target-specific N2 novelty. Hence no sound future-action-preserving frontier state or target-specific recurrence can be supplied for this candidate.

## First-party evidence locators

- [LLVM current HWAddressSanitizer source](https://llvm.org/doxygen/HWAddressSanitizer_8cpp_source.html): options at lines 108–292; `instrumentStack` lines 1479–1503; `retagMask` and `getAllocaTag` lines 1263–1317; short-granule storage lines 1229–1260.
- [Clang HWASan design](https://clang.llvm.org/docs/HardwareAssistedAddressSanitizerDesign.html): pointer/shadow matching and short granules; stack base/ReTag rationale.
- [LLVM AArch64StackTagging source](https://llvm.org/doxygen/AArch64StackTagging_8cpp_source.html): `SanitizeMemTag` guard; used only to establish exclusion, never as same-object evidence.

