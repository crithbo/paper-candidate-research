# LLVM DWARF Call-Site Reconstructibility — independent Revision 1 closing

## Disposition

- Assignment: `STAGE0-C2-20260814-LLVM-DWARF-CALLSITE-RECONSTRUCTIBILITY-REVISION1-CLOSING-V8.7`
- Atomic gate: `SAME_MIR_TWO_PLAN_CLOBBER_WITNESS__TARGET_SPECIFIC_CALLSITE_FRONTIER`
- Decision: `CONFIRM_STAGE0_PASS`
- Conditional tier: `TIER_B_Q2_VIABLE`
- Evidence ceiling: `E1_STATIC_PREFLIGHT__STATIC_CERTIFICATE_ONLY__SEARCH_BOUNDED_OPEN`
- Revision budget: `1/1` consumed by the owner; no further revision is authorized here.
- Stage A/B authorization: `false / false`

The revision closes its *narrow, bounded* static gate. This is not a claim that
LLVM currently produces a natural-corpus win, that the proposed optimizer is
implemented, or that general register allocation is solved. Those claims stay
outside the ceiling and behind the frozen Stage A fidelity gate.

## Frozen-input integrity and review boundary

The four canonical revision files match the contract hashes: revision report
`0D62FB5D…BA8A`, action/frontier audit `3D0D7BBC…F07F`, claim matrix
`573F58ED…FB17`, and handoff `8A764825…67B91`; the revision manifest hash is
`761A3424…17C93`. I reviewed that package independently and did not alter its
construction. The only source check conducted for this closing was targeted,
read-only examination of LLVM's first-party DwarfDebug and debug-information
documentation. The exact pinned-source fetch was unavailable through the
browser cache, so this report makes no absence inference from that transport
result; the available first-party current source confirms the cited mechanism
and Stage A must replay the precise pin.

## Gate attacks and findings

| Attack | Independent finding | Result |
|---|---|---|
| Non-entry `bb.1` and entry-value fallback | `collectCallSiteParameters` sets `ShouldTryEmitEntryVals` only when the call MBB is `MF->begin()`. The witness call is in `bb.1`, not that entry MBB. `%sum` is additionally a newly computed value, not an unchanged formal. It therefore cannot be rescued by the documented entry-register fallback. | passes |
| `RAX` Plan A | Backward collection begins at `RDI`; the copy exposes `RAX` as a non-callee-saved source. The collector retains that forward register, reaches the physical `ADD` definition, and cannot turn that arithmetic definition into `describeLoadedValue`; it removes the unresolved source. The valid outcome is unavailable, rather than inventing an `RAX` expression. | passes |
| `RBX` Plan B | With the same call ABI and `RDI` argument, the copy exposes callee-saved `RBX`. Current collection can finish a parameter from a callee-saved source. Saving/restoring `RBX` and its CFI obligations make that assignment SysV and unwind legal; the legal call-value form is a target-printed `DW_OP_breg` for `RBX` (x86 DWARF register 3). The exact emitted spelling remains a Stage A fidelity check, not an assumed experiment result. | passes |
| Same-MIR/same-object | Both realizations retain one pre-RA computation, the same `RDI` call argument, fixed regmask, function ABI, executable observation, DWARF reader contract and unwind contract. The physical CSR choice necessarily introduces actual save/restore/frame/CFI obligations; it is not a metadata-only afterburner. | passes |
| Current strong union | The review includes RA/coalescing/spill/CSR policy, `LiveDebugVariables`, compatible InstrRef or VarLoc `LiveDebugValues`, DwarfDebug forwarding/clobber processing, entry-value behavior, and the legal fixed configuration grid. They propagate/emits an already-selected native plan but do not supply the declared allocation-time reconstructibility/full-cost frontier. A current configuration that produces the full Plan-B coordinate is expressly removed from the residual denominator. | passes, conditional residual only |
| Frontier certificate | The state retains physical aliases/clobbers, CSR/frame/CFI obligations, Dwarf forwarding/source class, entry eligibility and every declared cost coordinate. For the stated bounded-cut catalog, these components determine all legal future native transitions and incremental costs. The recurrence is therefore an exact Pareto DP FPT in the crossing width `w`; it does not claim global RA, arbitrary expressions, arbitrary stack identity or a generic ILP. | passes, bounded class only |
| Full cost and killer | The certificate charges native CSR/spill/frame work as well as debug output, then freezes a finite preclaim test: materialized witness, tiny action enumeration, verifier/object/unwind/dwarfdump checks, full current-grid comparison and a 30-function full-cost denominator. A failure of native legality, union residual, or full-cost non-domination is a predeclared Stage A killer. | passes as finite route, not as a result |

## Source-level reconstruction

The decisive current code sequence is stronger than the owner report's
informal description. LLVM's [DwarfDebug call-site collector](https://llvm.org/doxygen/DwarfDebug_8cpp_source.html)
seeds forwarding registers from call-site information, walks backward within
the MBB, accepts `describeLoadedValue` only when its source remains
callee-saved (or frame/stack-pointer), and otherwise continues the backward
worklist. The same source limits the entry-value attempt to the first MBB and
records a TODO for other blocks. The documented
[entry-value constraints](https://llvm.org/docs/SourceLevelDebugging.html)
likewise limit the operation to a register's frame-entry value, normally an
unmodified function parameter. Thus the `RAX` computed-ADD branch and the
saved `RBX` branch are mechanically distinguishable under the declared
contract.

The reviewer accepts no stronger proposition: Plan B is not claimed to be
emitted by stock LLVM, `DW_OP_breg3` is not accepted as a hand-transcribed
object-file result, and the exact pin must be rechecked at the Stage A
fidelity gate. These are bounded validation obligations, not defects in the
static same-object proposition.

## Why this is an N2 paper shape rather than an absorbed emitter tweak

The retained optimization action is a native allocation/location choice made
before the existing debug propagation and DwarfDebug emitter. It jointly
prices reconstructibility and CSR/frame/CFI/debug costs, while preserving the
call ABI. Existing propagation and expression emission are comparators and
remain in the union. The state includes source recognizability and ABI/CFI
obligations in addition to register pressure, so the proposed bounded
recurrence is not merely hot-register tuning, a metadata postprocessor, or a
generic RA/ILP wrapper. Its narrowness is honestly stated and is appropriate
to the conditional `TIER_B_Q2_VIABLE` ceiling.

## Mandatory first Stage A preclaim fidelity gate if mainline advances it

Before any claim-bearing measurement, the owner must:

1. materialize the exact pinned MIR pair and prove MachineVerifier,
   assembler/linker, SysV behavior, unwind/CFI and `llvm-dwarfdump` legality;
2. enumerate the complete tiny native action catalog and compare every point
   against the compatible current configuration union and generic ceiling;
3. verify the target-printer's call-site parameter expression and the exact
   `RAX` unavailability / `RBX` reconstructibility coordinates; and
4. bind code and DWARF bytes, CSR/spill/frame costs, compile CPU/RSS, runtime,
   invalid/unavailable outcomes, and the frozen 30-function natural
   denominator.

Stop the Stage A direction if any planned `RBX` realization is invalid, any
current union point reproduces every coordinate, Plan A becomes currently
expressible, or residual points are full-cost dominated.

## Collision and lane disposition

The direct-latest-collision boundary remains `SEARCH_BOUNDED_OPEN`; no
transport failure is construed as evidence of absence. This closing neither
starts Stage A nor changes shared state. After mainline acceptance, the lane
returns to `IDLE_REUSABLE_AWAITING_MAINLINE`.
