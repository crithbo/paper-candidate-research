# GPU-PDLFRONTIER Compiler-selected readiness frontiers for CUDA programmatic dependent launch

- Status: `PROPOSE_STAGE0`
- Primary lane: CUDA compiler / runtime pipeline optimization
- Discovery date: 2026-08-02

## Research question

For a dependent CUDA kernel pair in a real operator pipeline, can a compiler choose a legal producer trigger frontier and a consumer preamble split that improves overlap without changing numerical semantics or relying on unsafe concurrent execution?

## Importance and group fit

Programmatic Dependent Launch (PDL) exposes a new schedule dimension: a dependent kernel may start before producer completion but must synchronize before reading dependent data. NVIDIA documents the primitive and its safety condition, not a compiler method for deciding where producer readiness and consumer-independent work should meet. The contribution is a legality-and-profitability optimizer, not a PDL wrapper.

## Exact object

CUDA compute-capability-9.0+ producer/consumer kernel pairs in one stream (and optionally the equivalent CUDA Graph edge). The decision is a producer trigger frontier, a consumer preamble/dependent split, and optional legal producer tail reordering. Cost includes launch, fences, extra registers/shared memory, lost occupancy, graph capture/update, and the opportunity—not guarantee—of overlap.

## Strongest fair baseline

Ordinary serialized launches, NVIDIA's hand-written PDL pattern with an earliest safe trigger, and a legal fused-kernel implementation when fusion is feasible under identical precision and workspace constraints.

## Mechanism hypothesis

The earliest safe producer trigger is not necessarily profitable: moving work across the frontier can enlarge the consumer's independent preamble but raise register pressure or delay producer output. A compiler search over readiness frontiers can find a nontrivial interior point.

## Competing mechanisms

- Mechanism A: dependence-slice frontier search guided by static memory-read/write regions; prediction: an interior frontier beats both earliest and latest safe triggers; counterexample: earliest-safe always dominates.
- Mechanism B: consumer preamble extraction with launch-bound work (descriptor setup, invariant loads, output initialization); prediction: overlap exists without changing dependent arithmetic; counterexample: the extracted work is too short or blocks occupancy.
- Mechanism C: graph-level grouping of adjacent PDL edges with bounded resource pressure; prediction: chain-level makespan improves where pairwise greedy choices conflict; counterexample: pairwise choices compose.
- Preferred mechanism and why: A has explicit legality conditions and a falsifiable profitability boundary.

## Candidate paper claim

For open transformer/HPC operator chains on Hopper-class CUDA, readiness-frontier selection finds safe PDL schedules that beat serialized, hand-written earliest-safe PDL, and feasible fusion after all resource and graph costs are charged.

## Current collision subtraction

This is distinct from `GPU-TMAPHASE`, whose object is verification of TMA/mbarrier lowering, and from stopped `GPU-CONDGRAPH`, which concerned conditional buffer lifetime rather than overlap scheduling. CUDA's official PDL guide is a `DEPLOYMENT_BASELINE`; it does not establish the compiler search residual. `SEARCH_BOUNDED_OPEN` pending audit of CUDA samples, CUTLASS dependent-launch kernels, and PDL research.

## Decisive falsifier

Drop if PDL's earliest safe trigger plus conventional fusion dominates every legal frontier after register, occupancy, synchronization, and graph costs, or an existing compiler already implements the same dependency-slice optimization.

## Executable evidence path

### 72-hour first evidence

Implement a minimal LLVM/CUDA-source transformation prototype for one public producer/consumer pair (for example, a normalization/reduction producer followed by a matrix-operation consumer preamble), enumerate legal frontiers, and use CUDA events plus Nsight Compute counters on a CC 9.0+ GPU. First verify bitwise or contract-equivalent outputs before timing.

### AI core fraction and critical path

`AI_CORE_CONDITIONAL`, about `0.64`. AI can build the static dependence/transform prototype, generate variants, test semantics, and analyze traces. A compatible Hopper-class GPU is needed for decisive overlap evidence; without it, the evidence ceiling is compile-time legality only.

### Semantics-preserving open alternatives

The CUDA guide and open CUTLASS kernels provide an inspectable implementation substrate. No pre-Hopper substitute preserves PDL execution semantics; absence of CC 9.0+ hardware routes the candidate toward reserve rather than STOP.

## Dual-axis score

- Academic value: `58/70`
- AI executability bonus: `19/30`
- Total: `77/100`

## AI and researcher boundary

AI can own transformation, correctness, and trace analysis. The researcher must authorize compatible hardware use and delimit any architecture-specific performance conclusion.

