# S4 Source08 R18V2 — Residual-survival Triage

Assignment `DISCOVERY-S4-20260814-ADAPTIVE-SOURCE08-R18V2`; v8.7 canonical, claim-pack `OFF`. This pass uses residual-survival cards: each row names the putative residual, the strongest current contrary mechanism, and a finite distinguishing witness. It is source-only Discovery; no experiment, E2, build, download, or Stage transition occurred.

## Six raw residual-survival cards

| ID | Public object and stated objective mismatch | Residual-survival card (why not already absorbed) | Falsifier / disposition |
|---|---|---|---|
| M1 | `fio` fixed workload: throughput subject to a tail-latency/SLO constraint and complete client-side resource cost. | A joint action might optimize queue-depth, termination and measurement schedule while preserving workload semantics. Contrary source: `latency_target`, `latency_window`, `latency_percentile`, and `latency_run` already search for highest performance satisfying the target. | D1 witness is reconstructible by stock action; `DEEP_BASE_SELECTED__DIRECT_ABSORPTION_TEST`. |
| M2 | `iperf3` UDP performance: delivery, jitter and loss can disagree under one throughput score. | A correction would need preserve a fixed sender/receiver stream and change a network decision without choosing a report weight. | Official current complete carrier/action/guarantee not closed in bounded search; `NOT_ADMITTED_UNFROZEN`. |
| M3 | PostgreSQL physical database benchmark cost: client telemetry may perturb an SLO claim. | A non-invasive correction might change a decision under fixed SQL/database semantics. | Source05 already closed the relevant `pgbench` telemetry family; `EXCLUDED_SOURCE01_TO_SOURCE07_IDENTITY`. |
| M4 | Linux performance counters: multiplexing can change counter-based optimizer inference. | A counter-confidence correction could be a measurement mechanism rather than a dashboard. | No versioned natural trace + fixed PMU event/action contract; `NOT_ADMITTED_UNFROZEN`. |
| F1 | CompCert C 3.17: semantics-preserving compilation under a compile-time/RSS/code-quality budget. | A target-specific pass-composition action might retain semantic preservation while enforcing a resource Pareto boundary. | The official theorem preserves behavior, but no distinct current-union-external action or simultaneous target-specific resource theorem is frozen; `DEEP_BASE_SELECTED`. |
| F2 | Frama-C/WP: fixed C/ACSL contract proof obligations under proof CPU/RSS/certificate-size objectives. | A proof-obligation constructor might supply a nontrivial guarantee without changing contract semantics. | Existing WP/Qed/external-prover union and natural corpus/action contract not closed; `NOT_ADMITTED_UNFROZEN`. |

Only M1 and F1 were chosen for the two base depth slots. The third-depth trigger requires at least three D1-witnessable rows before any result is known; this batch has at most two named witness routes, so `THIRD_DEPTH_NOT_TRIGGERED__PRECOMMITTED_RULE`.

## Base depth A — fio latency-constrained performance

**Exact object:** a fixed fio version, engine, storage target, I/O pattern, block size, data-integrity behavior and client-visible completion semantics. Full cost would include workload preparation, warm-up, fio CPU/RSS, temporary space, I/O bytes, IOPS/bandwidth and submission/completion/total latency distributions.

**Current reality check and fair union:** fio documents configurable latency percentiles and a stock routine which varies queue depth to find the maximum performance point satisfying `latency_target`; `latency_window` and `latency_percentile` define the window and proportion, and `latency_run` controls the search. Thus the strongest same-information stock union already represents the proposed decision primitive. Changing target/percentile/window, using a profile selector, or reporting a different percentile is tuning/measurement policy, not an N2.

**Residual verdict:** `DROP__CURRENT_NATIVE_LATENCY_CONSTRAINT_SEARCH_ABSORBS_ACTION`. A later nontrivial proposal would need a different frozen action and a guarantee not implied by stock queue-depth search; the finite killer is to show its emitted schedule is obtainable through stock `latency_*` operation under the same workload and denominator.

## Base depth B — CompCert resource-constrained verified compilation

**Exact object:** CompCert C 3.17, a fixed supported target, the same CompCert C input/output semantics, and the stock semantic-preservation contract. Official sources state the whole-compiler theorem is composed from pass proofs and cover source-to-Asm behavior; they also delimit unverified elaboration/assembling/linking portions.

**Candidate shape required before a brief:** a target-specific algorithm for choosing/constructing a pass-composition or proof-carrying compilation artifact that preserves the exact stock semantic theorem, while proving a nontrivial bound/approximation on compile CPU/RSS and an output-quality dimension. Named comparator must be the same CompCert target/pass union with the same compiler/semantic boundary. An external solver, altering language support, treating an unverified stage as verified, or merely choosing optimization flags fails the contract.

**Residual-survival result:** `NOT_ADMITTED_UNFROZEN`. The current public source closes the high-level preservation guarantee but this source-only pass does not yet close the complete target/pass/config union, public natural C corpus with compiler-resource ground truth, a union-external atomic action, or a simultaneous target-specific guarantee. This is neither an implementation nor a resource negative. Finite Stage-A closure: pin release/target/corpus, enumerate driver/pass action paths, require a small source-to-Asm legality witness and reject if the action is already expressible or the theorem boundary changes.

## Primary sources

- fio, [current documentation](https://fio.readthedocs.io/en/master/fio_doc.html), accessed 2026-08-14.
- CompCert, [version 3.17 manual](https://compcert.org/man/) and [commented current development](https://compcert.org/doc/), accessed 2026-08-14.
- Frama-C, [WP official page](https://www.frama-c.com/fc-plugins/wp.html), accessed 2026-08-14.
- Kani, [official verifier guide](https://model-checking.github.io/kani/), considered only for a raw collision/contract check, accessed 2026-08-14.
