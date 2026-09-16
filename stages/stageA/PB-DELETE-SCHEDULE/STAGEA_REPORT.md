# Stage A Report: PB-DELETE-SCHEDULE

## Administrative freeze

- Assignment: `STAGEA-L2-20260809-PB-DELETE-SCHEDULE-INITIAL`
- Topic: `PB-DELETE-SCHEDULE`
- Lane: long-lived candidate execution lane 2
- Mode: initial Stage A; no pivot and no scientific revision
- Only write directory: `<LEGACY_LOCAL_PROJECT_ROOT>\stages\stageA\PB-DELETE-SCHEDULE`
- Stage B authorized: `false`
- User Stage B approval: `null`

The allowed Discovery, Stage 0 primary, and Stage 0 independent-confirmation handoff/report/manifest hashes were recomputed before execution and matched the frozen assignment. The experiment contract was frozen before downloads or claim-bearing measurements.

## Research question

On natural MaxPre-style WCNF preprocessing traces with an already-fixed set of checked core deletions, can a same-information dependency-frontier ordered partition reduce full verification cost while preserving the exact input/output WCNF, objective, deletion set, sequential checked-deletion semantics, and VeriPB/CakePB equioptimal contract?

## Evidence level

Under the academic-research-suite protocol, this is a deterministic, hash-closed Stage A computational risk probe with first-party natural inputs, executable source closure, two independent proof-checking stages, full-cost accounting, and two clean replays. It is not Stage B, not a paper-level causal or generalization claim, and not evidence for parallel deletion semantics.

The observed result is a scientific negative with scope restricted to the frozen object and mechanism. A positive result, had one occurred, would have been capped at `PRELIMINARY_SUPPORT / NOT_FALSIFIED`; no positive claim is made.

## Object and mechanism

Fixed:

- natural complete WCNF preprocessing traces;
- input and output WCNF bytes and hashes;
- objective and checked deletion set;
- existing per-deletion witness/rederivation commands;
- sequential checked-deletion semantics;
- forced checked-deletion VeriPB and CakePB output-equioptimal verification.

Changed:

- only the legal sequential order of existing adjacent dependency-frontier deletion commands;
- the candidate's batching is an ordered partition emitted sequentially.

Not changed or claimed:

- no new deletion rule, checker, emitter, output, objective, or parallel semantics;
- no unchecked deletion as an equal-guarantee comparator;
- no Stage B or large experiment.

## Corpus

The corpus contains 30 complete traces: all ten complete IJCAR artifact examples and twenty additional independent WCNFs range-extracted from the official MSE23 exact-weighted archive. Each trace has at least two checked deletions; the observed minimum is 153. Every WCNF, output, augmented proof, elaborated kernel, and canonical checked-deletion extraction has a separate hash in `CORPUS_MANIFEST.json`.

The official 3.14 GB ZIP was not downloaded whole. Its exact central directory was read through bounded 206 ranges, and 50 smallest stored members were frozen with byte/CRC/XZ/SHA gates. Eight emitted no checked deletions and were excluded intact; no example was split to satisfy the count.

## Fair controls and validation

The controls are original trace order, stable legal order with fixed target/trace-ID tie breaking, and greedy earliest-ready legal order. All methods use the same explicit witness/target information and the same legality oracle. Invalid proposals incur their own validation/fallback cost and revert to the original order.

Every accepted schedule passed:

1. VeriPB 3.0.2 with `--force-checked-deletion` and output WCNF;
2. elaboration to kernel proof;
3. CakePB WCNF with `VERIFIED OUTPUT EQUIOPTIMAL`;
4. exact output hash equality and unchanged objective;
5. two clean replays with identical proof and kernel hashes.

## Results

Legal scheduling choice exists on 24 of 30 traces (`0.80`), so the preregistered `<0.20` sparsity killer did not fire. The candidate nevertheless loses the full-cost Pareto test:

- candidate p50 full time: `260.117 ms`, versus original `138.997 ms`, stable `210.345 ms`, and greedy `215.443 ms`;
- candidate p90 full time: `813.385 ms`, versus original `422.363 ms`, stable `449.634 ms`, and greedy `480.587 ms`;
- candidate p50 certificate: `666,406` bytes, `25` bytes larger than every baseline;
- candidate p90 certificate equals the baselines, so it has no strict byte benefit there;
- all required p50/p90 Pareto residuals are empty.

All 240 final replay rows preserve the fixed output/objective and pass both verifiers. Thus the negative is not caused by invalidity, mismatch, or resource failure; full scheduling/legality overhead absorbs any checker-local gain.

## Interpretation and claim ceiling

The risk premise “there is scheduling freedom” is supported, but the paper mechanism premise “the proposed dependency-frontier schedule retains full-cost residual over fair controls” is falsified on the frozen natural corpus. Original trace order alone is decisive: it requires no scheduling machinery and dominates the candidate at both percentiles.

This does not prove that every possible legal ordering method is useless. It does show that this frozen mechanism core does not currently form a credible Q2 paper contribution after complete costing. A different rule, checker, emitter, deletion set, parallel semantics, or different object would be a new research question and cannot revive this ID by relabeling.

## Recommendation

- Stage A recommendation: `STOP_RECOMMENDED`.
- Quality label recommendation: `BELOW_Q2_STOP` for the frozen mechanism.
- Stage B: forbidden and unnecessary.
- `PENDING_USER_STAGEB_REVIEW`: false.
- Scientific `REVISE_ONCE` consumed: false; this was the initial Stage A execution.
- Lane after handoff: `IDLE_REUSABLE_AWAITING_MAINLINE`.

The candidate owner does not modify registry or formal project state. Independent Stage A gate/mainline decides the state transition.

## Reproduction entry points

1. Verify sources and corpus: `scripts/hash_source_trees.py`, then `scripts/prepare_corpus.py` only in a fresh copy.
2. Reproduce the range subset: `scripts/extract_mse23_zip_subset.py` with network and the hard-coded 206/size caps.
3. Reproduce the scientific probe: `scripts/run_stagea_probe.py`.
4. Validate the delivered closure: `scripts/validate_delivery.py`.

Exact commands, environments, failures, binaries, costs, rows, and hashes are in `COMMAND_LOG.md`, `ENVIRONMENT.md`, `FAILURE_LOG.md`, `SOURCE_MANIFEST.yaml`, `FULL_COST_MATRIX.csv`, and `HASH_MANIFEST.sha256`.
