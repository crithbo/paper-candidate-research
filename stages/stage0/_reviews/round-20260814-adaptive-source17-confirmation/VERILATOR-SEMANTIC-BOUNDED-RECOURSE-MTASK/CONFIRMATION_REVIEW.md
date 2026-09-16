# VERILATOR-SEMANTIC-BOUNDED-RECOURSE-MTASK — Independent Stage 0 confirmation

## 冻结范围与独立性

- Assignment: `STAGE0-C2-20260814-VERILATOR-SEMANTIC-BOUNDED-RECOURSE-MTASK-CONFIRM-V8.7`.
- Role: independent confirmation sentry; this review did not author the PRIMARY packet.
- PRIMARY integrity: the report, Q1 matrix, source audit, and handoff match the four supplied SHA-256 values; the supplied primary manifest is consistent (`4/4`).
- Review boundary: static source/document examination only.  No revision, implementation, build, simulation, benchmark, Stage A, or Stage B was performed.

## 裁决

**`CONFIRM_REVISE_ONCE`**

The sole gate is a legitimate, finite Stage-0 revision gate:

`PINNED_VERILATOR_STATIC_MTASK_ACTION_CATALOG__DEPENDENCY_CLOSED_EPOCH_REPACK_CERTIFICATE`.

Current official Verilator material supports the residual, but not the candidate certificate.  It documents static MTask-to-thread assignment, with prerequisite waits as the sole runtime behavior; it separately lists both a runtime graph follower and static scheduling with runtime repack as future improvements.  Thread-PGO collects a profile from one executable and applies it only in a later Verilation.  Thus the current native union does not already express the frozen same-epoch reassignment action.

This is neither a PASS nor a STOP.  The actual immutable commit/blob pin, full default/non-default action catalog, two complete same-design traces, and a Verilator-specific bounded-recourse recurrence/guarantee are all still absent.  Missing them is an unclosed static certificate, not evidence that an implementation or positive measurement is required.  The one permitted revision may attempt exactly this gate and nothing broader.

## 独立攻击结果

### 1. Current MTask/Thread-PGO union: action gap confirmed

The official internals say `V3Sched` performs static (Verilation-time) scheduling, `V3Order` produces ordered evaluation functions, and the multithread implementation statically assigns macro-tasks to threads in a static order.  A macro-task may block on prerequisite completion, but the documentation expressly says Verilator does not support a runtime graph follower.  It describes runtime repacking roughly every 10,000 cycles as a possible modification, not an available non-default action.

The current option reference makes `--threads-max-mtasks` a Verilation-time MTask partition count; `--threads-dpi` changes the thread-safety/serialization legality premise and must remain fixed.  The Thread-PGO guide further requires running an executable to produce `profile.vlt` and rerunning Verilator to consume it.  This is a strong static/recompile comparator, not an in-process epoch-repack action.

Therefore a finite union containing serial mode, static MTask assignment, legal `--threads-max-mtasks` configurations, `--prof-exec`, and same-history Thread-PGO is necessary and fair, but it does not directly absorb a legal, per-completed-epoch dispatch-table reassignment.

### 2. Immutable pin is required, but transport failure is not absence

The reviewed official GitHub source showed only a short current-master locator during this audit; it is insufficient as an immutable source pin.  The PRIMARY's prior `git ls-remote` transport failure cannot be used as absence evidence.  Revision must record one full upstream commit SHA plus immutable blob locators for `docs/internals.rst`, the threading/MTask generator paths, and the flag paths.  This is a finite provenance/fidelity requirement, not a scientific STOP and not permission to use an unpinned moving `master` as evidence.

### 3. Two-plan witness must preserve the real semantic trace

The static source describes distinct ico/act/nba loops, latching act triggers for NBA processing; timing-capable designs additionally use coroutine/trigger procedures.  A lawful witness must consequently state both complete dispatch plans for one fixed elaborated SV design and show, per epoch, identical trigger values, active-region behavior, NBA commit order, committed state, timing/coroutine state, DPI serialization conditions, and public generated-model interface.

“Dependency-closed bundle” cannot merely mean a DAG cut with no syntactic incoming edge.  It must include the generated prerequisite counters and every cross-bundle trigger/act/NBA/timing obligation; it may only switch at a completed quiescent `eval()` epoch.  No such two-plan trace currently exists in the packet, so no semantic action divergence is yet established.

### 4. Bounded recourse must be Verilator-specific, not a generic scheduler

The only admissible revision construction is an offline-emitted finite bundle grammar with fixed thread count, completed-epoch observations, quiescent reassignment, predecessor/region/timing closure, explicit reassignment budget, and a recurrence whose state preserves all later native legal actions and declared costs.  A ready-queue controller, generic dynamic-DAG scheduler, arbitrary repartitioner, generic ILP, Thread-PGO rerun, or weight-only `--threads-max-mtasks` grid fails the gate.

A conditional exact/FPT/competitive claim is acceptable only if it has a finite state alphabet, action/path correspondence, explicit parameters, dispatch-update/synchronization/full-cost accounting, and a stated no-gain boundary.  None is supplied now; the revision should either close this target-specific certificate or invoke the pre-registered sentinel.

### 5. Collision and paper-shape disposition

Current static MTask construction and Thread-PGO are strong direct subtractors; generic macro-dataflow scheduling is methodological adjacent because it lacks the exact Verilator scheduling/trace/interface and full-code-generation cost contract.  The bounded literature search supplied no full eight-predicate direct collision.  This remains `SEARCH_BOUNDED_OPEN`, not an absence claim.

If the gate closes, the residual is a plausible `N2` compiler/simulator scheduling paper with `TIER_B_Q2_VIABLE` conditional potential.  It must be presented as a semantics-preserving, bounded-recourse algorithm—not a parameter-tuning study—and Stage A must replay the full static union on natural RTL carriers with generator, dispatch-update, synchronization, RSS, code-size, and wall-time costs.

## Claim matrix

| Claim | Confirmation status | Reason |
|---|---|---|
| Current multithread execution is static assignment plus prerequisite waits | `CONFIRMED` | Official internals explicitly state the static approach and no runtime graph follower. |
| Runtime repack is already an available current native action | `REJECTED` | Official internals list it as a possible future modification. |
| Thread-PGO is an in-process per-epoch comparator | `REJECTED` | Official guide requires a later Verilation from `profile.vlt`. |
| Same-design two-plan exact-trace witness is already established | `NOT_YET_PROVIDED` | No complete trigger/act/NBA/timing/DPI/interface trace pair is frozen. |
| Bounded-recourse guarantee is non-generic and complete | `NOT_YET_PROVIDED` | No finite state/action bijection, recurrence, parameters, or no-gain boundary exists yet. |
| Gate is finite and permissible as the single scientific revision | `CONFIRMED` | It fixes source/action semantics rather than changing the SV object, interface, or desired trace. |
| Direct current-union/literature absorption | `NOT_ESTABLISHED__SEARCH_BOUNDED_OPEN` | Subtractors are strong but do not cover the candidate's fully specified action/guarantee. |

## Source basis and evidence ceiling

- Verilator, [internals](https://github.com/verilator/verilator/blob/master/docs/internals.rst): static `V3Sched`/`V3Order` scheduling; act/NBA and timing constraints; static MTask assignment; unsupported runtime graph follower; runtime-repack TODO.
- Verilator, [argument reference](https://verilator.org/guide/latest/exe_verilator.html): `--threads`, `--threads-dpi`, and `--threads-max-mtasks` semantics.
- Verilator, [simulation guide](https://verilator.org/guide/latest/simulating.html): Thread-PGO profile collection followed by a later Verilation.

Evidence ceiling remains `E1_STATIC_SOURCE_AUDIT__NO_CLAIM_BEARING_EXECUTION`.  No performance, theorem, trace-equivalence result, or natural-design result is asserted.

## Routing

- Decision: `CONFIRM_REVISE_ONCE`.
- Quality ceiling pending gate: `TIER_B_Q2_VIABLE` conditional only.
- Scientific revision: `0/1` consumed at this confirmation point; the next owner may perform only the named gate-bearing revision.
- Stage A/B: `false`.
- Stage-A preclaim (only if a later revision closes): immutable pin/catalogue; generated dispatch emission; complete same-trace witness; static-union parity; full-cost ledger; natural RTL carriers and mechanism-specific killer.
- Lane state: `IDLE_REUSABLE_AWAITING_MAINLINE`.
