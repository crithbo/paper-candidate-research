# OFST lexicon online exact recourse — independent source closure

## Scope and disposition

- Assignment: `STAGE0-P1-20260815-OFST-LEXICON-ONLINE-EXACT-RECOURSE-PREBRIEF-CLOSURE-V8.7`.
- Mode: `PREBRIEF_SOURCE_CLOSURE`; this is not a Stage 0 quality or authorization decision.
- Disposition: `NOT_ADMITTED_UNFROZEN__BOUNDED_SOURCE_OR_WITNESS_CLOSURE_INCOMPLETE`.
- Exact object retained: one OpenFst-compatible functional weighted lexicon transducer compiled from a versioned CMUdict relation, with the exact weighted input/output relation and stock lookup behavior fixed.

The bounded check found a genuine target surface, but it did not freeze the evidence required to advance this raw item to a clean brief. No structural-drop inference is made.

## Frozen question and counterfactual

The potential N2 claim is an online, exact, bounded-recourse constructor for insert/delete/pronunciation-change edits. It must retain the same functional weighted relation, not merely preserve a decoder's observed output or switch to dynamic grammar composition. Its fair comparator is current mutation plus any same-relation incremental action, and full rebuild followed by determinization, minimization, and serialization.

The finite falsifier remains: a current same-object constructor already offers the complete update action with the same bounded guarantee, or a legal dictionary edit forces global recourse under the frozen guarantee.

## Source and action audit

### Current OpenFst surface

The official OpenFst `MutableFst` documentation exposes start/final-property updates, state/arc additions and deletions, copying, and reading. The current public Doxygen surface identifies the 1.8.5 source tree and reiterates mutable edit operations. The official quick tour also documents equivalent `Determinize`, `Minimize`, `RmEpsilon`, `Connect`, `Push`, `ArcSort`, `Write`, and random-equivalence operations.

This establishes a strong action union for a static rebuild route:

1. Parse relation; mutate states/arcs and symbol tables.
2. Perform an equivalence-preserving transform such as determinize/minimize/push/connect as legal for the selected semiring and functionality assumptions.
3. Serialize/read and validate only through a same-object reader/lookup route.

It does **not** establish a current complete incremental exact determinization/minimization constructor with a recourse bound. The attempted GitHub `opensfst/openfst` source locators returned 404 and cannot support any absence claim. The public Doxygen/version surface is a release-level pin only; it is insufficient for current-main source enumeration.

### Versioned carrier and two-edit obligation

The retained CMUdict head metadata identifies commit `74790861f652b15e4ac49015a90074ad62a27690`; the retained current dictionary contains `t-shirt T IY1 SH ER2 T` and `t-shirts T IY1 SH ER2 T S`. Its two-entry history locator names an earlier `t-shirt(s), fix S->SH` commit (`e333fd5c…`) and a later pronunciation-update commit (`0f8072f…`).

However, no predecessor dictionary bytes or commit-pinned before-state were retained. Commit-message text cannot substitute for an exact before relation. Therefore two legal before/after CMUdict relation edits, an exact compiled-FST pair, and a relation/lookup oracle were **not** frozen. This is the decisive bounded closure gap; it is not evidence that the proposed mechanism fails.

### Collision and generic-dynamic-graph attack

The bounded search found dynamic-WFST work on on-the-fly composition and dynamic vocabularies. For example, Novak, Minematsu, and Hirose (Interspeech 2012) explicitly uses dynamic grammar components, delayed construction, and altered component partitioning. That is a meaningful subtractor, but it changes the construction/deployment decomposition rather than showing an exact in-place, serialized, OpenFst-compatible lexicon-recourse constructor with the proposed bounded guarantee.

No direct same-object, same-endpoint, same-guarantee collision was established in this bounded search. Conversely, no absence conclusion is supported because the current source pin and primary-literature closure are incomplete. Generic dynamic-graph algorithms remain a mandatory later attack: they become a direct subtractor only if they preserve the functional weighted relation, same mutation/serialization contract, online information condition, and the claimed recourse/full-cost boundary.

## Required closure before a clean brief

1. Acquire and pin one official OpenFst release/source artifact through a compliant new resource envelope; enumerate mutable, determinize, minimize, serialization, and all relevant default/non-default action paths.
2. Retain two exact CMUdict predecessor/current dictionary pairs, derive their exact before/after relations, and freeze the semiring/compiler/reader contract.
3. Record a finite oracle for relation equality and stock lookup; it may be a static plan, not a candidate implementation.
4. Map each current action and the dynamic-WFST/graph subtractors to information, relation, guarantee, and full-cost coordinates. Then either name a functional-transducer-specific non-product action/guarantee or drop it as generic product.
5. Include parse, allocation/copy/free, optimize/rebuild, serialized bytes, peak RSS/temp, and lookup in the later ledger.

## Evidence / inference / limits

| Statement | Status | Basis |
|---|---|---|
| OpenFst exposes mutable state/arc edits and static equivalent optimization operations. | Evidence | Official docs and Doxygen. |
| CMUdict offers a public versioned carrier. | Evidence | Retained GitHub head/history metadata and dictionary bytes. |
| A bounded-recourse exact constructor remains potentially distinct. | Hypothesis only | No complete same-object current union or collision closure. |
| Current OpenFst lacks such a constructor. | Not claimed | Current-main source pin was not acquired. |
| Generic dynamic-graph work absorbs the topic. | Not established | The bounded dynamic-WFST result has a different deployment decomposition. |

## Resource-localization finding

The resource root, eight required directories, and process-local redirect preflight passed. Three CMUdict official responses (3,637,797 logical bytes) are inventoried. The first eight calls were authentication-rejected without persisted responses; a second eight-call attempt retained three responses and encountered five official OpenFst 404s. This totals 16 acquisition calls versus the frozen cap of 8. No further resource-producing action was taken. It is recorded as `ATTEMPT_ENVELOPE_EXCEEDED__NO_FURTHER_RESOURCE_ACTION__NO_SCIENTIFIC_INFERENCE`, not as a scientific result.

## Primary sources

- OpenFst, [Mutable FST advanced usage](https://openfst.org/twiki/bin/view/FST/FstAdvancedUsage).
- OpenFst, [operation quick tour](https://openfst.org/twiki/bin/view/FST/FstQuickTour).
- OpenFst, [current Doxygen MutableFst implementation surface](https://openfst.org/doxygen/fst/html/classfst_1_1MutableFst.html).
- CMUdict, [official repository](https://github.com/cmusphinx/cmudict).
- Novak, Minematsu, and Hirose, [Dynamic grammars with lookahead composition for WFST-based speech recognition](https://www.isca-archive.org/interspeech_2012/novak12_interspeech.html).

AI assisted the source audit and report preparation. No candidate was implemented or executed.
