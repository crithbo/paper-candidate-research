# Primary-source audit

Cutoff: 2026-08-09. Only publisher/standards-body/author-artifact sources are used for technical claims. Download byte counts and hashes are frozen in `SOURCE_MANIFEST.yaml`.

## Claim-to-source map

| Source | What it establishes | What it does not establish for this assignment |
|---|---|---|
| Sereno, OSDI 2026 | Natural commercial-phone UI/application plus on-device LLM concurrency; Perfetto jank/slow-rendering metrics; topology-level `nsp_noc` to `SLAVE_EBI1` attribution; aggregate contention and system behavior; five-minute application/system traces. | A public per-request source/operation-to-first-arbiter trace, actual arbiter decisions, per-request AxQOS stream, or a candidate-vs-native same-object witness. The paper explicitly reports opaque NPU binaries and aggregate profiler visibility. |
| Arm AMBA AXI/ACE IHI0022H | `AWQOS` and `ARQOS` are 4-bit identifiers attached per write/read transaction. | Exact use of the identifier. The specification explicitly delegates semantics to a system-level QoS scheme, so it cannot instantiate the frozen mobile comparator. |
| AMD Versal QoS documentation | Official evidence that QoS signals/traffic classes can propagate through a programmable interconnect. | Same mobile SoC/object, same native comparator, or same workload. It is a subtractor/reference only. |
| XSched, OSDI 2025 + author artifact at `e5ed108...` | A preemptible command-queue abstraction and scheduling implementation for XPU commands. | Request-level mobile NoC/DRAM arbitration or a first-shared-arbiter mapping. |
| Layerweaver+, IEICE 2022 | QoS-aware scheduling of incoming DNN requests/layers. | Natural mobile foreground-plus-LLM traffic, transaction-QoS action, or first-arbiter evidence. |

## Exact PDF audit anchors

- Sereno PDF page index 4 (zero-based): `nsp_noc` reaches `SLAVE_EBI1`; page index 5: opaque binaries lack per-operator memory behavior/fine-grained shaping and profiler data are aggregate; page index 9: Perfetto foreground metrics; page index 11: five-minute traces.
- Arm PDF page index 101: two 4-bit QoS identifiers and the statement that the protocol does not specify exact use.
- XSched PDF page index 4: XQueue is a preemptible command queue.
- Layerweaver+ PDF page index 0–1: incoming-user-request/layer scheduling and QoS constraints.

The extracted-text audit is reproducible with `scripts/audit_pdf_text.py`. Its output is not a substitute for the primary PDFs; it is an indexed inspection aid.

## Collision and action boundary

Sereno is the closest same-setting subtractor, but its action is software yielding and its public observability stops before the required transaction-to-arbiter mapping. XSched and Layerweaver+ operate at command/request/layer scheduling boundaries. Arm and AMD establish that native QoS fields and propagation mechanisms exist, which makes B3/B4 mandatory, but neither defines the actual comparator on the frozen mobile platform.

No primary source found in the permitted set directly collides with the fully frozen candidate action. That is not a novelty finding: because the natural object and actual comparator cannot be instantiated, latest-collision closure remains conditional and no scientific outcome is inferred.
