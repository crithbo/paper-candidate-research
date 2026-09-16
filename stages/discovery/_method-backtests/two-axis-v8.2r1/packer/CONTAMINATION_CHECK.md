# Contamination check — v8.2r1

- Scope: 30 freshly constructed packets; no v8.2 executor material was copied.
- Target-cutoff rule: every positive has a target first-public date strictly later than its cutoff; the minimum lag is 674 days (L1-P02), so no same-day cutoff is used.
- Source rule: 18 primary-source provenance snapshots are ledgered with canonical URLs, publication/revision dates, retrieval timestamp, byte SHA-256, paths, and executor-visible status. Every packet references exactly three sources and each source predates that packet's cutoff.
- Separation: sealed_packets.yaml has no target title, author, DOI, target URL, abstract, method, results, expected class, stratum, or answer template. Those facts occur only in auditor_key.yaml.
- Scanner: literal scans over the executor-visible YAML for the 18 target URLs and titles returned zero matches. This check does not claim that a source is semantically incapable of suggesting an opportunity; it verifies the required direct-identity leakage boundary.
- Negative-control coverage (12): baseline selector absorption 3; ordinary tuning 3; no novelty 2; undefined/fairness 2; no finite evidence route 2.
- Acquisition update: 7/18 sources now have actual official-page snapshots: four newly captured arXiv pages and two Google Research pages, plus the prior TensorFlow arXiv page. 11/18 remain provenance stubs or inaccessible pages, so the source chain remains incomplete. Byte total is recomputed in SOURCE_LEDGER and HASH_MANIFEST.
- Disposition: FAILED_NOT_SEALED. The produced provenance stubs preserve an audit trail of the attempted bounded acquisition, but they do not meet the required local primary-source snapshot condition. No executor or auditor may consume these packets. PACKER performed no method execution or scoring.

## Remaining bounded-acquisition result

- Still missing: l1_s2, l4_s3, l5_s1, l5_s2, l5_s3, l6_s1, l6_s2.
- This pass found the proposed Microsoft Research and Halide author URLs retired, the proposed X/Heron page blocked by an anti-bot verification, and ACM publisher pages blocked by a challenge. None of those error pages or snippets was frozen as a source artifact.
