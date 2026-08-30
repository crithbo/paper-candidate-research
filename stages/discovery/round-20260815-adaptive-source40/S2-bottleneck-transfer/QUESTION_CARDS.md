# Question Cards — Source40 S2

## QC-S40-01 — cuObject client/server RDMA construction

- Exact identity: cuObject v1.2, fixed S3-compatible GET/PUT request set, object byte ranges, client/server request completion and S3 object semantics.
- Natural carrier: NVIDIA cuObject v1.2 (May 2026) official API/specification; a future Stage A carrier must use a versioned public S3-compatible object trace.
- Opportunity anchor: cuObject removes data-lake → scratch → GPU staging through RDMA, shifting work to request descriptor, registered-buffer, channel and completion construction.
- Current official locus: current cuObject overview plus client/server APIs describe client callback/descriptor and server registration/channel/GET/PUT/poll actions, including stated memory and operation limits.
- Minimum falsifier: all legal descriptor/buffer/channel structures are simply current client/server API composition, or a proposed method changes the S3/control-path/object result.
- Initial full cost: client/server setup CPU, buffer registration, RDMA/control bytes, GPU/host memory, channel/poll overhead and GET/PUT latency.
- Disposition: `EXCLUDED_BEFORE_RAW__CURRENT_CLIENT_SERVER_API_COMPOSITION`. No target-specific whole action/guarantee was frozen; this is not an implementation/result/resource inference.

## QC-S40-02 — OpenVINO RemoteTensor interoperability

- Exact identity: fixed GPU surface, tensor values, supported native interop object and stock inference output.
- Carrier commitment: official OpenVINO GPU RemoteTensor API; old official 2023.3 page proves a historical carrier but not the required current-locus assertion.
- Opportunity / action family: target-specific shared-surface materialization under stock RemoteTensor semantics.
- Minimum falsifier: current RemoteTensor context/tensor API composition expresses the action, or preserving it needs an altered reader/interoperability contract.
- Initial full cost: interop construction CPU, shared/copy bytes, GPU memory, surface/tensor setup, inference latency and host synchronization.
- Disposition: `SOURCE_CLOSURE_QUEUE_EXHAUSTED__NO_SCIENTIFIC_INFERENCE`; no raw, no absence claim and no negative paper-potential conclusion.
