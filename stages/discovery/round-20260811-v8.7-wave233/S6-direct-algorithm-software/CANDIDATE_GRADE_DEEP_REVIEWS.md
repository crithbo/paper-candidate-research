# Candidate-grade deep review

## F1 — Yosys joint whole-memory banking/map algorithm

**Disposition:** `NOT_ADMITTED_UNFROZEN`; no brief.

| Gate | Frozen record |
|---|---|
| Exact object / guarantee | Same RTL sequential semantics, clock/reset/read-during-write/port behavior and fixed target memory-cell library; formal equivalence is required. |
| Atomic action catalog | Normalize memory; choose banking and depth/width partition; replicate/share ports; generate mux/arbiter-free selection consistent with contract; choose RAM or FF realization; map with library constraints. |
| Strongest fair composition | Current Yosys memory collection, DFF/share/BRAM/map passes, techmap/opt, target-library rule files and all valid pipeline/default/nondefault options, plus comparable open/vendor mapping tools. Full union unclosed. |
| Static witness | A fixed dual-read/single-write memory can be mapped to FFs or to native RAM replication/banking with regenerated selection logic under the same port/latency contract. |
| Putative N2 | A non-generic joint algorithm with an approximation/FPT/complexity guarantee over whole-memory mapping under area/depth/latency/mux/compile budgets. |
| Natural carrier | Versioned public multiport-memory Verilog/SystemVerilog corpus; target library must be public and frozen. |
| Full-cost denominator | Synthesis CPU+wall+RSS/temp; mapped area/cell count; mux depth/critical path; memory latency; formal-equivalence CPU/RSS; any required mapping-rule generation. |
| 72h killer | Pin all named Yosys passes and target library rules/options; create the fixed two-output witness; formal-check it; compare against complete native composition and a fair target tool; reject if semantics change, only config/pass order is new, current union realizes it, or complete cost destroys the tradeoff. |
| Fidelity closure | Finite but incomplete: current source/config and direct collision closure are required first. |

### N2 assessment

Using known actions is permissible. The possible contribution is the joint selection algorithm and guarantee, not a claim that the primitives are missing. However, this cannot be promoted until the current compositional baseline and collisions are frozen; otherwise an apparent algorithm may reduce to pass sequencing, a target configuration, generic ILP, or changed timing behavior.
