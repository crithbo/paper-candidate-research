# R16A S5 replacement-02 — neutral source snapshot

Snapshot date: 2026-08-13.  This subtree is additive.  `replacement-01/` is
preserved unchanged following mainline's accepted/repeated adjudication.

## Exact dedup precheck

Before source depth, `rg -n -i` was run on 2026-08-13 over `plan.md`,
`registry.yaml`, and `history.md` for `ostree static delta`, `ostree summary`,
`flatpak ostree`, and `rpm ostree`.  There was no literal result.  This is a
signature precheck, not a novelty or absence claim; mainline owns cross-lane
deduplication.

## R16A-S5-R05 — OSTree static-delta and repository-summary construction

- Canonical signature: `object=OSTree repository revisions and optional summary
  metadata; problem=publish an offline/applicable update representation between
  fixed revisions; action=generate signed static delta from/from-parent to a
  target revision and update signed summary; mechanism=object-level revision
  delta plus atomic summary publication; information=fixed source/target
  revisions and signing key; output=stock ostree verify/apply-offline and
  summary-reader acceptance; comparator=ostree static-delta generate plus
  ostree summary --update; cost=object reads+delta generation+compression+
  signature+summary I/O+served bytes+apply verification.`
- Neutral carrier: a canonical real OSTree repository state with two fixed
  revisions, an optional existing summary, and an ed25519 key.  It is not an
  asserted performance result or a retrieved workload trace.
- First-party current reality snapshot: official OSTree manual pages accessed
  2026-08-13 and official upstream release `v2026.1`, commit `84fcfe1`.
  `ostree static-delta generate` exposes `--from`, mandatory `--to`,
  `--empty`, `--max-usize`, signature engine/key controls; the summary command
  exposes `--update`, metadata, GPG/ed25519 signing controls.  No current
  implementation absence is claimed.

## Snapshot non-leakage

This snapshot contains only object, contract, action, carrier, and source facts.
No canonical or V9 disposition was written before canonical sealing.
