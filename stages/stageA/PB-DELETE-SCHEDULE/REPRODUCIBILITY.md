# Reproducibility Protocol

## Preconditions

- Work only inside a fresh copy of `D:\project\writing\reserch\stages\stageA\PB-DELETE-SCHEDULE`.
- Do not change `EXPERIMENT_CONTRACT.yaml`.
- Keep disk below 4,294,967,296 bytes and use no GPU/exclusive device.
- Verify the official asset byte counts and hashes in `SOURCE_MANIFEST.yaml` before extraction or execution.

## Executed command entry points

Using the bundled Python path recorded in `ENVIRONMENT.md`:

```powershell
python scripts\extract_mse23_zip_subset.py
python scripts\prepare_corpus.py
python scripts\measure_packaged_preprocessing.py
python scripts\run_stagea_probe.py
python scripts\hash_source_trees.py
python scripts\validate_delivery.py
```

The literal executable arguments, return codes, durations, timeout state, peak RSS, stdout/stderr paths, and environment overrides for claim-bearing child processes are recorded in:

- `runs/corpus/CORPUS_COMMANDS.jsonl`
- `runs/preprocess_cost/PREPROCESS_COMMANDS.jsonl`
- `runs/probe/PROBE_COMMANDS.jsonl`

## Determinism

- Corpus selection: all ten complete packaged examples, then lexicographic eligible trace ID within the frozen 50-member bounded MSE23 pool.
- Dependency graph: preserve adjacent order on explicit witness-variable or target-ID overlap.
- Stable baseline: fixed target-ID then trace-ID rule.
- Greedy baseline: shortest ready checked-deletion command with fixed trace-ID tie break.
- Candidate: fixed dependency-frontier command-size score with trace-ID tie break.
- Invalid proposed schedules fall back to original and retain their own legality/failure cost.
- VeriPB is invoked with forced checked deletion; CakePB independently verifies the elaborated kernel and output-equioptimal claim.

## Replay closure

For every one of 30 traces and every one of four methods, `run_stagea_probe.py` creates two independent kernel-output directories and reruns VeriPB plus CakePB. The validator requires:

- exactly 240 result rows;
- two rows per trace-method pair;
- identical augmented-proof SHA-256 across both replays;
- identical elaborated-kernel SHA-256 across both replays;
- fixed output SHA-256 equality;
- objective equality;
- forced checked-deletion acceptance;
- CakePB output-equioptimal acceptance.

The final closure has zero violations.

## Expected primary hashes

- Corpus manifest: `3A1F4255B3EAAE7A02EB948EAF2E4BB409B42D2BB07C1585684B33C166A8C705`.
- Legal choice results: `97F371E8A7ADA04038584FF04F67553747E0D126A4A3A56666A9D71A8BA80CA7`.
- Full-cost results: `07A8F907343B694DB280BCE06ECDCFFD55B61F815B42DF26E797E0D27E572C59`.
- Full-cost CSV: `9A089076AE15ACEF54F98B207B8723C04DC33F1DD11749EBF5AAFB691076A883`.

Timing values are expected to vary across hosts; proof, output, kernel, corpus, selection, and source hashes must not. The scientific decision is recomputed from the measured p50/p90 Pareto relation, not from hard-coded timing thresholds.
