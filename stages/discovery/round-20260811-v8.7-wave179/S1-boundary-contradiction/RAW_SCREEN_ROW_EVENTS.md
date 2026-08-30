# RAW_SCREEN_ROW_EVENTS

| ID | 2025--26 compiler/runtime seam family | Fixed same-object contract and natural carrier | Current status |
|---|---|---|---|
| R01 | [COGENT, ASPLOS'26](https://www.asplos-conference.org/asplos2026/program/index.html): RISC-V binary tag compiler -> tagged binary -> runtime/loader consumer. | One fixed RISC-V binary plus its tag semantics; natural carrier would be published test binaries. | `NOT_ADMITTED_UNFROZEN` |
| R02 | [CHERI-SIMT, ASPLOS'26](https://www.asplos-conference.org/asplos2026/program/index.html): capability-aware GPU compilation -> ISA artifact -> capability runtime. | Fixed capability-memory safety semantics for one kernel. | `NOT_ADMITTED_UNFROZEN` |
| R03 | [JOSer, ASPLOS'26](https://www.asplos-conference.org/asplos2026/program/index.html): JIT serialization compiler -> serializer artifact -> Java reader/runtime. | Fixed Java object graph and byte-exact/deserialization contract. | `NOT_ADMITTED_UNFROZEN` |
| R04 | [FuseFlow, ASPLOS'26](https://www.asplos-conference.org/asplos2026/program/index.html): sparse dataflow compiler -> kernel graph -> streaming runtime. | Fixed sparse operator outputs and streaming dataflow contract. | `NOT_ADMITTED_UNFROZEN` |
| R05 | [Trinity, ASPLOS'26](https://www.asplos-conference.org/asplos2026/program/index.html): tensor optimizer -> lowered program -> tensor runtime. | Fixed tensor result/precision contract. | `STRUCTURAL_DROP__GENERIC_COMPILER_PASS` |
| R06 | [Triton-Sanitizer, ASPLOS'26](https://www.asplos-conference.org/asplos2026/program/index.html): compiler instrumentation -> kernel -> diagnostic runtime. | Fixed kernel semantics plus diagnostic report. | `STRUCTURAL_DROP__INSTRUMENTATION` |

For every row, a future StageA contract must charge compiler/JIT time, generated artifact bytes, load/link/serialization work, runtime latency/RSS/device or CPU cost, output/legality oracle and natural carrier preparation. No row advances without a first-party current source/config union.
