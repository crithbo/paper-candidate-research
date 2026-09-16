# Raw screen row events

| Row | First-party evidence | Frozen fact / action implication | Outcome |
|---|---|---|---|
| R1 | Yosys `memory_map` documentation | `memory_map` translates multiport memories created by `memory_collect` into basic cells. | native mapping baseline |
| R2 | Yosys upstream/source index | Current upstream contains the memory-pass and techmap source families named in the assignment. | requires path/flag closure |
| R3 | Yosys formal documentation | EQY provides a Yosys-based formal equivalence driver; formal equivalence can be an oracle route. | fidelity route |
| R4 | Yosys pass documentation | Existing memory handling supports library-driven mapping and sequential/memory transformations. | strongest-composition component |
| R5 | Proposed joint action | Bank/depth-width/port-sharing/FF-vs-BRAM choices can be selected jointly under a fixed cell library and fixed sequential semantics. | retain for N2 review |
| R6 | Current-source/collision closure | Exact commits; all pass ordering/default/nondefault flags; actual memory_bram/library/techmap constraints; and FPGA memory-mapping/vendor-tool literature collision are not fully closed. | `NOT_ADMITTED_UNFROZEN` |

The N2 hypothesis is not rejected because R5 uses known actions. R6 prevents a source-supported claim that the proposed joint algorithm is beyond current composition.
