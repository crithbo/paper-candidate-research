# Divergence seed pool — Source64

All six sketches were created before targeted evidence lookup.  They are non-evidentiary and do not count as locators, raw rows, candidates, novelty assertions, or proposal opportunities.

| Seed | Engine | Perspective | Sketch | Preliminary disposition |
|---|---|---|---|---|
| S64-01 | `BISOCIATION_STRUCTURAL_TRANSFER` | compiler/backend engineer | OpenMP target launch optimization could move cost to dependence/data-environment state construction, suggesting a joint lowering decision. | selected |
| S64-02 | `CONSTRAINT_MANIPULATION` | hardware architect | XLA buffer-assignment optimization could move cost from allocation to copy/alias/materialization, suggesting a whole-program placement-and-copy constructor. | selected |
| S64-03 | `ADJACENT_POSSIBLE_OR_BOUNDARY` | runtime maintainer | LLVM ORC lazy compilation could move cost from compilation to symbol/materialization-state construction, suggesting a target-specific construction algorithm. | selected |
| S64-04 | `NEGATION_OR_INVERSION` | end user | PyTorch graph capture could turn eager launch cost into static pool/graph state cost. | backlog |
| S64-05 | `JANUSIAN_TENSION` | operator | ROCm graph execution could trade launch overhead for command graph update/materialization cost. | backlog |
| S64-06 | `COMPOSE_DECOMPOSE_SIMPLIFY` | measurement reviewer | JIT profile persistence could move optimization cost to profile serialization/validation. | backlog |

Coverage uses six engines and six viewpoints.  S64-01–03 were selected before evidence because they vary in object (OpenMP offload program, XLA computation, ORC module set), mechanism (lowering, buffer assignment, JIT materialization), and potential contribution type.  Backlog entries cannot replace a selected item after evidence results.
