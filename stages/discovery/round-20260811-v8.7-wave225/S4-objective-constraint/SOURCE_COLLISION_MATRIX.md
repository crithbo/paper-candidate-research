# Current union / collision matrix

| competing mechanism | same information? | action coverage | collision result |
|---|---:|---|---|
| current serializer traversal, deferred queue, backref/forward-ref protocol, 8-object hot cache | yes | baseline whole snapshot serializer | required union member; does not expose a general eligible-object schedule |
| read-only/shared/startup partition and root/cache handling | yes | placement classes and fixed semantic constraints | must be preserved, not an optimization choice |
| `V8_SNAPSHOT_COMPRESSION` raw zlib path | yes | compression after native serialization | held fixed; external/new compressor forbidden |
| `reorder_builtins` plus profiling input | no for static-only candidate | builtins code order only | direct collision for builtins layout; excluded from candidate action |
| code-cache background deserialization | different object | per-script code-cache handling | excluded by same-object rule |
| constrained non-root object schedule under existing serializer bytecode | yes | root/map/space/defer legalities retained; schedule determines eligible emission order | no current configurable or source-defined complete scheduling action found in pinned union |

Latest-collision status is `SEARCH_BOUNDED_OPEN` for academic papers: only first-party V8 sources/documentation were admissible in this assignment. This is not an absence claim; Stage 0 must independently recheck papers. The source-level current-union conclusion is pinned and auditable.

