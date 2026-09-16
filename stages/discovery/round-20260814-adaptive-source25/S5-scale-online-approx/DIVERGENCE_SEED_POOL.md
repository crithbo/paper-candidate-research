# Divergence Seed Pool — S5 Source25

- Assignment/lane: `DISCOVERY-S5-20260814-ADAPTIVE-SOURCE25-DIVERGENCE-V1R1` / S5.
- Generation completed before external evidence lookup: YES.
- Seed count: 12 (ceiling 12); no seed is a locator, raw, C0 item, novelty claim or scientific denominator.
- Network-security exclusion: PASS.

## Engine coverage and seed records

| ID | Engine | Perspective | Two-sentence pre-evidence sketch and cautious conclusion-first test | Generic-shell check | Convergence state |
|---|---|---|---|---|---|
| S01 | `COMPOSE_DECOMPOSE_SIMPLIFY` | compiler backend engineer | Split a microcontroller inference graph at exact tensor-liveness boundaries, then compose only semantics-preserving arena fragments after a local model change. If successful, the most cautious conclusion would only concern a fixed model/ABI memory-layout construction, not generic caching. | PASS | select |
| S02 | `CONSTRAINT_MANIPULATION` | hardware architect | Hold bit-exact outputs and an MCU SRAM cap fixed, but replace global arena rebuilding by bounded movement of live intervals. A contribution would require an explicit target-specific bound, not a memory-planner heuristic. | PASS | select |
| S03 | `ADJACENT_POSSIBLE` | maintainer | A shader validation pipeline may expose a partial canonicalization primitive that can be retained across localized module edits. The only admissible conclusion would be exact validator-equivalent output under a fixed SPIR-V environment. | PASS | select |
| S04 | `INVERSION` | theorist | Rather than selecting more formal tests, consider whether an ISA certification signature can be decomposed into proof-carrying fragments with a target-specific recourse theorem. If it collapses to test ordering, it is not a topic. | PASS | backlog |
| S05 | `BISOCIATION_STRUCTURAL_TRANSFER` | operator | Transfer compaction's “live-set movement” abstraction to sparse tensor-buffer layouts while retaining the same tensor values. A real result must be more than a generic packing formulation. | PASS | select |
| S06 | `PROBLEM_REFRAMING` | measurement reviewer | Reframe an accelerator compile cliff as a reproducible characterization of legal-output frontier discontinuities under a fixed model/device contract. A paper would need a stable law and a noncontroller decision consequence. | PASS | backlog |
| S07 | `JANUSIAN_TENSION` | end user | A low-latency model must be both bit-exact and resource-bounded; treat exactness and bounded recourse as simultaneous constraints rather than a tuning tradeoff. | PASS | cluster with S01/S02 |
| S08 | `ABSTRACTION_LADDER` | maintainer | Raise a local IR rewrite to a proof-preserving module-level action only if a stock checker witnesses unchanged module semantics. The result cannot rely on a paper-owned rewrite sequence. | PASS | select |
| S09 | `COMPOSE_DECOMPOSE_SIMPLIFY` | hardware architect | Decompose an FPGA dataflow schedule into channel regions and ask whether selective state transfer can preserve I/O timing semantics. It must not become placement/scheduling policy. | PASS | backlog |
| S10 | `CONSTRAINT_MANIPULATION` | theorist | Freeze a canonical formal instance family and impose a recourse budget after one clause/module change. A contribution would demand a non-generic construction and checker, not a SAT wrapper. | PASS | backlog |
| S11 | `ADJACENT_POSSIBLE` | compiler backend engineer | Use a public IR optimization test corpus only as an oracle for a target-specific legal-witness construction. If the action is merely pass ordering, reject it. | PASS | cluster with S08 |
| S12 | `INVERSION` | operator | Invert “rebuild on pressure” into “certify which representation can remain” for an online inference artifact. The meaningful endpoint would be a format-specific guarantee, not a controller. | PASS | backlog |

## Clusters and coverage-constrained selection

| Cluster | Seeds | Shared mechanism | Representative / locator route |
|---|---|---|---|
| Exact MCU inference state | S01,S02,S07,S12 | fixed tensors, memory arena, bounded movement | S02 → TensorFlow Lite Micro current source/docs |
| Checked IR/module preservation | S03,S08,S11 | local edit, canonicalization, stock checker | S03 → SPIR-V Tools current source/docs |
| Sparse layout structural transfer | S05 | live-set / representation movement | S05 → MLIR sparse-tensor current source/docs |
| Formal recourse | S04,S10 | canonical instance, proof/checker | S10 → BTOR2 formal family current source/docs |
| FPGA selective transfer | S09 | channel state movement | unselected backlog |
| Measurement law | S06 | frontier characterization | unselected backlog |

Selected S02, S03, S05 and S10 preserve non-dominated coverage across object, contribution type and checker route; selection is frozen before lookup and is not a ranked Top-N.  S01/S04/S06–S09/S11/S12 remain append-only non-evidentiary backlog.

Advisory: 8 engines used; 7 perspective roles used; no object surface dominates. `DIVERGENCE_COVERAGE_ADVISORY=PASS`.
