# R3R1 resume2 sealed PACKER report

## Outcome

`SEALED_DISPATCHABLE_PENDING_MAINLINE_MECHANICAL_ACCEPTANCE`. This is a calibration packet only; production Discovery remains v8.7. No candidate, native experiment, Stage 0/A/B work, EXECUTOR, or AUDITOR action occurred.

## Frozen contract

- Assignment: `BACKTEST-PACKER-L1-20260811-CONSOLIDATED-V8.8-R3R1-RESUME2`
- Approval: `V8_8-R3R1-BOUNDED-CALIBRATION-20260810`
- R6 proposal SHA-256: `43FCB5AADDDE37C6045345BD3F30231D8E0634D69B41612422A65F5E1E40BE8E`
- Ten independent opaque families, exactly two in each required stratum.
- Thirty complete primary artifacts, exactly three per family.

## Primary-source freeze and limits

The auditor-only `acquisition_records.json` records requested/final URL, redirects, response type and length, bytes, SHA-256, retrieved time, artifact date, upstream provenance and license for each artifact. Every source artifact precedes the 2026-08-11 frozen outcome boundary.

- Network bytes: `3,546,199 / 52,428,800`.
- Frozen primary bytes: `3,578,646 / 104,857,600`; final total workspace use is checked before dispatch.
- One resume1-complete artifact was copied byte-for-byte as authorized, SHA-256 `6B5A4CF6AEF65F6CC263DF52ADAEC17ADADCE2B26CDBF5DC58DA0BEF4D848D91`.
- Eight short/early reads were repaired once each with validated `206` and exact `Content-Range`; no whole-file retry occurred. All artifacts passed final declared-length and SHA-256 checks.

## Blindness and separation

`EXECUTOR_INPUT/` contains only opaque IDs, time-sliced neutral descriptions, source tokens, and the visible certificate. It excludes source URLs, project/author/title identity, old-case identifiers, expected disposition, outcome, auditor key, and provenance paths. `auditor_key/`, source artifacts, acquisition ledger, manifest, report, handoff, and hash manifest are explicit auditor-only denylist items.

The old V8.8-R3 C01–C18 set was used only as a prohibition/dedup set; it is absent from executor input, scoring denominator, and this case set.

## Scoreability

`scoreability_schema.yaml` maps every hidden acceptance predicate to a visible canonical output field. It imposes no unexposed exact token or named-source requirement. Underdefined cases are keyed only as `NOT_ADMITTED_UNFROZEN` unless a genuine ordered-table structural proof exists.

## Required mainline checks

Before any serial downstream assignment: verify the canonical hash manifest, exact 10/30 counts, source and storage caps, allowlist/denylist, no-leakage scan, contract SHA, and write scope. PACKER does not dispatch either downstream role.
