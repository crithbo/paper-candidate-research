# Unique opportunity families

## F01 — CPython Py_buffer acquire/release ownership seam

- Canonical signature: `CPYTHON_BUFFER_PROTOCOL__PYBUFFER_ACQUIRE_RELEASE_OWNERSHIP__FIXED_EXPORTER_CONSUMER_VALIDITY_ENDPOINT__CPYTHON_CAPI_FULL_COST`
- History relationship: `NO_MATCH__NOT_NOVELTY_PROOF`; no exact identity was found in the bounded preflight.
- Native actions: acquire a view, consume the returned view, and release it exactly once.
- Current strongest union: official consumer acquisition/release protocol plus CPython source release hook, nulling, and decref behavior.
- Natural carrier/oracle: standard buffer exporters and a C-API consumer; native C-API lifetime/refcount behavior.
- Disposition: `EXCLUDED_BEFORE_RAW__PROTOCOL_PRESCRIBED_OWNERSHIP_OR_CHANGED_EXPORT_VALIDITY`.

The exclusion is structural, not a claim about implementation readiness, measured performance, or AI capability.
