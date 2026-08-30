# LLVM-APX-PREFIX-PRESSURE-PARETODP Stage 0 Revision 1 Report

- Assignment: `STAGE0-P1-20260811-LLVM-APX-PREFIX-PRESSURE-PARETODP-REVISION1-V8.7`
- Role: long-lived `STAGE0-BATCH-GATE / PRIMARY`
- Revision budget: `1/1 CONSUMED_BY_THIS_STATIC_GATE-BEARING_CONSTRUCTION`
- Atomic gate: `SOUND_APX_TRACE_QUOTIENT_CERTIFICATE`
- Decision: `RECOMMEND_STAGE0_PASS_FOR_CLOSING_REVIEW`
- Conditional quality: `TIER_B_Q2_VIABLE`
- Confidence: `0.88`
- Evidence ceiling: `E0-H_STATIC_PINNED_SOURCE_AND_FORMAL_CONSTRUCTION__NO_IMPLEMENTATION_OR_RESULT`
- Search status: `SEARCH_BOUNDED_OPEN`
- Stage A/B authorized or created: `false / false`
- Experiment, benchmark, candidate automation, or GPU run: `false`

## Atomic proposition, falsifier, and result

**Single proposition.** For one pinned pre-register-allocation X86/APX MachineIR trace, the complete finite native action system admits an exact Pareto dynamic program after quotienting only by physical-register-family transpositions that are mechanically certified to preserve every suffix legality relation, ABI/CFI obligation, and declared additive cost. The same grammar contains a legal EFLAGS-live APX-NDD versus legacy-copy action divergence that current tied-form, commutation, LEA, and NF compression cannot erase.

**Static falsifier.** The proposition fails if any certified swap changes one legal suffix action, successor, or declared cost; if the corrected action divergence is illegal or is absorbed by the complete current LLVM chain on the frozen object; if only identity states remain and no target-specific reduction/guarantee survives; or if the construction reduces to arbitrary bank permutation, generic CP/ILP, scalar tuning, or an emitter patch.

**Result.** The proposition is statically closed as a finite, conservative certificate and an exact orbit-canonical Pareto algorithm. It does not establish natural prevalence, compile-time practicality, or an end-to-end benefit. Those remain Stage A falsifiers. This is sufficient for conditional Q2 paper potential and closing review, not for self-promotion to Stage A.

## Mechanical and provenance audit

- Frozen assignment controls: `registry.yaml` `AACC97E49B06E3AEDD530502CCDA1806765E9F0E2BCDD04F7506F519706B6DDA`; `plan.md` `D2ABA3693567443065EB0522FB71F01F1A3742B358F406D7C6FBEEF7D70095A3`; role rule `741EC3544797FF8A5BF337E1E3448B5F683823E5229F818F162834400581626E`.
- Read-time shared-control hashes differed because mainline had advanced: registry `556F5319CF141C233FD925C4E1B7DEF210C22700ACFCE9195AEBCB60E0BC438B`; plan `8E635D5599E00C0AB209F3CB71CBF2F72BACAA9290D913E39BA5F955A603C37A`. The assignment's frozen scientific contract was retained; no shared file was modified.
- PRIMARY manifest self `C40852AD9DB8809654E42BDA952EF30302953D6AB850C8B28DCE02D4EFD1246D`; all `4/4` entries independently matched.
- Confirmation handoff `FEF8CF96AC64B9DBD1FE51417BA05F56E758A89EFD406851A48AD0CA96515455`; confirmation manifest self `0C567FCF4CDB0DDE1D58FDAEABF2A8F1D18FC8D8CEB05FE0F4D1A90E5A0583DA`; all `2/2` entries independently matched.
- Pinned LLVM monorepo commit: `a1194be1baefa99d20a09bd04b16056be0ab7225` (2026-07-28). Decision-bearing blob hashes and paths are frozen in `CURRENT_NATIVE_ACTION_AND_CERTIFICATE_AUDIT.md`.
- A revision-time attempt to refetch four pinned raw GitHub files returned transport/cache failures. It was not used to infer absence. The construction uses the already verified pinned first-party source packet and its blob hashes.

## Frozen same object

The object is an acyclic bounded trace at a fixed LLVM X86 MachineIR entrance immediately before register allocation, with:

1. LLVM commit `a1194be1baefa99d20a09bd04b16056be0ab7225`, target triple, CPU/subfeatures, APX component features, optimization level, relocation model, allocator arm, and pass pipeline fixed;
2. fixed semantic MachineIR values, instruction semantics, memory effects, exception behavior, live-ins/live-outs including EFLAGS, fixed/reserved registers, inline-assembly constraints, and trace boundary;
3. fixed x86-64 ABI, caller/callee-save rules, stack/frame, PEI, CFI, and unwind obligations; and
4. output restricted to stock LLVM-compatible native actions and stock MC encoding. Source program, ABI, target features, object format, or assembler contract may not change.

The output is the exact Pareto set of legal realizations in a declared additive vector such as `(text bytes, target-schedule static cost, copies, spill/reload work, save/restore and frame/CFI bytes)`. Candidate analysis CPU and peak RSS are charged in the evaluation ledger, not hidden inside the objective.

## Complete finite current-native action catalog

For a bounded trace, the catalog is compiled from the pinned TableGen/register/MC descriptions and the complete current pass behavior. It includes:

- legacy destructive, REX, REX2/EGPR, EVEX NDD/NF, and compatible LEA forms;
- tied-form recovery, operand commutation, coalescing, partial-write restrictions, copies, split/live-range choices, spill/reload, legal rematerialization, and current allocator consequences;
- subregister aliases and register units; fixed/reserved, byte/high-byte, `NOREX`, `NOREX2`, EGPR, operand-class, tied, early-clobber, implicit use/def, and address constraints;
- EFLAGS production/liveness, relocation suppression, inline-assembly restrictions, caller/callee-save actions, PEI, frame, CFI, unwind, and late compression; and
- current Greedy and PBQP paths plus a preregistered finite set of relevant APX/component/relocation/tuning controls. Target-changing configurations are negative controls, not same-object comparator arms.

Every macro-action has a precondition, a semantic transformer, an exact successor obligation update, and an additive cost label. The current LLVM output is always included as a legal fallback action sequence; therefore the candidate cannot win by omitting production behavior.

## Sound APX suffix certificate

### 1. Labeled state

At trace boundary `i`, a labeled state is

`x_i = (i, sigma_i, spills_i, saved_i, frame_i, cfi_i, flags_i, boundary_i)`.

`sigma_i` maps each labeled live semantic value to a physical register-unit family or its own canonical spill slot. It retains alias occupancy, fixed identities, dirty/save obligations, partial definitions, EFLAGS, and all boundary obligations. A Pareto label `q_i` stores the accumulated declared cost vector and a reconstruction pointer; it is not part of register symmetry.

### 2. Future relation tensor

For every boundary, construct a finite colored relational tensor `H_i` from the pinned target descriptions and the entire remaining suffix. Its universe is physical register-unit families. Its colors and relations encode:

- subregister alias graphs and widths;
- fixed/reserved/live-in/live-out roles and ABI/CFI identities;
- caller/callee-save and save/restore/frame costs;
- every suffix operand class, tied/early-clobber/fixed/implicit constraint;
- byte/high-byte, legacy/REX/REX2/EVEX, `NOREX`, `NOREX2`, EGPR, NDD, NF, addressing, relocation, and inline-assembly legality; and
- the native macro-action transition and declared-cost rows in which each register family participates.

This is a future object, not a current-liveness histogram. Two physical registers that look alike now but differ in any future action or cost obtain different rows.

### 3. Certified transposition classes

For register-unit families `r` and `s`, accept the transposition `(r s)` only if swapping their complete alias families is an automorphism of `H_i`: every color, relation tuple, transition row, successor obligation, and cost label is unchanged. Start from exact relation-row signatures, refine to stability, then explicitly audit each proposed swap against all tuples. A class `C` is admitted only when every transposition within `C` passes; otherwise it is split, conservatively down to singletons.

Let `Gamma_i` be the direct product of the symmetric groups of these certified classes. This deliberately ignores any harder automorphism not generated by certified full classes. Ignoring a true symmetry loses compression but cannot make the quotient unsound. Arbitrary low-GPR/EGPR bank permutations are forbidden.

### 4. Equivalence and bisimulation guarantee

Define `x ~_i y` iff there is a `pi` in `Gamma_i` that maps every register occurrence, alias occupancy, and save obligation of `x` to `y`, while fixing semantic value identities, spill slots, EFLAGS, fixed registers, and non-register obligations. Costs are compared in the Pareto labels and are not renamed.

Because `pi` is certified over the complete suffix transition/cost tensor, for every legal native macro-action `a: x -> x'` there is a renamed action `pi(a): y -> y'` with identical semantics and cost, and `x' ~_(i+1) y'`; the converse holds by `pi^-1`. Thus `~` is a strong declared-cost-preserving bisimulation. It preserves the set and cost of every legal continuation, not merely one next instruction.

### 5. Strict, target-specific example

In a straight-line APX integer suffix with no call, inline assembly, fixed-register use, or relocation, and with two live values constrained only to interchangeable 32-bit caller-clobbered no-REX families, the complete row audit can certify the paired ECX/EDX register-unit families. Swapping ECX and EDX preserves their full alias families, the symmetric reg-reg arithmetic action rows, boundary admissibility, and costs. Two labeled placements then form one orbit. This is a canonical formal-family witness, not a claim that natural LLVM traces frequently retain that class. If the actual row audit splits all classes on natural traces, Stage A kills the contribution.

## Exact orbit-canonical Pareto algorithm

At each boundary, canonicalize a labeled state to the lexicographically least state in its certified orbit. The dynamic program:

1. begins from the exact live-in/ABI state;
2. enumerates every legal catalog macro-action under the fixed finite trace grammar;
3. applies the semantic, alias, spill, ABI/CFI, and cost update;
4. canonicalizes the successor under `Gamma_(i+1)`; and
5. retains all and only nondominated Pareto labels and backpointers per canonical state.

Acceptance requires the exact frozen live-out, semantic, ABI, frame, CFI, and unwind contract. By induction over trace boundaries and the bisimulation lemma, orbit canonicalization neither removes nor invents a legal continuation; ordinary dominance pruning preserves the exact Pareto frontier. This is an exact algorithm, not an approximation claim.

Let `N` be trace length, `R` physical register-unit families, `W` maximum live semantic values, `A` maximum legal macro-actions per retained state, `p` cost dimensions, `Q` the maximum nondominated labels per canonical state, `Z` the finite non-location obligation-state cardinality, `S` the maximum number of quotient states, and `C_can` canonicalization cost. A conservative bound is:

- time `O(N * S * A * (C_can + p * Q^2) + N * R^2 * |H|)`;
- memory `O(S * Q * (W + p) + R^2 * |H|)`;
- labeled fallback `S <= (R + W)^W * 2^R * Z`; and
- for certified classes `C_1...C_K`, an orbit bound `S <= (K + W)^W * product_j(|C_j| + 1) * Z` for location and symmetric save-obligation summaries.

The method is FPT in the explicit parameters `(W,R,Z,p,Q)` for the frozen bounded trace grammar; because x86 has fixed architectural `R`, the deployable concern is the observed quotient frontier, not a false `3^W` claim. Class construction by row refinement plus full transposition audit is `O(R^2 * |H|)` per boundary under an explicit tuple representation. If every class is a singleton, the algorithm degenerates exactly to labeled Pareto enumeration and supplies no publishable compression residual.

## Corrected native action-divergence witness

Freeze a three-address 32-bit add whose post-operation live boundary contains `EAX` (destination), `EDX` (source 1), `ECX` (source 2), and the arithmetic EFLAGS. The destination interferes with both sources and is distinct from both. EAX/ECX/EDX are all in LLVM's traditional `GR32_NOREX` set. The operation is register-register, with no memory, relocation, fixed-register, partial-write, or inline-assembly side condition.

Two legal same-semantics realizations are:

1. `addl %ecx, %edx, %eax` as APX NDD. From the pinned official MC row `addl %ecx, %edx, %r10d` with bytes `62 f4 2c 18 01 ca`, changing only the encoded NDD destination field to EAX derives `62 f4 7c 18 01 ca`: 6 bytes.
2. `movl %edx, %eax` (`89 d0`) followed by `addl %ecx, %eax` (`01 c8`): 4 bytes and one extra instruction/copy.

This encoding tuple is labeled `DERIVED_PINNED_MC_ENCODING__STAGEA_REPLAY_REQUIRED`; it was not assembled in this revision. The move preserves incoming flags; the destructive add produces the same arithmetic flags as NDD; EDX and ECX survive; EAX carries the same sum. Current compression cannot tie the destination to either live source, commutation cannot expose a dead source, and EFLAGS liveness blocks both ADD-to-LEA and NF substitution. The witness therefore separates `(bytes, instruction/copy count)` actions while preserving the same MachineIR values and boundary. It does not establish that current LLVM misses the better point on a natural function.

## Comparator and degeneration map

| Comparator | Complete action/guarantee role | Residual after subtraction |
|---|---|---|
| `LLVM-CURRENT-COMPLETE` | Complete production chain and one scalar output | Does not document an exact Pareto frontier or certified suffix-state reduction |
| `LLVM-SCALAR-TUNING-GRID` | Finite same-input allocator/APX/tuning controls | Subtracts ordinary cost tuning; cannot claim an exact frontier |
| `UNISON-SAME-TRACE` / generic exact model | Integrated generic instruction/register optimization | Absorbs a generic CP/ILP encoding; candidate survives only through the APX relation-tensor certificate and parameterized algorithm |
| `LABELED-PARETO-DP` | Same catalog without quotient | Exact semantic comparator and degeneration case | Candidate must show a nontrivial certified orbit and useful state reduction |
| `EXHAUSTIVE-MICRO-ORACLE` | Enumerates tiny traces | Correctness oracle only | Must agree exactly; never counted as a production baseline |

The claim fails if the candidate merely invokes a generic solver, enumerates identities, tunes scalar weights, modifies the emitter, or selects an existing LLVM output. The acceptable paper kernel is the target-table-derived complete-future bisimulation and exact APX-specific Pareto construction.

## Finite Stage A fidelity and killer route

Before any claim-bearing observation, Stage A must:

1. pin/build the stated LLVM commit and emit a hash-complete native action table from TableGen, register info, current APX passes, and MC;
2. replay the corrected witness with `llvm-mc`/`llvm-objdump`, MachineVerifier, and an independent arithmetic/flags equivalence check;
3. enumerate tiny traces (for example `W <= 4` over a fixed register subset), compare labeled and quotient frontiers exactly, and reject on the first merged pair with a different successor/action-cost multiset;
4. compare candidate, labeled DP, complete LLVM, finite tuning grid, and generic exact subtractor on the same trace, budget, semantics, and full-cost ledger; and
5. only then extract a frozen public LLVM test-suite/regression corpus and report certified-class incidence, state/frontier reduction, compile CPU/RSS, bytes, target-schedule cost, copies, spills, saves, frame/CFI, verification failures, and fallback.

Preclaim fidelity fails closed on any native-catalog omission, encoding mismatch, semantic/ABI/CFI mismatch, or oracle disagreement. The scientific direction stops if all natural suffix classes are singleton, quotient reduction is immaterial (preregistered threshold: under 10% states on at least 90% of eligible traces), the complete current union exposes the same frontier, or candidate full cost removes every Pareto residual. A positive micro witness is preliminary non-falsification only.

## Structural paper potential vs current readiness

- Structural paper potential: conditional `TIER_B_Q2_VIABLE`. If the exact quotient remains nontrivial on natural traces and exposes full-cost Pareto points beyond the complete current union, the result is a target-specific compiler N2 with a formal algorithmic core.
- Current readiness: medium-low. The source/catalog route is public and finite, but the derived MC tuple, complete tensor extractor, oracle agreement, natural class incidence, and benefit are unexecuted.
- Claim ceiling: an APX bounded-trace exact Pareto algorithm and certified state-reduction result. No whole-CFG, universal register-allocation, runtime-speedup, or Q1 claim is justified.
- Resource status: no blocker. Lack of APX hardware does not prevent Stage A semantic, encoding, static-cost, or compile-cost falsification.

## Revision decision

`SOUND_APX_TRACE_QUOTIENT_CERTIFICATE` is statically closed without changing the object, workload, target, or guarantee. The revision replaces the unsound arbitrary bank quotient with a conservative complete-future action/cost bisimulation, corrects the action witness to satisfy EFLAGS/source/destination/no-REX conditions, states an honest exact algorithm and complexity, and freezes a finite fidelity killer. Therefore the recommendation is `RECOMMEND_STAGE0_PASS_FOR_CLOSING_REVIEW`, conditional `TIER_B_Q2_VIABLE`, pending independent D-root closing confirmation. Stage A and Stage B remain false.

