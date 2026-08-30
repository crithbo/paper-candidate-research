# Stage 0 Independent Confirmation Review

- Assignment: `STAGE0-C2-20260811-LLVM-RVV-GROUP-MASK-SPILL-PARETODP-CONFIRM-V8.7`
- Topic: `LLVM-RVV-GROUP-MASK-SPILL-PARETODP`
- Role: independent Stage 0 confirmation sentry
- Review date: 2026-08-11
- Decision: **CONFIRM_REVISE_ONCE**
- Conditional quality: **TIER_B_Q2_VIABLE**
- Confidence: **0.93**
- Evidence ceiling: `E0-H_STATIC_CURRENT_SOURCE_AND_FORMAL_GATE_CONFIRMATION__NO_IMPLEMENTATION_OR_RESULT`
- Latest-collision status: `SEARCH_BOUNDED_OPEN`
- PR-head transport status: `TRANSPORT_BOUNDED_OPEN__NO_ABSENCE_INFERENCE`
- Stage A started: `false`
- Stage B started: `false`
- Candidate implementation, experiment, or benchmark run: `false`

## 1. Scope, independence, and frozen packet

This review is independent of the RVV PRIMARY task `019fbc13-54f3-7412-9cdd-abf95493af42`. I read only the project control files and Stage 0 rule, the wave236 RVV Discovery packet, and the frozen RVV PRIMARY packet. I did not execute the proposed revision, implement the candidate, run experiments or benchmarks, inspect another candidate, or start Stage A/B.

The user-frozen controls matched the files at assignment read time:

| Control | Frozen and observed SHA256 | Result |
|---|---|---|
| `registry.yaml` | `98B2193B37CFF842D8DD0B78313EF550326F04A48B1A556E350C5BCDD9362865` | PASS |
| `plan.md` | `55A5AC9503F27FAB0913370892F717137D7EB83B70842D3C246DBBD2C1AB20E9` | PASS |
| `rules/ROLE_STAGE0_REVIEW.md` | `741EC3544797FF8A5BF337E1E3448B5F683823E5229F818F162834400581626E` | PASS |

At final package verification, mainline had changed the shared `registry.yaml` and `plan.md` to `AD4B0542373880B71A3C1AFDCF42B9E18709E09D4680199898846F7D47DAF6C4` and `D306F22D1582CE2FEE3D25ADE4CBA5E3C20E8D1ED52496E7E40B429EAB8DF2FE`, respectively; the role hash remained frozen. I did not reread or adopt the changed control contents. The review uses the initially verified user-frozen contract. This mid-assignment control-plane drift is a provenance fact, not scientific evidence for or against the topic.

The PRIMARY packet passed its canonical 4/4 manifest check exactly:

| File | Frozen SHA256 | Result |
|---|---|---|
| `STAGE0_REPORT.md` | `693FB77E5A3B602B51597FFCF85BBA31F982C932634C1DEF6EDC90BCE9670253` | PASS |
| `Q1_COMPARATOR_MATRIX.md` | `623F6BBE84C20764393D3917E554CB66FA345759DBDE3D07773C311A4EF8FCF5` | PASS |
| `SOURCE_AUDIT.md` | `4227020CA7366DC9CA8A97DBD76E77F1E46F9DA3544EFF560CE5231ED2BCE25C` | PASS |
| `handoff.yaml` | `047C3BA24C709E1F55631F4ECD0B240D5D8B359E83632C536FE966464AD6D89B` | PASS |
| manifest self | `8508AC23B1142DD383BF77D2540524788B056E8235BD28F7067CFE85B0E51771` | PASS |

The scientific source pin is LLVM commit `5BB2565693F062A9E99929DB1814A7A076D4DC76`. The frozen source audit and independent official-source checks agree on the material pipeline facts below.

## 2. Editorial synthesis

The PRIMARY correctly rejects direct PASS but does not establish a scientific STOP. The Discovery witness with one live `VRM8`, one `v0` mask, and one fractional-LMUL temporary does **not** force register pressure: an LMUL=8 group occupies only one of four aligned eight-register groups, while fractional LMUL values use the ordinary single-register `VR` class. The proposed state `(O,M,V,S,q)` is also not yet a sound quotient because it omits value identity and several facts that can change future actions and costs.

Those are real static defects, but both have finite same-object closure routes. A revised legal MIR witness can use enough simultaneously live aligned groups/tuples and exact `v0`/`NoV0` constraints to force a spill choice. A revised abstraction can retain or soundly quotient live-value identity, register-class/alignment/alias facts, mask windows, spill representation and slot identity, AVL/VTYPE facts, and cost frontier. No reviewed source shows that current LLVM already supplies this joint exact/Pareto optimizer, and no formal impossibility was found.

Therefore the correct outcome is `CONFIRM_REVISE_ONCE`: one atomic static certificate must replace the invalid witness and underdefined quotient. Missing implementation, natural positive results, or a completed theorem is not a STOP reason at Stage 0.

## 3. Independent reviewer lenses

### 3.1 Field and contribution lens

The paper-shaped residual is not typed partial spilling by itself and not a generic fixed-register search. It is a target-specific N2: exact/FPT/Pareto planning over RVV aligned register groups, physical-mask windows, whole versus typed spill representations, and VTYPE/VL transitions on a fixed reachable MachineIR trace. Publication potential survives only if the revision exposes nontrivial RVV structure and a formal guarantee beyond caller tuning, sequential pass composition, ordinary CP/ILP, or exhaustive enumeration justified solely by the architectural constant of 32 vector registers.

### 3.2 Domain and current-source lens

The current native action order is material and must be frozen rather than idealized:

| Pipeline/action fact | Confirmation finding | Consequence |
|---|---|---|
| RVV vector registers | There are 32 vector registers; `VRM2/4/8` groups require aligned starts, and `VRM8` has starts `v0m8`, `v8m8`, `v16m8`, `v24m8`. | A single `VRM8` value cannot establish forced pressure. |
| Fractional LMUL | LMUL below one uses the ordinary `VR` class, not a separate fractional physical subregister allocation class. | The fractional temporary does not consume another aligned LMUL=8 group. |
| Mask handling | `VMV0Elimination` creates physical copies to `v0` before coalescing/allocation; `NoV0` variants encode overlap restrictions. | A witness must state physical `v0` liveness and exact overlap restrictions, not merely a symbolic mask bit. |
| Pass order | The current optimized pipeline performs RVV vector allocation and virtual-register rewriting, then `RISCVInsertVSETVLI`, then scalar allocation. | The fair comparator is this complete sequential pipeline and its finite relevant allocator/configuration union. |
| Production spill lowering | The pinned/current production path selects whole-register `VS1R/2/4/8` and `VL1RE8/2RE8/4RE8/8RE8` forms. | Typed partial spill is a direct subtractor/proposed action, not candidate novelty at the pin. |
| VSETVLI handling | `RISCVInsertVSETVLI` performs dataflow intended to minimize required configuration instructions. | A joint optimizer must beat the full existing vset logic, not a naive reset policy. |

Primary official sources independently checked were the [LLVM RVV backend documentation](https://llvm.org/docs/RISCV/RISCVVectorExtension.html), [current LLVM target-machine pass source](https://llvm.org/doxygen/RISCVTargetMachine_8cpp_source.html), [`VMV0Elimination` source](https://www.llvm.org/docs/doxygen/RISCVVMV0Elimination_8cpp_source.html), [`RISCVRegisterInfo` spill/reload source](https://www.llvm.org/docs/doxygen/RISCVRegisterInfo_8cpp_source.html), and the [LLVM typed-spill RFC](https://discourse.llvm.org/t/rfc-riscv-vector-register-spill-optimization-pass/80850).

Direct transport to the live PR head and exact GitHub commit view did not close in this confirmation request. This is recorded as `TRANSPORT_BOUNDED_OPEN`; it is not evidence that the PR or a collision is absent. The frozen commit boundary is nevertheless decidable: the frozen source packet and official production-source path do not contain typed partial spilling, while the RFC/PR action is included in the required strongest comparator as a proposed/direct subtractor. A later PR-status change would require catalog relabeling, not evasion of that comparator.

### 3.3 Methodology and formal lens

The Discovery state `(O,M,V,S,q)` is not sufficient as written:

- `O` cannot be only an occupancy bitmap. Two equal bitmaps may contain live values with different classes, aligned-group choices, aliases, next uses, kills, rematerialization status, or future operand constraints.
- `M` must preserve physical `v0` copies, mask-source liveness, `NoV0` windows, and inline-assembly or fixed-register constraints.
- `V` must preserve every suffix-relevant AVL/VTYPE fact consumed by `RISCVInsertVSETVLI`, not just an informal current vtype label.
- `S` must identify the spilled value, whole/typed representation, legal spill/reload forms, frame/slot consequences, and reload semantics.
- `q` must have a declared additive/full-cost algebra, dominance rule, terminal accounting, and an explicit frontier-size or complexity bound.

A state merge is sound only when every continuation from either representative has a corresponding native-legal continuation with the same declared cost vector and equivalent terminal semantics. Live-value identities may be merged only through a proved trace automorphism or identical future signature; raw occupancy symmetry is insufficient. A cost-preserving labeled bisimulation, an exact sufficient-statistic proof, or a formulation-neutral equivalent certificate is acceptable.

The complexity claim must also be honest. Enumerating a finite `2^32` occupancy space can produce an exact solver for a fixed ISA, but the architectural constant alone is neither FPT evidence nor a nontrivial N2. A paper-grade route must state an input family and explicit parameter—such as maximum simultaneously distinguishable live groups/future signatures or an interference/event-graph width—then prove the state/frontier bound, optimality, approximation, or another target-specific property. A tiny exhaustive oracle remains required for validation but is not itself the contribution.

### 3.4 Perspective and evidence-route lens

The finite Stage A route is clear once the static certificate exists:

1. prove a small legal forced-pressure witness at the fixed MachineIR/liveness/ABI/VLEN boundary;
2. exhaustively enumerate tiny traces under the same action grammar and compare exact optimum/frontier with the quotient DP;
3. test action-catalog coverage against the complete pinned native pipeline and legal typed-spill subtractor;
4. use reference execution or another semantic checker for graph/trace equality;
5. report whole-function/full-cost results, including spill bytes/traffic, vset instructions, code size, compile/planning cost, and any frame effects;
6. apply the preclaim fidelity gate before any claim-bearing observation and then use natural RVV routes plus a strongest-union killer comparison.

No step requires a Stage 0 implementation or positive result. The witness can prove action divergence only; it cannot establish prevalence or natural benefit.

### 3.5 Devil's-advocate lens

The strongest remaining attacks are:

- a corrected trace still has an unmodeled aligned group or `v0`-legal allocation, so no spill is forced;
- typed spilling changes inline-assembly or other semantics, or a required vset eliminates the local saving;
- two merged states have different later register, mask, spill/reload, or VTYPE/VL actions or costs;
- the algorithm reduces to generic enumeration/CP over 32 registers with RVV names;
- the complete sequential LLVM plus typed-spill union matches the proposed optimum;
- local traffic savings disappear under whole-function/full-cost accounting.

These attacks are precise revision falsifiers and later killer tests. None is currently a demonstrated direct absorption or formal impossibility.

## 4. Mechanical audit of the original witness

The original three-object witness fails its claimed forced-pressure role.

1. `VRM8` provides four legal aligned groups over 32 registers. With one live group, at least three aligned groups remain before considering exact reservations.
2. A live `v0` mask forbids overlapping uses under the applicable `NoV0` rules, but a non-`v0` LMUL=8 group still leaves multiple legal groups.
3. A fractional-LMUL temporary resides in `VR`, so it can use a remaining individual register and does not by itself consume an aligned LMUL=8 block.
4. Consequently there is no mechanical necessity to choose whole spill, typed spill, or an extra VTYPE/VL transition on the stated trace.

A finite correction is plausible but must be delivered, not assumed. For example, the revision may construct sufficient simultaneously live aligned groups/tuples to occupy the non-`v0` blocks and then introduce another group demand in a physical-mask/`NoV0` window, with exact operand classes, kills, next uses, and VLEN/VTYPE facts. The particular construction must be accepted by the pinned MachineIR legality rules and must show that every unmodeled escape is closed. Confirmation does not certify such a replacement witness in advance.

## 5. Current action catalog and comparator boundary

The revised certificate must distinguish landed actions from proposed actions and include the complete strongest union:

- the pinned production RVV allocator choice/order, virtual-register rewriting, `VMV0Elimination`, `RISCVInsertVSETVLI`, scalar allocation, pseudo expansion, prologue/epilogue and MC emission where they affect legality or cost;
- current whole-register spill/reload forms and every relevant class/alignment/alias/`v0` restriction;
- the legal typed partial spill/reload action with its eligibility guards, inline-assembly boundary, and required VTYPE/VL transitions, even though it is not landed at the frozen pin;
- finite relevant existing allocator and backend controls;
- an exact same-grammar exhaustive or CP oracle on tiny traces;
- an integrated generic method subtractor, such as Unison or a technically equivalent register-allocation/scheduling formulation, with the same semantic and cost boundary.

This catalog prevents the candidate from claiming the RFC's local spill action as novelty. It also prevents a weak baseline that omits current vset minimization or downstream frame/code effects. Conversely, the checked current sources expose sequential component passes, not the proposed sound joint exact/Pareto frontier; that is evidence of a residual research question, not a global absence theorem.

## 6. Frozen single revision proposition

The only admissible scientific revision is frozen as:

`SOUND_RVV_TRACE_ACTION_AND_QUOTIENT_CERTIFICATE`

It must deliver one coherent static proposition containing all of the following:

1. **Same object.** A pinned reachable LLVM RVV MachineIR trace with fixed liveness, ABI, target features, VLEN assumptions, output semantics, and VTYPE/VL boundary.
2. **Legal forced-pressure witness.** Enough simultaneously live aligned groups/tuples and explicit physical-mask/`NoV0` conditions to force the relevant choice, with all classes, aliases, kills, uses, and legal continuations enumerated.
3. **Complete action catalog.** Landed current actions and finite controls separated from proposed typed-spill actions, with exact eligibility and semantic guards.
4. **Complete formal model.** State, transitions, base/terminal conditions, cost vector, dominance/Pareto rules, and terminal/full-cost accounting.
5. **Sound state equivalence.** Complete-future-action and declared-cost preservation, including value identity/future signatures, alignment, `v0` windows, spill identity/representation, and AVL/VTYPE facts.
6. **Nontrivial N2 and honest complexity.** A target-specific exact/FPT/approximation/structural guarantee on an explicit input family and parameter; neither generic solver invocation nor constant-ISA enumeration alone qualifies.
7. **Comparator and fidelity closure.** Tiny exact oracle equivalence, complete current-union coverage, semantic checking, whole-function/full-cost accounting, and natural RVV routes.

The word “quotient” is not mandatory: another formalism may pass if it proves the same complete future-action/cost preservation and nontrivial target-specific guarantee. This is one atomic revision, not permission to perform serial witness and model revisions.

## 7. Decision and mechanical routing

**Decision: `CONFIRM_REVISE_ONCE`.**

Direct PASS is unavailable because the existing witness does not force pressure and the existing quotient/complexity statement is unsound as written. Scientific STOP is also unavailable: no current-union direct absorption, same-object impossibility, or formal impossibility of the refined proposition was established, and a finite static closure route exists.

If the single revision cannot produce a legal forced-pressure witness, if any merged states admit different future legal actions or declared costs, or if the only surviving algorithm is generic fixed-register enumeration/CP with RVV labels, the mechanical terminal outcome is:

`BELOW_Q2_STOP__INVALID_PRESSURE_WITNESS_OR_GENERIC_FIXED_REGISTER_ENUMERATION`

Failure to implement the method or obtain natural positive results is not that sentinel. Scientific revision consumed by this confirmation: `false`. Mainline alone may authorize and register the single revision. Lane state after handoff: `IDLE_REUSABLE_AWAITING_MAINLINE`.
