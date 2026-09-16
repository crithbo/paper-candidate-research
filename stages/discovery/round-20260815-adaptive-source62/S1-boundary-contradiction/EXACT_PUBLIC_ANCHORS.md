# Exact public anchor

## A01 — MPI-4.1 partitioned point-to-point communication

- Exact public anchor/version: MPI Standard Version 4.1, approved 2023-11-02; official PDF observed 2026-08-15.
- URL: https://www.mpi-forum.org/docs/mpi-4.1/mpi41-report.pdf
- Fixed object: one persistent partitioned point-to-point request with fixed partition layout, start/test/wait trace, matching order, and `MPI_Pready*` publications.
- Fixed endpoint: same MPI completion/partial-completion observations and message contents; no transport replacement or weaker progress claim.
- Current route: official MPICH repository plus its partitioned communication implementation/tests; immediate contrary source is the MPICH/ICPP partitioned-communication performance study.
