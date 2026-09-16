# CANDIDATE_GRADE_DEEP_REVIEWS — Wave185

## DEEP-185-01 — OSM history member-delta constructor: `NOT_ADMITTED_UNFROZEN`

- **Carrier and exact semantics.** OSM's official weekly full-history dump includes all versions of almost all post-API-0.5 nodes, ways and relations, including deleted objects; date-aligned full-history diffs provide all entity changes in a period. The exact object is `(OSM id, time)` and the output is its native version/member/tag state at that time.
- **Layout-independent N3 hypothesis and whole action.** Measure a fixed identity-set temporal locality statistic: fraction of member edges changed between consecutive fixed-duration slices, stratified by object type, geographic region and object age. A complete action would build version delta chains with periodic exact checkpoints and reconstruct the native object state by merging only the changed member subsequences. The action preserves IDs, member ordering and version semantics; it is not a generic reordering.
- **Confounds / witness.** Control slice duration, region, object type, object age and deletions/redactions. Witness: one relation with a changed member and one unrelated unchanged relation; reconstruction must be exact for both under two physical input orderings.
- **Why not admitted.** The official history page says existing OSM processing tools are not suitable for full history; that is not a current-source proof that no constructor exists. Conversely, this review does not freeze an official current historical query oracle, parser semantics/config union or prior collision sufficient to certify a union-external action. The required stable cross-slice locality law has not been measured and cannot be inferred from the availability of history.
- **Full cost / 72h killer.** Count full-history extraction, checkpoint bytes, delta bytes, reconstruction CPU/RSS and exact version/member equivalence. On a small official date-aligned diff plus matching base state, test two regions and a held-out period; any native member/order/version mismatch or held-out locality reversal kills the formulation. Not run.
- **Disposition.** `NOT_ADMITTED_UNFROZEN`, not a readiness or resource drop.

## DEEP-185-02 — Debian Snapshot incremental dependency constructor: `DROP`

- **Carrier and exact semantics.** snapshot.debian.org preserves past/current archive states by date/version, with historic timestamps approximately six hours apart in the cited archive example, and is usable as an APT repository. Exact object is a frozen `(timestamp, suite, component, architecture, package request)`; output is the APT-resolved installation candidate/dependency selection under the frozen repository metadata.
- **Hypothesis/action/witness.** A layout-independent churn law would count changed package/version constraint edges between adjacent timestamps and propose a complete incremental resolver that reuses untouched constraint components while returning the same exact APT solution. Witness: one package version changes and an unrelated component remains unchanged; both resolved selections must equal APT under two input enumeration orders.
- **Current union and collision.** Debian Snapshot's native use is to feed precisely a date-frozen archive to APT; the package manager already computes the same install/dependency outcome. The proposed output therefore sits in the strongest same-object union. No separate exact complexity or quality guarantee was frozen, and a “local churn” law has not been established.
- **Full cost / 72h killer.** Compare snapshot metadata acquisition, index parsing, reused-state bytes, solve time/RSS and output equality to APT on 20–50 timestamped package requests. Any mismatch destroys fidelity; equality demonstrates no output action gap. Not run.
- **Disposition.** `DROP` due direct same-object union absorption, not lack of implementation/results/resources.

## DEEP-185-03 — Ethereum block-incidence locality constructor: `DROP`

- **Carrier and exact semantics.** Ethereum blocks are strictly ordered batches linked by parent hash; the official JSON-RPC `eth_getBlockByNumber` returns a block by frozen height, including full transactions when requested. Exact output is the native block/transaction record or its fixed address-incidence projection.
- **Hypothesis/action/witness.** A temporal locality statistic would use address/transaction incidences by block interval, stratified by block height/window and transaction type, and a complete constructor would reuse a frontier across adjacent blocks while returning exact projected incidences. Witness: two adjacent blocks share an address but have different transaction sets; no source ordering can affect either result.
- **Current union and collision.** The same exact height-indexed output is already supplied by the official JSON-RPC block API; a different storage frontier does not yield a distinct native function or guarantee. Stable locality is not claimed merely because block order exists.
- **Full cost / 72h killer.** Include RPC/archive retrieval, block decoding, frontier state, CPU/RSS and output bytes; compare a small height window and held-out window against JSON-RPC canonical block records. Mismatch kills fidelity; equality leaves no action gap. Not run.
- **Disposition.** `DROP` by direct current union absorption.

## DEEP-185-04 — NCBI Taxonomy lineage-churn constructor: `DROP`

- **Carrier and exact semantics.** NCBI provides `new_taxdump` updates and monthly historical taxdump archives. TaxIds are stable unique numerical identifiers (with recorded merged IDs); exact native output is a frozen TaxId's parent/child/lineage relation under a particular dump/API version.
- **Hypothesis/action/witness.** Compute locality only from change events (added, merged, deleted and parent/rank relation changes), stratified by rank and age; a complete maintained factorization would update ancestor/descendant closures while emitting the same TaxId relation set. Witness: a merged/deleted identifier whose current TaxId and lineage must remain exact under alternate dump ordering.
- **Current union and collision.** Current NCBI Datasets taxonomy commands explicitly support parents and children; the Taxonomy Browser/API and data package provide the same lineage/child functionality. Thus the desired closure output is already in current same-information action union. A stable-locality law remains unmeasured.
- **Full cost / 72h killer.** Count archive/dump selection, diff state, factor tables, update CPU/RSS and exact output; use three monthly dumps plus a held-out month. Any TaxId/parent mismatch kills semantics; equality leaves only an internal reimplementation. Not run.
- **Disposition.** `DROP` by direct current union absorption, independent of readiness.

