# Stage A lightweight manifest guidance

Use one concise manifest at packet freeze and one at scientific handoff.

- Claim-critical: hash candidate source, corpus index, executable packet, command DAG, full-cost ledger, raw claim result and claim summary.
- Execution-critical: hash executed tool binaries once when the shared asset is registered; on reuse check path, version, size and mtime, and rehash only after drift.
- Auxiliary: ordinary logs, copy receipts, temporary files and helper JSON require only existence, size and count checks.
- Do not recursively hash the complete toolchain or resource tree during routine reuse.
- A typical canonical manifest should contain about 5–15 entries; add more only when they can change a scientific or authorization decision.
