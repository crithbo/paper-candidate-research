# PACKER report — consolidated Discovery/Stage-0 v8.8 R3

Assignment: `BACKTEST-PACKER-20260810-CONSOLIDATED-V8.8-R3`  
Role: `DISCOVERY-BACKTEST-PACKER`  
Result: `COMPLETE_SEALED_DISPATCHABLE_PENDING_MAINLINE_ACCEPTANCE`  
Completion state after handoff: `IDLE_REUSABLE_AWAITING_MAINLINE`

## Scope compliance

This role constructed a sealed historical packet only. It did not run the
control or proposed method, score a case, contact/create an executor or auditor,
run a candidate experiment, perform Stage 0/A/B, revive a terminal topic, alter
production semantics, or write outside the assigned PACKER directory.

The frozen R1/R2/R3 hashes in `sealed_method_contract.yaml` were recomputed
before packing and match the assignment exactly. P1 shadow files were not used
as production behavior or acceptance authority.

## Packet composition

| Stratum | Count | Auditor-key cases | Required behavior tested |
|---|---:|---|---|
| Current-collision sentinels | 2 | C01–C02 | minimum-set recall 2/2; broad-claim leakage 0/2 |
| Structural negatives | 6 | C03–C08 | no packaging; underdefined action, changed object, ordinary product and current-union absorption remain closed |
| Positive historical Stage-0 shapes | 6 | C09–C14 | at least 5/6 candidate-grade deep review and 4/6 proposal-grade or explicitly nonstructural-unfrozen |
| Resource/unimplemented controls | 4 | C15–C18 | at least 3/4 not mislabeled as structural scientific failure |
| Total | 18 | C01–C18 | terminal revival 0; hard-gate violation 0 |

The executor sees only anonymous IDs `C01`–`C18`. The class, target ID,
historical disposition and downstream label are stored only in
`auditor_key/case_key.yaml`.

The input contains 55 complete primary-source artifacts: three for every case
and a fourth generic b-matching source for the HNSW sentinel. Total source bytes
are 37,681,036. The executor-visible sealed set has 74 files and 37,726,016
bytes, all listed and hashed in `sealed_input_manifest.yaml`.

## Coverage choices

- The sentinel packets explicitly cover first-party current source, sibling
  implementation family, closest same-object paper/artifact, generic kernel
  where independently required, and the strongest deployed/configurable action
  union.
- C03–C05 are the R2-frozen SPLIDT/Kafka/Flink incomplete-action boundaries.
  They are negative controls because an attractive problem statement cannot be
  packaged without a complete same-object action/certificate; the pack does not
  prelabel them to the executor.
- C06–C08 cover direct-current/ordinary screening, changed-object/product and
  canonical composition failures. Their terminal labels are auditor-only.
- C09–C14 are heterogeneous historical Stage-0-positive shapes. Later Stage-A
  failures for any of them are intentionally excluded so native hindsight
  cannot flow backward into Discovery/Stage 0.
- C15 is the stale-document/current-source trap: an old cvc5 page is presented
  alongside cutoff-current `alethe_printer.cpp` and the Alethe format. The raw
  checker build event must not override the current-source collision analysis.
- C11 is the explicit model-certificate/native-realization boundary; all cases
  use the same boundary in the sealed method contract.
- C15–C18 expose only raw pre-classification blocker/pause observations and the
  fact that no claim-bearing run occurred.

CUDA/GPU-related cases are C06, C07, C14 and C17 (4/18); the remaining 14 are
non-CUDA. The 22:78 realized mix is below the approximate 3:7 planning target
because the R2-mandated sentinel/underdefined/resource strata determined the
finite historical set; the ratio is explicitly not an admission quota. No NPU,
NDP or PIM implementation claim is present. GPU cases carry source/model-only
claim ceilings and contain no device execution or hardware result.

## Time-slice and source integrity

Each case freezes a cutoff, source URL, release/commit/public date, relative
artifact path, byte count, SHA-256, inclusion role, exclusions and contamination
status. GitHub evidence is commit-pinned; release documents and paper originals
are dated before cutoff. Dynamic pages used during initial acquisition were
replaced with cutoff-pinned sources where they mattered to current-action
claims.

The first transport pass had 13 incomplete/blocked/obsolete-path records. None
was accepted. Official/author-hosted pre-cutoff replacements or complete retries
closed all 13; the full history is in
`provenance/SOURCE_ACQUISITION_LEDGER.md`. Search snippets, error pages, partial
bytes and provenance stubs are excluded.

## Separation and contamination

Executor-readable paths are exactly:

1. `sealed_input_manifest.yaml`;
2. `sealed_method_contract.yaml`;
3. `sealed_cases/**`.

`auditor_key/**`, `provenance/**`, this report, `handoff.yaml`, the canonical
hash manifest, and every external workspace path are forbidden to the executor.
The authored executor YAML passed exact hidden-ID and downstream-status scans.
Public source bytes may name their own public papers/projects/formats; they do
not expose the local target or outcome.

## Frozen later shadow waves

`auditor_key/shadow_wave_protocol.yaml` freezes deterministic, non-cherry-picked
selection for two future waves, cutoff/source/hash rules, and the independent
minimum-set audit at Stage-0 intake. Both waves are `FROZEN_NOT_RUN`; this PACKER
assignment does not authorize or execute either wave.

## Mechanical validation

`provenance/validate_pack.py` reported:

```text
YAML_PARSED=24
CASES=18
SOURCES=55
EXECUTOR_FILES=74
EXECUTOR_BYTES=37726016
MANIFEST_HASHES=PASS
PATH_BOUNDARY=PASS
PDF_MAGIC=PASS
HIDDEN_ID_SCAN=PASS
```

The final `HASH_MANIFEST.sha256` is generated only after this report and the
handoff are frozen. It uses canonical `/` relative paths, includes every file
under the PACKER root except itself, and is the authoritative all-file hash
inventory.

## Handoff condition

The packet may be dispatched only after mainline mechanically accepts the
write boundary, hashes, executor allowlist and auditor-key separation. This
role does not dispatch the executor. Production behavior remains unchanged
until an independent auditor passes every frozen threshold and the mainline
performs the separately authorized next step.
