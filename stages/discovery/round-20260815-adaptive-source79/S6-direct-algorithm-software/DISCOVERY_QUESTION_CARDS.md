# Discovery question cards

## QC-S79-01 — Git diffcore rename/copy pairing construction

- Exact public identity: Git current diffcore rename/copy detection; fixed pre/post tree pair, contents, modes, `-M/-C/-l` and relevant diff options; identical rename/copy classification and output.
- Carrier: `IMPLEMENTATION_CARRIER_ONLY`; a versioned public Git test pair would be needed later.
- Same-object: a proposed pairing must retain filepair classification, similarity threshold and emitted diff semantics. Altering input trees or a command's reporting meaning is out of scope.
- Hypothesis: METHOD_ALGORITHM/N2, joint break/candidate/pair correspondence with exact labels plus comparison CPU/RSS and recall/precision guarantee.
- Full cost: blob loading, similarity computation, candidate-pair memory, exhaustive comparisons, output generation and CPU/RSS; no measurements were run.

### Identity preflight

Bounded registry/plan query `git rename detect`, `diffcore rename`, `rename detection git`, `similarity filepair` found no five-field-exact identity. This is `NO_MATCH__NOT_NOVELTY_INFERENCE`. R62 and all held/terminal identities were not read or reopened.

### Current union and anti-collapse result

- Current Git documentation defines `diff.renames`, `diff.renameLimit` (default currently 1000), `-M` rename and `-C` copy detection, and the exhaustive portion of detection. `gitdiffcore` describes the break-to-rename pipeline, similarity scores and candidate filepairs.
- Candidate action pairing deleted/created files by content similarity is the generic correspondence/matching kernel. Raising/lowering `-M`/`-l`, switching copy mode, or using external matching changes configuration or is a generic solver wrapper, not an N2.
- Directory rename aggregation is used by merge machinery and does not yield the same `git diff` output object; importing it would change endpoint/scope.
- Cheapest falsifier: two deleted and two created files at a fixed similarity matrix. If a proposed pairing optimizes that matrix it is generic matching; if it changes threshold or omits exhaustive candidates it is existing config/action or changes diff labels.

### Disposition

- RAW_REQUIRED audit: INCOMPLETE because the non-generic target-specific discriminator fails.
- `EXCLUDED_BEFORE_RAW__CURRENT_DIFFCORE_UNION_PLUS_GENERIC_SIMILARITY_CORRESPONDENCE_KERNEL`.
- Structural exclusion only; it does not infer anything from missing implementation/results/resources/AI readiness. No closure queue/deep review.
