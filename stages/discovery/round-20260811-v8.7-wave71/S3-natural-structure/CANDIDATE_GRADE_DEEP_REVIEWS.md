# Candidate-grade deep reviews

## GFA-REPEAT-PATH-CONTRACTION — DROP

- Exact object/function: a sequence graph with the same represented segment sequences, links, paths/walks and spelled path semantics.
- Natural structure: public assembly and pangenome graphs contain repeated ordered subpaths across assemblies and haplotypes.
- Minimal action-divergence witness: a path of oriented segments has no externally distinguishable interior branch for its supported walks; replace it with a single segment and rewrite incidence/path records.
- Canonical oracle and full cost: GFA validity plus equality of all preserved path spells/links; include graph construction, rewritten records, query/traversal cost and any lost path metadata, not segment count alone.
- Current union / direct subtractor: current upstream GFA assembler-components documentation lists the exact action “contract paths”: glue vertices of paths and replace each path with a single sequence segment. This is a complete same-object constructor rather than a mere configuration.
- Current-upstream reality record: GFA 1 specification and current assembler-components material were inspected at cutoff. No absence claim is used. The contrary source gives the same contracted-segment action and required path/link semantics.
- Finite Stage A killer: construct one small GFA path with a repeatable subpath and compare the claimed contraction with the official path-contract step. If it preserves the oracle, direct subtraction applies; if it loses paths/links, same-object fails. Structural-paper potential: `BELOW_Q2_STOP`.

## HDF5-REGIME-CHUNK-CONSTRUCTOR — DROP

- Exact object/function: an HDF5 dataset whose values and selection/read semantics are unchanged.
- Natural structure: public scientific datasets often combine compact hotspots, sparse regions and repeated selection patterns.
- Minimal action-divergence witness: choose a boundary where adjacent regions have different access/compression regimes, assigning independent chunk/cache treatment.
- Canonical oracle and full cost: HDF5 reader values and hyperslab selections; include chunk-index metadata, filters, cache load/flush, I/O, conversion and file bytes—not cache-hit rate alone.
- Current strongest union: current HDF5 documentation defines independently stored chunks, B-tree mapping, chunk cache, filters applied per chunk, and manual cache/chunk parameter adjustment. The supposed mechanism is a selection over this native representation/configuration space.
- Current-upstream reality record: current HDF Group chunking/chunk-issues documentation was inspected at cutoff. It supplies positive current native actions; this DROP does not rely on missing flags or unimplemented APIs.
- Finite Stage A killer: enumerate two small distinct-regime chunks under existing chunking/cache/filter choices. If the mechanism only changes shape/cache parameters it is tuning; otherwise it changes reader/filter semantics. Structural-paper potential: `BELOW_Q2_STOP`.

## OTEL-TRACE-SKELETON — DROP

- Exact object/function: OpenTelemetry traces preserving span identifiers, parent/child relationships, timestamps, attributes, links, events and status under reconstruction.
- Natural structure: traces contain repeated service-span skeletons across requests and regime phases.
- Minimal action-divergence witness: two traces have an isomorphic labeled span skeleton except for a bounded set of per-request fields; store/reuse skeleton and transmit differences.
- Canonical oracle and full cost: reconstruction equality for all stable OpenTelemetry span fields, end-to-end collection/export CPU, storage, communication, skeleton synchronization and latency.
- Direct collision: the original 2025 Tracezip paper defines a Span Retrieval Tree that continuously captures redundancy, transforms spans to a lightweight form and reconstructs full traces at the backend; it reports an OpenTelemetry Collector implementation. This is the same central shared-skeleton constructor.
- Current-upstream reality record: current OpenTelemetry Trace API/source defines the retained span contract; Tracezip is primary-paper collision evidence. No absence claim is used.
- Finite Stage A killer: on a small public trace, compare skeleton/difference reconstruction to SRT’s stated construction. Same complete action/claim gives direct collision; any dropped span field violates the oracle. Structural-paper potential: `BELOW_Q2_STOP`.
