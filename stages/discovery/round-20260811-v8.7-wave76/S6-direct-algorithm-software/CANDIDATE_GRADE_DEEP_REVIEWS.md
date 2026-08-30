# Candidate-grade deep reviews — Wave76

| family | whole action/current union | witness/full cost/72h killer | decision |
|---|---|---|---|
| WiredTiger pages | fixed records to reader-equivalent column pages; native page encoding union | small record page; bytes/write/read CPU/RAM. Killer: read mismatch or no charged Pareto. | DROP: page/codec choice, no atomic N2. |
| HFile index | fixed KV blocks to HFile index; native builder union | two-block index witness; bytes/build/seek/read. Killer: reader mismatch. | DROP: index level/block policy/configuration. |
| LMDB pages | fixed KV to native pages/free list; current B-tree construction union | six-key page witness; bytes/build/read. Killer: reader/integrity failure. | DROP: B-tree page construction family. |
| TOAST chunks | fixed value to TOAST reader; native chunk/compression union | long value witness; write/read/bytes. Killer: value mismatch. | DROP: ordinary chunk/codec configuration. |

All rows have finite native fidelity closures but no same-object union-external nontrivial N2. No readiness/resource/result factor is a DROP reason.
