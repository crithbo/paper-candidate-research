# Discovery question card

## QC01 — `dlclose` reference/dependency/destructor visibility

| field | frozen content |
|---|---|
| signature | `GLIBC_DLCLOSE__REFERENCE_DEPENDENCY_DESTRUCTOR_UNLOAD_VISIBILITY__FIXED_ELF_HANDLE_ENDPOINT__LOADER_CPU_RSS_RESIDENCY` |
| exact identity | glibc 2.43 / current Linux `dlopen`/`dlclose` semantics for a fixed ELF shared object and dependencies. |
| same-object contract | Same object file/dependency graph, handles and flags, destructor effects, legal symbol residency and `dlclose` endpoint. |
| native action | `dlopen`, symbol use, `dlclose`; loader maintains handles/refcounts/dependency reachability and invokes destructors before a qualifying unload. |
| current union | Current interface specifies reference counting; a qualifying zero reference/dependency condition triggers destructors before unload. It also states that successful `dlclose` does not guarantee symbols were removed; `RTLD_NODELETE` explicitly fixes a different residency contract. |
| problem/insight | Loader teardown cost is real, but a paper requires a target-specific same-information closure constructor. Early/different destructor or unload timing violates the endpoint; selecting residency flags or a plugin coordinator is not N2. |
| minimum falsifier | Object A depends on B, both have destructors recording noncommuting effects. Close A while B remains required; any candidate that destroys/unmaps contrary to reachability/required ordering fails. |
| carrier/oracle | Public ELF shared objects plus stock loader; `dlclose` result, destructor trace, and legal symbol/residency behavior are the native oracle. |
| full-cost | loader CPU/RSS, unload latency, text/data residency, relocation/destructor cost, and coordination overhead. |
| finite route | 72h Stage0 could use the two-object dependency trace and standard loader observables before measuring cost. No experiment was run. |
| identity preflight | Frozen registry/plan lookup surface gives `NO_MATCH__NOT_NOVELTY_PROOF`; related loader/runtime records cannot exclude. |
| disposition | `EXCLUDED_BEFORE_RAW__FIXED_DLCLOSE_LIFETIME_ENDPOINT_OR_GENERIC_LOADER_POLICY` |

This is a structural exclusion, not an inference from missing implementation, results, resources, or AI readiness.
