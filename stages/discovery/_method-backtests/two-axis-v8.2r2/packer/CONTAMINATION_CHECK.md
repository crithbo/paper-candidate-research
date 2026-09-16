# Contamination and dispatch check — two-axis v8.2r2

Status: `FAILED_NOT_DISPATCHABLE`.

The intended construction is six lenses, each with three positive packets and
two structural negative controls, for 30 packets total. It is deliberately not
materialized.

- The permitted r8.2r1 PACKER ledger identifies 11 reusable sources and seven
  failed source IDs: `l1_s2`, `l4_s3`, `l5_s1`, `l5_s2`, `l5_s3`, `l6_s1`, and
  `l6_s2`.
- Direct HTTPS retrieval was attempted against both a USENIX primary artifact
  and an arXiv primary page. Both failed before any source bytes were received
  with `SEC_E_NO_CREDENTIALS`.
- Search output, rendered snippets, provenance stubs, error pages, and
  Packer-authored digests are not primary artifact bytes and were excluded.
- Since 7/7 replacement-source byte freezes are missing, no executor-visible
  packet exists. Therefore no target identity, title, author, DOI, URL,
  result, or future knowledge can leak to an executor.
- No old executor or auditor output, and no r8.2r1 auditor key, was read.

Required recovery: provide a transport path that delivers the raw bytes of
seven accessible, first-party pre-cutoff source artifacts, and provide a
properly authorized PACKER-only target/cutoff input (or permit access to the
previous PACKER-only ground-truth package). Re-run PACKER from a new frozen
assignment after those inputs are available.
