# LLVM APX Prefix-Pressure ParetoDP — Stage 0 Revision-Final Closing

## Assignment and decision

- Assignment: `STAGE0-C2-20260811-LLVM-APX-PREFIX-PRESSURE-PARETODP-REVISION1-CLOSING-V8.7`
- Topic: `LLVM-APX-PREFIX-PRESSURE-PARETODP`
- Role: independent `STAGE0_CLOSING_CONFIRMATION`
- Review date: `2026-08-11`
- Revision budget: `1/1 CONSUMED`
- Second revision authorized: `false`
- Stage A/B started or authorized: `false / false`

## Mechanical closing decision

`CONFIRM_STAGE0_PASS`

- SENTRY disposition: `CONFIRM`
- Quality tier: `TIER_B_Q2_VIABLE`
- Confidence: `0.86`
- Evidence ceiling: `STATIC_APX_SUFFIX_BISIMULATION_AND_DERIVED_ENCODING_ACCEPTED__NO_NATIVE_REPLAY_IMPLEMENTATION_NATURAL_OR_FULL_COST_RESULT`
- Latest-collision status: `SEARCH_BOUNDED_OPEN`

Revision1 repairs the two defects that justified `REVISE_ONCE`. The witness now freezes live arithmetic EFLAGS, both live sources, a destination distinct from both, and the traditional no-REX 32-bit register subset. The state reduction no longer assumes a low-GPR/EGPR bank symmetry: it accepts only whole-register-family transpositions that preserve the complete boundary-indexed suffix action, successor-obligation, ABI/CFI, and declared-cost relation. Singleton fallback makes the quotient conservative. Strong cost-preserving bisimulation then supports an exact orbit-canonical Pareto DP over the declared bounded trace grammar.

This is a conditional compiler-algorithm N2, not evidence that LLVM currently misses a natural benefit. The NDD byte tuple is explicitly `DERIVED_PINNED_MC_ENCODING__STAGEA_REPLAY_REQUIRED`; no assembler, MachineVerifier, candidate, experiment, or benchmark was run in this closing. Natural orbit incidence, frontier reduction, current-union residual, and full-cost value remain Stage A killers.

## Scope and integrity

The closing review read the frozen project controls/rule and the assigned revision1 minimum package. It did not read another candidate, start additional retrieval, run native code, modify shared files, or create Stage A/B.

Frozen control hashes all matched at read time:

| Control | Expected and observed SHA256 |
|---|---|
| `AGENTS.md` | `66231F71EF6AB250A1AD9FF576D5840978F09EFC03BF5D2F0527D47F4D82B063` |
| `plan.md` | `C12B4E1566E6AF3DD024CF6FAFB739E1F9B78E26316E4F1221EC41FCBB5A1EA6` |
| `registry.yaml` | `1B5E2C348C0D7F401FAE1DB31A2BADD7BA925607BE0702AAF965F6744D8A2D11` |
| `rules/ROLE_STAGE0_REVIEW.md` | `741EC3544797FF8A5BF337E1E3448B5F683823E5229F818F162834400581626E` |

The supplied revision1 package independently passed `4/4` manifest verification:

| Artifact | SHA256 | Result |
|---|---|---|
| `REVISION_REPORT.md` | `D1B180752CE18ED00FA911DA3A6528E18A58AB66197F6D7126F5612A772B9359` | PASS |
| `CURRENT_NATIVE_ACTION_AND_CERTIFICATE_AUDIT.md` | `16981C39F1AF4480591ADAE666B978CBF5F1FFCC23090299B0FB24C38DD8A2C6` | PASS |
| `CLAIM_MATRIX.md` | `149A9D3F39AD2D3A014292CCA68C6BD1D4AF4317CE3DC494094B9C82FD97BBEA` | PASS |
| `handoff.yaml` | `16D01A2DADFD236C2B411CF3C2FFD06A11ED51A8D8928BD2C3AAD4170AA53DC5` | PASS |
| manifest self | `BE4B0A5EC3E16764760ABEBD1B67CDDBD206884DE630349C6D267A0382D3B508` | PASS |

## Academic re-review configuration

- Workflow: `academic-research-suite / re-review verification`
- Field: compiler optimization, register allocation, and x86/APX code generation
- Contribution paradigm: target-specific exact algorithm and formal state-reduction certificate
- Target floor: credible Q2 paper potential
- Maturity: Stage 0 revision-final closing
- Evidence policy: static proposition and finite fidelity route; no implementation or positive-result prerequisite

This verification round used the same active model family as the revision workflow may have used; correlated judgment error is therefore possible. No cross-model adjudication was requested or performed. The decision rests on explicit definitions, counterexamples, and frozen falsifiers rather than stylistic agreement with the revision.

## Priority-item verification record

| Closing obligation | Status | Independent finding |
|---|---|---|
| Corrected EFLAGS/source/destination/NOREX witness | `FULLY_ADDRESSED_AT_STAGE0` | EAX/EDX/ECX permit the stated two-byte legacy MOV and ADD; both sources live and destination interference prevent destructive tying after commutation; live arithmetic flags block LEA and NF substitutions. The NDD bytes remain derived, not executed. |
| Complete-suffix certified transposition bisimulation | `FULLY_ADDRESSED_AT_STAGE0` | A swap is admitted only if it preserves every boundary-indexed suffix constraint, transition row, successor obligation, and declared cost. Failure to map a successor into the next boundary's certified relation rejects the swap. Singleton fallback prevents unsafe merging. |
| Orbit-canonical Pareto DP exactness | `FULLY_ADDRESSED_AT_STAGE0` | Strong cost-preserving bisimulation plus within-canonical-state Pareto dominance preserves all legal continuation frontiers and backpointers. The guarantee is restricted to the declared finite grammar and additive cost vector. |
| Complexity and generic-solver boundary | `FULLY_ADDRESSED_AT_STAGE0` | The report exposes `R,W,Z,p,Q,S,A,C_can`, admits exponential labeled fallback and singleton degeneration, and makes no polynomial/practicality claim. Publishable residual is conditional on APX-specific certified compression, not generic enumeration. |
| Derived encoding evidence ceiling | `FULLY_ADDRESSED_AT_STAGE0` | `62 f4 7c 18 01 ca` is a pinned-row field derivation only. The packet consistently requires Stage A `llvm-mc`/`llvm-objdump` replay and semantic verification. |
| Strongest union, collision and full cost | `FULLY_ADDRESSED_AT_STAGE0` | Current LLVM, finite tuning, Unison/generic exact solving, labeled DP, and exhaustive micro-oracle are all represented. `SEARCH_BOUNDED_OPEN` is honest; solver CPU/RSS and the complete compiler/output ledger are frozen. |

No item is `PARTIALLY_ADDRESSED`, `NOT_ADDRESSED`, or `MADE_WORSE` at the Stage 0 proposition level.

## Independent technical attack

### 1. Corrected native witness

The witness fixes a post-add live boundary containing destination `EAX`, source values in `EDX` and `ECX`, and arithmetic EFLAGS. The destination is distinct from and interferes with both sources. The operation has no memory, relocation, inline-assembly, fixed-register, or partial-write side condition.

Two same-semantics realizations are declared:

1. APX NDD `addl %ecx, %edx, %eax`, derived as six bytes `62 f4 7c 18 01 ca` from the pinned official row whose only changed encoded field is the NDD destination;
2. legacy `movl %edx, %eax` (`89 d0`) followed by `addl %ecx, %eax` (`01 c8`), four bytes and one extra instruction/copy.

The legacy MOV leaves flags unchanged and the following ADD produces the same arithmetic flags as the ordinary NDD ADD. Both sequences preserve EDX and ECX and produce the same EAX value. Since both original sources remain live, neither can be coalesced into the new destination without violating interference; commutation only exchanges two still-live sources. Since produced EFLAGS are live, ADD-to-LEA and no-flags substitution are not same-object actions. EAX/ECX/EDX are all in the pinned `GR32_NOREX` class, so the legacy two-byte sizes are coherent.

The static legality argument therefore closes the earlier witness defect. It does not elevate the NDD bytes to observed output. Any native encoding, operand-order, liveness, verifier, or flags-equivalence mismatch in Stage A kills this certificate.

### 2. Complete-suffix relation and cross-boundary closure

The decisive soundness condition is stronger than equal current pressure or register class. At boundary `i`, `H_i` contains physical register-family colors and all relations needed by the remaining suffix: alias/subregister structure, fixed and ABI roles, save/frame costs, every later operand and encoding constraint, native macro-action transition rows, successor obligations, and cost labels.

A transposition `(r s)` is accepted only after full tuple audit shows it is an automorphism of this complete boundary-indexed object. The phrase “complete suffix” must be read mechanically: the tensor includes the identity of each future boundary and the relation that maps every current action to its successor state. Consequently, an accepted action `a: x -> x'` must have a same-cost renamed action from the swapped state and the resulting pair must be related by the certified relation used at boundary `i+1`. If the next-boundary relation does not contain that pair, the original swap fails certification rather than being used for canonicalization.

This condition prevents a subtle but fatal error: a swap may look symmetric before an instruction yet cease to be symmetric after a fixed-register or ABI obligation becomes active. The revision's explicit complete-transition/successor audit and singleton fallback cover this case at the definition level. Stage A must materialize this check; a row-signature heuristic alone is insufficient.

Pairwise certification of every transposition within one disjoint class is sufficient to generate that class's full symmetric group. Conservatively splitting a class can lose compression but cannot invent a legal continuation. Arbitrary low-GPR/EGPR bank permutations remain forbidden.

### 3. Exact orbit-canonical Pareto DP

For every legal catalog action, the DP applies its semantic, alias, spill, save/frame/CFI, and additive-cost transformer, then canonicalizes the successor under the certified group for the next boundary. If `x ~ y`, strong cost-preserving bisimulation gives a same-cost continuation in both directions for every suffix path. Therefore:

- replacing a labeled state with one orbit representative neither removes nor creates a reachable legal plan;
- Pareto dominance between labels attached to the same canonical state is safe because their future feasible set and incremental cost set are identical; and
- exact live-out/ABI/frame/CFI/unwind acceptance plus backpointers recovers the same Pareto frontier as labeled enumeration.

The result is exact only for the frozen bounded trace grammar and declared additive vector. Target-schedule static cost must be represented by an additive state/transition label; a hidden history-dependent term must be added to state or causes fidelity failure. Planner time and memory are evaluation costs, not silently included in the mathematical frontier.

### 4. Complexity honesty

The stated running time `O(N*S*A*(C_can + p*Q^2) + N*R^2*|H|)` is an output-/state-sensitive ceiling. `S` and `Q` may be exponential. The labeled fallback bound and mandatory singleton degeneration explicitly admit no compression. The claimed parameterization is meaningful only when all non-location obligation modes are charged to finite `Z`, macro-action enumeration/canonicalization are charged through `A` and `C_can`, and cost dimension/frontier size remain explicit.

The class-product orbit bound is not needed for correctness and must not be presented later as a practical theorem unless dirty/save/restore, alias, fixed, and spill modes are all counted in `Z` or the class summary. With that ceiling, the construction is honest: it offers exact certified reduction when target tables expose it and degenerates to labeled Pareto enumeration otherwise.

### 5. Target-specific N2 versus generic symmetry solving

Symmetry quotienting, graph automorphisms, Pareto DP, CP, and ILP are generic techniques. They cannot alone sustain this paper. The residual is the conjunction of:

1. a complete current LLVM/APX action and cost catalog for the frozen pre-RA trace;
2. a compiler from X86 target/register/MC/pass constraints and a complete trace suffix into a mechanically auditable action/cost relation tensor;
3. conservative whole-family transposition certificates with successor-closure evidence;
4. exact orbit-canonical Pareto construction over APX form, allocation, copies, spills, saves, frame and encoding cost; and
5. a measurable natural regime with non-singleton certified classes, meaningful state/frontier reduction, and a full-cost residual beyond current LLVM and generic exact solving.

Unison or an equivalent same-trace exact solver absorbs a generic integrated optimization claim. Labeled Pareto DP absorbs exact enumeration without the quotient. Current LLVM and its finite tuning union absorb APX action availability and scalar heuristic selection. Thus Stage 0 PASS is conditional on the target-specific certificate and later natural compression; if implementation is merely a generic solver with symmetry-breaking clauses, the preregistered sentinel fires.

### 6. Current strongest union and latest collision

The comparison set is appropriately strong for Stage 0:

- complete pinned LLVM X86 selection/allocation/coalescing/spill/PEI/compression/MC output;
- a preregistered finite same-input LLVM allocator/APX/relocation/tuning grid;
- Unison or an equivalent generic same-trace exact formulation with solver CPU/RSS charged;
- exact labeled Pareto DP over the same action catalog; and
- exhaustive tiny-trace enumeration as correctness oracle only.

No current component is claimed absent merely because a transfer failed. The accepted revision packet identifies no same-object equal-guarantee direct absorber and retains `SEARCH_BOUNDED_OPEN`. Stage 0 permits that bounded-open state; a later direct collision is a scientific killer.

### 7. Full-cost and natural falsifiability

The ledger covers compile CPU/RSS, candidate tensor/canonicalization/frontier cost, text/object and prefix bytes, copies, spills/reloads, save/restore, frame/CFI, target static cost, verification, and fallback. Runtime cycles are optional evidence when appropriate hardware exists, not a prerequisite for initial fidelity.

The natural route uses frozen public LLVM test-suite and integer-pressure regression functions. It reports eligible traces, certified class sizes, labeled versus quotient states/frontiers, compile overhead, output costs, failures, and fallbacks. The declared killer—less than 10% state reduction on at least 90% of eligible traces, all-singleton behavior, same frontier from the complete current union, or loss of every residual under full cost—is specific enough to distinguish algorithmic potential from implementation maturity.

## New-issue scan

No new Priority-1 structural failure was introduced. Four bounded risks remain:

1. `H_i` may be large enough to approach the labeled transition system; finiteness proves soundness, not practicality.
2. The illustrative orbit bound must account for every obligation mode through `Z`; only the broader output-sensitive bound is currently safe.
3. The NDD bytes and native MIR witness are derived rather than replayed.
4. Genericity and direct-collision risk remain high until natural APX-specific certified compression and full-cost residual are observed.

These are precisely frozen Stage A proof/fidelity/empirical killers. None establishes direct absorption, same-object failure, or formal impossibility. `INCONCLUSIVE_POLICY_HOLD` is unnecessary because the static proposition is defined and the unresolved obligations have a finite preclaim route. A second Stage 0 revision is neither needed nor authorized.

## Frozen first Stage A preclaim fidelity gate

No claim-bearing natural observation may be used before all of the following pass:

1. **Complete native catalog.** Pin source/build/target/pass hashes and extract every relevant form, register unit, constraint, allocator, spill/rematerialization, ABI/PEI/CFI, relocation, compression, MC, and finite control arm. Prove current LLVM output has a catalog path.
2. **Native witness replay.** Materialize the fixed MIR liveness/interference boundary; assemble/disassemble both forms; run MachineVerifier and an independent value/EFLAGS/live-out/ABI check; require exactly the frozen bytes or revise evidence downward and stop if the divergence disappears.
3. **Transposition successor audit.** For every admitted swap and every tiny reachable state/action, compare legal action, successor-obligation, next-boundary equivalence, and declared-cost multisets. The first mismatch kills the quotient.
4. **Exact frontier oracle.** Exhaustively compare labeled DP, orbit DP, and micro-oracle at every boundary and canonical state, including every Pareto point and reconstructed plan—not only final minima.
5. **Comparator parity.** Use identical traces, features, budgets, semantics, objectives and cost ledger for current LLVM, finite tuning, generic exact solver, labeled DP, and candidate.
6. **Complexity accounting.** Report tensor construction, tuple audit, canonicalization, frontier comparison, backpointers, CPU, peak RSS, `S`, `Q`, fallbacks, and every mode included in `Z`.
7. **Natural compression/full-cost killer.** Freeze 10–20 or more public eligible functions before results and apply the declared class-incidence, state-reduction, complete-union-frontier, and full-cost thresholds without post hoc filtering.

Scientific STOP conditions are: any catalog omission or illegal action; any supposedly equivalent states with different future action/successor/cost sets; native witness failure or current-union absorption; any orbit/labeled/oracle frontier mismatch; all-singleton or threshold-failing natural behavior; generic-solver collapse; a complete-current-union identical frontier; no full-cost residual; or a direct same-object equal-guarantee collision.

## Claim ceiling and final closing statement

Allowed now is only a conditional Stage 0 statement: the revision defines a same-object bounded-trace APX-specific exact Pareto optimizer modulo a conservative complete-suffix action/cost bisimulation, with credible Q2 paper potential and a finite falsification path.

Not allowed now: native bytes were executed; an implementation or proof-complete extractor exists; natural LLVM traces exhibit useful orbits; compile time, code size, target cost, or runtime improves; the current strongest union is beaten; collision search is closed; the algorithm handles arbitrary whole CFGs; or Q1 potential is established.

The final recommendation is `CONFIRM_STAGE0_PASS / TIER_B_Q2_VIABLE`. Mainline alone may register the Stage 0 transition and decide whether to issue a separate Stage A assignment. This closing creates or starts neither Stage A nor Stage B.

Lane post-handoff state: `IDLE_REUSABLE_AWAITING_MAINLINE`.
