# RAW_SCREEN_ROW_EVENTS

| ID | New producer--consumer ownership seam | Exact object / natural carrier | Current whole-action union | Status |
|---|---|---|---|---|
| R01 | GPU state producer -> restore consumer | [GCR FAST'26](https://www.usenix.org/conference/fast26/presentation/zeng): one GPU process checkpoint and same-process restoration; public C/R traces. | cuda-ckpt, PhOS and GCR control/data split, dirty identification, checkpoint/restore. | `DEEP_DIVE_REQUIRED` |
| R02 | Compiler event producer -> profiler consumer | [Neutrino OSDI'25 artifact appendix](https://www.usenix.org/system/files/osdi25-huang-songlin.pdf?file=osdi25-huang-songlin.pdf): a CUDA kernel and collected trace. | compiler instrumentation, probes, collection/analysis and source-level profiler semantics. | `DEEP_DIVE_REQUIRED` |
| R03 | Binary producer -> decompiler semantic consumer | [Bin2Wrong ATC'25](https://www.usenix.org/conference/atc25/presentation/yang-zao): source/compiler/optimization/format testcase tuple. | binary mutation, testcase construction, decompiler and semantic/differential oracle. | `DEEP_DIVE_REQUIRED` |
| R04 | Software producer -> redacted SBOM consumer | [Petra, Security'26](https://www.usenix.org/system/files/conference/usenixsecurity26/sec26_prepub_ishgair.pdf): artifact plus redacted SBOM redistribution chain. | producer policy, SBOM generator, redaction, verifier/KMS and consumer protocol. | `NOT_ADMITTED_UNFROZEN` |
| R05 | GPU collective producer -> overlap-kernel consumer | [MSCCL++ ASPLOS'26 program](https://www.asplos-conference.org/asplos2026/program/index.html): a communicated tensor consumed by GPU execution. | documented collective/runtime API and kernel/stream synchronization. | `NOT_ADMITTED_UNFROZEN` |
| R06 | Training producer -> resilient execution consumer | [RobustRL OSDI'26 sessions](https://www.usenix.org/conference/osdi26/technical-sessions): a training state and error/restart/reconnect consumer. | error detection, restart/reconnect and runtime policy. | `STRUCTURAL_DROP__CONTROLLER` |

All carriers and actions are scoped to the listed object; no issue, future-work, or unverified absence claim is used.
