# Source and collision audit

## Input integrity

| Input | Frozen SHA-256 | Result |
|---|---|---|
| Brief | `3517AE98FB57931F276073A00FE7D54983373920513E1B701824246F2FA319E8` | readable / scope consistent |
| Collision matrix | `090678A1A64F54F0ED466D954D488D83DA958B3190771EE5D54130BD1FF63FF3` | readable |
| Discovery log | `4B7FF6282B21F11CA97EEFEF267F93B9337E33F211C7DEC717F67221FBD26263` | readable |
| Discovery handoff | `9B7D5FE47C4D0D95F137EA14F8925C5371072AED8E86FEBE948AC5B7AEF23742` | readable |

## Pin and first-party findings

- Immutable baseline: LLVM 22.1.8 `ca7933e47d3a3451d81e72ac174dcb5aa28b59d1`.
- `MachineOutliner.cpp`: local suffix-tree discovery, legal overlap filtering, target hook invocation, `FunctionList` scalar-priority stable sort, greedy walk and pruning after earlier selection.
- `MachineOutliner.h` / `TargetInstrInfo`: candidate legality categories and target candidate/frame/call/function-safety hooks.
- CGData: `None`, `Write`, and `Read`; read mode builds global candidates from an outlined hash tree created by previous codegen.  `llvm-cgdata` merges embedded object data for later codegen.
- Current action flags: benefit threshold, leaf descendants, reruns, disable-global-outlining, linkonce-odr and content-hash naming.  These must be frozen/replayed, not tuned by the candidate.

## Collision classification

| Work / native feature | Relation | Why it is not (or is) fatal |
|---|---|---|
| LLVM MachineOutliner (2016 and current) | DIRECT_SUBTRACTOR | covers target hooks, suffix candidate discovery and greedy outline replacement |
| LLVM CGData Global Outlining (2024/current) | DIRECT_SUBTRACTOR | covers cross-module global candidate discovery, not target-cost complete selection |
| LLVM current `outline()` | STRONGEST_SAME_OBJECT_BASELINE | scalar priority then greedy pruning; precise residual boundary |
| IR Outliner | ADJACENT | different IR stage/object and cost/legality semantics |
| PLOS post-link outlining (CC 2025) | ADJACENT | changes post-link object/action space |
| Optimistic Global Function Merger (LCTES 2024) | ADJACENT | merge action, not compatible MachineOutliner selection |
| Generic weighted set packing / CP/ILP | SUBTRACTOR_OR_ORACLE | not a target-specific algorithm or deployment baseline |

No `DIRECT_FATAL` is asserted.  This audit is bounded and leaves external same-object exact frontier work `SEARCH_BOUNDED_OPEN`.

## Primary sources

- [LLVM v22.1.8 commit](https://github.com/llvm/llvm-project/commit/ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
- [MachineOutliner current source](https://llvm.org/docs/doxygen/MachineOutliner_8cpp_source.html)
- [Target outlining hooks](https://www.llvm.org/docs/doxygen/classllvm_1_1TargetInstrInfo.html)
- [Global outlining commit](https://lists.llvm.org/pipermail/all-commits/Week-of-Mon-20240909/178821.html)
- [llvm-cgdata guide](https://www.llvm.org/docs/CommandGuide/llvm-cgdata.html)
