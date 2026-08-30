# LLVM-PPC-PREFIX-PRESSURE-PARETODP — Stage 0 PRIMARY Report

- Lane: `STAGE0-BATCH-GATE / PRIMARY`
- Assignment: `STAGE0-P1-20260811-LLVM-PPC-PREFIX-PRESSURE-PARETODP-PRIMARY-V8.7`
- Decision: `REVISE_ONCE`
- Quality tier if the registered gate closes: `TIER_B_Q2_VIABLE`
- Current calibration: `PARITY_CONDITIONAL`
- Confidence: `0.76`
- Evidence ceiling: `STAGE0_DESIGN_AND_STATIC_CURRENT_SOURCE_ONLY`
- Novelty route: `N2`
- Stage semantics: a conditional paper-potential screen; this review establishes neither a compiler implementation nor a performance result.

## Assignment integrity

The assignment began against the user-specified frozen `plan.md` SHA `71B89CB6…6747F` and `registry.yaml` SHA `234E8245…049E0`, both verified before substantive review. A final mechanical check observed newer shared-control hashes (`plan.md` `8B19F593…A2F6C`; `registry.yaml` `89203C24…7392`). These are **post-freeze control drift**, not imported evidence: this report retains the assignment’s original control freeze and requests mainline acceptance against the supplied contract.

## Structural paper potential vs current readiness

**Structural paper potential if successful.** A bounded-trace, target-specific exact/FPT Pareto method that jointly chooses legal Power10 prefixed PC-relative forms, their ELFv2/relocation consequences, and address-live-range/register-allocation decisions could support a credible Q2 compiler paper. The paper kernel is not “use prefixed instructions”: Power ISA defines the 34-bit PC-relative form, while current LLVM contains several local and late transformations. The kernel is a semantics- and relocation-preserving quotient over the *complete current legal action grammar*, with an exact/certified Pareto frontier that the current staged composition does not promise.

**Current readiness.** Moderate. Current upstream action and relocation paths are inspectable and public, and the future Stage A path needs only LLVM tests/Test-Suite plus assembler/object/unwind oracles. The discovery package has not pinned one ABI/code model/instruction/relocation witness, or supplied a future-action-preserving quotient. That is a finite design gap, not a negative result and not a resource failure.

Missing implementation, test results, or hardware does not cause this decision. The revision is required because the present N2 claim can otherwise collapse into ordinary instruction selection plus generic register allocation.

## Frozen object and claim

The frozen same-object contract is a **Power10, ppc64le Linux ELFv2, medium-code-model** pre-form MachineIR trace with fixed program semantics, virtual-value def/use graph, memory/alias facts, ABI/unwind contract, and source-to-object relocation constraints. A legal output has identical observable program behavior and matching relocation, DWARF/unwind, assembler, linker, and object-format validity. It may choose only target-legal forms for fixed addressable operations:

1. `PCREL34` prefixed load/store where the ISA and ABI permit it;
2. target-legal prefixed displacement form; or
3. the existing materialize-address-plus-use sequence, including the introduced address value and all legal RA/coalescing/spill actions.

It may not alter source semantics, symbol binding/visibility, code model, ABI, CFG, memory ordering, relocation model, post-link layout, or use a different linker/object format. The output ledger is `(text bytes, relocation count/type, compile+link CPU, peak RSS, spill/copy/frame bytes, static uop proxy, runtime)`. No claim is made that these dimensions will improve.

## Independent current-upstream reality check (2026-08-11)

- **Pinned current source observed:** LLVM `llvm-project` main `f127b4c19c63b0492fb924934e37e032c17ea35b` (retrieved 2026-08-11). This is an observation pin, not a claim that this moving head is an experiment environment.
- **ISA/ABI boundary:** Power ISA v3.1 defines prefixed loads whose `R=1` case uses `CIA + sign-extended 34-bit displacement`; it is not a generic “no address register” switch. GCC documents `-mpcrel` as requiring `-mcmodel=medium` and `-mprefixed`; target/ABI gating is therefore part of the object, not a tunable afterthought.
- **Current native paths found:** `PPCPreEmitPeephole.cpp` has default-on hidden `ppc-pcrel-linker-opt` and `ppc-late-peephole`; it recognizes `PLDpc` GOT accesses, records def/use conditions, and emits a PCREL optimization marker. `PPCMCCodeEmitter.cpp`, `PPCELFStreamer.cpp`, and `lld/ELF/Arch/PPC64.cpp` implement/consume PCREL and `R_PPC64_PCREL34`/GOT-PCREL34 paths, including relaxation. The current `lld` implementation explicitly limits one GOT relaxation to `pld`, because `paddi` requires an address rather than the loaded object.
- **Implication:** discovery’s “prefixed form plus an address temporary” is real but narrowed. A GOT-indirect `PLDpc` already materializes a pointer and participates in native linker optimization; it cannot be used as the claimed no-temporary witness. A direct PCREL34 load/store with a fixed legal binding/relocation may be a valid seed, but must be explicitly specified.
- **Current strong composition:** LLVM instruction selection/form selection; greedy or PBQP register allocation; coalescing, spilling, frame/prologue/epilogue handling; PPC pre-emit peephole; MC emission; `ld.lld` relaxation. `ppc-pcrel-linker-opt=true` and `ppc-late-peephole=true` belong to the default-on union. `-ppc-pcrel-linker-opt=false`, `-ppc-late-peephole=false`, Power10 feature selection, relocation/code-model switches, and legal compiler configuration are finite negative controls, not an absence claim.
- **Other primary upstream subtractors:** GCC’s documented PowerPC `-mprefixed` and `-mpcrel` surfaces, GNU `as` Power10 instruction-option surface, and GNU/LLVM linkers are deployment/reference comparators. They are not same-MachineIR baselines unless the exact input representation and information are made equivalent.
- **Collision result:** no primary source or paper retrieved in this bounded review stated the same PPC ELFv2 PCREL34-form + temporary-liveness + full RA + relocation-aware bounded-trace Pareto certificate. `SEARCH_BOUNDED_OPEN` remains; it is not evidence of novelty.

## Named baselines and fairness contract

| Comparator | Same information / same object | Role | Required full cost |
|---|---|---|---|
| Current pinned LLVM composition | Yes; canonical deployment baseline | Strong baseline | complete compiler, RA/coalescing/spill, MC, lld, verification |
| Current LLVM finite configuration grid | Yes, only legal ppc64le ELFv2/Power10/code-model/peephole choices | Strong negative-control union | all compile/link and output costs |
| Form-fixed + current RA composition | Yes | Ablation: isolates form/pressure coupling | same ledger |
| Address-form-aware DP + fixed current RA | Yes | Ablation: isolates RA coupling | same ledger |
| Unison / generic CP/ILP | Model-equivalent only after exact PPC action table | Oracle/subtractor, not a deployment baseline | solve time and model construction included |
| GCC/binutils and lld behavior | External compiler/object-toolchain reference; not identical MachineIR | Deployment subtractor | semantic/object/unwind equality and toolchain costs |

The candidate must not compare only with default LLVM. Any candidate preprocessing/model-building, optimizer time, fallback, assembler/linker time, peak RSS, object size, relocation records, spills/copies/frame effects, verification time, and target execution metrics must be counted.

## Collision and facet matrix

| Facet | Current evidence | Consequence |
|---|---|---|
| 8-byte prefixed / PCREL34 legal action | Power ISA and LLVM PPC sources | Existing action; cannot be N1 |
| PCREL eligibility / ABI / code model | ISA, GCC options, LLVM Triple/MC/lld code | Must be frozen, not inferred from an address-shaped IR node |
| GOT pointer `PLDpc` and linker relaxation | Current PPC pre-emit + lld source | Absorbs a proposed GOT witness; candidate must exclude it or model its native action faithfully |
| register allocation, coalescing, spills | LLVM current pipeline; Unison | Generic global optimization is a direct subtractor |
| relocation/pair legality | current MC and lld source | Cost vector needs typed relocation constraints, not just a relocation count |
| target-specific trace quotient and certificate | `SEARCH_BOUNDED_OPEN` | Conditional residual only |

**Method-name deletion test.** Removing “Pareto DP” leaves a potentially nontrivial statement only if the state preserves PPC-specific future legality: PCREL eligibility, symbol/linker pairing, address-vs-loaded-value distinction, operand/register-class restrictions, ABI/unwind/frame effects, and finite declared cost. Removing these leaves a generic instruction-selection/RA solver and fails.

## Competing mechanism decision

- **Selected mechanism:** finite `PPCREL34` trace quotient DP whose state is based on future *legal native actions*, not an arbitrary permutation of physical register names. It must jointly account for form kind, value kind (`direct-value` versus `materialized-address`), relocation/pair status, live interference class, caller/callee/frame obligations, and the declared Pareto vector.
- **Rejected backup:** scalar “prefixed saves an instruction/register” scoring, form tuning, or selecting a different native LLVM output. These are current-pipeline tuning/emitter work.
- **Pivot boundary:** keeping the frozen object and exact semantics while replacing the underspecified `(i,L,A,q)` with a formally defined future-action equivalence is allowed once. Changing ABI, code model, symbol binding, object model, or target requires a new ID.

## Single scientific revision gate

`PPCREL34_ELFV2__FUTURE_NATIVE_ACTION_PRESERVING_TRACE_PARETO_CERTIFICATE`

**One proposition.** For one pinned Power10 ELFv2 medium-code-model pre-form trace and complete current LLVM/lld action catalog, provide (a) a legal direct-PCREL34-vs-materialized-address witness that is not an already-native GOT `PLDpc` relaxation, and (b) a finite state equivalence/bisimulation preserving every future legal form, RA, spill, relocation, ABI, frame, and declared-cost action, together with a target-specific exact/FPT/certified-frontier recurrence and a finite Stage A falsifier.

**Falsifiers.** The revision fails if the only witness is illegal, changes binding/ABI/code model, is a GOT `PLDpc` path already handled by native relaxation, or if the state collapses to generic CP/ILP, identity enumeration, scalar cost tuning, or arbitrary register-bank symmetry. It also fails if the required future action set cannot be made finite without dropping current native action classes.

This is one atomic contract-closure gate: the witness, action catalog, equivalence, and recurrence are inseparable parts of the same certificate, not separate mechanism pivots.

## Q1/Q2 paper shape

- **Problem:** target instruction forms can alter an address live range, yet target pipelines treat form selection, RA, late peepholes, and linker relaxation compositionally.
- **Contribution if successful:** PPC-specific quotient/state and exact/FPT Pareto algorithm over legal forms and typed relocation/ABI constraints; a proof/certificate of completeness relative to the frozen action catalog; a reproducible compiler-level evaluation.
- **Evidence plan:** natural LLVM PowerPC tests and LLVM Test-Suite functions, with fixed commits/manifests; verifier, assembler, `llvm-readobj`/`objdump`, relocation, DWARF/unwind and semantic test oracles; full compile/link/resource/output/runtime ledger.
- **Claim ceiling now:** “a finite, auditable research design with a conditionally viable N2 residual.” No claim of a real compiler improvement, a complete theorem, or a current-source absence.

## Fidelity closure and Stage A killer

`FIDELITY_CLOSURE_PLAN=READY_TO_CLOSE_IN_STAGEA_AFTER_REVISION`; no Stage A is authorized.

The first claim-bearing Stage A run must pin LLVM, target triple, Power10 CPU features, ELFv2, code model, assembler/linker, symbol-binding assumptions, and legal witness. It must verify code/object/relocations/unwind before comparing costs.

**Finite killer:** on 10–20 fixed public functions after legality filtering, stop the mechanism if (i) no qualifying direct-PCREL34/materialized pair exists, (ii) assembler, linker, relocation, unwind, or semantic equality fails, (iii) every candidate Pareto point is dominated by the current composition plus its finite legal configuration grid, or (iv) DP/model/optimizer overhead removes all p50/p90 full-cost Pareto points. A positive observation would be preliminary support only.

## Non-relaxable quality audit

- Same object: **conditional pass after revision**; current discovery wording is too broad.
- Latest collision: **pass with `SEARCH_BOUNDED_OPEN`**; current LLVM action absorption was independently recorded.
- Strong fair baselines: **conditional pass**; the complete native grid and all typed costs are named.
- Natural evidence: **finite route**, not yet collected; not a Stage 0 failure.
- Full cost: **planned but not measured**; candidate/precompute costs are explicitly in the denominator.
- Reproducibility: **conditional** on source/flag/action-table and manifest pinning in revision.
- Evidence honesty: **pass**; no positive result is asserted.

## Scores and disposition

- Academic value: `53/70` (conditional; N2 is meaningful only after the certificate prevents generic collapse)
- AI executability bonus: `23/30` (`AI_CORE_CONDITIONAL`, estimated `0.70`)
- Total: `76/100` (a priority signal, not an override of the gate)
- Decision: `REVISE_ONCE`, pending independent confirmation. Stage A/B: `false`.

## Sources

Primary/current sources were accessed 2026-08-11 and are detailed in `SOURCE_AUDIT.md`: Power ISA v3.1; LLVM current source and Doxygen; LLVM lld documentation; GCC PowerPC options; GNU as PowerPC options. Research comparators: Lozano et al., *ACM TOPLAS* 41(3), 2019, DOI `10.1145/3332373`; Lozano & Schulte, *ACM Computing Surveys*, 2019, DOI `10.1145/3200920`.

AI-assisted source review and synthesis were used; all source claims above are bounded to the cited primary/current materials.
