# Same-object RQ candidates

- **RQ47-01:** fixed non-contiguous `Kokkos::View` values, MPI receive values and request completion; ask whether pack/datatype/temporary construction has a target-specific guarantee beyond existing `Packer` implementations.
- **RQ47-02:** fixed rocSHMEM symmetric-heap values, remote PE, signal update and completion; ask whether put-plus-signal construction exceeds current device-side operations without becoming a protocol controller.
- **RQ47-03:** fixed KokkosComm channel endpoints, buffers and send/receive completion; ask whether registration/lifetime construction exceeds queued `sendinit`/`recvinit`/`start`/`wait` actions.

Versions were fixed before source outcomes.
