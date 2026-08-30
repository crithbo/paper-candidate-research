# Question cards — Source62 S2

## QC-S62-01 — Node SEA preparation blob

- Exact semantics: same Node version/platform, bundled main script, executable-visible assets and stock script result.
- Current union: the official SEA configuration exposes preparation blob creation, snapshot, code cache, assets and execution arguments. Snapshot/code cache are platform-bound and are documented as existing construction actions.
- Minimum falsifier: switching `useSnapshot`, `useCodeCache`, asset map or exec arguments is a configuration/selector, not target-specific N2.
- Full-cost if a residual existed: preparation CPU/RSS/temp bytes, executable/blob bytes, deserialize/compile cold-start and first request latency.
- Disposition: `EXCLUDED_BEFORE_RAW__CURRENT_CONFIG_UNION`.

## QC-S62-02 — V8 startup snapshot

- Exact semantics: same context observable behavior and same snapshot-captured heap content.
- Official anchor: V8 documents startup snapshot as serialized heap including precompiled built-in code, but the present bounded route does not pin a current source action catalogue or complete embedder boundary.
- Finite future route: one fixed V8 commit, native serializer/deserializer action catalogue, official test embedder and cold/startup full-cost plan.
- Disposition: `LOCATOR_ONLY__RQ_BACKLOG`; implementation/source incompleteness is not scientific failure.

## QC-S62-03 — Julia system-image multi-version metadata

- Exact semantics: same Base/user-image values and runtime dispatch behavior.
- Official material identifies stock multi-target cloning, target selection/dispatch slots and metadata loading; the provided official page is not a current source pin.
- Minimum falsifier: CPU-target and clone settings are stock configuration, not a non-generic new constructor/guarantee.
- Disposition: `LOCATOR_ONLY__RQ_BACKLOG`; no current-absence or negative claim.
