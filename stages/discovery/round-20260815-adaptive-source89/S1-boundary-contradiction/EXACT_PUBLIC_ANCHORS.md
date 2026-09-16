# Exact public anchor

## A01 — MPI active-request free and completion observability

- exact object: MPI-4.1 nonblocking point-to-point request lifecycle, instantiated by Open MPI 5.0.x `MPI_Request_free`.
- primary anchor: [MPI-4.1 standard](https://www.mpi-forum.org/docs/mpi-4.1/mpi41-report.pdf), section 3.7, pp. 82–83.
- current implementation/interface anchor: [Open MPI 5.0.x `MPI_Request_free`](https://docs.open-mpi.org/en/v5.0.x/man-openmpi/man3/MPI_Request_free.3.html).
- frozen contract: fixed point-to-point request, send/receive buffer semantics, request handle, completion/error observability, and message ordering.
- natural carrier: MPI applications that overlap nonblocking sends with computation and free a send request after logically establishing completion elsewhere.

This anchor is a locator, not a residual claim.
