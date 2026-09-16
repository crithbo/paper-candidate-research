# Raw-screen row events

| event | evidence | consequence |
|---|---|---|
| CURRENT_PRODUCER_PIN | Official DepQBF site identifies 6.03 as latest release; official upstream GitHub master README identifies version 6.03. | Current producer is frozen to `lonsing/depqbf` master/6.03 documentation surface, accessed 2026-08-11. |
| TRACE_UNION | README: `--trace` prints every resolution step during clause/cube learning; ASCII QRP and `--trace=bqrp` binary QRP; tracing needs simple dependency scheme, no incremental solving, and `--no-lazy-qpup` for QPUP QCDCL. | The native trace action is an emitted complete QCDCL derivation, not a separately free writer schedule. |
| CHECKER_PIN | Official QRP grammar defines a trace as steps with unique IDs and at most two antecedents; QRPcheck checks ASCII/binary QRP. | Stock checker oracle and legal smallest dependency witness are frozen. |
| LATEST_COLLISION | SAT 2025 QRP+Gen extends QRP and equips DepQBF with proof-producing generalized-axiom oracles. | The apparent stronger complete proof-production direction is already directly occupied. |
| FINAL | No same-object union-external N1/N2 remains after excluding postprocessing and changed QCDCL search. | STRUCTURAL_DROP |
