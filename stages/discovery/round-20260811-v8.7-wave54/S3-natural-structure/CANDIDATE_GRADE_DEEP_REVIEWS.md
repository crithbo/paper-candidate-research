# Candidate-grade deep reviews

The reviews below apply normal v8.7 production gates. The six-lanes-direct policy changes only scheduling; R7/shadow/dormant semantics are not used because the frozen mode is `OFF`.

## BGP-FIB-PREFIX-DAG — NOT_ADMITTED_UNFROZEN

- Exact object/function: a mutable route set with longest-prefix-match forwarding result for every address, including current route-update semantics.
- Natural carrier: [RouteViews](https://www.routeviews.org/) collector RIB snapshots; the relevant stable structure is nested prefixes that share the same next-hop/forwarding label.
- Minimal action-divergence witness: two sibling prefix subtrees have distinct syntactic routes but induce identical LPM label functions on their address intervals; a constructor would merge them into one persistent DAG node while retaining update reachability.
- Canonical oracle: exhaustive equivalence over a finite reduced address witness plus prefix-boundary witnesses, then router FIB lookup equivalence. Full cost is construction and update time, memory, lookup latency, persistent sharing/reclamation, and correctness—not static entry count alone.
- Current-upstream reality check: official current FRR material and public RouteViews data establish the object/carrier, but this screen did not freeze a current FRR commit, mutable-FIB source path, and all configuration routes needed to delimit an action gap. This is an evidence/action-contract gap, not negative scientific evidence.
- Finite Stage A killer: first freeze a current open-router trie/FIB implementation and a 20–50 snapshot/update slice; if its native action union already performs label-preserving subtree quotienting with the same update semantics, direct absorption follows. If the proposed merge cannot retain an update/reclamation invariant, it is structurally unclosable. Until that finite contract is frozen, this cannot become a brief.
- Structural-paper potential: potentially `TIER_B_Q2_VIABLE` only if the persistent quotient action survives the killer and demonstrates a nontrivial update/query tradeoff; current evidence readiness is low-to-medium. No DROP is made for that readiness.

## VG-GBWT-MERGE-CONSTRUCTOR — DROP

- Exact object/function: merge the same haplotype paths into a query-equivalent GBWT/GBZ index; natural input is phased VCF/GFA path data.
- Named natural structure: chromosome-component separation and run-length encoded phasing patterns.
- Minimal action-divergence witness: independently built non-overlapping component indexes can be merged without path extraction, whereas overlapping components require insertion/parallel construction under the index's existing constraints.
- Current strongest union: the current official `vg gbwt` documentation exposes construction from GFA, insertion merge, parallel/fast merge classes, `--gfa-input`, `--merge`, version compatibility output, and r-index construction. These are complete same-object index actions, not only external tuning.
- Current-upstream reality check: current `vg` index-construction and GBWT-subcommand documentation were inspected at cutoff. This uses positive evidence of existing constructors, not an absence claim. Documented options and compatibility requirements are contrary evidence to a claimed action gap.
- Full-cost denominator: final GBWT/GBZ/r-index bytes, all temporary files, merge CPU/RAM, query correctness, version compatibility, and downstream index construction—not merge time alone.
- Finite Stage A killer: with a small public GFA whose node IDs are both overlapping and non-overlapping across two components, enumerate legal construction paths. If a proposed mechanism only selects insertion/parallel/fast merge or orders batches, it is an existing-action selector; if it changes the path/index semantic contract, same-object fails. This kills the present mechanism.
- Structural-paper potential: `BELOW_Q2_STOP` for this exact proposal. Readiness was not a factor.
