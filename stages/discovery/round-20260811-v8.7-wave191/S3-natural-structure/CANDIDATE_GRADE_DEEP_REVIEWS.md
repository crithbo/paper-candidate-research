# CANDIDATE_GRADE_DEEP_REVIEWS — Wave191

## DEEP-191-01 — Typed Wikimedia relation-delta constructor: `NOT_ADMITTED_UNFROZEN`

### Exact object and stock oracle

The object is not an arbitrary web graph. It is a frozen named Wikimedia wiki, a declared dump/API version, a page/revision time slice and one typed relation: page links, category membership or template transclusion. Native semantics are title/namespace-aware MediaWiki tuples. The current Action API exposes `prop=links` (links from supplied pages), `prop=templates` (pages transcluded on supplied pages), and `list=categorymembers` (pages belonging to a supplied category), with explicit namespace, continuation, limit, direction, sort-key/timestamp and type controls. These are the stock exact query oracles.

### N3 law, confounds and complete utilization action

The proposed law is: after controlling for namespace, age, revision activity, moves/renames, deletion status and relation type, adjacent fixed-duration slices show stable low typed-edge symmetric difference and bounded changed-neighborhood radius across an independent wiki/period holdout. The action is a whole typed-delta constructor: select a canonical base relation state, retain typed changes in sequence, periodically checkpoint, and reconstruct the exact native relation tuple set for one stock query. It must preserve title normalization, namespace, relation type, membership order/sort-key semantics, continuation and deletion/move semantics. It is neither an index setting nor a cache wrapper.

The smallest witness is two matched pages, one with a single typed relation mutation and one unchanged. Under two shuffled physical dump orders, the constructor must produce exactly the same API-equivalent tuples for both pages. A moved page and a category member sorted by timestamp are required adverse witnesses because they can invalidate a naive ID-only delta.

### Current upstream reality / strongest union

The current MediaWiki source upstream is the Wikimedia `mediawiki` master mirror (frozen access date 2026-08-11); its resolved commit was not obtained in this no-download/no-source-fetch assignment, so it cannot be used to assert an implementation absence. The current official API documents the exact stock outputs and all relevant visible controls above. CirrusSearch is a current Elasticsearch-backed search extension with continuous updates; its documented configuration includes analysis hooks, index settings, deduplication, namespace matcher, prefix-weight and total-hit controls, and documented index rebuild commands. These are adverse evidence against calling an index-layout choice a new constructor.

However, neither the inspected documentation nor the source-listing page establishes that a semantics-preserving, time-versioned typed relation-delta construction is or is not already implemented across MediaWiki database, API, query/cache and CirrusSearch paths. The current source commit, relevant feature/config closure and a full same-object action union therefore remain unclosed. It would be invalid to infer a gap from missing inspection and equally invalid to call the proposal absorbed merely because stock API queries exist.

### Full-cost denominator, stability falsifier and fidelity closure

Full cost must include history/dump slice bytes and hashes, base extraction, delta/checkpoint bytes, build/update CPU and RSS, query reconstruction CPU/RSS, API-equivalence checking, and any storage/index build work. A finite 72-hour StageA killer is:

1. Freeze two successive official monthly/dated carrier slices, their provider checksum entries and 20–50 matched pages across relation types.
2. Define the schema above before observing measurements; split by wiki/period, not by dump layout.
3. Verify exact native tuples (including namespace, title normalization, sort/order/continuation and move/delete cases) against stock Action API or an equivalent frozen MediaWiki relation reader.
4. Reject the N3 law if any preregistered held-out stratum reverses the locality bound, or if the effect vanishes after the listed confound controls; reject N2 if any tuple differs or full cost fails to beat the frozen union.

None of these runs occurred here; no stability result is claimed.

### Decision

`NOT_ADMITTED_UNFROZEN`. There is a finite fidelity plan and a natural carrier route, but no frozen current source/config/action union and no demonstrated stable law or union-external whole constructor. This is not a DROP caused by absent implementation, result, resource or AI readiness; no Stage0 brief is warranted.

