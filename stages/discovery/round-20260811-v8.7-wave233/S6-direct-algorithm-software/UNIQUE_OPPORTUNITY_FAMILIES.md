# Unique opportunity family

## F1 — whole-memory joint banking and technology-map algorithm

**Same-object contract.** Fix synthesizable RTL sequential behavior, clock/reset semantics, read-during-write behavior, port behavior, latency, and the target memory-cell library. A result must be formally equivalent under the fixed contract and use only native technology-mapping constructs. It may not change timing semantics, add an arbiter that alters port behavior, select another library, or delegate selection to a generic ILP oracle.

**Candidate N2 (hypothesis).** Given a normalized memory, choose a decomposition into banks and depth/width parts; assign ports and sharing/mux logic; decide which portions use target RAM cells versus FFs; and co-optimize area, mux depth, latency constraints, compilation cost, and mapping feasibility. All choices already exist as primitives, but an approximation/parameterized/complexity result for their **joint** selection could be a valid N2 if it is not reproduced by current pass composition.

**Minimal RTL action-divergence witness.** A dual-read-port, single-write-port memory with a library offering one single-port RAM cell and FF logic admits two fixed-semantic outputs: (A) an FF implementation; (B) two replicated/banked RAM instances plus address/data selection that preserves each port’s stated latency and read-during-write behavior. This establishes two native-legal whole mappings, not a residual certificate. The exact library rules and complete reference design must be frozen in Stage A.

**Why it is not admitted.** The source-level union across `memory_collect`, `memory_dff`, `memory_share`, `memory_bram`, `memory_map`, `techmap`, `opt`, target-library rule files, and their default/nondefault flows has not been pinned. Current behavior may already compose enough of the proposed choices. Primary collision against FPGA banking/technology-mapping algorithms and vendor flows is not closed. Hence this is an honest `NOT_ADMITTED_UNFROZEN`, not a scientific DROP.

**Natural finite route.** Public Verilog/SystemVerilog designs containing multiport memories (for example, Yosys tests and public CPU/SoC RTL) can be versioned carriers. A later 72h fidelity gate would freeze a small synthesizable witness plus an open target memory-cell library and EQY equivalence; no material was downloaded or executed here.
