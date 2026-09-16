# AIE-ROBUSTFIFO Robust ObjectFIFO reservation for bursty AI Engine dataflow

- Status: `PROPOSE_STAGE0`
- Primary lane: NPU/accelerator compiler-runtime
- Discovery date: 2026-08-02

## Research question

Can a compiler choose ObjectFIFO depths, memory placement, and producer/consumer credit phases for an AIE graph so that bounded input bursts meet a throughput target with a non-dominated SRAM–stall tradeoff, rather than sizing every FIFO for its worst local burst?

## Importance and group fit

ObjectFIFO lowering materializes each element as a buffer plus lock. Thus depth is real tile-SRAM capacity and not a cosmetic runtime knob. This targets public AIE dataflow graphs and a robust reservation decision; it is not a generic FIFO checker.

## Exact object

MLIR-AIE ObjectFIFO graphs with fixed kernels, bounded-rate/burst input contracts, and finite tile SRAM. The decision is graph-wide FIFO depth/placement and phase-credit assignment; all DMA, lock, drain, and unconsumed-reservation costs count.

## Strongest fair baseline

MLIR-AIE default ObjectFIFO lowering, uniform/max-burst depth, static SDF buffer minimization, and a fair combination that uses the same placement legality and throughput target.

## Mechanism hypothesis

The decisive slack is correlated across edges: a phase-aware robust credit allocation can share slack along a cut, whereas independent worst-case depths reserve the same burst several times.

## Competing mechanisms

- Mechanism A: cut-coupled robust credit allocation; prediction: lower peak SRAM at identical burst envelope and no throughput violation; counterexample: all edge peaks co-occur.
- Mechanism B: placement-first depth allocation; prediction: routing constraints, not depth, cause stalls; counterexample: optimal placement never changes the Pareto frontier.
- Mechanism C: producer throttling with shallower FIFOs; prediction: bounded slowdown beats extra reservations; counterexample: any throttle loses more throughput than it saves.
- Preferred mechanism and why: A gives a crisp robust constraint and a mechanism-specific counterexample; B/C are valid same-object pivots.

## Candidate paper claim

For public AIE streaming graphs with measured/specified burst envelopes, cut-coupled reservations expose latency/SRAM Pareto points unreproducible by independent-depth and SDF baselines under the same lock/DMA accounting.

## Current collision subtraction

MLIR-AIE documents ObjectFIFO allocation and examples, while SDF work covers deterministic buffer minimization. Neither was located in the bounded search as making correlated burst envelopes and AIE lock/DMA phases the decision. `SEARCH_BOUNDED_OPEN`; Stage 0 must audit AIE runtime semantics and robust-SDF literature.

## Decisive falsifier

Stop if ordinary SDF minimization plus per-edge max burst gives exactly the same feasible frontier once AIE lock and placement constraints are modeled, or natural graphs never have nontrivial correlated slack.

## Executable evidence path

### 72-hour first evidence

Use MLIR-AIE distribution and matrix-multiplication examples, extract ObjectFIFO graphs, enumerate bounded burst traces, and compare an ILP/DP realization of A against baseline depth policies with a complete SRAM/lock ledger.

### AI core fraction and critical path

`AI_CORE_EXECUTABLE`, about 0.71. AI can extract graphs, implement the reservation solver, generate traces, and compile/simulate; hardware measurements only raise the ceiling.

### Semantics-preserving open alternatives

MLIR-AIE software/emulation flow and its public examples retain the compiler-level ObjectFIFO semantics. No device result may be claimed without a device run.

## Dual-axis score

- Academic value: `57/70`
- AI executability bonus: `22/30`
- Total: `79/100`

## AI and researcher boundary

AI can establish compiler/model-level feasibility; the researcher owns physical AIE calibration, authorship boundary, and any device claim.
