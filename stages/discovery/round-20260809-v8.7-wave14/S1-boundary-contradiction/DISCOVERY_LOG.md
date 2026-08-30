# Discovery log — S1 boundary / contradiction, Wave 14

**Assignment:** `DISCOVERY-S1-20260809-V8.7-WAVE14`  
**Search cutoff:** 2026-08-09  
**Method:** accepted v2/v8.1 + calibrated v8.6 `FIDELITY_CLOSURE_PLAN` admission + v8.7 `CURRENT_UPSTREAM_REALITY_CHECK`. The blocked v8.2r2 method was not used.

## Scope, exclusions, and evidence rule

This is Discovery only. No experiment/benchmark, Stage 0/A/B directory, registry change, or claim-bearing observation occurred. Current candidates must retain the same semantic object, function, and guarantee, and offer a finite CPU Stage-A killer if promoted. Existing S1 reserve, CVC5, Parquet, PB, Git, RocksDB, ORC, SQLite FTS5, and all active/terminal objects were excluded before search.

For every implementation-absence lead, v8.7 requires an immutable current tag/commit plus official current docs, actual source, and relevant defaults/non-default knobs. Issues, old documentation, and future-work wording are leads only; they cannot establish an absence claim.

## Current-upstream scouts

### A. Arrow Rust IPC record-batch writer

An April 2026 issue alleges per-batch heap allocation and full copies. It was treated only as a lead. The upstream `main` source inspected on 2026-08-09 already contains an `IpcBodySink::Collect` route whose comments say it accumulates encoded buffer segments for deferred zero-copy streaming, and an `IpcDataGenerator::write` path that writes those segments directly. The public `59.1.0` release tag was frozen as the latest immutable release available to this check; the repository publishes a monthly schedule and lists `59.1.0` as June 2026.

The exact code-at-tag fetch and `main`-tip commit resolution could not be completed from this workspace because `git ls-remote` failed with `SEC_E_NO_CREDENTIALS (0x8009030e)`. Accordingly, this batch makes **no** claim that a current release lacks (or possesses) every reuse optimisation. The source/issue conflict alone means the issue cannot support a current-absence gap. No same-object N1/N2 action, natural corpus, or fair strongest-union-external residual was frozen. **Not promoted; no fidelity status applies.** This is neither a scientific STOP nor a resource-blocked retained candidate.

### B. Provider-native periodic serverless invocation

The official EventBridge Scheduler contract already exposes native recurring schedules, flexible time windows, retries, at-least-once delivery, templated targets, and universal API-operation targets. Thus an external periodic dispatcher/selector would be a forbidden wrapper rather than a new same-object action. No provider-native semantic residual with a finite public acquisition route was found. **DROP: no union-external native action.**

### C. MLIR effect/legality boundary

This object was not re-proposed: it was screened in Wave 12, and current competing mechanisms (Ratte, DESIL, and pairwise MLIR equivalence verification) remain the applicable strongest union. Rebranding interface contract inference would violate the terminal-object and direct-absorption exclusions. **Excluded, not reconsidered.**

## Decision

`COMPLETE_ZERO_PROPOSALS`. The current-upstream check prevented an issue-derived absence from becoming a false candidate. No candidate was retained, so the required retained-candidate statuses (`READY_TO_CLOSE_IN_STAGEA`, `FINITE_FIDELITY_GAP`, `HUMAN_CORE_FIDELITY_GAP`, `RESOURCE_BLOCKED_FIDELITY_GAP`) do not apply. No object was labelled `STRUCTURALLY_UNCLOSABLE`.

## Primary sources

1. [Arrow Rust `59.1.0` immutable release tree](https://github.com/apache/arrow-rs/tree/59.1.0) (upstream tag).
2. [Arrow Rust IPC writer, upstream current source](https://raw.githubusercontent.com/apache/arrow-rs/main/arrow-ipc/src/writer.rs) (actual source inspected 2026-08-09; moving branch not used as an immutable absence proof).
3. [Arrow Rust upstream repository/release schedule](https://github.com/apache/arrow-rs) (official project source).
4. [AWS EventBridge Scheduler current user guide](https://docs.aws.amazon.com/scheduler/latest/UserGuide/what-is-scheduler.html) (official contract).
5. [AWS Lambda scheduled invocation guide](https://docs.aws.amazon.com/lambda/latest/dg/with-eventbridge-scheduler.html) (official deployment semantics).
6. [Ratte](https://www.doc.ic.ac.uk/~afd/papers/2025/ASPLOS-Ratte.pdf), [DESIL](https://xgdsmileboy.github.io/files/paper/oopsla25.pdf), and [Practical Formal Verification for MLIR Programs](https://arxiv.org/abs/2605.01124) (paper originals used only for the already-screened MLIR collision).
