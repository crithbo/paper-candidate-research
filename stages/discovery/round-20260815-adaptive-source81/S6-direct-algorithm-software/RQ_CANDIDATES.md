# Research-question candidates

## RQ-S81-01

- Seed: `S81-01`.
- Exact anchor: GNU tar sparse-file documentation and current GNU tar source.
- Stable object: one fixed sparse file byte/hole map, metadata and GNU tar sparse-format compatibility contract; stock GNU tar extraction recreates the same sparse-file semantics.
- Primary RQ: **Does GNU tar admit a target-specific complete sparse-map construction algorithm with a formal archive-size versus extraction-work guarantee beyond its current sparse-format/version and detection controls?**
- Counterfactual: a user could obtain an equivalent extracted sparse file with a stated GNU-tar-specific tradeoff rather than choosing a format/version flag.
- Contribution hypothesis: `METHOD_ALGORITHM`, N2; sparse-map segment construction.
- Primary source route: GNU tar manual, then current source sparse writer/format loci.
- Transport-only fallback: GNU tar official source browser/mirror.
- Strongest null: sparse-map construction is interval/run-length representation; selection among GNU/PAX sparse formats is already a format/configuration choice, not a target-specific new algorithm.
- Pre-RQ closure: `ORDINARY_CLOSURE`; selective-depth is off.
