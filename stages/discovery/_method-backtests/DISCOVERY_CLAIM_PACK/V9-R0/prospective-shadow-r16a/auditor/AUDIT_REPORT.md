# Independent audit — R16A V9 prospective shadow sample

- Assignment: `DISCOVERY-AUDITOR-20260813-R16A-V9-PROSPECTIVE-SHADOW-SAMPLE24`
- Verdict: **`PILOT_NOT_CALIBRATED_INCONCLUSIVE`**
- Scope: one frozen prospective, noncanonical shadow wave. This audit does not authorize production, a second wave, a candidate, Stage 0, or any state transition.

## Mechanical input and sample integrity

The frozen sample ledger, auditor assignment, and their two-entry addendum manifest match the supplied SHA-256 values. All nine ledger-listed lane-package root manifest hashes match; manifest-content recomputation found zero hash mismatches. The six parent lane roots contain the ledger-reported aggregate 118 files and 199,207 bytes.

There is one non-fatal format caveat: the S1 root manifest uses Windows backslashes for three nested manifest paths, instead of canonical `/`. Each resolves inside the S1 root on this workspace and matches its recorded SHA-256; it is not a boundary breach or content mismatch.

The ledger contains exactly 24 accepted, pairwise distinct opportunity-family signatures. Its 13 exclusions are non-counted, and its replacements are documented as duplicate-only; no replacement was used to improve outcome or proposal yield. No external material, source-lane decision-content contact, leak, or terminal-STOP revival was found in the allowed input package.

## Observed metrics

| Metric | Observation | Audit status |
|---|---:|---|
| Canonical-before-shadow order | 24/24 families | PASS |
| Canonical/shadow leakage | 0/24 | PASS |
| Terminal STOP revival | 0 | PASS |
| Source-action corrections | 24 observations; 0 changed canonical dispositions | Observed only |
| Decision stability | 24/24 | Observed only; cannot justify PASS alone |
| Canonical clean briefs | 0 | No precision denominator |
| Stage 0 feedback / repair vectors | 0 | Unobserved |
| Model token / monetary cost | unobserved | Not imputable |
| CPU / wall cost | not uniformly recorded | Not imputable |

`0/0` clean-brief precision is **undefined**, not perfect precision. With no canonical clean brief, there is likewise no Stage 0 feedback or repair-vector observation from which to estimate quality, corrections, or admission precision.

## Protocol sufficiency

The required two-prospective-wave condition is not met: this assignment supplies one prospective shadow wave only. Decision stability, no leakage, and no revival are necessary integrity observations, but cannot alone establish calibration. The missing clean-brief/Stage-0 and cost observations also remain non-imputable.

Accordingly, this is an internally intact pilot, but not a calibrated production basis. Fail-closed rules remain in force; no production state has changed and no shadow wave was run by this auditor.

## Completion

Only the required auditor artifacts were written. No repack, new sampling, second wave, Discovery, Stage 0/A/B, E2, experiment, automation, install, download, external communication, or STOP revival was performed. Completion state: `IDLE_REUSABLE_AWAITING_MAINLINE`.
