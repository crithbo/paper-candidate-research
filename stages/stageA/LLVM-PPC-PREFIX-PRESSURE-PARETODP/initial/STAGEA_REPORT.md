# LLVM-PPC-PREFIX-PRESSURE-PARETODP Stage A Report

- Lane id: `CANDIDATE_EXECUTION_LANE_2`
- Assignment id: `STAGEA-L2-20260811-LLVM-PPC-PREFIX-PRESSURE-PARETODP-INITIAL-V8.7`
- Decision: `BLOCKED_USER_ACTION_REQUIRED`
- Quality tier: `TIER_B_Q2_VIABLE` carried from Stage0, not rescored
- Evidence ceiling: `RESOURCE_FAILURE_ONLY__NO_SCIENTIFIC_INFERENCE`
- Novelty route: `N2`
- Stage semantics: StageA risk pilot; no scientific run began
- Cross-assignment contamination: none

## Pre-claim contract fidelity gate

- Gate status: `FAIL_CLOSED`
- Frozen actions: exact local/hidden non-GOT direct `PLDpc` versus `PADDI+LD`,
  complete native RA/MC/link actions and PPC-TPD transition/merge actions
- Comparator: exact current LLVM/lld form selection, greedy/PBQP RA,
  coalescing/spills/frame, default-on PPC pre-emit/late peepholes, MC/relaxation
  and the finite legal configuration grid
- Native parity: not executable; required LLVM pin is unavailable
- Metric denominator: frozen from model/optimizer through compile, link,
  verification and runtime, including CPU/RSS/bytes/spills/relocs/static uops
- Small witness: specified statically upstream but not compiled or verified here
- Proxy/control output: none
- Claim-bearing run started only after PASS: `false`; no such run started

## Frozen contract and highest-risk premise

The same object is Power10 ppc64le Linux ELFv2, medium code model, fixed pre-form
MachineIR and non-preemptible `dso_local`/hidden symbol semantics. The first risk
is whether exact current LLVM accepts and preserves the declared non-GOT direct
PCREL34 loaded-value witness and its `PADDI+LD` materialized-address counterpart,
while exposing the complete same-information action union.

That premise cannot be probed without LLVM commit
`f127b4c19c63b0492fb924934e37e032c17ea35b` built with PowerPC, MIR,
MachineVerifier, MC object tools and lld. None is present.

## Minimal mechanism and strongest baselines

The frozen candidate remains PPC-TPD: an exact bounded-interface Pareto recurrence
over value kind, binding/typed relocation/link labels, PPC register roles,
liveness, spills/frame/unwind and declared costs. It may return a certified
`INTERFACE_CAP_EXCEEDED`; it may not silently become a heuristic.

The strongest baseline is the full current LLVM/lld composition plus all legal
finite configuration cells. Form-fixed/current-RA and form-aware/fixed-RA are
required ablations. Generic CP/ILP/Unison and GCC/binutils are subtractors, not
same-object replacements.

## Probe result and directional increment

No probe result exists and no direction can be inferred. There is no measured
headroom, mechanism-specific action, compiler output, natural occurrence, Pareto
point or full-cost effect. A positive future StageA outcome would be capped at
`PRELIMINARY_SUPPORT/NOT_FALSIFIED` and still require an independent gate.

## AI execution ledger

- AI executability class: `RESOURCE_BLOCKED`
- Measured ai_core_fraction: not measurable before the exact toolchain exists
- Completed AI work: frozen-input validation, contract/fidelity registration,
  tool inventory and reproducible blocker package
- Human/mainline action: provide a portable exact build or explicitly authorize
  an isolated build with frozen resource limits

## Literature collision and Q1/Q2 status

Latest collision remains `SEARCH_BOUNDED_OPEN` at the Stage0 source boundary.
No current-source absence claim was added. Calibration is
`PARITY_CONDITIONAL_WITH_EXECUTABLE_GAP`; the conditional Tier-B assessment is
carried unchanged.

## Control-drift handling

The user-frozen plan and registry hashes matched at assignment entry. A terminal
check observed later mainline versions (`plan.md` `38BBCA80…88F6`,
`registry.yaml` `DDDA54F1…6761`). Per the assignment-freeze rule, this package
retains its entry contract, imports no later shared facts and records the drift
only for audit. This lane did not modify any shared control.

## Non-relaxable quality audit

- Same object: frozen, but executable fidelity not established
- Latest collision: Stage0 bounded-open; no StageA update
- Strong fair baselines: fully named, not run
- Natural input/evidence: not run
- Full cost: dimensions frozen, no samples
- Reproducibility: blocked by exact toolchain
- Evidence/claim honesty: pass; resource absence is not scientific evidence

## Supported and unsupported claims

Supported: the frozen inputs are intact, the exact required toolchain is absent,
and the StageA gate was enforced before scientific execution.

Unsupported: witness legality, native-union action gap, quotient correctness,
natural frequency, performance, size, compilation cost, full-cost Pareto residual,
PASS, STOP or reserve.

## Mandatory user gate before Stage B

- Independent StageA gate decision: not applicable while blocked
- User-facing packet: `USER_REVIEW_PACKET.md`
- `pending_user_stageb_review`: `false`
- StageB approval: `null`
- StageB authorized: `false`

## User-action blocker

- Claim-bearing observation obtained before failure: no
- Scientific revision consumed in StageA: no
- Immutable failure directory: this `initial` directory after handoff
- Resume directory: mainline must assign a new directory; never overwrite initial
- Blocker packet: `USER_BLOCKER_PACKET.md`
