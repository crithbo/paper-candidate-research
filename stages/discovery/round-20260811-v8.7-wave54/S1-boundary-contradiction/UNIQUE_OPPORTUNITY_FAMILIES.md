# Unique opportunity families and subtractors

| Family | Exact object / atomic action | Strongest current same-object union | Carrier and full-cost denominator | State |
|---|---|---|---|---|
| REKOR-PROOF-SHARING | Fixed finite set of Sigstore bundles to all-valid/all-rejected decision; verify a proof node once only when equal node/root data recur. | `rekor-cli verify`, signed-tree-head validation, each bundle’s signature/certificate/identity/inclusion checks. | Public Sigstore bundles; CPU, hash/signature checks, network-independent bundle bytes, every acceptance decision. | Deep |
| OPENSSL-CHAIN | Fixed X509 target/store/untrusted set/params; construct and validate a trust-anchor chain. | `X509_build_chain`, `X509_verify_cert`, purpose/trust/host/depth/flag parameter union. | OpenSSL test certificates; chain-build CPU/memory, every certificate/CRL/OCSP/policy check and return code. | Deep |
| TUF-DELEGATION | Fixed TUF metadata graph/snapshot/target; traverse roles and verify threshold signatures/expiry/hash/version. | TUF reference spec/client role traversal, terminating delegations and threshold validation. | Official TUF repository fixtures; metadata I/O, signature/hash checks, expiry/version and target decision. | Deep |
| POSTGRES-SSI | Fixed serializable history; choose permitted abort/conflict action. | SSI rw-conflict tracking and dangerous-structure rules. | PostgreSQL isolation tests; abort rate, CPU/memory and serializability. | Raw drop |
| SQLITE-WAL | Fixed WAL snapshot; validate read visibility/commit progression. | Native WAL index/checkpoint/snapshot logic. | SQLite tests; all reads, locking/I/O and isolation result. | Raw drop |
| WASM-VALIDATOR | Fixed Wasm binary; execute legal validator stack transition. | Normative validation rules and mature validator implementations. | Spec tests; validation CPU/memory and exact valid/invalid result. | Raw drop |
| ETCD-TXN | Fixed transaction request; perform compare then atomic branch. | Native Compare/Success/Failure transaction semantics. | etcd integration fixtures; linearizability, latency and storage/log cost. | Raw drop |
| HTTP2-WINDOW | Fixed connection/stream window state; choose legal WINDOW_UPDATE emission. | RFC flow-control state machine and implementation controls. | RFC traces; protocol compliance, wire bytes, latency/fairness and CPU. | Raw drop |
