# O4-DYNCACHE-PGM Stage A results

## Material Passport

- Origin Skill: `academic-research-suite / experiment-agent`
- Origin Modes: `plan → run → validate`
- Origin Date: 2026-08-09
- Verification Status: `VERIFIED`
- Version Label: `o4_pdec_stagea_v1`
- Frozen contract SHA-256: `e1df8bfa3401cce3a9a33ec47d65d243a0900c7dda2c9566aab1b7bfa622c953`

## Experiment result

- ID: `O4-PDEC-STAGEA-20260809`
- Type: deterministic state-space enumeration plus natural-feed replay
- Status: completed
- Environment: Windows host; bundled Python 3.12.13; CPU only; no GPU
- Anomalies: none in execution; important evidence limitations are listed below

### Exhaustive small-instance checker

The checker closed the reachable state graph from the empty state under every insert and delete over keys `0..7`. A state retains its page partition, so the graph includes history-dependent representations rather than only one canonical packing per set.

| Metric | Result |
|---|---:|
| Reachable page representations | 1,740 |
| Update transitions checked | 27,840 |
| No-op transitions included | 13,920 |
| Strict predecessor checks | 17,400 |
| Closed-range checks | 62,640 |
| Maximum committed leaf pages | 5 |
| Maximum charged page touches/update | 4 (cap 4) |
| Maximum dual-version auxiliary pages | 2 (cap 2) |
| Maximum auxiliary bytes | 512 (cap 512) |
| Maximum rebuilt key slots/update | 5 (credit 5) |
| Semantic or invariant failures | 0 |

Result: `NOT_FALSIFIED`. The complete frozen small state space produced no counterexample to exact strict predecessor, exact closed-range output, the output-sensitive leaf-scan check, page certificate feasibility, the charged leaf-local page-touch cap, or the dual-version peak-space cap.

### Natural OSM replication witness

- Locked input: OSM minute replication sequence `7,235,045`
- Feed state timestamp: `2026-08-09T03:59:06Z`
- Input SHA-256: `4b09084d3f08676f152203d38ea340649c8eb34a6daf89d185baebf433ca3fe5`
- Input size: 38,400 bytes
- Mapping: 16-bit-per-axis Hilbert cell and fixed-width type-qualified node id
- Replay order: canonical XML/replication document order

| Metric | Result |
|---|---:|
| Node events parsed | 651 |
| Create / modify / delete events | 506 / 135 / 10 |
| Effective updates | 639 |
| Same-key or unobserved-delete no-ops | 12 |
| Final active observed keys | 639 |
| Final leaf pages | 295 |
| Maximum charged page touches/update | 4 |
| Maximum auxiliary pages / bytes | 2 / 512 |
| Semantic or invariant failures | 0 |

Result: `PRELIMINARY_SUPPORT` for a natural feed-order witness. The minute diff has 15 adjacent timestamp inversions, consistent with the replication feed's transaction/document ordering not being a strict timestamp sort; no sorting or synthetic reordering was applied.

The natural result is narrow: the replay starts without a planet snapshot, so all ten delete events target unobserved prior state and are charged as no-ops. It therefore supplies natural insert/upsert evidence, not a natural delete/reinsert witness. Alternating insert/delete pressure is covered only by the exhaustive small-state checker.

## Validation report

The complete experiment was rerun using the frozen commands. Both result files matched byte-for-byte:

| File | Original SHA-256 | Rerun SHA-256 | Verdict |
|---|---|---|---|
| `exhaustive.json` | `c9182aff3606d4728fc8a1bb3084c80fc0df53aac2b51e15d21bd681fecaf5e3` | same | exact match |
| `natural.json` | `b0cd389fd54831df8400f822381028ca1ddd13c09b0e846e419bc496a75cc33b` | same | exact match |

- Reproducibility verdict: `REPRODUCIBLE`
- Statistical fallacy scan: not applicable; this probe uses complete deterministic enumeration and exact equality checks, with no p-values, sampling inference, or effect-size claims.

## Mechanism-specific interpretation

The tested mechanism is a page-local leaf microkernel. Each page carries an exact-rational endpoint affine rank certificate with maximum stored-key residual `ε=1`. One update replaces at most one old page with one or two feasible copy-on-write pages; the old image remains visible until atomic publication. This made the paired local invariants coherent in the frozen state space and natural upsert stream.

This is not evidence that a complete PDEC index has bounded updates. The model charges one logical routing page and excludes scalable directory split/merge, fence propagation, reclamation, concurrency, crash recovery, real cache/TLB events, and baseline build/runtime costs. The eager fixed-page rebuild also does not validate a long-lived deferred credit schedule. Those exclusions materially limit the claim.

## Full-cost ledger boundary

Included: route charge, affected old leaf read, every new leaf image, certificate recomputations, rebuilt key slots, no-ops, committed pages, auxiliary pages, and auxiliary bytes.

Not measured: end-to-end latency/throughput, allocator/reclamation cost, multi-level directory maintenance, synchronization, cache/TLB counters, baseline conversion/build/tuning, or actual memory fragmentation. Therefore there is no performance or Pareto result in Stage A.

## Evidence conclusion

The frozen leaf-local premise is `NOT_FALSIFIED` and has `PRELIMINARY_SUPPORT`; `MAIN_CLAIM_ESTABLISHED` is explicitly unsupported. A complete index theorem, scalable directory transition, deferred credit proof/checker, natural delete/reinsert stream, and fair ESA/PGM/ALEX/B+tree full-cost comparison remain open.
