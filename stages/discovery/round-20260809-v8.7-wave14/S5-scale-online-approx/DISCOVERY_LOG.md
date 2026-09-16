# DISCOVERY-S5-20260809-V8.7-WAVE14 — Discovery Log

**Evidence cutoff:** 2026-08-09  
**Method:** accepted v2/v8.1 + calibrated v8.6 fidelity plan + v8.7 `CURRENT_UPSTREAM_REALITY_CHECK`.  
**Decision:** `COMPLETE_ZERO_PROPOSALS`.

## Scope discipline

Excluded before searching: active, blocked, and terminal topics; CVC5, Parquet, PB, Git, RocksDB, ORC, SQLite FTS5, KLL, TurboQuant, RASK, POEGA, and their renamed variants. No experiment, benchmark, Stage 0/A/B directory, mainline modification, or Stage-B authorization occurred.

## Current-upstream reality check

| Potential absence-based seed | Frozen upstream target | Docs/source/config examined | Result | Consequence |
|---|---|---|---|---|
| Streaming distinct-count sketch that changes representation as memory/latency changes | Apache DataSketches Java: official GitHub release `9.0.0` (the current released tag visible in official repository metadata at check time); official HLL API pages are versioned `6.1.0` and therefore lineage only, not current-absence evidence | Official repository metadata, HLL/Union API, `TgtHllType`, `lgConfigK`, sparse/dense modes, on/off-heap choice, and union result type | A direct `git ls-remote … HEAD` reality check failed before receiving source because this workspace's Schannel returned `SEC_E_NO_CREDENTIALS (0x8009030e)`. No current-HEAD source commit could be frozen. The older API confirms configuration is already a broad action family, but is not used to assert current absence. | `NO_ABSENCE_CLAIM__NO_PROPOSAL`: no brief based on an unverified current-source gap. Parameter/type selection would also be ordinary configuration/controller behavior. |

This is a v8.7 fail-closed provenance outcome, not a scientific rejection of streaming sketches and not a resource request for a candidate.

## Same-object source scan not relying on absence claims

| Seed | Natural/formal object and fair union | Collision / residual result | Why no brief |
|---|---|---|---|
| Multi-pass approximate maximum matching in fully dynamic graph streams | Insert/delete edge stream; matching-quality guarantee; passes, semi-streaming space, update order and full compute cost. Union: the current randomized sketching algorithm plus stated lower-bound frontier; exact offline matching only ceiling. | The recent work settles the logarithmic-pass frontier for the identified model. No distinct update/query information regime, representation, or action outside that union was frozen. | A claim of “fewer passes/better approximation” would be unsupported relabeling; no finite natural killer can discriminate an unnamed mechanism. |
| Exact streaming-graph representation | Timestamped edge stream; neighborhood/time queries; memory and per-edge update cost. Union: Dolha's hash-backed double orthogonal list and its persistent/sliding-window form, plus standard adjacency structures. | The apparently new action—hash-backed bidirectional edge representation with persistent time window—is direct prior art. | Direct absorption; no same-object N2 action remained. |
| Effect-aware incremental shell re-execution | Changed shell program/input; behaviorally indistinguishable output including non-idempotent effects; dependency/effect and storage/re-execution cost. Union: Bash re-execution and Incr. | Incr's dependency/effect tracking and retained intermediates occupy the exact construction. | Direct absorption; cache policy is selector/wrapper. |

## Fidelity and natural-killer conclusion

The v8.6 correction was observed: lack of an encoded interface, checker, or witness did not cause any drop. No candidate was formed because none has a same-object action gap. Therefore no `FIDELITY_CLOSURE_PLAN`, `READY_TO_CLOSE_IN_STAGEA`, or finite natural killer can be truthfully attached to a brief.

## Primary-source ledger

1. Apache DataSketches Java official repository/release metadata: <https://github.com/apache/datasketches-java>.
2. Apache DataSketches HLL and Union API (`6.1.0`, used as historical capability context only): <https://apache.github.io/datasketches-java/6.1.0/org/apache/datasketches/hll/HllSketch.html> and <https://apache.github.io/datasketches-java/6.1.0/org/apache/datasketches/hll/Union.html>.
3. Assadi et al., **Settling the Pass Complexity of Approximate Matchings in Dynamic Graph Streams**, author preprint: <https://arxiv.org/abs/2407.21005>.
4. Zhang et al., **Dolha — an Efficient and Exact Data Structure for Streaming Graphs**, author preprint: <https://arxiv.org/abs/1901.08639>.
5. Xie et al., **Incr: Faster Re-Execution via Bolt-On Incrementalization**, OSDI 2026 official proceedings: <https://www.usenix.org/conference/osdi26/presentation/xie-yizheng>.
