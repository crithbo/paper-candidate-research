# Divergence Seed Pool — Source28 S5

- Assignment: `DISCOVERY-S5-20260814-ADAPTIVE-SOURCE28-RQ-PRODUCTION-V1`.
- Frontend: `RQ_REFINEMENT_STAGED_EVIDENCE_V1` in PRODUCTION; v8.7 canonical, V9 OFF.
- External lookup during seed generation: none. Seeds are non-evidence and make no novelty, absence, or quality claim.
- Network-security exclusion: PASS.

| Engine | Seed IDs |
|---|---|
| `BISOCIATION_STRUCTURAL_TRANSFER` | S28-01 |
| `PROBLEM_REFRAMING` | S28-02 |
| `CONSTRAINT_MANIPULATION` | S28-03 |
| `NEGATION_OR_INVERSION` | S28-04 |
| `ABSTRACTION_LADDER` | S28-05 |
| `COMPOSE_DECOMPOSE_SIMPLIFY` | S28-06 |

### S28-01 — target-ISA MC relaxation repair

For a fixed target ISA object file, view branch/fixup relaxation after a local assembly edit as a bounded-recourse legality-preserving constructor rather than a full reassembly. The conclusion-first test is a target-ISA relocation/encoding preservation bound, not generic incremental compilation. Risk: LLVM MC may already define this entire action surface.

### S28-02 — CIRCT FIRRTL memory lowering

For a fixed FIRRTL module and Verilog semantics, ask whether a changed memory-port constraint admits a local-global lowering action with exact emitted semantics. The conclusion would need a target-specific memory-construction guarantee, not generic MLIR lowering. Risk: CIRCT/firtool already owns a complete constructor.

### S28-03 — VTR fixed-architecture clustered-netlist update

For a fixed public FPGA architecture and netlist edit, seek an exact architecture-legality constructor with a predeclared bounded changed-cluster count. The causal structure is RTL/netlist edit → cluster assignment → stock architecture checker, not generic placement tuning. Risk: it may be a generic packing solver in disguise.

### S28-04 — NVDLA compiler feature-map state construction

For a fixed NVDLA network and compiler-visible feature-map layout, ask whether a local graph change permits a bounded-recourse on-chip buffer/layout action while preserving stock compiled execution semantics. The conclusion must be a named NVDLA-native state/action guarantee, not configuration selection. Risk: compiler's existing full scheduler may absorb it.

### S28-05 — Verilog-to-Routing timing-constrained routing state

Freeze a public architecture and timing contract, then invert the usual reroute-whole-design premise after one netlist delta. Any result must bound changed routing resources under exact legality/timing semantics. Risk: this is ordinary routing/placement and may be a generic solver.

### S28-06 — LLVM machine instruction compression state

Treat selection of fixed-target compressed instruction encodings as a coupled local-global code-size action, keeping exact ISA decode/relocation semantics and a limited rewrite budget. The conclusion would require a named target backend primitive and stock object-reader oracle. Risk: a normal target pass or option grid absorbs it.

## Pre-evidence clusters and selection

| Cluster | Seeds | Selected | Reason |
|---|---|---|---|
| ISA/object emission | S28-01, S28-06 | S28-01 | fixed relocation/action contract is more specific than generic compression |
| HDL/FPGA compilation | S28-02, S28-03, S28-05 | S28-03 | architecture legality plus cluster recourse has an explicit checker candidate |
| accelerator compiler state | S28-04 | S28-04 | distinct NVDLA native state surface and stock execution oracle |

Selected seeds are coverage-constrained, not score-ranked. S28-02, S28-05 and S28-06 remain append-only non-evidence backlog.
