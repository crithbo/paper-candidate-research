# SystemZ packed-stack callee-save joint construction — prebrief source closure

## Scope and disposition

- Assignment: `STAGE0-P1-20260814-SYSTEMZ-PACKEDSTACK-CALLEESAVE-JOINT-CONSTRUCTION-PREBRIEF-CLOSURE-V8.7`
- Mode: `PREBRIEF_SOURCE_CLOSURE` — **not** a full Stage 0 paper-potential review.
- Exact object: one public SystemZ ELF MachineFunction under fixed ABI and object semantics.
- Proposed joint action: callee-save range selection plus packed-stack object/offset representation.
- Disposition: `STRUCTURAL_DROP__GENERIC_PRODUCT_OR_CURRENT_UNION_ABSORPTION`
- Confidence: `0.93`
- Stage A/B: not authorized.

The bounded current-source closure falsifies the candidate's indispensable joint choice. On a fixed MachineFunction, the packed-stack predicate is determined by the existing function attribute and calling convention; it is not a layout decision. The GPR saved range and its ABI offsets are then derived from the already determined `CSI` and fixed ABI table. Object ordering applies a general density sort to the pre-existing frame-object list. Thus no same-function pair of plans can differ in the stated “saved range plus packed representation” action while retaining the frozen ABI, object and semantic contract.

This is a structural prebrief drop, not a finding that compilation has been benchmarked or that a full Stage 0 paper review has failed.

## Resource-localization compliance

Before acquisition the assignment created the required eight directories and a durable inventory. A process-local redirect preflight set `TEMP`, `TMP`, `TMPDIR` to `resources/tmp` and `XDG_CACHE_HOME` to `resources/cache`; all paths resolved under the frozen root. Only three official LLVM read-only responses were persisted, with hashes and paths in `RESOURCE_INVENTORY.yaml` and immutable snapshots. No external cache, toolchain, build tree, source clone, experiment output, or unregistered resource was used.

Pinned current commit: `72edcedcdf0a8de68338e9b42f4effd1f21e9725`.

## Current action closure

| Current source behavior | Consequence for the frozen action |
|---|---|
| `usePackedStack(MF)` returns `HasFnAttribute("packed-stack") && CallConv`, with a fixed unsupported-combination error. | For one fixed function/calling convention, packed-stack mode is a fixed input fact, not a legal output action. Flipping it changes the function's contract. |
| `determineCalleeSaves` first delegates to `TargetFrameLowering::determineCalleeSaves` and then adds mandatory ABI cases such as varargs/landing pads/frame pointer. | The eligible saved set follows liveness and ABI obligations; it is not freely selectable by a later frame-layout constructor. |
| `assignCalleeSavedSpillSlots` scans `CSI`, obtains `getRegSpillOffset`, selects the lowest GPR offset, fixes the high GPR at `R15D`, records range state, and creates the corresponding fixed spill objects. | The range is a deterministic consequence of `CSI` plus the ABI offset table. An alternate range would omit a required save or add a needless save, changing correctness/full cost rather than supplying a comparable plan. |
| `getRegSpillOffset` adjusts the ABI table deterministically for packed stack (GPRs get the documented fixed shift; non-GPRs are handled as prescribed). | The alleged shared base shift is a derived representation effect, not an independently chosen state transition. |
| `orderFrameObjects` scans frame uses and stable-sorts pre-existing objects by short/pair displacement density. | It is an ordinary frame-object ordering action; it neither selects callee saves nor changes packed-stack mode. |
| prologue/epilogue consume `ZFI`'s recorded low/high GPR range and finalized offsets. | They are downstream emitters, not a second legal joint choice. |

These source paths are directly available in the authoritative [LLVM source repository](https://github.com/llvm/llvm-project/tree/72edcedcdf0a8de68338e9b42f4effd1f21e9725/llvm/lib/Target/SystemZ). The retained exact blobs are hashed in the inventory.

## State-erasure attack

The proposed shared state is `(saved GPR range, fixed ABI spill offsets, packed-stack base shift)`. Erasure shows:

1. The packed-stack bit is a fixed property of the input function, not an optimization variable.
2. Given `CSI` and that bit, `LowGPR`, `HighGPR`, `StartSPOffset`, fixed spill objects and base adjustment are computed deterministically.
3. The only remaining reorder is the target's ordinary density-based frame-object ordering, which is separable from callee-save selection.

No cross-term survives as a legal same-object decision. Recasting the deterministic map as an optimizer would be a generic product/frame-layout wrapper; allowing it to change `packed-stack`, `CSI`, ABI offsets or call convention would violate the frozen object.

## Witness and collision disposition

The requested witness requires two complete ABI-legal plans for one public fixed-ABI regression. The current action closure rules that out before selecting a regression: the same function fixes `packed-stack`; the same `CSI` and ABI fix the saved range/offset representation. A regression whose plans differ must therefore change a function attribute, calling convention, callee-save requirement, ABI or object semantics. It would not witness this object.

The current LLVM union directly absorbs the actual deterministic range/slot/frame behaviors. This is stronger than `SEARCH_BOUNDED_OPEN` for the proposed action; no external-paper absence claim is made, and an exhaustive literature search is neither required nor performed.

## Boundary and next state

- This conclusion does not reject a different SystemZ topic with a new exact object/action; it rejects only this frozen proposed joint action.
- No complete Stage 0 report, Q1 calibration, implementation plan or performance claim is produced because prebrief admission fails structurally.
- `RESOURCE_FAILURE_ONLY__NO_SCIENTIFIC_INFERENCE` does not apply: source acquisition succeeded in the frozen local resource root.
- Recommended mainline action: record the prebrief structural drop; do not route this ID to full Stage 0 PRIMARY.
