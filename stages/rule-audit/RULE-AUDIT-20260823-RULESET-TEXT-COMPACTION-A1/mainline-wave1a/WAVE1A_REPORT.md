# Ruleset text compaction — Wave 1A report

Date: 2026-08-23 (Asia/Shanghai)

## Outcome

`COMPLETE__PREVIEW_ARCHIVED__LIVE_INDEX_ONLY`

Mainline applied only the reversible preview-archive part of the audit proposal.
No active role or active template body was compacted, and no registry-slice
reader was enabled.

## Changes

- Copied the former `rules/CORE_POLICY.md`, nine `rules/_shadow_v9/` role
  previews and four `templates/_shadow_v9/` previews byte-for-byte to the
  versioned `20260810-r3-shadow-p1` archive roots.
- Verified all 14 historical source/archive pairs by SHA-256 before removing
  the live preview bodies.
- Replaced the three live preview surfaces with short, explicit
  `REFERENCE_ONLY__NOT_PRODUCTION` indexes.
- Updated the historical P1 registry paths to the archive and preserved both
  the archived policy hash and the older hash expected by the shadow roles.
- Changed `ROLE_PAPER_PROJECT.md` so a common policy is read only when an
  assignment explicitly pins a production path and hash. The live
  `CORE_POLICY.md` index is never authority.

## Context effect

The live preview surface fell from 68,861 bytes to 1,473 bytes, a reduction of
67,388 bytes (97.86%). Historical bytes were not deleted; they remain available
in the versioned archives and are covered by `ARCHIVE_MANIFEST.sha256`.

## Non-changes

- Scientific gates, policy authority and candidate states: unchanged.
- Assignment decisions, revisions and resource permissions: unchanged.
- Active role/template bodies: unchanged pending actionability-equivalence
  replay.
- Branch registry reads: still full `registry.yaml`; Wave 2 dual-read shadow
  backtest remains required before any cutover.

## Recovery

Every removed live preview body is recoverable by copying its exact archived
counterpart back to the former path. The historical common-policy mismatch is
intentional telemetry: archived bytes hash to `C3E764C4...`, while the old
shadow roles expected `30B24D06...`; the absent version was not reconstructed.
