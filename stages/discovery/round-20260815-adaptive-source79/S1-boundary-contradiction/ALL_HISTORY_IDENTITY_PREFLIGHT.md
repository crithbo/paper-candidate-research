# All-history five-field identity preflight

Candidate signature:

`CPYTHON_BUFFER_PROTOCOL__PYBUFFER_ACQUIRE_RELEASE_OWNERSHIP__FIXED_EXPORTER_CONSUMER_VALIDITY_ENDPOINT__CPYTHON_CAPI_FULL_COST`

| Field | Frozen value |
|---|---|
| Object | CPython C-API `Py_buffer` exporter/consumer view |
| Action | acquire/use/release ownership construction |
| Endpoint | fixed buffer result plus exporter validity/resize behavior |
| Guarantee | same flags, consumer trace, and producer-consumer lifetime semantics |
| Full cost | refcount/release work, retained memory, resize wait, copy/bytes, end-to-end consumer work |

Bounded local history/registry text search for `Py_buffer`, `buffer protocol`, `PyBuffer_Release`, and `memoryview` found no exact five-field identity. This is `NO_MATCH__NOT_NOVELTY_PROOF`; broad buffer mentions are RELATED_ONLY. No held or terminal identity listed in the frozen control was opened.
