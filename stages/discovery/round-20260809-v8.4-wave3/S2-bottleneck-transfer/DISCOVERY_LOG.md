# Discovery log — S2 Wave 3

- Assignment: `DISCOVERY-S2-20260809-V8.4-WAVE3`
- Lane: `DISCOVERY-S2-BOTTLENECK-TRANSFER`
- Cut-off: 2026-08-09 (Asia/Shanghai).
- Result: **0 / 2 `PROPOSE_STAGE0`**. No frozen brief was emitted.
- Permitted method: accepted production Discovery `v2/v8.1`; lens O2 is `CALIBRATED` in `registry.yaml`.
- Explicit exclusion: the TLS-blocked two-axis `v8.2r2` was not used, cited as a method, or treated as production evidence.
- Source boundary: paper originals and official project/proceedings sources only; no vendor blog, secondary summary, or executed artifact was used.

## O2 search logic

The search starts where a reported optimization displaces cost to an adjacent layer: explicit host staging, inter-PE exchange, or placement/communication coordination. Before testing any residual, the anchor paper's stated limitation and its immediate future-work-shaped action are **subtracted**. A lead survives only if it exposes a different decision variable or constraint structure, the same semantic object, a current fair baseline, a natural workload, full-cost accounting, and a finite Stage A falsifier.

## Primary-source queries and retained evidence

1. `PIMDAL UPMEM inter-DPU communication 2025`
2. `UPMEM inter-DPU communication 2025 2026 PIM scheduler`
3. `UPMEM host-PIM transfer NUMA 2025`
4. `PIMDAL materialization query pipeline UPMEM`
5. Follow-up by named mechanism: `PID-Comm commodity processing-in-DIMM collective communication`.

Retained originals:

- [PIMDAL (arXiv:2504.01948)](https://arxiv.org/abs/2504.01948): real UPMEM data analytics; identifies explicit memory management and limited inter-compute-unit communication among the implementation limits, and evaluates TPC-H queries.
- [PID-Comm (arXiv:2404.08871)](https://arxiv.org/abs/2404.08871): same commodity PIM-in-DIMM communication bottleneck; supplies a collective communication abstraction and implementation for UPMEM-class PEs.
- [UPMEM Unleashed (arXiv:2510.15927)](https://arxiv.org/abs/2510.15927): treats host–PIM transfer consistency/throughput with NUMA-aware allocation API extensions.
- [PIM or CXL-PIM? (arXiv:2511.14400)](https://arxiv.org/abs/2511.14400): characterizes explicit staging from disjoint PIM/host address spaces and the alternative unified-address interface. It is used only as a collision/placement check, not as a CXL candidate.

## Selection discipline and outcome

- The direct limitation-shaped ideas — generic inter-PE collective scheduling, NUMA host-transfer placement, and a generic staging-elimination planner — are direct subtractions, not candidates.
- The remaining PIMDAL-shaped idea, query-level selection of intermediate ownership/materialization plus inter-DPU transfer, has no independent same-object residual: its transfer component is within PID-Comm's collective mechanism; its placement component becomes either the existing UPMEM NUMA-allocation mechanism or a cross-interface CXL comparison. Combining them would be a prohibited wrapper/union and would not freeze a fair same-stack baseline.
- No proposal is rejected for missing code, experimental results, or low AI readiness. It is rejected because the structural paper shape never reaches `TIER_B_Q2_VIABLE` after current-mechanism subtraction.
- No experiments, Stage 0/A/B directories, candidate state, or shared control files were created or modified.

Search is bounded, not a claim of universal novelty. A future new-object search would require a first-party artifact that fixes a new semantic PIM query object and exposes a non-collective ownership action with a public natural trace and same-stack full-cost baseline.
