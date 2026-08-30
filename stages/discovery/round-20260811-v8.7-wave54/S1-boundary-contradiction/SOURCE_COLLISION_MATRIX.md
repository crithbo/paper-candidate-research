# Current source and collision matrix

| Family | Current-upstream reality | Decisive subtractor | Decision |
|---|---|---|---|
| Rekor | Official docs expose CLI bundle/inclusion-proof verification and signed-tree-head integrity validation. No missing primitive is claimed. | Complete bundle verification union; sharing hashes is generic CSE. | `DROP` |
| OpenSSL | Current `X509_build_chain` and `X509_verify_cert` document chain construction, parameterized validation, safe default callback and failure semantics. | Current chain constructor/validator; any waiver changes authentication guarantee. | `DROP` |
| TUF | Current specification defines delegated roles, thresholds, terminating delegation and metadata validity. | Full role-traversal/check union; schedule changes are not a new action. | `DROP` |
| PostgreSQL SSI | Serializable history must be serializable or abort; SSI danger structures already define the correctness boundary. | Native conflict/abort semantics; a new abort score is controller or changes guarantee. | `STRUCTURAL_DROP` |
| SQLite WAL | WAL fixes concurrent reader/writer visibility semantics. | Native snapshot/locking action. | `STRUCTURAL_DROP` |
| Wasm validation | Normative stack/type rules define binary acceptance. | Existing validator rule application; alternative check ordering is generic. | `STRUCTURAL_DROP` |
| etcd txn | Compare/success/failure form the atomic native transaction interface. | Native atomic branch action. | `STRUCTURAL_DROP` |
| HTTP/2 flow control | Window state and protocol legality are fixed by RFC 9113. | Scheduling objective would be controller policy or extra fairness guarantee. | `STRUCTURAL_DROP` |

No `NOT_ADMITTED_UNFROZEN` or `RESOURCE_BLOCKED` line occurred. `SEARCH_BOUNDED_OPEN` is not used as a novelty conclusion.
