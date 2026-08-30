# Research-question candidate

## `S1-89-RQ01`

For a fixed MPI-4.1 point-to-point communication trace, request handle, buffer lifetime, error/completion endpoint, and message order, can a target-specific constructor reduce request-lifetime cost while allowing the same legal early request release and retaining full completion/error observability?

The RQ has one scope. Replacing the MPI request with an application tracker changes the endpoint; a generic request pool or controller is not N2. Ordinary source closure only; no selective packet.
