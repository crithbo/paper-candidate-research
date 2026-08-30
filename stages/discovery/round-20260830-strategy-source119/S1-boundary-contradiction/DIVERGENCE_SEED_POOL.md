# Source119 S1 Divergence Seed Pool

- Assignment: `DISCOVERY-S1-20260830-SOURCE119-BOUNDARY-CONTRADICTION`
- Lane: `DISCOVERY_S1`
- Generated before targeted evidence lookup: `YES`
- Seed count: `8`
- These are non-evidence sketches; none asserts novelty, absence, or Q2 quality.

| Seed | Engine | Exact public anchor candidate | Boundary question | Counterfactual decision |
|---|---|---|---|---|
| S1-119-01 | BOUNDARY_OR_FAILURE | IREE HAL buffer view / executable dispatch source | Can buffer range/alignment semantics contradict backend dispatch legality assumptions? | choose copy/repack versus direct dispatch |
| S1-119-02 | CONSTRAINT_MANIPULATION | IREE parameter archive and external weights source | Can archive alignment/lifetime constraints change zero-copy parameter placement rather than packaging only? | map, stage, or copy weights |
| S1-119-03 | ADJACENT_POSSIBLE_OR_BOUNDARY | IREE Stream/HAL dynamic-shape dispatch source | Can dynamic-shape constraints be carried into target-specific dispatch formation without guard-only specialization? | form one dispatch or split/guard variants |
| S1-119-04 | BOUNDARY_OR_FAILURE | MLIR Quant dialect types and conversion passes | Are per-axis quantization invariants lost before backend lowering chooses an integer kernel? | preserve quantized op or materialize dequant/requant |
| S1-119-05 | JANUSIAN_TENSION | MLIR MemRef layout/data-layout interfaces | Can logical memref legality coexist with target ABI misalignment that requires layout-aware lowering? | retain view or materialize layout transform |
| S1-119-06 | COMPOSE_DECOMPOSE_SIMPLIFY | LLVM/MLIR sparse tensor GPU conversion source | Can sparse encoding guarantees conflict with target memory-space/vectorization choices? | native sparse lowering or dense/alternate format |
| S1-119-07 | BOUNDARY_OR_FAILURE | ExecuTorch backend partitioner/delegate source | Can partition legality remain true while fallback boundary costs invalidate the chosen partition? | delegate region boundary selection |
| S1-119-08 | PROBLEM_REFRAMING | ExecuTorch memory planning and backend delegate interfaces | Can delegate-owned tensors break planner lifetime/reuse assumptions? | reuse, pin, or transfer intermediate buffers |

## Convergence

All eight seeds are retained for bounded source closure because they differ in exact object, action endpoint, or semantic guarantee. No backfill is allowed after source results.
