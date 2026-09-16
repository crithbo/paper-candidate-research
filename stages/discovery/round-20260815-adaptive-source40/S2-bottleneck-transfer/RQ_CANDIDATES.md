# Same-object RQ candidates — Source40 S2

## S40-01 cuObject

- RQ-A: For a fixed versioned S3 GET/PUT object request set, object bytes and completion result, can a client/server descriptor-and-buffer constructor reduce full control/data-path cost with a bounded same-object guarantee?
- RQ-B: Under the same object request contract, can RDMA descriptor/materialization structure change direct-transfer completion cost without changing object-store semantics?
- Selected: RQ-A; contribution type `SYSTEM_ARCHITECTURE / N2`; minimum falsifier is that the full action is already just current cuObj client/server API composition.
- Deterministic carrier/evidence route: current cuObject v1.2 official overview and client/server API specifications.

## S40-02 OpenVINO RemoteTensor

- RQ-A: For a fixed video/GPU surface, tensor values and inference output, can a target-specific interoperability-materialization constructor reduce full shared-surface execution cost under stock RemoteTensor semantics?
- RQ-B: Can the same remote tensor object admit a bounded copy/interop guarantee beyond existing context/tensor construction APIs?
- Selected: RQ-A; contribution type `COMPILER_TOOL / N2`; minimum falsifier is that the needed action is existing RemoteTensor context/tensor API composition or requires an altered reader.
- Deterministic carrier/evidence route: current official OpenVINO GPU RemoteTensor documentation; one old official carrier page is known, but the current version locus is a bounded closure question.

The RQs were committed before targeted source outcomes. Missing exact current source was not used as an RQ discard reason.
