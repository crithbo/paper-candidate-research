# VERILATOR-SEMANTIC-BOUNDED-RECOURSE-MTASK — Stage 0 PRIMARY

## 中文摘要

- 结论：`REVISE_ONCE`，并送独立 confirmation；不授权 Stage A/B。
- 质量档：`TIER_B_Q2_VIABLE`（条件性）。当前 Verilator 的多线程路径将语句 DAG 粗化为 MTask，随后静态分配到线程；官方 internals 明言 runtime graph follower 不受支持，runtime repack 仍是 TODO。Thread-PGO 需要收集 profile 后重新 Verilate，故不表达同一 eval-epoch 的依赖闭包 bundle 重绑定动作。
- 原子修订门：`PINNED_VERILATOR_STATIC_MTASK_ACTION_CATALOG__DEPENDENCY_CLOSED_EPOCH_REPACK_CERTIFICATE`。
- 原因：有同对象、同语义、有限且可证伪的 N2 路线，但尚无 pinned source SHA、完整 native action catalog、两计划合法 witness，或区别于普通在线调度的 target-specific recourse 算法/保证。
- 用户操作：无。当前本地 GitHub TLS 取 HEAD 失败只限制不可变 commit 记录；不构成科学负证据或资源 STOP。

- Lane id: `STAGE0-BATCH-GATE / PRIMARY`
- Assignment id: `STAGE0-P1-20260814-VERILATOR-SEMANTIC-BOUNDED-RECOURSE-MTASK-PRIMARY-V8.7`
- Input freeze: discovery 4/4 matched contract hashes.
- Cross-assignment contamination: none; no later queue material read.
- Decision: `REVISE_ONCE`
- Confidence: `0.76`
- Evidence ceiling: `E1_STATIC_SOURCE_AUDIT__NO_CLAIM_BEARING_EXECUTION`
- Novelty route: `N2`
- Candidate venue family: simulation/EDA systems; realistic Q2 conditional, Q1 only after stronger theory plus broad performance evidence.
- Stage semantics: conditional paper-potential screen; no performance, theorem, or implementation result is asserted.

## Structural paper potential vs current readiness

**Structural potential if successful.** A compiler-emitted, semantics-preserving online repack mechanism is not merely choosing `--threads-max-mtasks`: it changes the admissible runtime action from a single static MTask-to-thread schedule to bounded changes of a dispatch table at quiescent `eval()` epochs. If its bundles are closed under every required predecessor / trigger / act–NBA boundary and its policy has a conditional recourse/load-balance guarantee, it is a target-specific online scheduling algorithm over Verilator's semantic graph, hence credible Q2 N2.

**Current readiness.** The public code, docs, `--threads`, `--threads-dpi`, `--threads-max-mtasks`, `--prof-exec`, and `--prof-pgo` make a finite Stage-A route available. No model was built, no CVA6 run was made, and no gain is inferred. A local `git ls-remote` attempt failed with Windows Schannel `SEC_E_NO_CREDENTIALS`; browser-visible official current source/documents remained readable. The next static packet must record an immutable commit SHA before any claim-bearing work.

## Frozen object and claim

**Exact object.** One fixed legal SystemVerilog design, elaborated under one pinned Verilator commit and a fixed `--threads N`, timing, DPI, trace, and generated-model interface contract. The output is the same scheduling-visible trace: trigger behavior, active/NBA ordering, committed state, and public C++ model interface.

**Candidate action.** At only a completed `eval()` epoch, map a finite collection of pre-emitted dependency-closed MTask bundles to the same `N` workers. A bundle may not cross an unmet dependency, an active/trigger/NBA region boundary, or a coroutine/timing boundary. The action changes neither RTL, event semantics, task bodies, thread count, nor the exposed model API.

**Information and target.** Use only profile observations from completed earlier epochs. The target is exact trace equivalence, an explicit per-epoch reassignment budget, and a conditional stationary-window balance/overhead bound versus the current static union, including dispatch update and synchronization cost.

## Current-upstream reality check

Checked on 2026-08-14 against current official Verilator documentation and current `master` source locators: `docs/internals.rst` (`V3Sched::schedule`, `V3Order::order`, `V3Sched::partition`, multithreaded mode), and source paths `src/V3Sched.cpp`, `src/V3Order.cpp`, `src/V3Partition.cpp` named by that documentation. Exact revision SHA could not be retrieved locally because of the logged Schannel error; this must be frozen in revision, not guessed.

| Native union element | Current semantics | Candidate relationship |
|---|---|---|
| `V3Sched` / `V3Order` | constructs active/NBA-correct statement dependency order at Verilation time | semantic boundary; must remain fixed |
| `V3Partition` / MTask | greedily contracts the DAG, trading synchronization against critical path | fair static constructor/subtractor |
| generated static MTask assignment | each thread executes its MTasks in a static order; a task can only wait for prerequisites | strongest same-object baseline |
| `--threads` / `--threads-max-mtasks` | fixes worker cap and compile-time MTask-count control | finite configuration baseline, not the proposed action |
| `--prof-exec` | records fragmentation for diagnostics | admissible observation source |
| `--prof-pgo` / `profile.vlt` | profile is consumed by a later Verilation to improve static decisions | strong offline/recompile baseline; not per-epoch runtime rebinding |
| `--threads-dpi` | controls DPI thread-safety assumption/serialization | fixed legality condition; cannot be changed by candidate |

The decisive contrary source is unusually clear: official internals say Verilator does **not** support runtime macro-dataflow scheduling and instead statically assigns MTasks to threads; its “Static Scheduling with Runtime Repack” section describes repacking every roughly 10,000 cycles as a possible future modification. This establishes an action gap, but not a result.

Sources: [Verilator internals](https://github.com/verilator/verilator/blob/master/docs/internals.rst), [runtime/Thread-PGO guide](https://verilator.org/guide/latest/simulating.html), [argument reference](https://verilator.org/guide/latest/exe_verilator.html), and [official repository](https://github.com/verilator/verilator).

## Collision and baseline decision

No `DIRECT_FATAL` was found in the bounded official/current search. Generic dynamic DAG scheduling is methodological adjacent: it lacks the frozen Verilator active/NBA/trigger trace contract, static generated-code interface, profile-information restriction, and full code-generation/dispatch cost boundary. Static partitioning, finite MTask-count settings, and Thread-PGO are direct subtractors and must be jointly replayed rather than treated as absence evidence.

| Eight-predicate direct-coverage check | Verdict | Reason |
|---|---|---|
| Same object / protocol | FAIL | generic online schedulers do not implement Verilator scheduling semantics |
| Same carrier | PARTIAL | MTask DAG is shared only by native source |
| Same information | FAIL | offline/dynamic schedulers often have broader observations |
| Epoch dependency-closed rebind action | FAIL | current docs identify it as unsupported/future work |
| Same exact-trace guarantee | FAIL | not shown by generic work |
| Same full-cost boundary | FAIL | no generator/code/RSS/update accounting |
| Same config/version | PARTIAL | native baseline is current, immutable SHA pending |
| Full-depth reproducibility | PARTIAL | current docs/source available; revision must pin SHA |

`SEARCH_BOUNDED_OPEN` remains for broader primary literature. It cannot be converted to a direct collision merely because a generic solver can schedule a DAG.

## Selected mechanism and required repair

Selected mechanism: **semantic-boundary-aware bounded-recourse bundle repacking**. Backup: static Thread-PGO plus a finite `--threads-max-mtasks` grid. The backup wins if an alleged policy only changes bundle weights, count, or static assignment after recompilation.

The single revision proposition is:

> For a pinned current Verilator MTask DAG and fixed legal threaded configuration, there is a finite bundle/action grammar and a target-specific online constructor which, from completed-epoch profiles only, chooses an epoch-bound dependency-closed reassignment while preserving every future native semantic edge and declared full cost; it provides a nontrivial bounded-recourse conditional guarantee beyond static partition/Thread-PGO.

Falsifiers are equally atomic: (i) any two-plan witness changes trigger/NBA trace or crosses a predecessor boundary; (ii) the complete catalog reveals current native runtime repacking; (iii) the method reduces to ready-queue scheduling, load weighting, static PGO, or a generic solver; or (iv) no target-specific state/guarantee survives the full catalog.

Required revision deliverables, all static:

1. Pin an immutable Verilator SHA and catalog default/non-default MTask, PGO, DPI, and threading actions.
2. Define epoch quiescence and bundle closure over predecessor, trigger, act/NBA, timing and DPI constraints.
3. Give one finite native two-plan witness where both dispatch tables are legal, trace-equivalent, and differ from every static/PGO action.
4. Specify a bounded state (frontier, prerequisites, worker loads, recourse tokens) with a target-specific recurrence and honest conditional exact/FPT/competitive guarantee.
5. Freeze a Stage-A fidelity gate: generated dispatch emission, source-level semantic trace equality, static-union replay, and a full-cost ledger.

Failure of this one proposition invokes `BELOW_Q2_STOP__CURRENT_VERILATOR_REBINDING_ABSORPTION_OR_GENERIC_DYNAMIC_SCHEDULER`.

## Fair baseline and full-cost contract

The strongest replayable union is serial evaluation; default threaded static `V3Order`/`V3Partition`; finite legal `--threads-max-mtasks` settings; Thread-PGO using exactly the prior profile history; and `--prof-exec` diagnostic overhead where enabled. All use identical RTL, top, timing/DPI/trace flags, thread cap and visible trace contract.

The Stage-A ledger must include Verilation/constructor CPU and peak RSS, generated C++/object bytes, worker dispatch table bytes and update CPU, synchronization, profile collection, model RSS, wall time, and no-gain/negative designs. An offline omniscient scheduler is only a ceiling, never the deployment comparator.

## Q1/Q2 shape and finite Stage-A killer

The natural carrier is a pinned public CVA6 RTL commit with its documented Verilator route, followed by a second public large RTL carrier. First claim-bearing work must first close fidelity on a two-bundle active/NBA/trigger witness. Then, within a fixed CPU budget, replay the union on a small CVA6 subset and stop the direction if: the two legal plans cannot preserve trace, no bundle action differs from static PGO, update/synchronization dominates, or all candidate points are Pareto-dominated on full cost.

At most a Q2 paper can be claimed from a conditional guarantee plus two diverse public carriers and full ledger. Q1 needs a broader design set, robust theory and a nontrivial performance envelope. This Stage 0 report makes neither empirical assertion.

## Non-relaxable audit and score

| Gate | Status |
|---|---|
| Same object | PASS, subject to SHA pin in revision |
| Latest current collision | PASS with `SEARCH_BOUNDED_OPEN`; no direct coverage found |
| Strong fair baseline | PASS as a frozen union plan |
| Natural carrier | PASS, public CVA6 route named |
| Full cost | PASS as required ledger, unmeasured |
| Reproducibility | REVISE: immutable source pin and witness package missing |
| Evidence/claim honesty | PASS: no invented run/result |

- Academic value: `52/70`
- AI executability bonus: `22/30`
- Total: `74/100`
- AI class: `AI_CORE_CONDITIONAL`, estimated core fraction `0.70`.
- Discovery repair vector: `ATOMIC_ACTION_UNCLEAR`, `EVIDENCE_LOCATOR_OR_VERSION_GAP`; material, but does not change this independent conditional decision.

## Handoff disposition

`REVISE_ONCE` only. Confirmation should test the pin, action catalog, and whether the proposed state/guarantee is genuinely Verilator-specific rather than a generic scheduler. No Stage A/B is authorized.
