# Research-question candidate

## Primary RQ

For a fixed CPython exporter, requested `Py_buffer` flags, consumer call trace, bytes/format/shape result, and exporter validity/resize semantics, is there a non-generic complete N2 constructor that jointly places buffer-view ownership/release work to reduce full lifecycle cost while preserving the same endpoint?

### Counterfactual and discriminator

The counterfactual is a different legal acquire/use/release construction under the same C-API contract. It must preserve both the consumer result and the exporter’s permitted lifetime/mutability behavior. A mere earlier or later release fails if it changes when the exporter can be resized, freed, or otherwise observes the outstanding export.

### Initial closure route

Pin the current CPython documentation and `PyBuffer_Release` implementation; trace acquire → use → release on a public C-API extension/example; use the native protocol/refcount behavior as the oracle. The smallest killer is a consumer/exporter trace showing that any different release point changes exporter validity or is simply the protocol-prescribed pairing.
