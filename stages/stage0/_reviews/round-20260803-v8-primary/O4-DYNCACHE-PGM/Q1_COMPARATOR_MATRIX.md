# Q1 comparator — O4-DYNCACHE-PGM

| Anchor | Verified shape | Required candidate separation |
|---|---|---|
| [PGM-index, PVLDB 2020](https://pgm.di.unipi.it/) | learned-index guarantee/implementation pairing | non-amortized local update and delete-aware cache residual |
| [ALEX, SIGMOD 2020](https://github.com/microsoft/ALEX) | dynamic index system baseline | fixed representation/invariant rather than heuristic leaf selection |
| [ESA 2025](https://drops.dagstuhl.de/entities/document/10.4230/LIPIcs.ESA.2025.64) | fully dynamic worst-case learned index | cache-local bounded-space representation with same semantics |

**Calibration:** `PARITY_CONDITIONAL`. A paper needs two independent natural streams, executable ESA parity, proof of the two invariants, and no-gain regions.
