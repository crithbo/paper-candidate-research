# GPU-MXSCALEFLOW Scale-flow placement for block-scaled FP4 producer--consumer chains

- Status: `PROPOSE_STAGE0`
- Primary lane: CUDA/GPU compiler and approximate computing
- Discovery date: 2026-08-02
- Novelty state: `SEARCH_BOUNDED_OPEN`

## Research question

For a chain of block-scaled low-precision GPU operators, can a compiler jointly choose scale layout, scale generation/retention, and exact conversion boundaries so that payload and scale metadata travel together only when this is cheaper than materializing a higher-precision intermediate?

## Importance and group fit

Current CUTLASS releases expose NVFP4/MXFP4/6/8, block-scaled output with scale generation, layout/remap-capable epilogues, and reference evaluators. These make scale tensors an explicit dataflow object rather than hidden quantization bookkeeping. The topic differs from `AQ-02`'s CIM closure and from generic GEMM fusion: its exact object is the payload--scale pair at block boundaries and its primary claim includes bit-exact scale semantics and metadata cost.

## Exact object

Input is a static chain/DAG of block-scaled GEMM/pointwise/reduction operators with declared block size, scale type/granularity, rounding, saturation, zero handling, and consumer layout requirements. The decision is each edge's pair representation (payload layout, scale layout), retain/recompute/materialize action, and legal fusion boundary. Costs include scale payload bytes, scale-generation work, transformations, precision conversion, synchronization, and fallback. It excludes inventing a new numeric format or retuning a single GEMM tile.

## Strongest fair baseline

Per-kernel CUTLASS/CuTe dispatch with its native input/output layouts, explicit materialization between kernels, and the strongest available epilogue fusion that does not jointly optimize cross-kernel scale flow. All baselines must use identical rounding and scale rules.

## Mechanism hypothesis

A typed shortest-path / e-graph extraction over representation states can find globally cheaper legal scale-flow plans than locally choosing each kernel's preferred layout; a bit-exact reference guards against silently changing quantization semantics.

## Competing mechanisms

- Mechanism A: typed representation-DAG shortest path; variables are edge representations and materialization actions; predicts non-dominated metadata/transform traffic; counterexample is every consumer forcing a unique native representation; minimum artifact is a Python reference and planner.
- Mechanism B: local producer--consumer fusion heuristic; variable is a pairwise fusion decision; predicts lower compilation cost; counterexample is a three-operator chain where local fusion blocks a better later conversion; minimum artifact is CUTLASS/CuTe template selection.
- Mechanism C: scale recomputation policy; variable is retain versus recompute; predicts a Pareto region when scale bytes dominate; counterexample is recomputation always more expensive or numerically non-identical; minimum artifact is a cost and exact-reference evaluator.
- Preferred mechanism and why: A, because it generates an explicit global comparison and admits B/C as ablations.

## Candidate paper claim

On declared block-scaled chains, typed scale-flow planning finds bit-exact plans with lower accounted payload-plus-metadata conversion cost than per-kernel dispatch and pairwise fusion, with a precise coverage/fallback boundary. No performance claim is made before a target-GPU evaluation.

## Current collision subtraction

CUTLASS is a strong `DEPLOYMENT_BASELINE`: it already supports block-scaled kernels, generated output scales, epilogue fusion and remaps. This subtracts any claim that merely adds an FP4 kernel or another epilogue. Search-bounded residual is the cross-operator scale-flow decision with explicit metadata accounting; Stage 0 must audit whether TensorRT/Triton or recent low-precision graph compilers already implement it equivalently.

## Decisive falsifier

Drop if exact-reference tests show no valid multi-choice chains beyond ordinary fusion, or if an accessible compiler already performs the same cross-operator representation/scale placement with equivalent costs and semantics.

## Executable evidence path

### 72-hour first evidence

Create a CPU bit-exact NVFP4/MXFP4-style toy reference for 8--12 CUTLASS-like chains, enumerate legal representations, and compare A/B/native plans including bytes and conversion operations. Pass only if at least two natural chains show a Pareto improvement while all declared boundary vectors match.

### AI core fraction and critical path

- `ai_core_fraction`: 70%
- Class: `AI_CORE_EXECUTABLE`
- AI can implement the exact semantic reference, planner, enumeration, and static cost ledger. Blackwell execution would validate the performance ceiling but is not required for the model-level claim.

### Semantics-preserving open alternatives

The public CUTLASS reference/evaluator and CPU numerical model supply a same-semantics first path. Hardware runs must disclose format, scale granularity, rounding, fallback, and all metadata/transform costs.

## Dual-axis score

- Academic value: `58/70`
- AI executability bonus: `23/30`
- Total: `81/100`

## AI and researcher boundary

AI can establish only the planner and bit-exact/static-cost evidence layer. The researcher must decide the target format family and confirm that no unpublished group work owns the cross-operator scale-flow claim.
