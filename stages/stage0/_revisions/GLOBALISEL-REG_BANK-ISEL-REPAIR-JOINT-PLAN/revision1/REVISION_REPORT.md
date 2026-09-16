# GLOBALISEL-REG_BANK-ISEL-REPAIR-JOINT-PLAN — Stage 0 revision 1

## Decision

- **Recommendation:** `RECOMMEND_STAGE0_PASS_FOR_CLOSING_REVIEW`
- **Tier if independently confirmed:** `TIER_B_Q2_VIABLE`
- **Revision:** `1/1 CONSUMED`
- **Atomic gate:** `PINNED_RBI_ACTION_CATALOG__NONLOCAL_BOUNDED_REGION_CERTIFICATE`
- **Evidence ceiling:** `STATIC_NATIVE_ACTION_CERTIFICATE__NO_BUILD_NO_PERFORMANCE_CLAIM`
- **Stage A/B:** not authorised.

The gate is closed at the static level.  This is not a claim that the proposed
planner improves final code on a corpus.  It establishes a pinned same-GMIR,
target-legal, nonlocal action divergence; a bounded target-specific algorithm
with an exact declared-cost frontier; and a finite route that can falsify the
bridge to complete downstream cost before any claim-bearing measurement.

## Single proposition and its falsifier

**Proposition.**  On the pinned AArch64 contract below, a bounded region of
legalized SSA GMIR has two legal complete bank/repair plans.  Current Fast and
Greedy plus all source-defined `RepairingPlacement` actions select or repair
the local GPR-first plan; they do not construct the lower declared-cost
FPR-first plan.  `A64-RBI-FDP`, a finite frontier DP over the complete
region-action grammar, contains the latter plan and is exact for the declared
RBI/repair/planner cost vector on the stated region family.

**Pre-registered counterexample.**  The proposition fails if replay against
the pinned source shows any of: (i) a listed mapping is rejected by the
machine verifier, (ii) Fast/Greedy or a legal stock control emits the FPR-first
frontier member, (iii) a legal `RepairingPlacement` revises the already
processed mapping so as to construct that member, (iv) a suffix action is not
represented by the state in the action audit, or (v) the full downstream ledger
has no nondominated candidate point.  Items (i)--(iv) refute the static
certificate; item (v) stops the frozen mechanism at its Stage-A preclaim gate.

## Immutable same-object pin

| Field | Frozen value |
|---|---|
| LLVM source | `llvm-project` commit `ba5bccfe01368f76e74d6ff4c35f1330e155b4ba` (main tip observed 2026-08-12; immutable Git object) |
| RBI implementation | `llvm/lib/Target/AArch64/GISel/AArch64RegisterBankInfo.cpp` and generated AArch64 register-bank tables at that commit |
| Selector implementation | `llvm/lib/CodeGen/GlobalISel/RegBankSelect.cpp` at that commit |
| Target and ABI | `aarch64-unknown-linux-gnu`, AAPCS64, `+neon`, fixed data layout and no change to IR, GMIR, ABI, diagnostic or code-generation contract |
| Pipeline | legalised SSA `MachineFunction` -> RegBankSelect Fast or Greedy -> InstructionSelect -> unchanged RA, scavenger, frame, scheduling, post-RA and MC/link stages |
| Candidate domain | reducible, tree-decomposition width at most `w`, only the action grammar in `CURRENT_ACTION_AND_CERTIFICATE_AUDIT.md`; values crossing its boundary retain their LLVM vreg identity and bank interface |

The commit page is a first-party immutable source.  The current branch was
also inspected on 2026-08-14; the relevant AArch64 RBI and RegBankSelect
actions are present.  A transient `git ls-remote` TLS failure was not used as
an absence claim or a scientific negative.

## Same-MIR action-divergence witness

The witness is a straight-line, width-two region in a legalised SSA
`MachineFunction`.  `%pa`, `%pb` are pre-existing `s64` GPR address live-ins;
`%q` is a pre-existing `s64` FPR-bank value feeding the same fixed FPR sink as
`%r`.  LLT scalar widths do not encode signedness or floating-point category;
the `G_FADD` opcode fixes the FPR operation.  No value, address, CFG edge,
ABI-facing result or downstream consumer is changed.

```text
  %a:_(s64) = G_LOAD  %pa
  %b:_(s64) = G_LOAD  %pb
  %x:_(s64) = G_OR    %a, %b
  %r:_(s64) = G_FADD  %x, %q
  ; fixed FPR-bank continuation/sink outside the region
```

The pinned RBI catalog gives each `G_LOAD s64` a cost-1 GPR-result mapping and
a cost-1 FPR-result mapping, with the address remaining GPR.  `G_OR s64` has
cost-1 all-GPR and all-FPR alternatives.  The FPR operation has the fixed FPR
mapping.  The source-defined GPR-to-FPR repair cost is 5; all conversions here
are one-piece, materialisable repairs.

| Complete plan | Loads | OR | FADD input | Declared mapping + repair cost | Status |
|---|---|---|---|---:|---|
| `P_local` | GPR, GPR | GPR | insert one GPR->FPR repair for `%x` | `4 + 5 = 9` | Fast/Greedy result |
| `P_joint` | FPR, FPR | FPR | already FPR | `4 + 0 = 4` | candidate frontier member |

`P_joint` is not an invented instruction or an unavailable target action:
every mapping is named in the pinned AArch64 RBI.  The output selector,
legality, executable semantics and all non-region pipeline stages are the
same.  The difference is the coupled choice of the two load/OR mappings before
the FPR consumer forces a repair.

## Why the full stock union does not reproduce this plan

The current selector walks in reverse postorder and processes instructions in
their block order.  For each MI, Greedy calls `getInstrPossibleMappings` and
updates its choice only if `CurCost < Cost`, not on an equal cost.  The AArch64
catalog appends GPR then FPR for the two load alternatives.  Thus each initially
unconstrained load is committed to GPR on the equal-cost tie.  At `G_OR`, the
all-FPR mapping requires two already-GPR operand repairs and is locally more
expensive, so Greedy preserves GPR.  At the FPR consumer, the source code
creates a local repair insertion/reassignment decision; it does not revisit
the previously applied `G_LOAD`/`G_OR` mappings.  Fast takes the target default
mapping, which is likewise GPR for this scalar non-floating load/OR path.

`RepairingPlacement` is included, rather than assumed away: it may reassign a
simple unassigned operand, insert a materialisable repair, split a CFG edge or
declare an action impossible.  In this witness it can materialise the final
GPR-to-FPR repair, but it has no action that rolls back the three already
applied mapping choices into `P_joint`.  No documented Fast/Greedy control
reorders the AArch64 mapping vector or enables the historical not-implemented
Global mode.  Hence the candidate is outside—not a relabelling of—the complete
current RBI action union for this pinned witness.

## Certified bounded-region algorithm

`A64-RBI-FDP` works only on the declared action grammar and delegates every
other instruction/region to the unchanged stock union.  For a nice tree
decomposition, the frontier state at bag `t` is

`S_t = (B_t, R_t, I_t, H_t, C_t)`

where `B_t` maps each live boundary vreg to `{GPR,FPR}`; `R_t` records for each
boundary use the complete repair status `{none,reassign,insert,edge/split}`;
`I_t` holds target operand mapping IDs and materialisability/PHI/terminator
facts; `H_t` is the fixed downstream interface summary (boundary LLTs,
vreg identities, ABI class and the ordered emitted repair signature); and
`C_t` is the additive declared full-cost prefix
`(RBI MappingCost local/nonlocal, repair implementation cost, planner CPU/RSS
charge, emitted-copy count)`.  Candidate plans are compared only when all of
`B,R,I,H` agree; this prevents a hidden change of future legal action or output
interface.

Introduce nodes enumerate the *target-supplied* alternatives; forget nodes
charge repairs whose last use leaves the boundary; join nodes require equality
of all interface facts and add only disjoint internal costs.  A state is pruned
only by componentwise domination with the same future-action interface.  The
recurrence is exact for the declared static cost frontier.  With at most four
AArch64 alternatives and four repair statuses, its running time is

`O(n * 4^(w+1) * 4^(c(w+1)) * poly(w))`,

where `c` is the bounded number of operand/edge repair facts per boundary MI;
space is the corresponding frontier size.  This is target-specific FPT in
the declared width/action interface, not an ILP/CP invocation, bank-identity
enumeration or scalar Greedy retuning.  Its no-gain boundary is explicit:
only one legal mapping, width/action cap exceeded, unmaterialisable repair, or
an interface frontier already matched by stock delegates to stock with no
quality claim.

The exact guarantee deliberately stops at the pre-ISel, target-RBI declared
cost.  Final RA/scheduling/frame/MC effects are **not** claimed exact by this
static theorem.  They remain in the charged full-cost ledger and are made a
mandatory finite Stage-A falsifier.  `H_t` preserves every frozen interface
fact needed to replay those unchanged downstream stages; it is not a proxy
result or a substitute for them.

## Finite Stage-A preclaim fidelity/killer

Before any claim-bearing observation, use the same commit/target/options and
freeze no more than 20 public AArch64 GlobalISel-supported bounded regions.
For every region, a separate tiny exhaustive oracle checks the *same RBI action
catalog*, both plan legality and the frontier (the oracle is not the method).
The ledger charges extraction, DP/certificate CPU and RSS, RegBankSelect and
all downstream compilation CPU/RSS, COPY/repair count, spills/frame size,
object/text bytes, and controlled same-executable runtime only if collected.

Stop the frozen mechanism if any region violates verifier/semantic parity; if
Fast/Greedy plus permitted stock controls emits the candidate frontier; if the
oracle finds a missing legal action; or if p50/p90 charged full cost has no
nondominated point relative to the complete stock union.  This is a finite
same-contract falsifier, not a requirement that this revision already run it.

## Collision, paper shape and claim ceiling

Current LLVM documents only Fast and Greedy, while source makes their local
mapping/repair behavior concrete.  Historical Global-mode design is genealogy;
Unison-like combinatorial RA/scheduling is an adjacent methodological
subtractor.  Neither provides the pinned AArch64 RBI mapping-plus-repair FPT
certificate.  Paper collision status remains `SEARCH_BOUNDED_OPEN`, never an
absence assertion.

If independently confirmed, this is a narrow compiler N2 paper: complete
native action grammar, a real nonlocal action divergence, a target-specific
bounded frontier theorem, stock-compatible no-gain fallback, and a credible
full-cost natural-corpus route.  It is Tier B, not Q1: no multi-target theorem,
natural results or performance claim exists yet.

