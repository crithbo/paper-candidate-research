# Discovery log — S2 data-movement / verification bottleneck deep review

**Assignment:** `DISCOVERY-S2-20260811-V8.7-WAVE102-DATA-MOVEMENT-VERIFY-BOTTLENECK-DEEP`  
**Cutoff:** 2026-08-11 · **result:** `COMPLETE_ZERO_PROPOSALS`

## Frozen method

Method: `production_v2_v8.1 + v8.6 fidelity-closure-plan + v8.7 CURRENT_UPSTREAM_REALITY_CHECK`; revision `v8.7-authoritative-plus-r3-p0-clarity-compatibility__r5-p0-funnel-clarity__r7-p0-repair-vector-dormant-off__discovery-six-lanes-direct-20260811__p1-shadow-not-authoritative`; `DISCOVERY_QUALITY_MODE=OFF`. Six new objects were selected and all six received deep review.

The pass requires primary evidence that a pre-existing compute or processing optimization can expose data movement, verification, or materialization in the end-to-end denominator. It admits only a complete same-object N2/N3 action, not transfer/cache configuration. The finite 72-hour killer below is an unexecuted falsifier defined for each deep review.

## Six complete deep reviews

### 1. PyTorch DataLoader → pinned host-to-device movement — `DROP`

**Shift evidence:** current PyTorch documentation says host-to-GPU copies from pinned memory are faster and can overlap with computation; current `DataLoader` source makes pinning, prefetch, workers, order and persistence explicit. **Exact object:** same ordered training batches and tensor values fed to the same model; **full cost:** source read/decode/collate + worker queue + pinned-copy materialization + H2D + model step. **Atomic-action audit:** the screened action chooses batch pinning, prefetch, workers, nonblocking copy and ordering. Current union exposes `pin_memory`, `prefetch_factor`, `persistent_workers`, `in_order` (default true), and asynchronous copy. It is therefore a controller/path formulation; `in_order=false` can also harm reproducibility. No distinct batch-construction algorithm with same data/order contract was frozen.

**Natural carrier:** torchvision/public-image datasets used by upstream DataLoader tests. **72h killer:** one fixed ordered training epoch; fail if the action is expressible by current DataLoader/copy flags or changes yielded batch sequence/value. No brief.

### 2. TensorFlow tf.data → host/device pipeline materialization — `NOT_ADMITTED_UNFROZEN`

**Shift evidence:** TensorFlow’s current tf.data APIs document prefetch/autotune and device-facing pipeline staging, whose role is to overlap input preparation/movement with computation. **Exact object:** the same finite dataset elements, deterministic ordering and model-step outputs; **full cost:** source transform + batching + staging/prefetch + transfer + compute. **Atomic-action audit:** no complete new joint constructor was successfully frozen. Candidate forms were merely buffer-size/autotune/prefetch scheduling, or changed sharding/order behavior. These are not promoted or dropped for lack of code; they remain `NOT_ADMITTED_UNFROZEN` because the same-object action and information condition were not defined beyond runtime policy.

**Natural carrier:** public TFDS image datasets and TensorFlow tf.data test pipelines. **72h killer if promoted:** a deterministic pipeline with fixed seed; fail on changed element order/cardinality or if all behavior maps to existing `prefetch`/`AUTOTUNE` configuration.

### 3. NVIDIA DALI → decode-to-device materialization — `NOT_ADMITTED_UNFROZEN`

**Shift evidence:** DALI’s official project documents GPU-accelerated preprocessing and pipeline execution, deliberately moving input preparation off the training compute critical path; remaining cost can be decode/copy/materialization. **Exact object:** identical decoded tensors and labels presented to a training step; **full cost:** encoded read + decode/augment + CPU/GPU movement + pipeline materialization + model step. **Atomic-action audit:** current operators/prefetch/pipeline execution are present, but no whole, same-output construction outside their union was frozen. A rearrangement of operators or copy placement may alter augmentation/order/randomness. This is honestly `NOT_ADMITTED_UNFROZEN`, not a resource/readiness rejection.

**Natural carrier:** DALI’s public image/video pipeline examples. **72h killer if promoted:** fixed seed and files; fail if output tensors/order differ, or candidate is only an existing operator/prefetch composition.

### 4. libfabric → memory-registration / completion verification — `NOT_ADMITTED_UNFROZEN`

**Shift evidence:** libfabric’s provider/endpoint interface makes memory-registration, completion, RMA/message transfer and buffer modes first-class, exposing registration/completion costs once payload compute is short. **Exact object:** same fabric message/RMA data and completion/error semantics; **full cost:** buffer preparation/registration + transfer + completion verification + consumer use. **Atomic-action audit:** no whole registration/verification construction was fixed separate from choosing FI modes/provider capabilities. The current union must be treated as strong baseline, but a union-external protocol requires exact provider, memory-key and completion guarantee; these were not finitely frozen.

**Natural carrier:** official libfabric functional tests and provider-supported loopback traces. **72h killer if promoted:** same provider and payload sequence; fail if mode choice alone expresses the action or completion/error semantics differ.

### 5. Ceph BlueStore → checksum/extent materialization — `NOT_ADMITTED_UNFROZEN`

**Shift evidence:** BlueStore’s first-party architecture/source separates data I/O from checksums, metadata and extent/database paths, so faster device/data paths can expose integrity/materialization work in the OSD’s full cost. **Exact object:** same Ceph object read/write acknowledgment with current integrity/recovery semantics; **full cost:** client/OSD data path + checksum + extent metadata + database/persistence + verification/recovery. **Atomic-action audit:** a potential joint extent/checksum construction was not frozen without changing on-disk/recovery guarantees. Cache, checksum choice, or OSD scheduling is inadmissible. The correct result is `NOT_ADMITTED_UNFROZEN`.

**Natural carrier:** Ceph upstream BlueStore test objects and public OSD integration traces. **72h killer if promoted:** fixed object write/read with fault/checksum path; fail if recovery/checksum semantics differ or candidate reduces to cache/configuration.

### 6. JAX → asynchronous dispatch / device-result materialization — `DROP`

**Shift evidence:** JAX’s official documentation describes asynchronous dispatch: host can enqueue work while device runs, making synchronization/device-result materialization a visible end-to-end boundary after computation is dispatched. **Exact object:** same JAX function values/errors under fixed device semantics; **full cost:** trace/compile/dispatch + host-device transfer + device execution + synchronization/result materialization. **Atomic-action audit:** the screened action was choosing synchronization/copy/dispatch timing. It is an existing runtime path; forcing or avoiding synchronization changes observation/timing contract, while a representation change changes device/result interface. No whole same-function algorithm or quality/complexity guarantee was frozen.

**Natural carrier:** JAX public quickstart/benchmark functions with fixed arrays. **72h killer:** fixed function and seed; fail if candidate only changes `block_until_ready`/dispatch/copy behavior or changes observable result/error timing semantics.

## Evidence integrity and outcome

Each row freezes a natural carrier, full cost and a finite non-executed killer. PyTorch and JAX are structural controller/path drops; TensorFlow, DALI, libfabric and BlueStore remain action-unfrozen rather than being rejected for missing implementation, positive results, resources, hardware, downloads or AI readiness. No experiment, benchmark, data download, automation, Stage0/A/B or shared-control mutation occurred.

`PROPOSE_STAGE0: []`; state after handoff: `IDLE_REUSABLE_AWAITING_MAINLINE`.
