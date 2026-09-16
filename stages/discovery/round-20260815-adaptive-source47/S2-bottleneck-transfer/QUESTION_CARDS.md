# Evidence-qualified question cards

## QC47-01 — KokkosComm non-contiguous View

- **Same object:** fixed source/destination View values, layout and send/receive completion.
- **Action and discriminator:** a target-specific pack/datatype/temp constructor with a bounded full-cost property, not a packer selection.
- **Current locus:** KokkosComm documents `Packer::DeepCopy` allocation/pack/unpack and `MpiDatatype` no-op alternatives; requests own temporary lifetime until `wait()`.
- **Comparator/full cost:** current Packer variants under equal views; pack/unpack CPU, temporary device bytes/RSS, MPI transfer and request wait latency.
- **Carrier/falsifier:** current KokkosComm packing tests/docs; equality plus request completion. Kill if all actions are Packer/Datatype selection.
- **Disposition:** `STRUCTURAL_DROP__CURRENT_PACKER_DATATYPE_UNION_OR_GENERIC_PACKING`.

## QC47-02 — rocSHMEM put-signal

- **Same object:** fixed symmetric-heap source/destination bytes, PE, signal address/value/operator and completion ordering.
- **Action and discriminator:** a target-specific whole data+signal constructor, not choosing wave/workgroup/NBI call forms or a protocol scheduler.
- **Current locus:** rocSHMEM current signal API defines device `putmem_signal` and wave/workgroup/NBI variants; it transfers data then applies the specified signal operation.
- **Comparator/full cost:** stock same-call union; launch/setup, data bytes, signal/atomic cost, wait/synchronization, device memory and latency.
- **Carrier/falsifier:** official rocSHMEM API example/test with exact destination and signal oracle. Kill if proposed construction composes documented calls.
- **Disposition:** `STRUCTURAL_DROP__CURRENT_PUT_SIGNAL_UNION_OR_PROTOCOL_CONTROLLER`.

## QC47-03 — KokkosComm Channel

- **Same object:** fixed endpoint ranks/tags, registered views and completed send/receive values.
- **Action and discriminator:** buffer-registration/lifetime constructor beyond native channel queue operations, excluding controller/replay.
- **Current locus:** Channel documentation defines `sendinit`, `recvinit`, queued accumulation, `start` fencing/launch and `wait` consumption.
- **Comparator/full cost:** current channel operations; registration CPU, metadata/resident buffers, fences, transfer and completion latency.
- **Carrier/falsifier:** official channel API route; exact received values/completion oracle. Kill if only registration sequence remains.
- **Disposition:** `STRUCTURAL_DROP__CURRENT_CHANNEL_UNION_OR_CONTROLLER`.
