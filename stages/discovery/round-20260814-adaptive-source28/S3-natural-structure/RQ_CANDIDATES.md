# RQ candidates — no promotion

The production RQ frontend was applied before evidence outcome.  It produced **zero admissible RQ candidates** because no seed had both an exact versioned public object and a non-colliding same-object endpoint.  No 2–3 RQ variants were fabricated from abstract domain buckets.

| Seed cluster | Why it cannot enter RQ refinement | Disposition |
|---|---|---|
| OpenAlex quarterly snapshots | Same identity/tool surface was used in Source25; Source28 requires a precommitted content-addressable evidence delta for re-entry. None exists in this batch. | `EXCLUDED_BEFORE_RQ__SOURCE25_COOLDOWN` |
| Debian archive/package metadata | Previously deep-reviewed Debian Contents index object/action space is registered; the Source27 capsule did not create a new object. | `EXCLUDED_BEFORE_RQ__HISTORICAL_IDENTITY_BOUNDARY` |
| ONNX Model Zoo | Exact identity was Source26's selected locator. | `EXCLUDED_BEFORE_RQ__SOURCE26_COOLDOWN` |
| MLPerf release history | Source26 identity plus S4's canonical-benchmark boundary; cannot be presented as a natural deployment carrier. | `EXCLUDED_BEFORE_RQ__SAME_IDENTITY_AND_LANE_BOUNDARY` |
| TFLite micro models | Terminal object in registry. | `EXCLUDED_BEFORE_RQ__TERMINAL_STOP_SCOPE` |
| Generic model/IR release domains | No exact immutable carrier/version, same-object problem, or finite action route was frozen. | `LOCATOR_ONLY__ABSTRACT_DOMAIN_BUCKET_FORBIDDEN` |
