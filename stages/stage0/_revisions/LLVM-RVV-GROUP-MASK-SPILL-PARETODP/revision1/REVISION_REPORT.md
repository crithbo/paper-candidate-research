# LLVM-RVV-GROUP-MASK-SPILL-PARETODP Stage 0 Revision 1 Report

- Assignment: `STAGE0-P1-20260811-LLVM-RVV-GROUP-MASK-SPILL-PARETODP-REVISION1-V8.7`
- Role: long-lived `STAGE0-BATCH-GATE / PRIMARY-REVISION`
- Atomic gate: `SOUND_RVV_TRACE_ACTION_AND_QUOTIENT_CERTIFICATE`
- Revision budget: `1/1 CONSUMED_BY_THIS_FIRST_GATE-BEARING_STATIC_CONSTRUCTION`
- Decision: `RECOMMEND_STAGE0_PASS_FOR_CLOSING_REVIEW`
- Conditional quality: `TIER_B_Q2_VIABLE`
- Confidence: `0.86`
- Evidence ceiling: `E0-H_STATIC_PINNED_CURRENT_SOURCE_AND_FORMAL_CONSTRUCTION__NO_IMPLEMENTATION_NATIVE_OUTPUT_OR_RESULT`
- Latest-collision status: `SEARCH_BOUNDED_OPEN`
- Stage A/B authorized or created: `false / false`
- Candidate experiment, benchmark, automation, or hardware run: `false`

## Single proposition, falsifier, and result

**Atomic proposition.** Under one pinned post-ISel LLVM RVV MachineIR/VLEN/ABI contract, the landed current action catalog plus a separately tagged proposed typed-spill action admit a target-specific exact Pareto dynamic program. Its state is quotiented only by recursively certified automorphisms of the RVV aligned dyadic register-group forest that preserve all suffix native actions, `v0`/`NoV0` legality, AVL/VTYPE transitions, spill/frame obligations, and declared costs. The same grammar contains a target-valid capacity witness in which current whole-register spilling and a legal candidate typed-spill realization diverge without changing semantics.

**Falsifier.** The proposition fails if the pressure witness has an unmodeled physical placement or rematerialization escape; if typed spilling is called current-native or crosses its legality boundary; if a merged state has any different future action, cost, VTYPE/VL, ABI, frame, or terminal behavior; or if the only method left is a generic CP/ILP/Unison model, unquotiented fixed-32-register enumeration, or an arbitrary register-bank permutation.

**Result.** The gate is statically closed. The construction supplies a forced-capacity witness, an action-complete landed/proposed boundary, a conservative cost-preserving bisimulation, an exact output-sensitive/FPT algorithm, degeneration map, strongest-union contract, and finite Stage A killers. It does not establish current-LLVM victim selection on a native run, natural incidence, state reduction, performance, or a completed theorem. Those remain Stage A falsifiers rather than Stage 0 STOP reasons.

## Mechanical provenance

- Frozen controls matched at assignment initialization exactly: `registry.yaml=D67CFD361F3B90A61EE03EA759E7267C072688D8DD2858928ABA6F5E871353A7`; `plan.md=835C7F80E9D13AB547AD7C32140EAAF943DC50A2A5F7572AE773D382BCFBFCBB`; `ROLE_STAGE0_REVIEW.md=741EC3544797FF8A5BF337E1E3448B5F683823E5229F818F162834400581626E`.
- During read-only review, mainline advanced the shared controls to registry `3D562779BEEF71C7CF5CEE1654B0AD964AE084F9331862E44CE4648838928F4D` and plan `257E2E1A9AEC3BAE11B6225D30BAC53652D7F3C7CC86A02870060352D5E50D83`. The original user-frozen scientific contract was retained; this lane did not write shared controls.
- PRIMARY manifest self `8508AC23B1142DD383BF77D2540524788B056E8235BD28F7067CFE85B0E51771`; entries `4/4 PASS`.
- Confirmation handoff `3CD11E4C2F3B8A8570A2374E3D87802432986715D0383A364666AB43A2DC4703`; confirmation manifest self `78F59718D72A8FCFEE2CCFDAB2F28A7FCD02725AF713B7396FFA601EB5ED045F`; entries `2/2 PASS`.
- Pinned LLVM commit: `5bb2565693f062a9e99929db1814a7a076d4dc76`. Revision-time official-source refetches failed by transport/cache and were not used as absence evidence. The accepted pinned source packet and blob identities remain the decision basis.

## Frozen exact object

The object is a bounded acyclic post-ISel MachineIR trace at the pinned LLVM commit with:

1. `riscv64-unknown-linux-gnu`, RVV enabled, fixed `+zvl128b`, `VLEN=128`, fixed CPU/features, optimization level, allocator arm, and downstream pipeline;
2. fixed MachineIR values, full-lane/subrange liveness, instruction and memory semantics, exception behavior, live-ins/live-outs, block-frequency/spill-priority metadata, and trace boundary;
3. fixed LP64D ABI, no calls or inline assembly in the witness, fixed scalable frame/PEI rules, and unchanged pseudo-expansion/MC/execution contract; and
4. fixed AVL/VTYPE requirements including SEW, LMUL, tail policy, mask policy, and known/unknown VL facts consumed by the pinned `RISCVInsertVSETVLI` transfer functions.

The output is a legal whole-trace realization over physical aligned vector groups, physical `v0` mask copies/windows, current whole spill/reload actions, optionally the separately tagged candidate typed-partial spill action, and exact vset transitions. The source program, MachineIR semantics, RVV ISA, VLEN, ABI, vectorizer, scheduler outside the trace, and object format are not variables.

## Complete action catalog and landed/proposed boundary

### Landed current actions `A_native`

The pinned catalog contains:

- `VR`, `VRNoV0`, fractional classes mapped to ordinary one-register `VR`, and aligned `VRM2/VRM4/VRM8` plus `NoV0` variants;
- exact alias/group legality and allocation starts, including four `VRM8` groups rooted at `v0`, `v8`, `v16`, and `v24`;
- `VMV0Elimination` physical copies and mask windows, coalescing/splitting, current vector-first `fast/basic/greedy` allocation, register hints, eviction/spill/reload/rematerialization when legal;
- current whole-register `VS1R/VS2R/VS4R/VS8R` and `VL1RE8/VL2RE8/VL4RE8/VL8RE8` lowering families;
- the complete pinned `RISCVInsertVSETVLI` dataflow and insertion behavior, including the current whole-register-move valid-vtype option;
- scalar RA, pseudo expansion, PEI/scalable frame, MC encoding, and every fixed-register/ABI/terminal effect relevant to legality or cost; and
- a preregistered finite relevant configuration grid. Configurations that change pre-trace MachineIR are end-to-end negative controls, not identical-trace arms.

### Proposed action `A_typed`

LLVM PR `#105661` and its RFC define typed partial spill/reload with eligibility guards and possible additional vset transitions. At the frozen commit it is **not landed** and is never called native/current behavior here. It is simultaneously:

- a direct subtractor that absorbs any claim that typed partial spill itself is novel;
- a legal candidate extension action only when its type, lane, memory, and no-inline-assembly guards hold; and
- an arm of the strengthened sequential comparator `B2`, so the candidate cannot win by comparing against current whole spills alone.

Every action has a precondition, semantic transformer, exact live/alias/mask/VTYPE/spill/frame successor, and declared cost label. Current LLVM output is included as a fallback path.

## Target-valid forced-pressure witness

### Static MIR/trace contract

At one pressure cut `c`, freeze the following pairwise-interfering live values:

1. three full-lane values `G0,G1,G2` in `VRM8NoV0`, live across `c` and with no legal split/rematerialization escape;
2. a physical `v0` mask live across `c`, produced through the current mask-copy mechanism; and
3. eight fractional-LMUL values `F0...F7`, each assigned by current LLVM to the ordinary one-register `VR` physical class, pairwise live across `c`, defined by non-rematerializable vector computations, and aliased against the live LMUL8 groups.

Because `v0m8` is illegal while the physical mask is live, the three LMUL8 values occupy the only three legal non-v0 aligned groups `v8m8`, `v16m8`, and `v24m8`, covering `v8...v31`. The mask occupies `v0`. LLVM's current fractional-LMUL representation gives `F0...F7` eight distinct one-register demands, but only `v1...v7` remain. By pigeonhole, at least one fractional value must be split/spilled at `c`. This closes the flaw in the original one-`VRM8`/one-temp witness; no arbitrary pressure weight or synthetic physical register is injected.

Freeze `F0` as an `e32,mf2` value whose live lanes and memory extent satisfy the typed-spill guard, with no inline assembly and with its reload semantics fully defined. Two same-object whole-trace realizations are legal:

- `P_whole`: current production chooses a victim at the forced cut and preserves `F0` using the landed whole-register `VS1R`/`VL1RE8` family, with current vset propagation.
- `P_typed`: the candidate extension preserves the same `F0` using typed `e32,mf2` unit-stride spill/reload and the exact required vset transitions, then rejoins the identical live-out/VTYPE/ABI boundary.

The two plans have identical semantic values, memory contents at observable boundaries, mask behavior, ABI, and terminal VTYPE/VL. They differ in physical spill traffic/frame extent versus vset/code/planning cost. `P_typed` is `PROPOSED_LEGAL_ACTION__NOT_CURRENT_NATIVE__STAGEA_REPLAY_REQUIRED`.

### Non-product sequential-divergence extension

The same trace includes a second eligible fractional value `F1` whose typed reload type matches the surrounding VTYPE state, while `F0` requires a type transition and restoration. Freeze the current allocator's deterministic victim/prioritization metadata so the current sequential arm commits to `F0` before vset insertion. The strengthened sequential comparator may choose whole versus typed representation for `F0` but cannot reopen the already committed spill victim. The joint candidate can compare that branch with spilling `F1` and retaining `F0`, accounting for group/mask occupancy and all vset costs simultaneously.

This establishes an action-space separation between irrevocable sequential composition and the joint constructor. It does **not** claim the alternative is naturally nondominated or that current Greedy selects the frozen branch in an executed MIR; exact current-path replay is a Stage A preclaim obligation. If replay does not realize the frozen priority/action path, this witness fails closed.

## RVV dyadic-forest state certificate

### 1. RVV physical resource structure

Represent `v0...v31` as four aligned eight-register blocks, each carrying a depth-three dyadic tree. Legal LMUL `1/2/4/8` groups are exactly the aligned nodes of these trees. Color leaf `v0`, any fixed/reserved register, ABI role, and suffix fixed-use distinctly. This representation encodes the target's power-of-two alignment rather than treating the register file as an unlabeled 32-bit bitmap.

### 2. Exact labeled state

At trace boundary `i`, retain

`x_i = (i, lambda_i, mask_i, spill_i, nu_i, frame_i, boundary_i)`,

where:

- `lambda_i` maps every labeled live semantic value to an exact dyadic group node, one-register leaf, or its canonical spill slot and retains live subranges/alias ownership;
- `mask_i` records mask source identity, physical-v0 copy lifetime, `NoV0` windows, and fixed/inline-assembly barriers;
- `spill_i` records value identity, resident/whole/typed representation, eligibility, slot, stored lane/type extent, outstanding reloads, and terminal semantics;
- `nu_i` is the exact finite suffix-relevant AVL/VTYPE/VL state produced from the pinned `RISCVInsertVSETVLI` transfer domain, not a coarse hand-written label;
- `frame_i` retains scalable slot allocation, frame/PEI/ABI obligations, and any nonadditive terminal extent; and
- `boundary_i` retains fixed live-in/live-out, value identity, uses/kills, operand classes, and terminal constraints.

The Pareto label is separate and contains additive counters plus a terminal frame component. It never substitutes for legality state.

### 3. Certified future signatures and automorphisms

At every boundary, color the dyadic forest with all remaining-suffix facts: every live value's allowed nodes, full alias/subrange relations, operand/group alignment, `v0`/`NoV0`, fixed uses, action preconditions, mask-copy transitions, spill/reload forms and costs, exact VTYPE/VL transition rows, ABI/frame consequences, and terminal roles.

Compute signatures bottom-up. Two equal-height subtrees or top-level eight-register blocks may be swapped only when their complete colored relation/action/cost signatures are byte-identical and an explicit tuple audit confirms that the swap preserves every transition row and successor obligation. Block 0 is distinguished by `v0` and cannot be swapped with another block. Any failed equality splits the class down to singletons.

Let `Gamma_i` be the group generated only by these certified subtree/block swaps. Semantic values, spill slots, VTYPE state, EFLAGS-equivalent status, and boundary outputs are fixed; only complete physical placements are renamed. Define `x ~_i y` when some `pi in Gamma_i` maps every physical group/leaf/alias occurrence in `x` to `y` and leaves all other fields identical.

Because each generator was audited against the complete suffix action-and-cost tensor, every legal action from `x` maps to a same-cost legal action from `y`, with successors related at `i+1`; the inverse generator proves the converse. Thus `~` is a strong declared-cost-preserving bisimulation. It does not merge states merely because their occupancy, pressure, LMUL count, or `(O,M,V,S,q)` summary matches.

### 4. Nontrivial target-specific reduction

In the witness before any suffix fixed-register use, the three non-v0 LMUL8 blocks have identical full action/cost signatures. Their physical placement permutations form an orbit of size up to `3!`, while `v0` remains fixed. The quotient therefore strictly merges at least the six labeled placements of `G0,G1,G2` whenever their future constraints remain symmetric. If any future use distinguishes a block, recursive signatures split it automatically. This is a canonical formal-family result, not a claim about natural frequency.

## Exact orbit-canonical Pareto DP and guarantee

The algorithm scans trace events in order. For each retained state it enumerates the complete legal `A_native union A_typed` macro-actions, applies exact liveness/alias/mask/spill/VTYPE/frame updates, canonicalizes the physical placement under `Gamma_(i+1)`, and retains all nondominated cost labels and reconstruction pointers. Acceptance requires the exact frozen semantic, mask, VTYPE/VL, ABI, frame, and live-out boundary. Current-only comparison runs the same engine with `A_typed` disabled.

By induction over boundaries and the bisimulation lemma, orbit canonicalization preserves all and only legal continuations and their cost vectors. Standard Pareto dominance pruning is therefore exact. The guarantee is the exact Pareto frontier for the frozen bounded trace grammar, not global CFG/program optimality.

Let:

- `n` be trace events, `R=2^h` vector registers, `g` the maximum group height (`g=3` for LMUL8), and `w` maximum active labeled values;
- `D` be per-value resident/whole/typed/pending-reload states, `M` mask-window states, `Z` exact AVL/VTYPE/VL states, and `F` finite frame/ABI states;
- `A` be maximum legal macro-actions per state, `p` cost dimensions, `Q` maximum retained nondominated labels, `S` maximum quotient states, and `C_can` signature/canonicalization cost.

The number of legal physical dyadic nodes is `L(R,g)=sum_(j=0)^g R/2^j`. A conservative labeled bound is

`S_raw <= (L(R,g)+w)^w * D^w * M * Z * F`.

The certified quotient never increases this bound and divides any fully symmetric orbit by its exact orbit size. Runtime is

`O(n * S * A * (C_can + p*Q^2) + n*R*log(R)*|Sig|)`

and memory is

`O(S*Q*(w+p) + R*log(R)*|Sig|)`.

This is an honest output-sensitive FPT algorithm in `(w,h,g,D,M,Z,F,p,Q)` with polynomial dependence on `n`; for standard RVV, `R=32` and `g=3` are frozen constants. It does not present `2^32` as the contribution. If all certified orbits are singleton or `Q/S` is impractical, the algorithm remains exact but the target-specific paper residual fails its Stage A killer.

## Strongest comparator union and degeneration map

| Comparator | Action/guarantee boundary | Required disposition |
|---|---|---|
| `B1 LLVM-CURRENT-COMPLETE` | pinned vector-first RA, mask elimination, whole spills, complete vset insertion, scalar RA, PEI/MC, finite relevant controls | strongest production baseline; typed action disabled |
| `B2 LLVM+TYPED-SEQUENTIAL` | B1 victim/allocation fixed, then complete guarded PR-style whole/typed choice and current vset pass | subtracts local typed-spill novelty and weak sequential baselines |
| `B3 LABELED-RVV-PARETO-DP` | identical actions/state without physical quotient | exact degeneration comparator; candidate must demonstrate certified reduction |
| `B4 GENERIC-EXACT/UNISON` | same grammar/cost via exhaustive, CP, ILP, or integrated generic formulation | oracle/method subtractor; cannot be candidate core |
| GCC/adjacent grouping work | source-level or changed grouping/ISA object | external subtractor/negative control only |

The candidate fails if it becomes B2 postprocessing, B3 identity enumeration, B4 generic solving, LMUL/allocator tuning, a wrapper/controller, or a changed ISA/grouping object.

## Full-cost algebra and claim ceiling

The optimization vector records text bytes, vector spill/reload instructions and exact bytes transferred, mask copies, vset instructions, target-schedule static cost, scalable spill-slot/frame extent, and save/restore effects. Candidate planning CPU and peak RSS, table construction, verifier failures, and fallback are evaluation costs. Runtime/energy may be added only with later hardware and cannot replace static correctness/full cost.

Claim ceiling: a bounded-trace RVV-specific exact Pareto constructor and certified dyadic-state reduction, conditional on natural nontriviality. No new typed-spill action, whole-CFG optimum, universal register allocation, hardware speedup, or Q1 claim is supported.

## Finite Stage A preclaim replay and killers

Before any claim-bearing observation, Stage A must:

1. build/hash the pinned LLVM source and extract an action catalog whose current-only mode reproduces the complete native path;
2. materialize the witness as MIR with exact classes, subranges, mask copy, kills, block frequencies, VLEN/VTYPE and no-rematerialization guards;
3. use MachineVerifier, assembler/disassembler, reference execution or an independent semantic oracle to verify `P_whole` and `P_typed`, explicitly reporting typed action as candidate/unlanded;
4. enumerate small traces and compare labeled versus quotient successor/action-cost multisets and exact frontiers; the first mismatch fails closed;
5. compare B1/B2/B3/B4 with identical trace/action information, budgets, semantics, and full-cost dimensions; and
6. only after fidelity closure, freeze public LLVM RVV regressions/test-suite plus canonical pressure examples and report class/orbit incidence, state/frontier reduction, compilation cost, spill traffic, frame, vset, code, failures, and fallback.

Scientific killers are: a legal extra placement invalidates forced pressure; current replay does not realize the frozen sequential action boundary; typed semantics/guard fails; any quotient mismatch; all natural orbits are singleton or fewer than 10% states are removed on at least 10% of eligible traces; B1/B2 exposes the same frontier; or full candidate cost removes every residual. Positive microcases are preliminary non-falsification only.

## Structural potential versus readiness

- Structural paper potential: conditional `TIER_B_Q2_VIABLE`. The paper kernel is the RVV dyadic-resource/future-action certificate and exact Pareto constructor over known actions, not typed spilling itself.
- Current readiness: medium-low. Source and oracle routes are public and finite, but the MIR witness, current Greedy path, typed candidate lowering, catalog completeness, natural quotient incidence, and benefit are unexecuted.
- Resource status: no blocker. RVV hardware is unnecessary for the first semantic, static-cost, compile-cost, and exactness falsifiers.
- Evidence honesty: this package is a static research proposition. It contains no candidate output, natural result, performance claim, or proof checked by a machine.

## Revision decision

The single gate `SOUND_RVV_TRACE_ACTION_AND_QUOTIENT_CERTIFICATE` is statically closed without changing the frozen object or pretending PR `#105661` is current-native. The revised witness forces pressure by exact group/mask/single-register capacity; the state retains all facts omitted by `(O,M,V,S,q)`; only certified dyadic-tree automorphisms are quotiented; and the exact/FPT guarantee, comparator union, full cost, degeneration, and killers are explicit. Recommendation: `RECOMMEND_STAGE0_PASS_FOR_CLOSING_REVIEW`, conditional `TIER_B_Q2_VIABLE`, pending the same long-lived D-root confirmation sentry. Stage A/B remain unauthorized.

