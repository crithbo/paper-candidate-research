# Source Audit — GCC-GENAUTOMATA-CFG-JOIN-RESERVATION-STATE-UNION

## Scope and ceiling

- Cutoff: 2026-08-15.
- Mode: independent Stage0 PRIMARY, E1 static only.
- No source tree, paper, binary or dataset was persisted; no build or experiment ran.
- Network retrieval was bounded at the assignment limit. Unclosed newest-paper collision is `SEARCH_BOUNDED_OPEN`; 429/404/transport outcomes are not absence evidence.

## Current upstream pin

| Item | Locator | Pin/result | Role |
|---|---|---|---|
| Official GCC git | `https://gcc.gnu.org/git/gcc.git` | HEAD `af0cf36fb47a704a02dd2ead5f8db5d140e45351` | authoritative commit identity |
| GCC GitHub mirror | `https://github.com/gcc-mirror/gcc.git` | same HEAD | exact-commit blob transport |
| Main source | `https://raw.githubusercontent.com/gcc-mirror/gcc/af0cf36fb47a704a02dd2ead5f8db5d140e45351/gcc/genautomata.cc` | exact commit | current generator/action audit |
| GCC Internals | `https://gcc.gnu.org/onlinedocs/gccint/Processor-pipeline-description.html` | current official docs at cutoff | stock recognizer semantics/options |

The official git endpoint and mirror independently returned the same commit. An official web blob route returned HTTP 429 and a googlesource route returned 404; the review therefore uses the identical mirror commit for source transport without treating either failure as scientific evidence.

## Decisive current-source findings

1. The `genautomata.cc` top-level limitation still says union automaton states are not generated and identifies more accurate interlock scheduling at a joint CFG point as the intended need.
2. The same file contains a `states_union` helper. Its context is reservation-state union during NDFA/alternative construction; it is not evidence that GCC propagates an exact set of recognizer states over a program CFG join.
3. The current generator contains deterministic/NDFA construction, determinization/minimization paths, `state_transition`, and full/comb table emission.
4. Relevant action controls include default deterministic construction and non-default `ndfa`, `collapse-ndfa`, `no-minimization`, and `no-comb-vect`. Timing/stats/verbosity/progress controls do not add scientific actions.
5. `genautomata` is a target-machine-description generator. The fixed program CFG is consumed later by the scheduler/recognizer interface. Representing all possible predecessor recognizer states at a program join therefore induces a set-of-`Q` domain over the generated transition system.

## Complete-enough current action union

| Layer | Current actions/configurations | Coverage conclusion |
|---|---|---|
| Target reservation description | fixed `.md` reservations/alternatives/bypasses | object semantics |
| Generator construction | deterministic and NDFA paths | covered |
| State reduction | minimization/no-minimization; NDFA collapse | covered |
| Representation | comb-vector/full-vector choice | covered |
| Recognizer relation | generated state transition/deadlock/delay interface | covered |
| Scheduler use | stock recognizer state update under fixed CFG | complete enough for Stage0 boundary; exact CFG state-set join not found |
| Internal union helper | `states_union` in generator construction | adjacent absorption only, not fixed candidate relation |

## Natural carrier and witness audit

- Deterministic selection route: current AArch64 in-tree scheduler tests, fixed `-mcpu=neoverse-v2`, beginning with `gcc/testsuite/gcc.target/aarch64/dispatch_sched_1.c`.
- Result: the selected public test exercises DFA lookahead/dispatch scheduling but does not expose the required natural two-predecessor CFG join with two auditable lawful reservation states. It is therefore rejected as the candidate witness.
- Exact target reservation `.md` + matching natural two-predecessor regression was not closed within the bounded retrieval budget. Status: `SEARCH_BOUNDED_OPEN`.
- Scientific consequence: none by itself. The STOP does not infer nonexistence; it assumes the strongest case that two distinct reachable predecessor states do exist and attacks the algorithmic residual under that assumption.

## Formal label-stripping reduction

For any stock generated recognizer with states `Q`, instruction alphabet `A`, and transition relation/function `δ`, a two-predecessor exact join is `S={q1,q2}⊆Q`. The frozen pointwise lift computes successor sets from `δ(q,a)` for every `q∈S`, with the frozen all-path legality rule. Repeated joins form the reachable powerset domain. Any safe merge/cap is an abstraction `α:2^Q→D` whose soundness is ordinary over-approximation of the collecting semantics.

Delete these labels:

| GCC label | Generic replacement |
|---|---|
| reservation state | DFA state |
| instruction reservation | alphabet symbol/action |
| stock hazard transition | transition relation |
| CFG join | dataflow join |
| certified state coarsening | abstract-domain merge |
| generated recognizer table | transition table |

No state variable, recurrence, proof obligation, asymptotic bound, exactness claim, or precision-space guarantee changes. Bounded join width/set cardinality merely yields the standard bounded powerset frontier; it does not create GCC-specific FPT structure. This exactly satisfies the frozen generic-reduction STOP predicate.

## Primary literature and collision classification

| Source | Locator | Classification | Why |
|---|---|---|---|
| Makarov, 2003, *The Finite State Automaton Based Pipeline Hazard Recognizer and Instruction Scheduler in GCC* | `https://gcc.gnu.org/projects/summit/2003/Automaton_Scheduler.pdf` | strong same-genealogy subtractor | explicitly identifies union states and state explosion; does not by itself prove current native implementation |
| GCC Internals processor pipeline description | `https://gcc.gnu.org/onlinedocs/gccint/Processor-pipeline-description.html` | current semantics/config authority | fixes native generated recognizer and action controls |
| GCC 2006 User Summit proceedings, VLIW/interblock scheduling material | `https://gcc.gnu.org/projects/summit/2006-GCC-User-Summit-Proceedings.pdf` | adjacent | interblock scheduling, not exact action/guarantee coverage |
| Generic powerset/collecting semantics | formal mechanism family | fatal formal absorption | exact action/guarantee preserved after label stripping |
| Abstract interpretation/state-set compression/table synthesis | formal/algorithm family | fatal formal absorption | certified coarsening/frontier/emission are generic |
| Latest same-object paper search | bounded queries at cutoff | `SEARCH_BOUNDED_OPEN` | no absence inference |

## Full-cost audit

Required denominator is complete and non-negotiable:

- generator CPU, RSS and temporary storage;
- number of reachable set states and construction work;
- generated source/object/table bytes;
- compiler scheduling time and memory;
- recognizer transition runtime;
- precision loss, schedule quality and downstream code-quality effects;
- cap/no-gain/state-explosion regions.

No cost was measured. This absence only fixes the E1 ceiling; it is not used as negative evidence. Even a favorable full-cost result would not repair the formal generic-reduction failure under the frozen N2 gate.

## Integrity conclusion

- Current-native exact CFG join relation: not established; source gap remains plausible.
- Direct paper collision: not claimed closed.
- Generic formal absorption: established from the frozen action and guarantee.
- Decision support: sufficient for `STOP / BELOW_Q2_STOP` without implementation or outcome evidence.
