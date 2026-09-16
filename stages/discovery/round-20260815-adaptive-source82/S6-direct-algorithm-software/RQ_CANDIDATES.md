# Research-question candidates

## RQ-S82-01

- Seed: `S82-01`.
- Exact anchor: GNU Binutils `ar`/`ranlib` documentation and current binutils source.
- Same-object envelope: fixed archive member objects, member order and exported symbol definitions; stock linker resolution and archive semantics unchanged.
- Primary RQ: **Can GNU ar construct the archive symbol index by a target-specific complete algorithm with a stated link-time/bytes guarantee beyond current archive-index generation, without changing members or archive-reader/linker semantics?**
- Counterfactual: a link user could select a same archive object by a certified lookup/space tradeoff instead of an ordinary index representation.
- Contribution hypothesis: `METHOD_ALGORITHM`, N2; native symbol-index construction.
- Primary source route: official GNU ar/ranlib documentation and current binutils `bfd`/archive source locus.
- Strongest null: archive symbol lookup is a generic mapping from symbol keys to member offsets; member-order/index layout variation is generic table construction or changed archive ordering.
- Pre-RQ closure: `ORDINARY_CLOSURE`; no selective packet.
