# LLVM MachineOutliner target-cost global candidate selection — Stage 0 revision 1

## Disposition

- Assignment: `STAGE0-P1-20260814-LLVM-MACHINE-OUTLINER-TARGET-COST-GLOBAL-CANDIDATE-SELECTION-REVISION1-V8.7`
- Sole gate: `PINNED_MACHINEOUTLINER_GLOBAL_CANDIDATE_CATALOG__TARGET_COST_CONFLICT_COMPONENT_PARETO_CERTIFICATE`
- Decision: `STOP`
- Quality disposition: `BELOW_Q2_STOP__CURRENT_MACHINE_OUTLINER_GLOBAL_SELECTION_ABSORPTION_OR_GENERIC_CONFLICT_GRAPH_PACKING`
- Scientific revision: **consumed (1/1)** by this gate-bearing static construction.
- Stage A / Stage B: not authorized.
- Confidence: 0.90.

This is a structural scientific STOP, not a consequence of missing implementation, test-suite execution, or performance data.  The current source leaves a scalar greedy selection heuristic, but the remaining action space under the frozen native grammar is ordinary weighted interval/conflict selection.  No target-specific non-product state or guarantee survives without changing candidate discovery or native frame/call actions.

## Frozen source, target boundary, and action catalogue

The immutable baseline is LLVM v22.1.8 commit `ca7933e47d3a3451d81e72ac174dcb5aa28b59d1`.  The attempted contract fixes AArch64, one subtarget, ABI, unwind/relocation semantics, one MachineIR module, and the entire current action family:

1. local `InstructionMapper` mapping and suffix-tree repeated-substring discovery;
2. local per-repeated-substring left-to-right overlap pre-pruning;
3. CGData `None`, `Write`, and `Read`, including global outlined-hash-tree matches from prior codegen;
4. target `getOutliningCandidateInfo`, `buildOutlinedFrame`, `insertOutlinedCall`, `isFunctionSafeToOutlineFrom`, and target function-safety hooks;
5. benefit threshold, leaf-descendant, rerun, linkonce-odr, global-disable and content-hash controls; and
6. `outline()`'s scalar priority sort followed by greedy replacement and later-overlap pruning.

The audit confirms two facts which must both be honored: current LLVM already has global candidate discovery through CGData; and its final selection is greedy.  The latter alone is not a paper residual.

## Gate proposition and attempted construction

**Required proposition.** A complete set of current native candidates contains a bounded conflict component for which a target-cost-aware finite frontier can select a different legal Pareto plan from LLVM's scalar greedy plan, while retaining all future native actions and frame/call/object/unwind/relocation semantics.  The resulting recurrence must be target-specific, not weighted set packing.

**Attempted same-MachineIR component.** Consider three individually hook-accepted groups in one AArch64 MachineIR block: `G0` occupies `[0,3)`, `G1` occupies `[1,4)`, and `G2` occupies disjoint `[4,7)`.  Each group calls the existing target hooks and has positive standalone saving.  `G0` conflicts with `G1`; `G2` does not.  This is the strongest possible static multi-candidate witness under the frozen action grammar.

It fails the gate for two independent, structural reasons:

1. **Completeness failure before selection.** Local candidate discovery sorts occurrences of one repeated substring and discards later overlapping occurrences *before* `FunctionList` selection.  A selector that recovers discarded occurrences changes discovery, not selection; it cannot claim to optimize the complete current native candidate catalogue.  CGData read mode changes how cross-module sequence matches are found, but it does not restore a complete local occurrence/action family.
2. **Generic kernel after catalogue freeze.** For every retained `OutlinedFunction`, current target hooks compute a fixed sequence size, frame overhead, and the sum of per-occurrence call overheads.  Selection changes only whether a group’s intervals are used.  Different groups share no native frame, relocation, unwind, or call action in the existing grammar.  ABI/unwind/relocation/MachineInstr legality are already enforced per selected group by the hooks.  Thus the remaining decision for `G0,G1,G2` is exactly “take an independent compatible subset under scalar/vector weights.”  Adding a second cost dimension produces a generic Pareto interval/conflict packing instance, not a target-specific state transition.

The apparent action divergence `G0+G2` versus `G1+G2` proves only generic overlap choice.  It has no target-specific coupling: target labels affect fixed weights or reject a vertex, but do not alter the compatibility/action transition of a selected group.

## Why no admissible target-specific recurrence exists

An attempted frontier may name `(occupied instruction intervals, selected group IDs, accumulated size/runtime cost)`.  It is precisely generic weighted interval scheduling or set packing.  Adding `FrameConstructionID`, target features, ABI, unwind and relocations does not save it:

- `FrameConstructionID` and the target feature merge belong to construction of one outlined function, not a shared resource across competing `OutlinedFunction` groups;
- frame/call costs are supplied per group and summed in the current `OutlinedFunction` cost model;
- object, relocation and unwind validity follows after native `buildOutlinedFrame` / `insertOutlinedCall` for each selected group, without a cross-group action;
- a state that permits candidate recovery from the raw suffix tree has changed the native candidate grammar and enters forbidden global discovery; and
- a state that merely carries target-labelled weights is still generic packing with labels.

Accordingly, no future-native-action preserving finite state can both be complete and non-generic.  The only exact/FPT guarantees available here are generic interval/conflict algorithms or a generic CP/ILP formulation, expressly forbidden by the contract.  Claiming them as a MachineOutliner algorithm would be an implementation wrapper, not N2.

## Current source evidence

The pinned `MachineOutliner.cpp` explicitly (a) pre-discarding overlaps while forming candidates for each repeated substring; (b) sorting `FunctionList` by `getNotOutlinedCost()/getOutliningCost()`; (c) walking it greedily; and (d) pruning any candidate that overlaps with previously outlined instructions.  Its CGData read branch already creates global candidates from an existing global outlined hash tree.  `llvm-cgdata` records/merges global outline information.  These facts both refute the former global-discovery framing and establish that the unabsorbed heuristic gap does not itself supply a non-generic algorithmic kernel.

## Claim ceiling and successor boundary

No paper claim survives for this topic ID.  A future successor requires a new topic/object that introduces a real shared target semantic action or native non-product constraint—rather than re-ranking the present groups—or an independently verified new LLVM action grammar.  Renaming scalar/vector priority, adding a solver, using a suffix-tree enumeration, selecting flags, or changing the ABI/IR/frame action cannot reopen this ID.

## Sources

- [LLVM v22.1.8 immutable commit](https://github.com/llvm/llvm-project/commit/ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
- [Pinned MachineOutliner source](https://github.com/llvm/llvm-project/blob/ca7933e47d3a3451d81e72ac174dcb5aa28b59d1/llvm/lib/CodeGen/MachineOutliner.cpp)
- [Current MachineOutliner source reference](https://llvm.org/docs/doxygen/MachineOutliner_8cpp_source.html)
- [Target outlining hooks](https://www.llvm.org/docs/doxygen/classllvm_1_1TargetInstrInfo.html)
- [LLVM CGData global outlining commit](https://lists.llvm.org/pipermail/all-commits/Week-of-Mon-20240909/178821.html)
- [llvm-cgdata guide](https://www.llvm.org/docs/CommandGuide/llvm-cgdata.html)
