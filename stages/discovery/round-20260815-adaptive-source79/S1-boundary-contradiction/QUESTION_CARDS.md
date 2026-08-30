# Question cards

## QC01 — Py_buffer ownership/release

- Exact identity: A01, CPython `Py_buffer` acquisition and `PyBuffer_Release`.
- Same-object problem and endpoint: preserve the requested view and the exporter/consumer validity and resize contract.
- Contribution type considered: N2, a joint lifecycle constructor rather than a new wrapper.
- Current-source locus: official buffer-protocol documentation and CPython `Objects/abstract.c` release path.
- Minimum falsifier: one native acquire/use/release trace where the alternate placement either changes exporter validity/resizability or reduces to the existing required pair.
- Finite closure route: source pin plus public C-API trace and native protocol oracle; no build or experiment performed in Discovery.
- Full-cost initial denominator: consumer CPU/refcounts, retained memory, producer release work, copying/bytes, resize/mutability wait, and end-to-end consumer I/O/array work.

## Gate result

`KNOWN_FATAL`: the public contract requires release exactly once after successful acquisition, and the consumer-owned strong reference is what keeps the exporter valid. Moving release changes the fixed endpoint; retaining the same pairing is no new target-specific algorithm. Therefore QC01 does not enter evidence-qualified raw.
