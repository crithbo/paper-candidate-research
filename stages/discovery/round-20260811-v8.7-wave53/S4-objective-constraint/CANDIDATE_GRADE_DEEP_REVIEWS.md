# Candidate-grade fidelity-first deep reviews

The four reviews freeze a same-function oracle before testing novelty. The first-party conference record is the current official mechanism record. No residual depends on a claim that a moving upstream implementation lacks a flag/action; consequently no undocumented absence is inferred. Implementation and readiness are recorded separately and are not used as negative evidence.

## SPICE-SHELF-RESTORE — DROP

- Exact object/guarantee: restore one fixed snapshot into an executable process with identical user-visible function behavior and required OS/process state.
- Atomic alleged action: choose a sparse/reordered physical page layout while splicing it into the original virtual layout and bulk-restoring process metadata.
- Strongest union: Spice's SHELF format, `spliceVMA`, selective prefetch/overlay, and bulk metadata restoration. This is already the complete joint layout/restore action.
- Six dimensions: same layout action; same snapshot/page information; same disk/VMA/metadata resources; same runnable-process guarantee; full cost is bytes, faults, copies, I/O and restore calls; remaining difference is layout policy tuning.
- Current docs/source/flags: official OSDI record checked. It states the mechanism directly; no action-gap relies on a missing source symbol or default/nondefault flag.
- Fidelity closure/killer: a one-function snapshot restores or fails under the native process contract; the proposed action is already replayable by the documented constructor before any benchmark.
- Structural potential: `BELOW_Q2_STOP` for this residual. Current readiness: public paper route, not a decision factor.

## ARCA-CONTINUATION — DROP

- Exact object/guarantee: a dependency-waiting function continuation that resumes with the same serializable state and isolation contract.
- Atomic alleged action: capture the continuation then pause, migrate, or copy it according to a resource/latency bound.
- Strongest union: Arca's continuation capture service and its portable serializable continuation operations.
- Six dimensions: decision is precisely capture/pause/migrate/copy; information is continuation/dependency state; resource includes capture bytes and movement; guarantee is state/isolated resume; full cost includes capture, transfer, resume and wait; a threshold only reweights existing actions.
- Current docs/source/flags: official OSDI record checked; no absence claim is needed.
- Fidelity closure/killer: a one-continuation capture/resume witness must preserve the serialized state. Any claimed action is an existing Arca operation; a different serializability rule changes object/guarantee.
- Structural potential: `BELOW_Q2_STOP`; readiness not used negatively.

## FALCONFS-STATELESS-METADATA — DROP

- Exact object/guarantee: a fixed distributed filesystem namespace and file-operation sequence with identical path and file results.
- Atomic alleged action: perform server-side hybrid metadata lookup/lazy namespace replication while merging concurrent metadata requests under a client-memory hard cap.
- Strongest union: FalconFS stateless-client architecture, server-side hybrid metadata indexing, lazy namespace replication, concurrent request merging and VFS shortcut.
- Six dimensions: same metadata actions and namespace information; server CPU/network/replication resources; same POSIX-like file/namespace results; full cost includes metadata, replication, request merge and actual file I/O. A new client cache violates the frozen cap/object; a new policy only reorders current work.
- Current docs/source/flags: official NSDI record checked. It explicitly documents the complete constructor; no missing feature/flag claim is made.
- Fidelity closure/killer: one namespace trace plus path/file equality is finite. The atomic action maps to FalconFS's stated union, so the residual is directly absorbed.
- Structural potential: `BELOW_Q2_STOP`; production/open-source readiness does not affect that conclusion.

## ZIPLLM-LOSSLESS-LAYOUT — DROP

- Exact object/guarantee: a fixed family of model tensors reconstructed bit-for-bit from storage.
- Atomic alleged action: jointly cluster related variants, deduplicate tensor blocks and encode the remaining XOR delta losslessly under a read/decode budget.
- Strongest union: ZipLLM's model-family clustering, tensor-level deduplication and lossless BitX delta compression.
- Six dimensions: same grouping/dedup/delta choices and tensor information; resource includes index and metadata plus encoding/decoding; guarantee is exact tensor recovery; full cost includes storage, build, lookup, read amplification and decode. Selecting a different threshold/cluster criterion is ordinary tuning; a lossy delta changes guarantee.
- Current docs/source/flags: official NSDI record checked; no absence claim is made.
- Fidelity closure/killer: a two-variant tensor witness must reconstruct byte-identically and charge every index/delta byte. The complete action already exists in the documented union.
- Structural potential: `BELOW_Q2_STOP` for the proposed residual; current implementation status is irrelevant.
