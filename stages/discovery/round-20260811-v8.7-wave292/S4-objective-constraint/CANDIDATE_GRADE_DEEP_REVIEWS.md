# Candidate-grade deep reviews

No review below has been executed. “Natural route” is a finite reproducibility route, not collected evidence.

## D01 — Linux BTF artifact-density cliff

- **Exact same object and oracle:** a released Linux `vmlinux` BTF section, with fixed kernel/BTF semantics, accepted by the matching kernel BTF parser/verifier (and, where applicable, the matching official BPF tooling).
- **Current reality pin and union:** Linux master `d58772d8520c7ef247c4b95c9bd76d3a25da9ff5`; the documented contract includes BTF type IDs, type records, string-table references, and producer-generated BTF. The actionable union still needs a source-level closure across kernel parser/verifier, BTF emission, architecture/configuration choices, and all producer options; it is not claimed closed here.
- **Phenomenon hypothesis and confounds:** measure normalized BTF parse/load time and RSS against type/string density across 20–50 versioned release artifacts. Hold architecture, kernel configuration, compression state, debug-info provenance, and binary size accounting fixed; repeat each artifact and compare against matched-density controls. This is designed to distinguish a representation cliff from build/configuration differences.
- **Natural carrier / full cost:** versioned released `vmlinux` artifacts and upstream BPF selftests; producer CPU/RSS/temp plus BTF bytes, parser/verifier CPU/RSS/latency, and artifact acquisition/decompression are the denominator.
- **Direct collision:** the BTF documentation establishes current record/string representation but does not establish an external current constructor that exploits the hypothesized phase transition.
- **72h Stage A killer:** first verify that a fixed set of 20 versioned artifacts shows a repeatable normalized discontinuity after confound controls. If it does not, STOP this phenomenon line. If it does, enumerate a native-legal regenerated witness and test whether the closed current producer union already expresses it.
- **Disposition:** `NOT_ADMITTED_UNFROZEN__NO_NATURAL_CLIFF_EVIDENCE_AND_CURRENT_ACTION_UNION_NOT_CLOSED`. No N2/N3 mechanism is proposed.

## D02 — JavaScriptCore cached-bytecode representation cliff

- **Exact same object and oracle:** a fixed WebKit/JavaScriptCore revision’s cached bytecode, identical JavaScript observable semantics, and the matching stock interpreter/cache reader as oracle.
- **Current reality pin and union:** WebKit main `1a91592d550067571bf491412e36dd1dd036a4d4`. The official bytecode-format report establishes representation pressure (bytecode size, memory and cache behavior), but it is not a current complete inventory of cache serialization, bytecode generation, invalidation, layout, and all default/non-default runtime/build flags. That union is therefore not asserted.
- **Phenomenon hypothesis and confounds:** on versioned, naturally sourced JavaScript suites, normalize cache bytes/startup time/RSS by code size and syntax mix; control JSC revision, CPU/OS, build mode, warm/cold cache state, and script distribution. A cliff must recur across suites rather than be a single program anomaly.
- **Natural carrier / full cost:** versioned WebKit test material plus public JavaScript application suites selected before observation; compilation/cache-write CPU/RSS/temp, cache bytes, cache-read/startup CPU/RSS/latency, and invalidation cost are the denominator.
- **Direct collision:** no first-party current source closure or direct paper collision was sufficient to claim a residual.
- **72h Stage A killer:** freeze one current build and 20 named programs; regenerate native-legal cache artifacts and reject the line if the normalized discontinuity fails to repeat, or if source review shows the full action is already emitted by the current union.
- **Disposition:** `NOT_ADMITTED_UNFROZEN__CURRENT_UNION_AND_VERSIONED_NATURAL_CLIFF_UNCLOSED`. No brief is justified.

## D03 — PostgreSQL GIN pending-list threshold

- **Exact same object and oracle:** fixed PostgreSQL GIN index semantics for the same indexed rows, queries, and update stream; stock GIN reader/index behavior is the oracle. No reader, query semantics, or quality guarantee may change.
- **Current reality pin and union:** PostgreSQL master `086f6f1760140a0055c2faa8d6831fd3ebaf96b0`. Current official documentation says `fastupdate` is enabled by default, entries may accumulate in a pending list, searches must scan it, and cleanup can be much slower after it exceeds `gin_pending_list_limit`. The relevant present union includes GIN `fastupdate`, pending-list limit, foreground cleanup, and maintenance/autovacuum routes; non-default `fastupdate=off` is part of the fair union, not an absence claim.
- **Phenomenon / repeat and confound plan:** on a versioned public update/query trace, pre-register list size, update rate, query selectivity, vacuum schedule, cache state, disk, and table/index size; repeat on either side of the documented boundary with matched row/query semantics. The observed cliff must survive normalization by pending-list and workload shape.
- **Natural carrier / full cost:** a publicly versioned PostgreSQL application trace plus its data snapshot (to be selected before execution); include ingest/update CPU/RSS/temp, index bytes/WAL, foreground and maintenance CPU/RSS, query tail latency/RSS, and recovery effects.
- **Direct collision and action subtraction:** the official current mechanism already exposes the boundary-management actions. A proposal consisting of threshold selection, `fastupdate` switching, vacuum scheduling, or a controller is exactly a policy/configuration member of the current union, not a whole producer constructor.
- **72h Stage A killer:** using a pre-frozen natural trace, prove whether the documented discontinuity repeats under the controls above; independently map the attempted action to current `fastupdate`/pending-list/maintenance union. Either failure closes the line.
- **Disposition:** `NOT_ADMITTED_UNFROZEN__NATURAL_TRACE_NOT_FROZEN`; additionally, the currently visible action gap is `STRUCTURAL_DROP__THRESHOLD_POLICY_ABSORBED_BY_CURRENT_UNION`. No target-specific N2/N3 has been identified.
