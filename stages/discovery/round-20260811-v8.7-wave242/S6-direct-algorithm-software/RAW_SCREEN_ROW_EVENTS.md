# Raw screen-row events

| Row | Primary anchor | Review event | Result |
|---|---|---|---|
| R1 | GNU ld 2.46 manual | Linker scripts map input sections to the output and control memory layout; a default script is always used. | same-object constraints are substantial |
| R2 | GNU ld `SECTIONS`/output-address documentation | Without `SECTIONS`, input sections are placed in first-encounter order; output addresses are aligned and scripts can constrain them. | establishes legal layout actions and limits |
| R3 | GNU Binutils official source-access page | Official development source is `binutils-gdb.git`, with branch/snapshot access. | network retrieval did not supply a pinned source revision/call-path audit |
| R4 | LLVM lld upstream source/docs | lld implements ELF GC/ICF and target thunk/relaxation machinery. | strong subtractor; not a closure of GNU ld/BFD composition |
| R5 | Joint constructor lead | Jointly choose legal placement/alignment/relaxation/thunk realization while regenerating relocations. | witness is conditional, residual not admitted |

No issue, future-work sentence, missing local checkout, or missing measurement was treated as evidence of a gap.
