# Contamination audit

Status: `PASS_DISPATCHABLE`.

## Separation boundary

Executor-readable:

- `sealed_method_contract.yaml`;
- `sealed_input_manifest.yaml`;
- `sealed_cases/C01` through `sealed_cases/C18`, including source bytes.

Forbidden to executor:

- `auditor_key/**`;
- `PACKER_REPORT.md` and `handoff.yaml`;
- `provenance/**`;
- every path outside this PACKER directory;
- `HASH_MANIFEST.sha256` unless the mainline exposes it only for byte
  verification without revealing forbidden paths. The handoff defaults to
  forbidden.

## Hidden information scan

The authored executor-visible YAML files contain no exact local target ID from
the auditor key, no case-specific historical PASS/STOP label, no downstream
method/result, and no later correction. Public source artifacts naturally name
their own public paper/project/format and are allowed; they do not contain the
hidden local candidate outcome.

Case class (`sentinel`, `structural negative`, `positive shape`, or
`resource/unimplemented`) and expected disposition exist only in
`auditor_key/case_key.yaml`. Acceptance numerators and the two-wave audit plan
exist only in `auditor_key/`.

## Time-slice audit

- Every case has an explicit historical cutoff.
- GitHub-hosted current-source evidence is commit-pinned and dated no later
  than its case cutoff.
- Versioned release documentation and venue/author paper originals are dated
  no later than cutoff.
- No local downstream file was copied into `sealed_cases/`.
- Runtime failure events in C15–C18 are sanitized pre-classification
  observations: they state what failed and whether claim-bearing work ran, but
  hide the historical scientific disposition.

## Mechanical checks required before handoff

- parse all YAML;
- recompute every embedded source SHA-256 and byte count;
- verify each manifest path resolves inside the PACKER root;
- verify source counts are C01=3, C02=4 and C03–C18=3;
- scan authored executor files for every hidden target ID and case-specific
  downstream status;
- verify canonical `/` relative paths and no self-entry in
  `HASH_MANIFEST.sha256`.
