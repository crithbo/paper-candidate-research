# Source and collision matrix — Wave273

| Facet | First-party/current source | Frozen finding | Effect on admission |
|---|---|---|---|
| Upstream identity | Unicode ICU upstream `main`, `f86dc86d89aa3c3cd661af8b88e6b4d2ac99ca59` | Ref supplies the source baseline to inspect for package generation, loading, and resource access. | Pin only; no absence conclusion. |
| Data packaging and deployment | [ICU Data](https://unicode-org.github.io/icu/userguide/icu_data/) | ICU documents packaged data, archive/file/library/static deployment modes, package loading/caching, common/application data and endianness/data-format considerations. | Establishes a broad existing configuration/action surface; a proposal may not silently treat these as absent. |
| Data build path | [ICU data build tool](https://unicode-org.github.io/icu/userguide/icu_data/buildtool) | ICU documents generation of its versioned common data package and its build-time tooling. | Natural source route is finite, but package-index action semantics still require source closure. |
| Stock resource semantics | [ICU Resource Management](https://unicode-org.github.io/icu/userguide/locale/resources.html) and [ICU Services](https://unicode-org.github.io/icu/userguide/icu/services.html) | Resource bundles and `ures_` APIs supply the reader-side same-object oracle. | Prevents changing reader or resource semantics to manufacture a residual. |
| Source facets to audit | Pinned ICU source: `source/tools/toolutil/pkg_gencmn.cpp`, package tools, common-data loader, resource-bundle reader | These are the relevant generator/index/loader/reader paths; their full legal action union has not been mechanically enumerated in this Discovery-only pass. | `NOT_ADMITTED_UNFROZEN`, rather than an implementation-absence claim. |
| Candidate action | Joint package-index plus physical-layout constructor for fixed `B,W` | No source-authorized two-layout witness shows it is distinct from ordinary ordering/packing or a reader/format change. | No complete N2 is frozen. |
| Direct-collision search | ICU official documentation and current upstream source pin; no primary same-object paper was relied on as a negative result | A latest direct paper collision cannot be resolved until a legal, non-generic action has been specified. | Search remains bounded open; it cannot support novelty. |

## Collision verdict

No direct-absorption conclusion is asserted. Conversely, no candidate is admitted: the necessary stock-legal action-divergence witness has not been frozen, and current packaging/configuration choices make a generic layout description an unfair residual. The proper status is `NOT_ADMITTED_UNFROZEN`, not `DROP` and not a novelty claim.

