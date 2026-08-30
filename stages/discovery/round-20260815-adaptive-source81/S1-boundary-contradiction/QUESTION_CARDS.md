# Question cards

## QC01 — FFM arena lifetime versus segment accessibility

### Identity and research contract

- Exact public identity: Java SE 26 manually managed `Arena` and native `MemorySegment` objects.
- Carrier: `NATURAL`; Java FFM native allocation and downcall use.
- Same-object problem: reduce lifecycle resource cost while retaining the same segment values, foreign-call results, spatial bounds, temporal safety, thread-access semantics, and close observation.
- Contribution shape considered: N2 joint scope/close construction.
- Network-security exclusion: PASS.

### Evidence-qualified raw gate

- Current source/spec locus: Java SE 26 `Arena.close` and FFM temporal-safety documentation; current OpenJDK `MemorySessionImpl` implementation locus.
- Current native union: global, automatic, confined, and shared arenas expose distinct lifetime/thread contracts; a successful close invalidates every segment associated with its scope and releases backing regions.
- Default/non-default configuration check: no flags/thresholds provide a hidden same-guarantee close-placement action; arena-kind changes alter the endpoint and cannot be smuggled in as a configuration.
- Strongest skeptic: scope coarsening/partitioning or moving `close` is ordinary region/lifetime inference; if it changes segment accessibility, deallocation point, or thread eligibility, it changes the fixed contract.
- Minimum falsifier: a public try-with-resources arena/segment trace where a later valid access follows the proposed earlier close, or an existing segment must remain alive through a downcall. A transformation avoiding both is only the current last-use lifetime action.
- Finite closure: source-pinned API trace with Java’s access exception/`scope().isAlive()` as native oracle; no build or experiment performed by Discovery.
- Initial full cost: retained/released native bytes, allocation and close CPU, segment-access checks, thread coordination, downcall cost, and end-to-end application work.

### Gate disposition

`EXCLUDED_BEFORE_RAW__CHANGED_TEMPORAL_THREAD_GUARANTEE_OR_GENERIC_REGION_LIFETIME_ANALYSIS`.

An earlier/partitioned scope either changes temporal or thread-access guarantees, while a scope chosen exactly from ordinary liveness is generic region inference rather than a target-specific FFM mechanism. This is structural, not an inference from readiness or missing results.
