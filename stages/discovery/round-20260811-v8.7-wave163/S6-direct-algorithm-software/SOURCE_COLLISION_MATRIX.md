# Source and collision matrix

| primary/official source | frozen finding | effect |
|---|---|---|
| [DepQBF official site](https://lonsing.github.io/depqbf/) | Identifies version 6.03 as latest release and upstream source location. | Establishes current release context. |
| [DepQBF upstream README](https://github.com/lonsing/depqbf) | Documents `--trace`, `--trace=bqrp`, every-step QCDCL trace emission, trace constraints and all relevant solver modes. | Freezes strongest executable producer/config union. |
| [QRP format grammar](https://fmv.jku.at/qbfcert/qrp.format) | A trace has unique steps, at most two antecedents, and resolution/reduction/input/terminal roles. | Supplies legal dependency witness and checker semantics. |
| [QBFcert/QRPcheck](https://fmv.jku.at/qbfcert/) | QRPcheck checks binary/ascii QRP; QBFcert supports solver-independent QRP traces. | Fixes stock checker route. |
| [QRP+Gen, SAT 2025](https://drops.dagstuhl.de/entities/document/10.4230/LIPIcs.SAT.2025.25) | Extends QRP with checkable generalized-axiom evidence and integrates proof-producing oracles with DepQBF. | Direct collision for the only identified richer proof-production mechanism. |

Latest-collision cutoff: 2026-08-11. No issue, future-work statement, or missing-source inference is used.
