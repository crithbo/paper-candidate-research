# LLVM-RVV-GROUP-MASK-SPILL-PARETODP Stage 0 Report

- Lane id: `STAGE0-BATCH-GATE / PRIMARY`
- Assignment id: `STAGE0-P1-20260811-LLVM-RVV-GROUP-MASK-SPILL-PARETODP-PRIMARY-V8.7`
- Input freeze SHA-256: `TOPIC_BRIEF.md=A685791F469B3687CCA828568369A3675FBE4734034BC6A45909188C464C7420`; `SOURCE_COLLISION_MATRIX.md=68D3EEEB1BA3D8A64845E50DBD35A6D8546B6149C90ED3DD60EDD45A29933F53`; `CANDIDATE_GRADE_DEEP_REVIEWS.md=0584B294DFD35CB0AEB9598C85A07846B36973773C97DAB9BE94DB23532213FD`; `handoff.yaml=A5E63B1232A46F3645B4AF8F31189D2627FC2B5336E4B17AD52076B9BD9B0EEB`; Discovery manifest self `8B8267B0AE29549CA49055E985920CFB84BE9C534AFA9DE104BD019F02B399A9` (8/8 independently verified).
- Frozen controls: `registry.yaml=88B1D221E35BCAEE7A0BC46997235F747D48F87A0FB151A633F4986E836BFCE2`; `plan.md=88551293C686C9245F352CDD1BA9C2CB1B5899734F6DA052350F8C23F7891C57`.
- Shared-control drift note: both hashes matched at assignment initialization. The final read-only check observed `registry.yaml=18A88A189133258A0B07B926B4074CDBA2C2FA792C4F19E045400912518F6FB6` and `plan.md=9344C0D044110C7807EB702A90A2CEEDF61B2482CCE490FEDD1BA96FD36D1000`, with 2026-08-11 06:20 local modification times. This lane made no shared-control write; the scientific decision remains bound to the frozen start hashes and mainline should reconcile the concurrent update mechanically.
- Cross-assignment contamination declaration: no score, PASS, source conclusion, or evidence from an earlier candidate was inherited.
- Decision: `REVISE_ONCE`
- Quality tier: `TIER_B_Q2_VIABLE` conditional on the single atomic revision below.
- Confirmation status: `PENDING_CONFIRMATION`; this PRIMARY does not change registry state.
- Confidence: `0.88`
- Evidence ceiling: current-source and static-design review; no candidate implementation, benchmark, natural result, theorem proof, or hardware result was produced or required.
- Novelty route: `N2`
- Candidate Q1/Q2 venue family: compiler backends/code generation and optimization (`ACM TACO/TOPLAS`, or a comparable compiler venue); present shape is Q2-viable, not yet Q1-calibrated.
- Stage semantics: conditional paper-potential screen; this report does not establish the main claim.

## Canonical decision

The direction is not structurally absorbed by current LLVM, the open partial-spill work, GCC dynamic LMUL, or the bounded direct-paper search. If a sound, RVV-specific quotient-state exact/Pareto algorithm exists, it can form a nontrivial target-specific N2 paper.

The submitted formulation nevertheless does not yet define that algorithm soundly. Its three-object witness (`one VRM8 live group + v0 mask window + one fractional temporary`) does not force a spill or an allocation divergence: current `VRM8` has four starts (`v8`, `v16`, `v24`, `v0` in allocation order), so one group leaves three complete eight-register regions; a fractional-LMUL temporary uses the ordinary one-register `VR` class and also has ample legal placements. Allocating the group at `v0m8` is incompatible with a simultaneous v0 mask window rather than a legal competing realization. Additional live occupancy and exact operand/NoV0 constraints are required.

The proposed state `(O,M,V,S,q)` and the bound `O(n * 2^32_restricted(w) * H * F * Q)` are also not yet a theorem-grade quotient or meaningful FPT result. A 32-bit occupancy bitmap is a fixed-ISA constant; unless `S` preserves value identity, live endpoints, legal class/tuple alignment, rematerialization, mask-copy timing, spill-slot/frame consequences and future transition costs, merging equal bitmaps can merge states with different legal futures. The single revision must repair this exact structural gap, not obtain positive performance.

## Single atomic revision gate

- Gate id: `SOUND_RVV_TRACE_ACTION_AND_QUOTIENT_CERTIFICATE`
- Single proposition: under one pinned current LLVM RVV MachineIR/ABI/VLEN/target contract, a finite action catalog and a future-action-and-cost-preserving equivalence define an exact Pareto DP whose target-specific state is strictly more informative than scalar pressure yet strictly smaller/structured beyond unlabelled fixed-32-register brute force, and a fully legal pressure witness makes the complete current sequential pipeline and the joint algorithm expose different nondominated actions.
- Required static closure:
  1. freeze one legal trace with enough simultaneously live aligned groups/tuples to make the v0 window and fractional temporary create an unavoidable choice;
  2. distinguish production actions from proposed-but-legal actions: LLVM current whole-register spills are native; typed partial spills are represented by open PR `#105661`, not current production;
  3. give complete state fields, transition predicates, base/terminal conditions, cost additivity, and a future-action/cost bisimulation or equivalent sufficiency argument;
  4. state a correct complexity result—either an explicit fixed-ISA exact bound or a genuine parameterized bound in declared parameters—without presenting `2^32` as an unexplained FPT contribution;
  5. map every candidate action to the complete current-LLVM comparator, current+typed-spill sequential comparator, and small exact solver/oracle.
- Falsifier: no legal forced-pressure witness; any pair of merged states with different legal suffixes or costs; typed spill changes semantics/inline-asm contract; or the only remaining method is generic fixed-register enumeration/CP with target labels.
- Revision failure sentinel: `BELOW_Q2_STOP__INVALID_PRESSURE_WITNESS_OR_GENERIC_FIXED_REGISTER_ENUMERATION`
- Scope: exact object, workload class, objective, and main problem are unchanged. This is one atomic scientific revision, not an implementation or Stage A result request.

## Structural paper potential vs current readiness

- Structural paper potential if successful: `TIER_B_Q2_VIABLE`. A sound exact/Pareto optimizer that jointly accounts for RVV aligned group allocation, v0 exclusivity, spill representation, and future vset transitions would be a recognizable target-specific compiler-algorithm contribution beyond ordinary flag tuning.
- Current evidence-acquisition readiness/risk: `MEDIUM_LOW`. LLVM source, tests, assembler/disassembler and an exact small-trace oracle are public and finite, but the submitted witness and state theorem need repair before claim-bearing work.
- Why missing implementation/results/proof/hardware is not structurally fatal: the first decisive claims are static legality, state sufficiency, and action divergence. They can be falsified on CPU using MIR and finite enumeration. Hardware only raises the eventual runtime evidence ceiling.

## Discovery provenance

- Opportunity origin: boundary contradiction between vector-first register allocation and later `RISCVInsertVSETVLI`, plus the current whole-register/typed-partial spill tradeoff.
- Domain tags: compiler backend, RISC-V Vector, register allocation, spill lowering, exact/Pareto optimization.
- Paper genealogy: general exact integrated register allocation/scheduling (Unison) → RVV current vector-first RA/vset pipeline → RVV partial-spill RFC/PR → proposed target-specific joint quotient DP.
- Discovery method revision: no Discovery score or recommendation was inherited.
- Backtest reference and status: not candidate evidence.

## Frozen object and claim

The object is a bounded, acyclic, post-ISel LLVM RVV MachineIR trace with fixed instruction/operand semantics, liveness, target CPU/features, ABI, VLEN contract, vtype/AVL requirements, exception behavior and source-visible result. The output is a native-legal allocation/spill/vset realization accepted by the unchanged downstream pseudo expansion, PEI, MC/assembler and execution semantics.

Allowed candidate decisions are physical aligned `VR/VRM2/VRM4/VRM8` placements, v0-compatible mask-copy windows, whole-register versus explicitly legal typed-partial spill/reload forms, and compatible vset transitions. Instruction selection, LLVM IR semantics, VLEN/ABI/ISA, scheduling outside the frozen trace, vectorization, and source program are not decision variables.

The conditional claim is exact enumeration of all nondominated realizations for the declared action grammar and costs—not global program optimality and not a runtime speedup claim.

## Positive opportunity map

- Natural workloads: public LLVM RVV regression/test-suite functions and RVV-spec high-pressure examples; later evaluation may add SPEC/RAJAPerf/HPC kernels that naturally reach LMUL pressure.
- Source-supported opportunity: the ratified RVV examples explicitly show LMUL=8 reducing the allocator to four groups and causing whole-register spill code; current LLVM performs vector RA before vset insertion; open PR #105661 identifies the typed-spill versus additional-vset tradeoff.
- Headroom caution: `Closer in the Gap` reports compiler default LMUL is often near optimal on its tested workloads. This is a natural-headroom shrinker, not a direct collision, and requires pre-registering no-gain cases.
- Mechanism-specific prediction: only traces where aligned-group placement, v0 windows and spill/vset representation interact should yield Pareto points beyond complete sequential composition. Ordinary low-pressure traces are expected negatives.

## Named baselines and fairness contract

1. **B1 current LLVM production pipeline** at commit `5bb2565693f062a9e99929db1814a7a076d4dc76`: current vector classes/allocation order and NoV0 classes, `VMV0Elimination`, optimized greedy RVV RA (plus the finite `fast/basic/greedy` allocator grid), current whole-register spill lowering, `RISCVInsertVSETVLI`, scalar RA, post-RA pseudo expansion, PEI and MC. Same input and guarantees.
2. **B2 complete sequential local-action comparator**: B1 allocation followed by the legal whole-versus-typed spill decision represented by open PR #105661 and then unchanged vset insertion. It receives the same trace/action information and cost table; it is not reduced to a weak local heuristic.
3. **B3 same-grammar exact CP/exhaustive oracle** on small traces: identical legal actions and vector cost. It is an oracle/method subtractor, not an online deployment baseline. Unison is the generic integrated-optimization genealogy and must be discussed explicitly.
4. **External subtractors/negative controls**: GCC 15 `-mrvv-max-lmul={m1,m2,m4,m8,dynamic}` and its cost controls, plus LLVM finite relevant hidden flags/configurations. GCC operates on a different internal trace and cannot be presented as the same-MIR primary baseline.

Fairness is assessed at two layers: identical frozen MachineIR for algorithm/action separation, and identical source/target/options for end-to-end robustness. Results from those layers cannot be silently pooled. Full cost includes optimizer CPU/RSS, code bytes, scalable frame bytes, vector spill bytes/instructions, mask copies, vset count, static uops, downstream verification failures/fallback, and—only later—runtime.

## Collision analysis

### Nearest-prior facet matrix

| Source/current mechanism | Same exact object | Same actions | Same objective/guarantee | Disposition |
|---|---:|---:|---:|---|
| LLVM current RVV pipeline at pinned commit | yes | group/NoV0/whole spill/vset subset | no joint Pareto guarantee | strongest production baseline; not fatal |
| LLVM PR #105661 / partial-spill RFC | yes for the local spill form | typed spill plus possible vset | local rewrite, no group/mask joint allocation | direct subtractor; absorbs any “new typed spill” claim |
| Unison, TOPLAS 2019 | generic MachineIR-like integrated RA/scheduling, not RVV trace contract | generic allocation/scheduling | exact combinatorial optimization | method/generic-kernel subtractor; fatal if RVV DP is only relabelled enumeration |
| GCC current RVV dynamic LMUL controls | different compiler IR/pipeline | upstream LMUL selection | no same-trace group/mask/spill/vset frontier | external subtractor only |
| Xu et al., 2026 adaptive grouping | changes grouping mechanism/architecture beyond standard power-of-two RVV groups | different | custom grouping utilization/performance | adjacent deployment collision, not same object |
| Zoozve, 2025 WIP | modified ISA/hardware with arbitrary groups | different | strip-mining/grouping performance | changed-object negative control |
| Fried & Stemmer-Grabow, CC 2023 | LLVM RISC-V RA but compressed-ISA objective | partial generic RA/spill mechanisms | code-size optimization | algorithm-shape neighbor, not direct |
| Shi et al., `Closer in the Gap`, 2026 preprint | natural RVV compiler workloads, not the bounded MIR decision object | LMUL configuration/evaluation | performance characterization | headroom shrinker and evaluation anchor |

`DIRECT_FATAL` was not found in the bounded search as of 2026-08-11. Status remains `SEARCH_BOUNDED_OPEN`; no transport failure is interpreted as absence.

### Seed-distance and method-name deletion test

- Seed distance: the opportunity begins from a real current-pipeline ordering boundary and an upstream partial-spill semantic tradeoff, not from an invented function.
- Method-name deletion: after removing “GMSP/Pareto DP,” the residual is still “select aligned groups, v0-compatible mask windows and spill representation while pricing future vset transitions under exact legality.” This is a coherent target-specific function.
- Current failure: after also deleting target field names, the submitted `2^32` enumeration does not yet distinguish itself from a generic fixed-register solver. The atomic revision must supply the quotient/guarantee and legal divergence that survive this test.

## Competing mechanism decision

- Selected mechanism: RVV-specific exact/Pareto quotient-state dynamic programming.
- Registered backup: none. Same-grammar exhaustive/CP is an oracle and subtractor, not a mechanism pivot.
- Pivot boundary: changing to generic ILP/CP, scalar cost tuning, LMUL selection, a spill post-pass, a different ISA/grouping rule, or a controller/wrapper is outside the frozen candidate and fails the revision.

## Residual paper kernel

After subtracting LLVM production behavior, PR #105661, GCC LMUL controls and generic combinatorial optimization, the only defensible kernel is a formally sufficient target-specific trace quotient that exposes and solves non-product coupling among aligned RVV group placement, v0 mask windows, spill representation and vset state. A valid forced-pressure witness and an exactness/complexity argument are part of defining that kernel; performance evidence is not required at Stage 0.

## Evidence route

- `PARETO_APPROXIMATION / COMPLEXITY_THEORY / PERFORMANCE`
- Claim ceiling now: conditional algorithm-design potential only.
- Stage A, if later authorized after closing review, may establish preclaim fidelity and preliminary static/natural headroom. It cannot turn one small witness into a global performance claim.

## Performance-optimization admissibility

- Same-function contract: fixed MIR semantics and unchanged native downstream reader/assembler/execution contract.
- Algorithmic delta: joint target-state optimization, not a parameter grid.
- Full-cost ledger: compile CPU/RSS, output/frame/spill bytes, mask/vset/static-uop counts, validation/fallback, then runtime if suitable hardware exists.
- Strong-implementation fairness: complete current LLVM and complete sequential partial-spill comparator, not isolated list allocation.
- Generality and failure boundary: bounded acyclic traces; expected no gain when pressure, v0 use, or vtype conflict is absent.
- Why not routine tuning: only a valid state-sufficiency/optimality result plus comparator-separating action can support N2. Without them, the topic collapses to tuning or a generic solver and stops.

## Q1/Q2 paper shape

- Problem: current RVV backend phases optimize group allocation, mask handling, spill representation and vset insertion sequentially despite shared physical-state costs.
- Contribution: a sound bounded-trace target quotient and exact/Pareto algorithm with a declared complexity and no-gain boundary.
- Evidence plan: legality/equivalence oracle, action-divergence microcases, public natural corpus, complete compiler baselines, exact small-instance oracle, full cost and failures.
- Expected narrative: target-specific combinatorial compiler optimization with a principled state compression, followed by source-accurate integration and natural workload evaluation.

## Q1/Q2 shape calibration

- Comparator file: `Q1_COMPARATOR_MATRIX.md`
- Reference set: Unison (TOPLAS 2019), Register Allocation for Compressed ISAs in LLVM (CC 2023), Performance Left on the Table (IEEE Micro 2022), and current 2026 RVV evaluation/adjacent grouping papers.
- Status: `PARITY_CONDITIONAL`
- Contribution-shape gap: the target quotient, legal witness and exactness/complexity claim are not yet soundly specified.
- Evidence-shape gap: no implementation or natural evidence yet; this is a Stage A readiness gap, not the reason for revision.
- Stage A closure plan: only after a closing review accepts the static revision, freeze the native contract and run the preclaim fidelity gate before collecting candidate evidence.

## Non-relaxable quality audit

- Same-object: conceptually coherent, but a concrete target/ABI/VLEN/MIR instance and fully legal action catalog must be frozen in revision.
- Latest collision: current LLVM source and docs, open PR #105661, current GCC options, Unison and bounded 2025–2026 RVV work checked. `SEARCH_BOUNDED_OPEN` remains honest.
- Strong fair baselines: finite complete set named above; no universal union and no offline oracle used to auto-kill.
- Natural input/evidence: official RVV pressure examples and public LLVM tests provide a finite route; current positive candidate evidence is absent and not imputed.
- Full-cost: dimensions are defined; measurement is future work.
- Reproducibility: immutable LLVM commit/source blobs, fixed MIR, command/options and oracle hashes are finite to produce.
- Evidence/claim honesty: no performance, exactness, FPT, or Pareto-superiority result is claimed as achieved.

## Evidence path and AI completion

- AI executability class: `AI_CORE_EXECUTABLE`
- Estimated ai_core_fraction: `0.85`
- 72-hour first evidence after closing: freeze one corrected MIR witness; enumerate all native-legal group/spill/vset realizations; compare B1/B2/B3; then sample 10–20 public high-pressure traces. This is a plan, not a completed observation.
- Human-only items: no human-only claim-critical step identified. Access to a particular RVV device changes runtime evidence ceiling but not the static core.

## Fidelity closure plan audit

- Discovery status: `FINITE_FIDELITY_GAP`
- Complete action and native semantics are finite and same-object: yes in principle; current production versus proposed typed-spill actions need explicit tagging.
- Comparator, denominator, full-cost and small-witness plan: finite, but witness presently invalid as a forced-pressure certificate.
- Why an unimplemented interface/format/checker is not structurally fatal: all required paths are public LLVM source/MIR/MC paths; no proprietary interface is necessary.
- Reminder: Stage 0 audits the plan; Stage A must actually close `PRE_CLAIM_CONTRACT_FIDELITY_GATE` before its first claim-bearing run.

## Independent current upstream reality check

- Frozen upstream commit and check date: LLVM `5bb2565693f062a9e99929db1814a7a076d4dc76`, 2026-08-10 UTC, checked 2026-08-11.
- Current official documentation checked: LLVM RVV extension documentation; RISC-V Vector 1.0 specification/examples; GCC current RISC-V options.
- Actual source paths/symbols checked:
  - `RISCVTargetMachine.cpp` blob `517e48faa104348f5ae22bed6001cfe8deb500a8`: RVV allocator selection and vector-RA → vset insertion → scalar-RA order;
  - `RISCVRegisterInfo.td` blob `9d43277bcdafef2ac3110f5e91424be6cad4f051`: `VR/VRNoV0`, `VRM2/4/8`, allocation order, LMUL/fractional classes;
  - `RISCVRegisterInfo.cpp` blob `f51f56cb10a46d8ac4092c910ccd4b460072ffe2`: whole-register `VS{1,2,4,8}R` / `VL{1,2,4,8}RE8` spill/reload lowering;
  - `RISCVInsertVSETVLI.cpp` blob `feceefe1b8550c2191267342ea781d78223508de`: three-phase vtype/VL dataflow and insertion;
  - `RISCVVMV0Elimination.cpp` blob `d72d27c983ada7c0310915be4d71820e660bff92`: copy-to-v0 lowering before allocation.
- Default/non-default controls checked: `-riscv-rvv-regalloc={fast,basic,greedy}` (optimized default greedy, O0 fast); `-riscv-v-vector-bits-min` default `-1`; `-riscv-v-vector-bits-max` default `0`; `-riscv-disable-vector-mask-mutation` default false; machine pipeliner default false; whole-register-move valid-vtype insertion default true. GCC exposes `-mrvv-max-lmul={m1,m2,m4,m8,dynamic}`, default `m1`, and `-madjust-lmul-cost` default off.
- Discovery absence claim: narrowed, not contradicted. Current LLVM expresses the component actions and sequencing, but not the proposed complete joint exact frontier. Typed partial spill is not current production: PR #105661 remained open at check time.
- Remaining non-tuning residual: only the sound target-specific quotient/guarantee described by the revision gate.

## Stage A highest-risk probe plan

- Risk-bearing premise: a legal forced-pressure trace exists and the proposed state equivalence preserves every legal suffix and additive cost.
- Cheap discriminating probe: for the corrected witness, exhaustively label live values and enumerate aligned placements, v0 copies, whole/typed spills and vset transitions; compare the proposed DP frontier byte-for-byte with an independent exact oracle and with B1/B2.
- Negative result that kills the direction: no action-divergence witness; any state merge loses a legal/cost-distinct suffix; all candidate points are reproduced by B1/B2; or target-specific state reduction is only generic fixed-register enumeration.
- Positive-result ceiling: preliminary support/non-falsification only; not main-claim proof.

## Stop conditions

1. The atomic revision cannot produce a legal pressure witness without changing the trace semantics, ISA, VLEN or action set.
2. The quotient is not future-action/cost preserving or the complexity claim cannot be stated without hiding value identities in `S`.
3. The complete current+partial-spill sequential comparator expresses every candidate action/frontier point.
4. The method reduces to generic CP/ILP/exhaustive enumeration with RVV field names and no target-specific guarantee.
5. A later same-object source/paper directly covers the action, objective, guarantee and cost contract.

## Dual-axis score

- Academic value: `46/70` (importance 11/15; N2 clarity 11/20; nearest-work delta 9/15; baselines/cost/venue 7/10; falsifiability/evidence route 8/10).
- AI executability bonus: `26/30` (same-object artifacts 8/10; core implementation/comparison 9/10; bounded probe/replay 9/10).
- Total: `72/100`
- Score interpretation: the numeric PASS threshold cannot override the invalid witness and underdefined quotient; one atomic revision is therefore required.

## Stage0 repair vector

`ATOMIC_ACTION_UNCLEAR / OMITTED_GENERIC_KERNEL / FULL_COST_GAP / Q2_SHAPE_GAP`

The material correction is the independent identification of (a) an insufficient forced-pressure witness, (b) the open—not landed—status of typed partial spill, and (c) the need to compare against generic exact integrated optimization before claiming an RVV-specific FPT contribution.

## Authorization

- Stage A authorized: `false`
- Stage B authorized: `false`
- Experiment/benchmark authorized: `false`
- Next route: same long-lived D-root confirmation sentry; if it confirms `REVISE_ONCE`, only the atomic gate above may be revised.
