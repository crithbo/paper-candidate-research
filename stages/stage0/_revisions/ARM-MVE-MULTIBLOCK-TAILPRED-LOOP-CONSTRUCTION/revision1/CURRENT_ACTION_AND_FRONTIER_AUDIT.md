# Current action and frontier audit

## Scope

Pinned LLVM commit: `81ac5c7c26efb70ffaffb91b26053437093ee085`  
Target: Armv8.1-M with MVE and low-overhead loops.  
Object: the frozen two-basic-block same-function MachineFunction; no changed ABI, branch, exception, active-lane, VCTP/VPT, loop-range or live-out semantics.

## Complete relevant native action envelope

| layer | current legal action | boundary for this review |
|---|---|---|
| IR conversion | replace safe active-lane mask with an MVE VCTP intrinsic, otherwise legalize it normally | does not itself create a two-block LOB plan |
| VCTP identity | admit a second VCTP only if it has an identical operand and the same reaching definition | a different count provenance is rejected |
| LOB form | map VCTP width to `MVE_DLSTP_*`/`MVE_WLSTP_*`; choose `MVE_LETP` only when TP legality holds | the choice is conditional, not a new candidate action |
| VPT/VPR | validate VPT state, convert VPT blocks, recompute VPT/VPST masks | component repair is current-union behavior |
| safety | validate ranges, branch layout, false-lane/live-out effects, exits and VPR live-ins | current proof assumes one loop block and one exit |
| fallback | use ordinary `t2LEUpdate`/revert when the conversion is not legal | fair baseline; it is not a candidate residual |
| modes | disabled, enabled-no-reductions, enabled, force-enabled-no-reductions, force-enabled | mode choice is fully included in the union |

Primary authoritative source: [LLVM ARM low-overhead-loop source](https://llvm.org/docs/doxygen/ARMLowOverheadLoops_8cpp_source.html); related [MVE tail-predication source](https://llvm.org/doxygen/MVETailPredication_8cpp.html). The local blobs and hashes are recorded in `REVISION_REPORT.md`.

## Static action-path table

| path | VCTP/VPR/VPT obligations | current status | candidate status |
|---|---|---|---|
| `P0`: ordinary/revert two-block loop | preserve original predicate and loop-end behavior; use normal/revert lowering | native and union member | baseline only |
| `P1`: one-block tail-predicated LOB | single VCTP-reaching class; valid VPT state; false-lane/live-out proof; range and exit checks | native and union member where legal | outside frozen two-block object |
| alleged `P2`: two-block tail-predicated LOB | must specify VCTP provenance on both blocks, VPR state across the edge, VPT regions/masks, exits/live-outs, branch/exception effects and LOB selection | not a current legal path: `IsTailPredicationLegal` rejects `ML.getNumBlocks()!=1` | no complete native plan/action has been supplied |
| mode/flag variant | same path with a different mode | union member | rejected substitute |
| remove block-count guard | creates an incomplete source patch, leaving validation assumptions unsatisfied | not an action in the frozen grammar | rejected substitute |

## Why no sufficient frontier is available

A legitimate state would at minimum need `(block/edge location, VCTP reaching class, VPT entry/mask state, VPR definition/liveness, LOB start/end form, exit/live-out obligation, branch/range condition, exception condition, fallback state, accumulated full cost)`. Merely writing such a tuple is not sufficient: no current or proposed transition defines the cross-block tail-predicated action while preserving all listed fields. Dropping any of the edge, live-out or exception fields breaks future-action preservation; retaining them without a native `P2` transition yields only generic CFG state enumeration.

Accordingly, no exact, FPT, or certified-Pareto recurrence is specified. A recurrence over independent block choices, generic CFG scheduling, generic ILP, or a flag sweep would either omit a required native obligation or be a contract-rejected generic substitute.

## Source-grounded boundary

`IsTailPredicationLegal()` comments that current LLVM supports only one block "for now." This is evidence of a current implementation boundary, not an ISA impossibility theorem. The correct inference is limited: it makes `P2` an unprovided action that must be fully constructed by the revision. The revision does not construct it. The atomic gate therefore fails without making an absence claim about Arm hardware or future LLVM.

## Fairness and full cost

Any later same-object candidate would need to charge VCTP/VPT setup and repair, branch/layout/range work, loop-form selection, fallback, register pressure/spills, code bytes, compilation time/RSS, and runtime. It would also need exactly the same active-lane, exception, ABI, loop-range and live-out semantics as `P0`. This audit reports no outcome on those metrics; it only shows why a valid candidate plan is a necessary precondition.
