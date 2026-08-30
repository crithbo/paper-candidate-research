# STREAM-CEP-LATE-NEGATION — Correct late repair for negative CEP under bounded retractions

- Status: `PROPOSE_STAGE0`
- Primary lane: stream systems / CEP algorithms
- Discovery date: 2026-08-02

## Research question

For keyed event-time CEP patterns containing bounded negative predicates, can an online operator accept events late by at most `L` and emit correct insert/retract deltas while bounding state and retractions per late event, rather than discarding late events or replaying the entire affected key-window?

## Importance and group fit

Flink documents that CEP assumes watermark correctness and does not process watermark-late elements; negative patterns magnify this because one late event may invalidate many provisional absences. The question is an algorithmic semantics/cost trade-off, not an API wrapper.

## Exact object

Keyed finite CEP automata with `notNext/notFollowedBy`, fixed event-time window `W`, bounded lateness `L`, exact event-time output-delta semantics, and an explicit per-key state/retraction budget. `OPT` is an offline full-order reference only.

## Strongest fair baseline

Same-watermark buffer plus per-key event-time reorder/replay, and a Flink-CEP-style drop-late policy where its semantics apply. Both receive the same arrival prefix, watermark and memory budget.

## Mechanism hypothesis

Maintain a causal invalidation frontier indexed by partial-match interval and negative guard, so a late blocker touches only witnesses whose valid interval contains it. **Separation hypothesis:** this frontier cannot be represented as a generic reorder buffer plus a generic full-window automaton replay without either larger touched state or more output retractions on an adversarial overlapping-negation family.

## Competing mechanisms

- Mechanism A: bounded causal invalidation frontier.
- Mechanism B: micro-batch event-time replay.
- Mechanism C: conservative delayed finalization / buffer until `L`.
- Preferred mechanism and why: A has a concrete non-product action—interval witness invalidation—whose touched set can differ from both B and C.

## Candidate paper claim

Conditional on the witness, prove a state/retraction trade-off and demonstrate exact late repair with lower touched-work than replay at equal output semantics. This is a hypothesis, not a claimed result.

## Current collision subtraction

Flink CEP already supplies negative patterns, timeout/pending states, event-time buffering and drops late events. The candidate contributes neither feature support nor watermarks. The remaining question is correct post-watermark repair with explicit delta/retraction cost; `SEARCH_BOUNDED_OPEN`.

## Decisive falsifier

If a same-information reorder+replay operator can reproduce every candidate action and output delta with no greater state and touched work on the constructed overlap family, `DIRECT_FATAL`.

## Executable evidence path

Use Flink CEP semantics plus a small standalone keyed automaton; generate deterministic late permutations and run Nexmark-style keyed event traces. No production cluster is required.

### 72-hour first evidence

Implement three-event negative patterns, exhaustive arrivals for small windows, and compare exact delta, touched partial matches, retained state and retractions against replay/delay controls. A single exact simulation identity kills the candidate.

### AI core fraction and critical path

`0.78`: AI can implement simulator, baselines, enumeration, logs and source audit. Human judgment remains claim scope/authorship.

### Semantics-preserving open alternatives

Apache Flink CEP docs/source, deterministic synthetic event-time generators, and Apache Beam/Nexmark-compatible traces.

## Dual-axis score

- Academic value: `50/70`
- AI executability bonus: `24/30`
- Total: `74/100`

## AI and researcher boundary

AI can run the killer and reproduce all decisions. A researcher must decide whether the final theorem/positioning is publishable.
