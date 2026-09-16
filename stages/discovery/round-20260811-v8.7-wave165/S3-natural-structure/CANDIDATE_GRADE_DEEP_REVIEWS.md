# CANDIDATE_GRADE_DEEP_REVIEWS — Wave165

## DEEP-165-01 — Source-order-independent NHDPlus HR reach-set construction: `DROP`

### Frozen object, representation and exact oracle

The object is NHDPlus HR National Release 1's directed hydrograph, not a derived raster, synthetic watershed or an alternative graph. The official 2025 user guide describes a nationally seamless network of stream reaches with catchments, flow surfaces and value-added attributes. National Release 1 presents a single nationally continuous representation; `NetworkNHDFlowline` carries commonly used VAA fields and `NHDPlusConnect` carries network connections between VPUs. The source-order-independent relation is explicitly the directed edge relation in `NHDPlusFlow` together with the inter-VPU connection table. For a frozen seed ID set and direction, the exact oracle is the set of reachable `NHDPlusID`s. Reordering rows, tiles or source files cannot alter that set.

### Structure hypothesis, whole action and controlled witness

The only admissible candidate action examined is a full separator/frontier closure constructor: compress a bounded confluence interface, join upstream frontier states exactly, and emit the complete reachable ID set. Its proposed condition is bounded interface width across natural VPU boundaries, computed from the same network relation; it is not a parameter selection. The minimal witness is two upstream branches crossing a VPU boundary and joining one downstream flowline. A correct constructor must coalesce the two branch states and return every ID exactly once.

### Current official action union and adverse evidence

The official NHDPlus HR guide supplies navigation instructions using joins of `NHDFlowline`, `NHDPlusFlow` and VAA fields, including an explicit procedure for all immediately tributary flowlines. The USGS `nhdplusTools` catalogue describes an R tool that subsets NHDPlus features and finds related features by upstream/downstream network navigation. These are current same-object, same-information actions whose observable output is the reach-set proposed above. Release 1 also exposes `NHDPlusConnect` and joined VAA fields in the national representation. Thus the current union already includes exact relation-based navigation across the declared carrier; a new internal frontier layout cannot be called a union-external constructor absent a different observable guarantee.

No absence assertion is made. The current-action record is based on official current guide/tool catalogue, not an old issue or future-work note. Relevant boundaries: the guide notes that additions/removals are not populated in NHDPlus HR data produced through 2024, and that some VPU-level material can have later-updated VAAs; those facts prevent claiming an unsupported dynamic-update task, not a performance residual.

### Natural-law, collision and six-dimensional audit

- **Natural structure evidence:** official sources establish real VPU boundaries, confluences and national network connections, but do not establish a reproducible, cross-region bound on separator/frontier width. No unrun measurement is reported as such a law.
- **Decision rule:** reachable-ID membership under the frozen directed relation is already the native navigation decision.
- **Information:** seed IDs, edge tables and VAA fields are the same; proposed source-order invariance is a semantic property of relation closure, not new input.
- **Complexity/resource and full cost:** any proposed precomputation, interface tables, memory, construction and query time must be compared to the official join/navigation pipeline. No current full-cost advantage is established.
- **Quality/guarantee:** exact membership is the same native output. A different update/delete guarantee would introduce a task unsupported by the frozen carrier/action contract.
- **Generalization/no-gain:** a bounded-interface law has not been demonstrated; absent one, the proposal is either an unproven optimization or a generic partition/index wrapper.
- **Latest collision:** the 2025 USGS user guide/current national product documentation and current USGS `nhdplusTools` network-navigation documentation.

### Finite fidelity closure / ≤72h killer (not run)

Freeze one small public National Release 1 VPU boundary and its `NHDPlusConnect` rows, then (1) materialize the edge-relation oracle in two different row orders, (2) run the official documented join/navigation procedure, and (3) run the claimed frontier recurrence. Any set inequality fails same-object fidelity; equality confirms the native action but leaves no action divergence. Separately, compute interface width across a predefined 20–50 natural boundary sample and require a fixed held-out regional bound; failure to establish such a bound prevents an N3 claim. This is a future finite killer, not executed evidence.

### Decision

`DROP` / `BELOW_Q2_STOP` for this exact navigation-constructor formulation: direct current same-object union absorption plus no frozen stable natural law or distinct exact guarantee. This is not based on missing implementation, result, compute resources or AI readiness. No Stage0 brief is recommended.

