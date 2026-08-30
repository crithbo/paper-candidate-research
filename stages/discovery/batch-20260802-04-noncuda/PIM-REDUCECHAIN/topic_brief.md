# PIM-REDUCECHAIN Command-aware hierarchical reduction placement for AiM GEMV

- Status: `PROPOSE_STAGE0`
- Primary lane: PIM/NDP architecture
- Discovery date: 2026-08-02

## Research question

For batched AiM/PIM GEMV with bank-local partial sums, can a scheduler choose bank, channel, and host reduction boundaries jointly with command timing and accumulator width, giving a non-dominated latency/energy/traffic tradeoff over always-host or always-near-bank reduction?

## Importance and group fit

PIM compute does not remove reduction traffic or accumulation precision. The proposal targets reduction-boundary placement under command-level costs, not the active `PIM-PRACCREDIT` security-credit scheduling or row-hit address scheduling.

## Exact object

AiM GDDR/HBM GEMV execution with a frozen PIM command model, bank partial sums, legal accumulator formats, and host/channel reduction options. Decision: hierarchy cut, batching, and accumulator width; account for commands, partial-sum transfer, conversion, and drain.

## Strongest fair baseline

Always-host reduction, fixed channel-tree reduction, fixed bank-local accumulation, and any architecture-provided reduction primitive using the same command model and numerical semantics.

## Mechanism hypothesis

There is a crossover governed by partial-sum fan-in and command drain: an adaptive hierarchy can avoid both host traffic at high fan-in and bank serialization at low fan-in.

## Competing mechanisms

- Mechanism A: fan-in/width-aware hierarchy cut; prediction: a crossover appears after command and conversion accounting; counterexample: one fixed boundary dominates.
- Mechanism B: batch coalescing before reduction; prediction: amortized drain changes the cut; counterexample: coalescing always hurts latency.
- Mechanism C: precision-aware partial-sum compression; prediction: reduced transfer pays for error budget; counterexample: required width removes all traffic gain.
- Preferred mechanism and why: A has the clearest same-object decisive curve; B/C are pivots without changing object.

## Candidate paper claim

Under a public AiM simulator and frozen numeric semantics, a command-aware hierarchy selector yields a non-dominated end-to-end reduction point that fixed-boundary baselines cannot produce under identical correctness and traffic accounting.

## Current collision subtraction

Ramulator2 and AiM Simulator provide artifacts. `PIM-PRACCREDIT` differs in security constraint/host-PIM co-scheduling. Recent RH+ is a `DIRECT_SUBTRACT` for row-hit scheduling, explicitly excluded here. `SEARCH_BOUNDED_OPEN` pending review of AiM reduction facilities and PIM GEMV papers.

## Decisive falsifier

Stop if the public target has no legal non-host reduction alternative, fixed hierarchy dominates across natural batch/fan-in ranges, or numeric correctness requires identical full-width host reduction.

## Executable evidence path

### 72-hour first evidence

Adapt/publicly configure AiM Simulator or Ramulator2, construct a GEMV partial-sum trace, and compare hierarchy policies with cycle/traffic/numeric ledgers on two fan-in regimes.

### AI core fraction and critical path

`AI_CORE_CONDITIONAL`, about 0.66. AI can modify model-level scheduling and reproduce traces; the conditional gap is faithful support for reduction primitives, so claims initially remain simulator-level.

### Semantics-preserving open alternatives

AiM Simulator extends Ramulator2 and preserves a public PIM command model. No claim of an unmodeled commercial device is allowed.

## Dual-axis score

- Academic value: `57/70`
- AI executability bonus: `20/30`
- Total: `77/100`

## AI and researcher boundary

AI can conduct simulator evidence; the researcher must validate any architecture-specific primitive or silicon relevance.
