# Candidate-grade deep review — POSTGRES-BRIN-NATURAL-RANGE-DEGRADATION

## Exact object / natural carrier

Create the same BRIN index over a fixed schema derived from official NYC TLC Yellow Taxi Trip Records, January--June 2025. Freeze column mapping (pickup timestamp plus one query-relevant value), PostgreSQL release/config, page size, journal/WAL settings, BRIN opclass and `pages_per_range`; preserve SQL query results and index-scan semantics. The carrier is natural, public, versioned at monthly release granularity, and no data were downloaded or run in Discovery.

## Layout-independent transition schema and controls

For each month prefix, define arrival disorder from source-record timestamps/ranks before PostgreSQL page placement (for example, normalized inversion/run-break rate of pickup time in the frozen ingest sequence). Define degradation as rechecked candidate tuples or heap blocks per true query result for fixed timestamp-window query families. The claim would require a repeated, directionally stable threshold after controlling: month, row count, timestamp marginal distribution, query selectivity, ingest batch size, schema/type, index opclass, `pages_per_range`, VACUUM/analyze state, warm/cold cache protocol, PostgreSQL version, and hardware.

Metrics/full cost: false-positive/recheck denominator, true results, heap/index/WAL bytes, build and incremental-maintenance CPU, query CPU/I/O/latency, and peak RSS. Reader correctness is SQL result equality; index integrity route is native PostgreSQL consistency tooling where applicable.

## Current strongest union / direct subtractor

BRIN builds and updates summary tuples; it exposes normal vacuum/autovacuum maintenance, optional autosummarize, all-range and single-range summarize functions, explicit de-summarization, and multiple opclass summary forms. `pages_per_range` and `autosummarize` are storage parameters, while minmax-multi/bloom have their documented parameters. This is the fair same-information union.

## Minimal static witness and action-gap verdict

Static witness: two canonical insert streams have identical records and identical query answers but different timestamp disorder; one range then has a broader min/max envelope and can recheck more tuples. This demonstrates a possible observation, not a stable natural law and not an algorithmic action gap.

Any proposed use fails the residual test: choosing a smaller/larger range or an opclass is parameter tuning; triggering summarize/de-summarize based on observed disorder is an online controller over current actions; reclustering/reordering changes the physical-input/update object or invokes a rebuild. No complete union-external direct N1/N2/N3 utilization action is named.

## Finite fidelity / killer

Within 72 hours after a future Stage A authorization, freeze the official monthly file hashes and a PostgreSQL commit/config; materialize two canonical source-order arms without changing rows; build the fixed BRIN contract; verify SQL result equality and index health; collect all full-cost dimensions; estimate the controlled transition on at least two month prefixes. **Killer:** reject if the transition fails to replicate under controls, or any apparent remedy reduces to pages-per-range/opclass/autosummarize/desummarize/rebuild. The action-side predicate already rejects this candidate in Discovery.

## Verdict

`STRUCTURAL_DROP`. This is not a negative measurement or an implementation/readiness/resource judgement. A future work with a different native summary representation or a fixed whole-index constructor would be a new object and needs a new assignment, not a revival of this one.
