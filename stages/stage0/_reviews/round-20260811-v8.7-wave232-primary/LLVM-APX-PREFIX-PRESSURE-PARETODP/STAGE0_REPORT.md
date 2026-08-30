# LLVM-APX-PREFIX-PRESSURE-PARETODP Stage 0 Report

- Lane id: `STAGE0-BATCH-GATE / PRIMARY`
- Assignment id: `STAGE0-P1-20260811-LLVM-APX-PREFIX-PRESSURE-PARETODP-PRIMARY-V8.7`
- Input freeze SHA-256: Discovery manifest self `8B32C1C90DD5BC918EA62E606443A3F230F2576D42841569402EE2AEF3B8125B`; 8/8 listed inputs independently verified.
- Control freeze: `registry.yaml` `18178EEA8EE1615A9481854AC65B37344BF9144DE4E932B20FF0D6FEDE904393`; `plan.md` `4DBAA0282278FFAAB61116185E1E2E3E818FA94B688D2A0D966379976B7C54F6`.
- Post-review control drift: final read-only integrity check observed `registry.yaml` `5396B336DADB3F026382933E6ABCDF539344E2757393885D279E3AF510E86EB2` and `plan.md` `712F12542ACCEE7F93884EAE8ED65811D6A1AA5C1638A84ABD2E3A69DA21D0F5`. This lane made no shared-file write and retained the assignment's frozen starting snapshot.
- Cross-assignment contamination declaration: no earlier candidate score, PASS, experiment, or unregistered source claim was inherited.
- Decision: `REVISE_ONCE`
- Quality tier: `TIER_B_Q2_VIABLE` conditional structural potential; not a Stage 0 PASS.
- Confidence: `0.91`
- Evidence ceiling: `E0-H_STATIC_CURRENT_SOURCE_AND_METHOD_AUDIT`; no candidate run or performance claim.
- Novelty route: `N2`
- Candidate venue family: compiler/code-generation journal or conference at credible Q2 level; Q1 only after stronger generality and natural evidence.
- Stage semantics: conditional paper-potential screen; this report does not establish the main claim.

## Structural paper potential vs current readiness

- Structural paper potential if successful: a sound, target-specific bounded-trace quotient algorithm that returns the exact Pareto frontier over APX form, physical-register, copy, spill and ABI-save choices would be a nontrivial compiler N2. Current LLVM implements the constituent actions and a sequential production composition, not this stated guarantee.
- Current evidence-acquisition readiness/risk: medium-low. The source and public corpus route is finite, but the proposed quotient and its `3^w` complexity are not yet well-defined, and the frozen divergence witness omits a current native LEA conversion.
- Why missing implementation/results/proof/hardware is not structurally fatal: Stage 0 does not require them; source-level legality, a small exact enumerator, LLVM verifier/assembler/objdump, and public LLVM test-suite traces provide a finite Stage A route without APX hardware. The revision is required because the algorithmic proposition itself—not its empirical outcome—is currently underspecified.

## Discovery provenance

- Opportunity origins: APX expands the legal form/register action space while longer REX2/EVEX encodings can oppose move/spill reduction.
- Domain tags: compiler backend, register allocation, instruction selection, x86 APX, multiobjective dynamic programming.
- Paper genealogy: current LLVM APX NDD-first selection and post-RA compression → generic PBQP/greedy allocation → Unison-style integrated combinatorial code generation → proposed APX-specific bounded-trace Pareto quotient.
- Discovery method revision: the current-source reality check materially narrows the static witness and rejects arbitrary within-bank register symmetry.
- Backtest reference and status: none used as candidate evidence.
- Reminder: method backtest is calibration, not candidate evidence.

## Frozen object and claim

The exact object is one acyclic hot trace inside an otherwise fixed LLVM MachineIR function at the pinned x86-64 APX backend, with fixed target triple, APX subfeatures, optimization level, live-ins/live-outs including EFLAGS, instruction semantics, exception behavior, ABI, frame, CFI and unwind contract. The output is a native LLVM-compatible realization using only legal instruction forms, physical registers, copies, spills/reloads and saves/restores. No custom assembler, postprocessor, changed calling convention, target toggle or changed source program is allowed.

The target claim is not “new APX actions.” It is an exact or explicitly bounded algorithmic guarantee: for a frozen finite trace grammar and budget, compute all nondominated realizations in a declared vector such as `(text bytes, static uops, spill/reload work, frame/save work)`, with compile CPU/RSS charged separately as full cost.

The current proposal `(P,L,H,S,q)` is not yet a sufficient state definition. Physical registers within “low” or “EGPR” banks are not freely interchangeable under fixed operands, subregister aliases, byte-register constraints, instruction-specific EGPR legality, caller/callee-save classes, relocation rules, inline assembly and CFI/frame obligations. Consequently the claimed `O(n F poly(w) 3^w Q)` bound is unsupported at this stage.

## Positive opportunity map

- Natural workloads: fixed public LLVM test-suite and public x86 integer-pressure regressions compiled at one pinned commit and APX feature vector.
- Observed or expected cost/headroom: APX creates a real form/register/prefix tradeoff, but no candidate natural gain is claimed. The source-grounded opportunity is that current LLVM deliberately selects NDD early, then relies on RA hints and post-RA local conversions; it does not retain a documented multiobjective trace frontier.
- Mechanism-specific prediction: after a sound equivalence relation is frozen, at least one natural trace should have two legal nondominated realizations that the complete current LLVM chain does not both expose. Failure to find one is a Stage A killer, not evidence already obtained.

`SOURCE_GROUNDED_NATURAL_OR_FORMAL_OPPORTUNITY_HYPOTHESIS`: under a fixed APX MachineIR trace contract, exact state quotienting by only genuine target automorphisms can expose a bounded set of legal byte/uop/spill tradeoffs lost by the sequential production pipeline. The hypothesis is finitely falsifiable by exact enumeration on small traces and a fixed public corpus.

## Named baselines and fairness contract

1. `LLVM-CURRENT-COMPLETE`: pinned LLVM full x86 pipeline—ISel/form choice, LiveRangeShrink/coalescing, configured Greedy or PBQP RA, spills, PEI/frame/CFI, relocation suppression, post-RA passes, `X86CompressEVEX`, and MC emission—with default and declared non-default APX feature/relocation settings.
2. `LLVM-SCALAR-TUNING-GRID`: the same pipeline with a finite, preregistered grid of legal objective weights, allocator choice and relevant APX tuning/feature switches. This subtracts ordinary target-cost tuning.
3. `UNISON-SAME-TRACE`: a same-grammar constraint/CP model, or a fidelity-closed reimplementation, with the same boundary state and full-cost objective. It is a strong generic integrated-code-generation subtractor; if the candidate is only generic solver encoding, the residual vanishes.
4. `EXACT-ENUMERATOR-ORACLE`: exhaustive/SMT enumeration for small traces only. It is a correctness and ceiling oracle, not a deployment baseline.

GCC APX is an independent method/output subtractor and binutils is an encoding legality oracle. Neither may replace the same-LLVM-input baselines. All comparisons preserve the same MachineIR trace, boundary liveness, feature set, ABI/unwind semantics and output verification. Full cost includes candidate analysis, table construction, solving/DP time and peak RSS.

## Collision analysis

No bounded search result established `DIRECT_FATAL` on the exact APX trace Pareto object. Status is `SEARCH_BOUNDED_OPEN`, not an absence claim.

### Nearest-prior facet matrix

| Work/source | Same object | Same target | Same core method/guarantee | Cost boundary | Classification |
|---|---:|---:|---:|---:|---|
| Current LLVM APX pipeline | yes | partly: production scalar objectives | no exact Pareto/quotient guarantee | production compile cost | `METHOD_COMPONENT_COLLISION`; strongest direct baseline |
| LLVM Greedy/PBQP RA | same MachineIR phase family | spill/coalescing objective | generic allocator, no APX form frontier guarantee | production | `GENERIC_KERNEL_SUBTRACTOR` |
| Unison, TOPLAS 2019 | trace/block code generation family | integrated RA/scheduling quality | generic combinatorial optimization, not the proposed APX quotient | solver cost reported | `METHOD_KERNEL_COLLISION`; fatal if candidate becomes generic CP/ILP |
| GCC APX + binutils APX | equivalent ISA/output legality | APX code generation/encoding | no same-LLVM trace Pareto guarantee found | compiler/assembler | `INDEPENDENT_IMPLEMENTATION_SUBTRACTOR` |

### Seed-distance and method-name deletion test

Removing “APX-P3,” “prefix pressure,” and “Pareto DP” leaves a target-specific finite-state exact code-generation problem. Its distance from current LLVM is the retained Pareto guarantee and sound target-automorphism quotient, not the presence of known APX forms. Its distance from Unison exists only if the quotient yields a named complexity/guarantee that a generic solver invocation does not. Without that certificate, the method-name deletion test collapses the proposal to routine backend cost tuning or generic solver modeling.

## Competing mechanism decision

- Selected mechanism: sound finite quotient-state Pareto DP over a pinned APX trace grammar.
- Registered backup: same-object generic CP/SMT exact formulation only as oracle/subtractor, not a publishable pivot under this ID.
- Pivot boundary: scalar weight tuning, a generic solver, a postprocessor, or changing the MachineIR/ABI object is not an allowed mechanism pivot.

## Residual paper kernel

Conditional residual: prove that a precisely defined equivalence relation over APX trace configurations is a cost-and-future-action bisimulation, derive a corrected parameterized state/transition bound, and retain the exact Pareto frontier. The quotient must include physical-register distinctions whenever the target grammar, aliases or ABI distinguish them. This is potentially publishable N2; “enumerate forms and call a solver” is not.

## Evidence route

- `PARETO_APPROXIMATION / COMPLEXITY_THEORY / PERFORMANCE`

## Performance-optimization admissibility

- Same-function contract: identical LLVM MachineIR values, branch/exception behavior, target features, ABI, frame/CFI/unwind and native decoding.
- Algorithmic delta: a target-grammar state quotient with an exact/FPT or frozen approximation guarantee, not a parameter sweep.
- Full-cost ledger: compile CPU and peak RSS; candidate extraction/DP/table cost; object/text/prefix bytes; static uops; copies, spills/reloads, saves/restores, stack/frame/CFI bytes; verifier/assembler failures and fallback. Runtime cycles are optional evidence only when hardware exists.
- Strong-implementation fairness: current complete LLVM plus a finite legal tuning grid receives the same MachineIR/liveness and budget; the exact enumerator is not charged as a production baseline.
- Generality and failure boundary: initial claim is acyclic bounded traces with explicit boundary state; cyclic CFGs, interprocedural allocation and unknown inline assembly are outside the claim.
- Why not routine tuning: only a sound quotient plus a formal Pareto/complexity guarantee and a comparator-separating trace family clears the gate.

## Q1/Q2 paper shape

- Problem: APX form selection, physical allocation and encoding length interact, while a sequential backend commits before all downstream costs are known.
- Contribution: one exact/bounded trace algorithm and target-specific state-equivalence theorem.
- Evidence plan: static proofs and exhaustive micro-oracle, current LLVM/finite tuning/Unison comparisons, natural public traces, native legality and full-cost accounting.
- Expected paper narrative: APX-specific compiler algorithm with a small formal core and reproducible production-backend evaluation; credible Q2 if the revision and Stage A residual close, not yet Q1 breadth.

## Q1/Q2 shape calibration

- Comparator file: `Q1_COMPARATOR_MATRIX.md`
- Reference set: Unison/TOPLAS 2019; BOLT/CGO 2019; SSA-Based Register Allocation with PBQP/CC 2011.
- Status: `PARITY_CONDITIONAL_WITH_EXECUTABLE_GAP`
- Contribution-shape gap: the state equivalence and complexity claim are currently not soundly specified.
- Evidence-shape gap: no current same-object frontier witness or natural full-cost result exists yet; this is Stage A work after revision.
- Stage A closure plan: first close native semantics and a corrected witness, then exact-enumerate small traces before any natural claim-bearing run.

## Non-relaxable quality audit

- Same-object: definable and finite, but the candidate state must preserve whole-function boundary/ABI obligations.
- Latest collision: current LLVM source independently checked; bounded academic search remains `SEARCH_BOUNDED_OPEN`.
- Strong fair baselines: named above; generic CP/Unison and the complete current chain cannot be omitted.
- Natural input/evidence: public LLVM traces give a finite route; no current positive result is asserted.
- Full-cost: ledger is finite and includes compile/solver cost and frame/unwind effects.
- Reproducibility: pinned source, public corpora, deterministic verifier/assembler/objdump and exact micro-oracle are sufficient in principle.
- Evidence/claim honesty: static source findings only; no performance, frontier incidence or complexity theorem is claimed as established.

## Evidence path and AI completion

- AI executability class: `AI_CORE_EXECUTABLE`
- Estimated ai_core_fraction: `0.78`
- 72-hour first evidence: after revision acceptance, freeze the exact grammar and a corrected EFLAGS-live witness; implement a small enumerator and compare it against the quotient transitions on synthetic legal traces before extracting 10–30 fixed public functions.
- Human-only items and why they are non-decisive: APX hardware can raise the runtime evidence ceiling but is not needed for semantic, encoding, complexity or static full-cost claims.

## Fidelity closure plan audit

- Discovery status: `FINITE_FIDELITY_GAP`
- Complete action and native semantics are finite and same-object: yes, if the action catalog includes current LEA conversion, relocation suppression, fixed/alias registers, flags, ABI and frame/CFI effects.
- Comparator, denominator, full-cost and small-witness plan: finite as stated above.
- Why an unimplemented interface/format/checker is not structurally fatal: LLVM MIR, verifier, MC and binutils are existing public interfaces; the missing item is a scientific state certificate, not inaccessible infrastructure.
- Reminder: Stage 0 audits the plan; Stage A must actually close `PRE_CLAIM_CONTRACT_FIDELITY_GATE` before its first claim-bearing run.

## Independent current upstream reality check

- Frozen upstream commit/tag and check date: Discovery short pin `de8cb59` resolved to LLVM monorepo commit `a1194be1baefa99d20a09bd04b16056be0ab7225`; checked 2026-08-11.
- Current official documentation checked: LLVM APX RFC/developer material, LLVM code generator documentation, Intel APX syntax/enabling documents, GCC 16.1 x86 options and GNU binutils APX source discussion.
- Actual source paths/symbols checked: `X86CompressEVEX.cpp::CompressEVEXImpl`, `X86TargetMachine.cpp::{addPreRegAlloc,addPreEmitPass,addRegAssignAndRewriteOptimized}`, `X86SuppressAPXForReloc.cpp::X86EnableAPXForRelocation`, `X86.td` APX features, and current X86 register/ABI handling.
- Default/non-default flags, thresholds and configurations checked: `-mapxf`/component APX feature controls, EGPR/NDD separation, `prefer-ndd-mem`, non-default inline-asm GPR32 use, default-off APX relocation enablement and current Greedy/PBQP allocator selection.
- Discovery absence claim confirmed, narrowed or contradicted: no direct absence claim is accepted. The proposed live-source `ADD32rr_ND` witness is contradicted as written because current `X86CompressEVEX` converts non-redundant ADD NDD to LEA when no EGPR is used and EFLAGS is dead.
- If contradicted, current native mechanism and finite configuration-grid baseline: the current chain includes redundant-NDD compression, ADD-NDD-to-LEA, relocation suppression, Greedy/PBQP allocation and post-RA compression. All must be in the baseline.
- Any non-tuning residual that remains: potentially, a sound Pareto quotient and guarantee under a corrected witness with EFLAGS live, source live after the add, no EGPR, and fixed low-register legality. This residual is not yet closed.

## Unique atomic revision gate

`SOUND_APX_TRACE_QUOTIENT_CERTIFICATE`

Single proposition: under one pinned MachineIR/APX/ABI trace contract, define an equivalence relation on partial realizations that preserves the complete set of legal future actions and all declared costs; give finite transitions and a corrected complexity/guarantee; and exhibit one minimal native action-divergence instance admitted by that same grammar. The minimal witness should freeze EFLAGS live after the ADD so the current LEA conversion is unavailable, source `a` live so destructive coalescing is illegal, and no EGPR use, then compare the complete current chain against `mov32 + destructive add32` without changing flags, values or ABI.

Revision passes only if the equivalence is explicit enough to audit fixed registers, subregister aliases, operand classes, caller/callee-save identities, relocation, PEI/CFI and boundary liveness, and the complexity is corrected to the actual retained state—not asserted as `3^w` from low/EGPR membership alone. A small exhaustive transition table or mechanically checkable counterexample search plan is sufficient; implementation and natural gain are not required.

Revision fails structurally if it can only use arbitrary within-bank permutations, generic ILP/CP, scalar weights, a cherry-picked form table, a postprocessor, or an EFLAGS-dead witness already converted to LEA. Failure sentinel: `BELOW_Q2_STOP__UNSOUND_REGISTER_SYMMETRY_OR_GENERIC_SOLVER_COLLAPSE`.

## Stage A highest-risk probe plan

- Risk-bearing premise: a sound target-specific quotient is materially smaller/different than labeled physical-register enumeration and preserves at least one action that current production composition loses.
- Cheap discriminating probe or counterexample search: exhaustive small-trace enumeration over the pinned legal catalog; automatically search pairs merged by the proposed quotient for different legal successors or different bytes/uops/spill/frame costs. Then compare the corrected witness and 10–30 public traces against complete LLVM and its finite tuning grid.
- Negative result that kills the direction: any quotient-merged pair has different future legality/cost; the state bound collapses to generic labeled allocation without a new guarantee; the corrected witness is absorbed by current LEA/compression/coalescing; or all natural candidate frontiers equal the full baseline.
- Positive-result ceiling: preliminary support/non-falsification only; not main-claim proof.

## Stop conditions

- Direct same-object work is found that already provides the APX trace quotient, guarantee and full-cost result.
- Correct state requires generic physical-register assignment/solver enumeration and provides no target-specific complexity or formal reduction.
- Corrected EFLAGS/ABI witness has no legal comparator-separating action under current LLVM.
- Any claimed realization changes source semantics, target feature set, ABI, CFI/unwind or assembler contract.
- Full-cost natural comparison yields no residual beyond the complete current pipeline and finite tuning grid.

## Dual-axis score

- Academic value: `45/70` (importance 11/15; N2 clarity 11/20; nearest-work increment 9/15; baseline/venue 7/10; falsifiability 7/10).
- AI executability bonus: `25/30` (artifact/baseline 9/10; AI core 8/10; bounded probe/replay 8/10).
- Total: `70/100`

The score supports revision, not PASS, because the atomic algorithmic certificate is a hard structural gate.

## STAGE0_REPAIR_VECTOR

`OMITTED_FIRST_PARTY_FEATURE`, `ATOMIC_ACTION_UNCLEAR`, `FULL_COST_GAP`, `Q2_SHAPE_GAP`.

The material repair is the current LLVM ADD-NDD-to-LEA path plus the need to replace arbitrary bank symmetry with a target-valid equivalence relation. No resource blocker or ownership conflict was found.
