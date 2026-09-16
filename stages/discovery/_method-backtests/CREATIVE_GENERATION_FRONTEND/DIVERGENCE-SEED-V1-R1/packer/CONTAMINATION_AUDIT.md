# Contamination and replacement audit

- Replacement boundary: semantic selection was performed after reading the V1R1
  contract and final divergence-seed template.
- V1 use was limited to complete source bytes, their hash/transport metadata,
  and the accepted blocker handoff. No V1 case card or semantic selection was
  read or copied into this packet.
- All 12 reused artifact bytes were freshly SHA-256 checked; source role and
  cutoff were requalified in `SOURCE_LEDGER.yaml`.
- Target anchors, identifiers, target dates, expected shapes, labels, and
  outcomes exist only in `AUDITOR_KEY.yaml` and `AUDITOR_KEY/`.
- `EXECUTOR_INPUT/` contains opaque case IDs, neutral cards, and pre-cutoff
  source artifacts only. Scan result: no target title, target arXiv identifier,
  target URL, label, or later-outcome prose in executor-authored text.
- Result: `PASS__BLIND_SEPARATION_CLOSED`.
