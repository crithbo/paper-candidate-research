# Primary RQ — S3-101-01

- **Anchor:** official Julia package-image, module-precompilation, command-line, and source documentation, checked 2026-08-15.
- **Object:** fixed Julia package/module sources and a stock Julia runtime’s `.ji`/pkgimage or sysimage behavior.
- **Same-object boundary:** same package source and runtime behavior, cache validity/selection and stock loader; no changed package API, custom loader, cache controller, or unsafe sysimage guarantee.
- **Identity preflight:** no exact object/action/endpoint match in the frozen history/registry lookup surface; no match is not a novelty/current-absence finding.

## RQ

For a version-pinned sequence of public Julia package releases, can a predecessor-aware package-image constructor retain stock precompile/load semantics while reducing complete cache/image plus equal-information transition cost against the current Julia cache/sysimage option union and generic delta?

This could be N2 only if a target-specific whole construction action and guarantee survive. N3 requires a separately measured release law. Full cost would include compiler CPU/RSS/temp, image/cache and delta bytes, package loading, startup, and execution cost.
