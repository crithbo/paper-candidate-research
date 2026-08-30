# LLVM GC Statepoint root-representation frontier — independent confirmation

## Disposition

- Assignment: `STAGE0-C2-20260814-LLVM-GC-STATEPOINT-ROOTREP-FRAME-REGISTER-PARETODP-CONFIRM-V8.7`
- Role: independent Stage 0 confirmation; no revision, implementation, build, experiment, Stage A, or Stage B was performed.
- Decision: `CONFIRM_REVISE_ONCE`
- Conditional tier if the sole gate closes: `TIER_B_Q2_VIABLE`
- Evidence ceiling: `E1_STATIC_PREFLIGHT__PINNED_COLLECTOR_READER_AND_TWO_PLAN_CERTIFICATE_PENDING`
- Sole permitted gate: `SAME_STOCK_COLLECTOR_TWO_PLAN_ACCEPTANCE__ROOT_UPDATE_PRESERVING_BOUNDED_FRONTIER_CERTIFICATE`

The PRIMARY's `REVISE_ONCE`, rather than PASS or STOP, is confirmed.  The open
issue is a finite same-object construction: it has to name a real existing
collector/runtime reader and prove that two complete representations are both
accepted without changing the logical root contract.  No absence claim, lack
of build, or lack of measured benefit is used here.

## Frozen-input integrity

The PRIMARY manifest's four canonical members were recomputed and agree with
the contract: report `F1DBFB16416FFBE5549358AD02607AB6107ADF5A0BF914A600F06E257C819D8D`,
Q1 matrix `9D590500D36AFE694CBAB7062B1ADDF18CA299EECE004D7E7D0716AAE4C989C1`,
source audit `CF732F243043CCC99BBA855A7AA1D01A6267D1F4DE569786E0FB31F065A66271`,
and handoff `056E505E10542899071648A03AA3FBCA107483EA987D8C57CC276C487F36FF40`.
The PRIMARY manifest self-hash is
`B15B993827E0B3E8AFD6E250923642ACC8161B4DF3F7CF8C045F666E58D5094A`.

## Independent attack and correction

### 1. The collector/reader must be concrete

The LLVM GC guide says LLVM provides a framework, stack-map generation and
barrier support, but **not a garbage collector**.  Consequently,
`statepoint-example`, an LLVM GC strategy, is not by itself a stock collector
or a runtime acceptance oracle.  A revision may not satisfy the gate by merely
renaming that strategy or by adding a bespoke parser.

It must pin one existing collector/runtime integration, its reader version and
the relevant LLVM commit/blobs.  That reader must accept both emitted plans
under the same target/ABI, collector policy, logical root identity and ordered
root contract.  This is a precise finite requirement, not a demand for a
natural performance result.

### 2. The two plans require a stronger semantic predicate

The official statepoint specification exposes both ingredients but does not
equate them.  `gc.relocate` emits relocation records containing a base location
and a location to update.  An alloca in `gc-live` instead records the address
of a stack region; the generator is responsible for store/fill, and that form
is only suitable when the collector can derive the object base from the pointer
itself.  The utility rewrite pass currently does nothing for allocas.

Thus a qualifying witness must use a base root (not an unsupported exterior
derived-pointer shortcut), give a complete pre-statepoint store and
post-statepoint fill/use for the alloca plan, and establish the following
logical equality:

`(root-id, base-id, gc-live order, update visibility, post-statepoint use,
reader-visible full cost)_relocate = (...)_alloca`.

The binary StackMap record layouts need not be byte-identical: a relocation
pair has two locations whereas an alloca-region plan may be represented
differently.  Equality must instead be proved at the pinned reader's logical
root interface.  If either plan is accepted only by a new collector, custom
reader, weakened base relation, altered root order, or changed update rule,
the gate fails and the pre-registered scientific sentinel applies.

### 3. Current union and absorption

The relevant current union is broader than the primary's two forms: IR
`gc.statepoint`/`gc.relocate`, `RewriteStatepointsForGC`, explicit alloca-root
handling, statepoint stack-map recording/parsing, target register allocation,
frame lowering, prologue/epilogue, and each compatible collector/reader
configuration.  StackMaps records physical register, indirect-memory and
direct-memory locations, while the statepoint format permits physical-location
aliasing.  These facts mean that frame and register costs must be included;
they do not establish a same-collector two-plan exchange or a joint frontier.

No first-party source reviewed here supplies a complete target-specific,
future-action-preserving Pareto constructor.  The current source locator for
`RewriteStatepointsForGC` was transport-limited; it is recorded as
`SEARCH_BOUNDED_OPEN`, never as evidence that a native action is absent.
There is therefore no direct-absorption STOP at this confirmation stage.

### 4. N2 certificate requirements

The revision must define a bounded live-interface state such as

`q = (ordered-root/base classes, representation, reader record role,
     register/spill availability, frame offsets/alignment, post-statepoint
     obligations, target call-clobber state, complete cost vector)`.

A merge is sound only when it preserves every future native action, legality,
reader acceptance, root/base/update semantics and all declared full-cost
coordinates.  The recurrence must be exact, FPT in stated interface width, or
a certified Pareto frontier with an honest bound and no-gain boundary.  An
identity-state enumeration, ordinary RA/frame packing, a generic ILP, or a
collector-contract swap is not N2 closure.

## Required revision deliverable and finite Stage A gate

The one revision may close only the named atomic gate by providing:

1. a 40-hex LLVM pin plus decisive `RewriteStatepointsForGC`, stack-map,
   target-RA/frame and collector/reader blob locators;
2. one fixed function/root set and two complete native plans accepted by one
   named existing collector/reader;
3. an action map for the complete current union, the reader-level equality
   predicate above, and an exact/FPT/certified target-specific recurrence; and
4. a bounded Stage A preclaim gate: stock parse/read acceptance of both plans,
   root-update oracle, full-cost ledger (transform/compile CPU and RSS,
   frame/spill/code/stackmap bytes, runtime root processing and fallback),
   union enumeration for tiny instances, then a finite statepoint-bearing
   corpus killer.

The first Stage A claim-bearing observation is forbidden unless this fidelity
gate passes.  It stops the direction if one plan is illegal, contracts differ,
the current union covers the frontier, the state reduces to generic packing, or
the full-cost residual vanishes.

## Basis and limits

Evidence: the frozen PRIMARY materials; current LLVM [Statepoints
documentation](https://llvm.org/docs/Statepoints.html), [GC
documentation](https://llvm.org/docs/GarbageCollection.html), and [StackMaps
documentation](https://llvm.org/docs/StackMaps.html).  In particular, the
first documents alloca-root restrictions and the rewrite-pass limitation; the
GC guide identifies the runtime/collector boundary; the StackMaps document
defines reader-visible physical locations.  Inference: the specified
same-reader equality predicate and bounded frontier could yield an N2 paper if
the gate closes.  No accepted native output, measured gain, natural prevalence,
or theorem is claimed.

`STAGE0_REPAIR_VECTOR: [OMITTED_CURRENT_SAME_OBJECT,
ATOMIC_ACTION_UNCLEAR, FULL_COST_GAP, EVIDENCE_LOCATOR_OR_VERSION_GAP]`.

