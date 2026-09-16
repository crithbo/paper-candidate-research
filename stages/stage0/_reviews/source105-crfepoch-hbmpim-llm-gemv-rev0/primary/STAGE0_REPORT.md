# CRFEPOCH-HBMPIM-LLM-GEMV-REV0 Stage 0 Report

## 中文摘要

- 结论：`STOP`
- 为什么：冻结的 stock GEMV CRF 程序恒为 6 条命令，32-entry 条件不形成优化约束；剩余动作只是对相邻相同程序的 `programCrf`/park/mode 序列做局部 hoist，不能构成非平凡 N2。
- 下一道门：无；主线登记同 ID 的 `BELOW_Q2_STOP`，不得改名复活。
- 是否需要用户操作：否。

- Lane id: `STAGE0_PRIMARY`
- Assignment id: `STAGE0-PRIMARY-20260824-CRFEPOCH-HBMPIM-LLM-GEMV-REV0`
- Input freeze SHA-256: `F671798721A1CE74DA5A03341F6B9E5A4F897C4F30B1097E1076A8069DC1C0EF`
- Cross-assignment contamination declaration: no Source105 chat memory, A3 audit output, group repository, private material, or unregistered cross-topic output was used.
- Decision: `STOP`
- Quality tier: `BELOW_Q2_STOP`
- Confidence: `0.87`
- Evidence ceiling: `PUBLIC_SOURCE_FULLTEXT_STATIC_INSPECTION_AND_Q1_Q2_CALIBRATION__NO_CLAIM_BEARING_EXPERIMENT`
- Novelty route: none survives (`N2` proposed; rejected)
- Candidate Q1 venue family: architecture/compiler systems
- Stage semantics: conditional paper-potential screen; this report does not establish a main result.

## Atomic repair trace P0 shadow, optional

- Mode: `SHADOW`
- P0 effect on decision: `NONE`
- Legacy/unobservable disposition: `NOT_APPLICABLE__NO_REVISE_ONCE_RECOMMENDED`

## Structural paper potential vs current readiness

- Structural paper potential if successful: no credible Q2 paper shape under the frozen action.
- Current evidence-acquisition readiness/risk: public static sources are sufficient for the structural decision; no simulator build or experiment was run.
- Why missing implementation/results/proof/hardware is not the reason: the STOP rests on the action’s lack of nontrivial algorithmic content, not on absent hardware or execution.

## Discovery provenance

- Opportunity origins: `O1 / O6`; Domain tags: `HBM_PIM`, `NDP_COMPILER`, `LLM_INFERENCE`, `COMMAND_TIMING`.
- Paper genealogy: PIMSimulator stock GEMV; UniNDP HPCA 2025; DCC ISCA 2026; PIMCOMP TCAD 2025.
- Discovery claim-pack mode: `OFF`; contribution type: `COMPILER_TOOL`; discovery quality is not inherited.
- Opportunity-family relation audit: same family and exact object preserved.

## Frozen object and claim

The object is the PIMSimulator `dev` HBM2-PIM GEMV command/CRF/PC/mode protocol on public Llama2 MVM shapes. The frozen action is CRF-resident epoch partitioning over same-template GEMVs. The claimed guarantee is identical stock command/PC/mode/result behavior with non-worse full cost.

## Claim-package completeness audit

- Atomic action and mechanism: retaining a programmed GEMV CRF and HAB mode across an equal-template run.
- Information/assumption contract: static template identity and graph order; dynamic values do not decide legality.
- Minimum falsifier: the current command generator shows a six-command GEMV program, eliminating the advertised capacity pressure before any run.
- Boundary/failure region: different template, output dependence, or required change to stock semantics.
- Dependencies and evidence ceiling: public PIMSimulator/DCC and pinned UniNDP only; no implemented or hardware claim.

## Positive opportunity map

- Natural workload: canonical UniNDP Llama2 7B/13B CSVs. They contain repeated operator shapes and the aggregation repeats non-final operators 32/40 times.
- Material qualification: `combine_e2e.py` explicitly assumes no operator fusion and sums per-operator latency. It therefore shows a baseline omission, not a dependency-aware scheduling space.
- Mechanism-specific prediction: avoiding a fixed prologue/epilogue could reduce those transactions, but that is routine scope motion rather than evidence of a paper mechanism.

## Named baselines and fairness contract

Stock PIMSimulator, UniNDP, DCC and a no-reuse schedule were considered. Any future comparison would charge program writes, park/mode transitions, barriers, command/data movement, result reset/readback and compiler time. This fair ledger does not cure the lack of an N2 action.

## Collision analysis

See `CURRENT_COLLISION_LEDGER.md`.

### Eight-predicate direct-coverage audit

No strict `DIRECT_FATAL` was established: DCC and UniNDP do not cover stock PIMSimulator CRF/mode/PC semantics. Their strong subtractive value is retained without overstating direct coverage.

### Seed-distance and method-name deletion test

Removing the “CRF epoch” name leaves: “keep the same fixed program active for the next equal-template call and omit an otherwise repeated prologue/epilogue.” That is a local code-motion optimization, not a distinct compiler algorithm.

## Competing mechanism decision

- Selected mechanism: none accepted.
- Why not routine tuning: `GemvPIMKernel::generateKernel()` emits five operational commands plus EXIT; `programCrf()` writes a maximum of four eight-command bursts. No capacity trade-off, template-selection search, or new guarantee remains.
- Pivot boundary: introducing graph reordering, multi-program caching, a changed ISA, or a broader PIM abstraction changes the frozen action/object and requires a new topic ID.

## Residual paper kernel

`NONE__ROUTINE_STOCK_PROLOGUE_EPILOGUE_HOIST_ONLY`.

## Evidence route

`PERFORMANCE` was proposed, but no claim-bearing probe is justified after the structural N2 failure.

## Performance-optimization admissibility

- Same-function contract: definable.
- Algorithmic delta: no substantive delta beyond local hoisting.
- Full-cost ledger: definable, but no nontrivial mechanism to evaluate.
- Strong-implementation fairness: possible, not sufficient.
- Generality/failure boundary: only equal-template contiguous runs; no credible general theorem or broader family.
- Why not routine tuning: the advertised constraint is inactive and the remaining optimization is peephole scope motion.

## Q1/Q2 paper shape

`PARITY_NOT_PLAUSIBLE`; see `Q1_COMPARATOR_MATRIX.md`. DCC/UniNDP/PIMCOMP calibrate a full compiler contribution with meaningful mapping/scheduling choice, broad evaluation, or reusable abstraction. This candidate has none after the static audit.

## Non-relaxable quality audit

- Same-object: preserved.
- Latest collision: independently rebuilt; no direct fatal asserted.
- Strong fair baselines: named and sufficiently scoped.
- Natural input/evidence: canonical benchmark-only carrier; no deployment extrapolation.
- Full-cost: explicitly bounded.
- Reproducibility: public PIMSimulator/DCC and pinned, clean UniNDP source snapshot.
- Evidence/claim honesty: no performance or hardware result claimed.

## Evidence path and AI completion

- E1/E2 execution-readiness audit: no E2 run; scientific inference from engineering smoke excluded.
- AI executability class: `AI_CORE_CONDITIONAL`.
- Estimated ai_core_fraction: `0.55` if a valid paper kernel existed.
- Human-only items: none decisive; resource availability is not the reason for STOP.

## Fidelity closure plan audit

- Discovery status: `STRUCTURALLY_UNCLOSABLE` for a Q2 contribution, not for stock semantic replay.
- Complete action/native semantics: a finite replay can be defined.
- Comparator/full-cost/small-witness: finite but only validates a routine transformation.
- Stage A preclaim gate: not reached.

## Independent current upstream reality check

- PIMSimulator source checked: `dev` `PIMKernel.cpp` and `PIMCmdGen.h`, 2026-08-24.
- Current stock behavior: CRF is programmed once inside each `executeGemv`; HAB→HAB_PIM records the PC reset; GEMV program is fixed six commands.
- UniNDP current pinned source: no `CRF`, `programCrf`, or `HAB_PIM` token; it models a different instruction/status abstraction.
- DCC current public generator: HBM3-PIM trace commands and barriers, no CRF/program/mode action in the named GEMV generator.
- Residual: protocol-level residual remains but is too routine for N2.

## Stage A highest-risk probe plan

Not applicable. The cheapest discriminating static probe has already killed the direction: the actual CRF command generator removes the claimed 32-entry scheduling constraint.

## Stop conditions

`NO_NONTRIVIAL_N1_N2_N3__FIXED_SIX_COMMAND_CRF_PROGRAM__ROUTINE_TRANSITION_HOIST`.

## Discovery repair vector

- Codes: `OMITTED_CURRENT_SAME_OBJECT`, `ATOMIC_ACTION_UNCLEAR`.
- Materiality: PIMCmdGen’s current fixed six-command construction was sufficient to show that the proposed capacity constraint is inactive.
- Was the missing information available before the frozen cutoff?: yes.
- Does this feedback alter the independent scientific decision?: `NO` (the vector reports the omission; this report’s decision is independently derived).

## Dual-axis score

- Academic value: `28/70`
- AI executability bonus: `18/30`
- Total: `46/100`

## User-action blocker

Not applicable. No claim-bearing observation was obtained and no resource failure occurred.
