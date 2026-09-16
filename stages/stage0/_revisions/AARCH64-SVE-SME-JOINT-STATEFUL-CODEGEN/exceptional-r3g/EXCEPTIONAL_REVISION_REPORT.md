# Exceptional Static Revision R3G

## Assignment and authority

- Assignment: `STAGE0-P1-20260811-AARCH64-SVE-SME-JOINT-STATEFUL-CODEGEN-EXCEPTIONAL-STATIC-R3G`
- Authorization: `POLICY-HOLD-DISPOSITION-20260811-R3G`
- Scope: one user-authorized, static-only exceptional revision. No source download, build, implementation, experiment, benchmark, generic solver, Stage A, or Stage B was performed.
- Atomic gate: `COMPLETE_PREDECESSOR_LAZY_DIAMOND__UNION_EXTERNAL_ACTION_DIVERGENCE__SAP_FDP_CERTIFICATE`.
- Scientific outcome: **gate not closed**.
- Recommendation to mainline only: **`HUMAN_RESEARCH_RESERVE__USER_DIRECTED_POLICY_HOLD__NO_SCIENTIFIC_STOP`**.

This recommendation uses the assignment's explicit user-directed fallback. It is neither a scientific STOP nor a claim that the candidate has passed Stage 0. Mainline alone controls registry/state changes.

## Frozen object

The fixed object remains a current-LLVM AArch64 MachineIR region with unchanged `aarch64_pstate_sm_*` and ZA attributes, fixed AAPCS64 N/S/SC plus ZA interface, fixed `+sve/+sme` target and ABI, and stock toolchain semantics. The candidate may select only existing native actions. It may not change interface, ownership class, function/call-site attributes, VL/SVL rules, ABI, reader/runtime, or target features.

## Complete diamond state audit

The prior certificate proposed a streaming-compatible/shared-`inout ZA` caller with a normal/private-ZA call on one arm and a ZA use on the other. The following table is the necessary state ledger. `D` denotes dormant (`LOCAL_SAVED`) and `A` active; `blk` is the same TPIDR2 block/save-buffer obligation throughout its lifetime.

| Path point | Action A: active-join composition | Attempted predecessor-lazy action B | Required invariant |
|---|---|---|---|
| Entry | `SM=SC`, ZA=`A`, TPIDR2=null, no pending buffer; live typed Z/P roles are represented virtually | identical | same input interface and typed liveness |
| Call arm before marked call | `A -> D`; allocate/setup `blk`, TPIDR2=`&blk`; fixed SC-to-N boundary and whole Z/P spill/reload where mandated | same | both must execute the fixed boundary; no typed Z/P crosses a VL-changing transition in a register |
| Call normal return | call either preserves dormant state with the same `blk`, or commits it; any committed/off result must be repaired before a shared-ZA return | same obligation | AAPCS64 normal-return/lazy-save obligations |
| ZA-use arm | stays `A`, executes the fixed ZA operation | must be `A` to execute the operation | a dormant ZA cannot serve the use without activation/restore |
| Incoming edge to join | Action A can make both edges `A` by restoring/abandoning/repairing on the call arm | the proposed B leaves call arm `D` but ZA-use arm `A` | both incoming edges must agree on an ABI-legal ZA/TPIDR2/save-buffer state at the join |
| Join/exit | `A`, TPIDR2=null, shared-`inout ZA` return obligations retained | unspecified in the revision-1 proposal | full same-interface exit state and all live typed roles must agree |

The B trace as proposed (“restore only on the ZA-using arm”) is therefore incomplete. It has two possible repairs, neither supplied as a complete native witness:

1. save again on the ZA-use arm (`A -> D`) and restore/activate after the join; or
2. restore/activate on the call arm before the join.

Both repairs add native transitions, TPIDR2/save-buffer obligations, and typed Z/P/frame interaction that must be included in a full-cost comparison. The prior trace cannot omit them. Without them it does not establish a valid trace-to-trace divergence under one fixed ABI.

## Current-union comparison

The frozen current LLVM action union contains attribute/call lowering, SM transition lowering, `MachineSMEABI`, `SMEPeepholeOpt`, ordinary vector allocation/spill/frame lowering, post-RA scheduling and stock assembly/linking. `MachineSMEABI` is CFG-aware: it collects required states, assigns a ZA state to each edge bundle, falls back to `ACTIVE` for conflicting desired incoming states, and inserts native state changes subject to call boundaries and physical X0/NZCV liveness.

This union does not by itself prove a global Pareto optimum. But the sole proposed divergence is not sufficient to establish an action outside it. The revision does not enumerate a repaired B action plan, identify its edge-bundle assignment, or show a cost vector in which it is non-dominated by the current composition. A policy-level observation that a conflict falls back to `ACTIVE` is not a comparator-separating witness.

## SAP-FDP certificate audit

The candidate state sketch was:

`(port, SM class/knownness, ZA state, TPIDR2 obligation, ZT0 state, mode class, typed Z/P live-role map, whole-spill-slot map, X0/NZCV, frame flag, exception obligation, cost)`.

It is a reasonable research direction, but this exceptional revision does not close its claimed exact/FPT certificate. Specifically:

- no finite canonical domain is given for typed Z/P future-use signatures across group/subregister, tied operand, spill slot, call-clobber, VL/SVL, exception and frame effects;
- no complete action-to-state / state-to-action mapping is supplied for both repaired diamond paths;
- the claimed `f(k,t,p)` is unspecified, so the stated complexity is a template rather than an attackable FPT bound; and
- no finite Pareto representation or explicit degeneration to the complete current union is shown.

Replacing these with a generic DP, CP, ILP, register permutation, or identity enumeration is forbidden and would not close the gate.

## Evidence ceiling and non-scientific disposition

The current-source observation remains an observation pin rather than an immutable LLVM commit/file hash. This is a finite fidelity limitation, not a resource or absence inference. The decisive failure here is scientific-certificate incompleteness: the native witness and future-preserving equivalence are not yet defined, so an independent closing pass would be unwarranted.

The incomplete certificate does **not** prove that every same-interface target-specific algorithm is absorbed, nor that the frozen research object is impossible. As policy expressly directs for this case, the correct result is a reversible user-directed reserve/policy hold recommendation rather than a fabricated second ordinary revision or a scientific STOP.

## If the user later reopens

Any new authorization must name a new atomic gate and write directory. The minimal reopening package must contain:

1. two fully enumerated native traces with equal entry, all branch-edge, join, and exit state over SM/ZA/TPIDR2/save-buffer/Z-P/frame/exception obligations;
2. an edge-bundle action table proving the candidate action is not emitted or certified by the current union;
3. a comparator-separating full-cost vector with all repair transitions charged; and
4. a finite, explicit state alphabet, action/path bijection, and exact/FPT/certified-frontier bound.

No Stage A/B route is authorized by this report.

