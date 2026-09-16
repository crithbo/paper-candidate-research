# SOURCE_COLLISION_MATRIX

| Family | First-party evidence | Strongest same-object union / collision | Decision |
|---|---|---|---|
| GCR | [FAST'26 paper](https://www.usenix.org/conference/fast26/presentation/zeng) | GCR plus named cuda-ckpt/PhOS C/R actions; control/data split and incremental dirty identification. | Absorbed. |
| Neutrino | [OSDI'25 artifact appendix](https://www.usenix.org/system/files/osdi25-huang-songlin.pdf?file=osdi25-huang-songlin.pdf) | Probe/instrument/collect/analyze path. | Instrumentation is not a whole contribution. |
| Bin2Wrong | [ATC'25 paper](https://www.usenix.org/conference/atc25/presentation/yang-zao) | Unified source/compiler/optimization/format testcase mutation and oracle union. | Absorbed. |
| Petra | [Security'26 paper](https://www.usenix.org/system/files/conference/usenixsecurity26/sec26_prepub_ishgair.pdf) | Policy/generator/redaction/verifier/KMS protocol surface not source-enumerated in this pass. | Unfrozen, no absence claim. |
| MSCCL++ | [ASPLOS'26 official program](https://www.asplos-conference.org/asplos2026/program/index.html) | Current source/config contract not source-enumerated in this pass. | Unfrozen. |
| RobustRL | [OSDI'26 official sessions](https://www.usenix.org/conference/osdi26/technical-sessions) | Detection/restart/reconnect mitigation. | Controller-only. |

Latest collision was checked only at the cited official paper/upstream surface. `SEARCH_BOUNDED_OPEN` is not used as a novelty conclusion.
