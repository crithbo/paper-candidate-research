# AUDIT REPORT — fidelity-plan v8.6

- Assignment: `BACKTEST-AUDITOR-L1-20260809-FIDELITY-PLAN-V8.6`
- Role: `DISCOVERY_BACKTEST_AUDITOR_LANE_1`
- Scope: calibration of Discovery admission only; not candidate evidence or authorization for Stage 0/A/B.

## Independent verdict

`ACCEPT_FOR_PRODUCTION` — `CALIBRATED`.

Wave 12 production use is permitted for the v8.6 Discovery admission rule, subject to every standing project gate. This does not waive same-object, collision, strong-baseline, natural-input, full-cost, reproducibility, or later Stage A fidelity requirements.

## Input, provenance, and isolation audit

| Check | Result | Evidence |
|---|---|---|
| Packer exact file set | PASS | 17/17 manifest-listed files present: 12 blinded cases and five control files. |
| Packer manifest | PASS | SHA-256 `26B8E768E528BBB106CC49CC8E26761C8E889F7B7F6AED53C2A88B1A5244B49B`; all 17 listed file hashes match. |
| Blinded root / inputs | PASS | 12/12 opaque input hashes match `AUDIT_KEY.yaml` and packer manifest; declared root consistently `739ECB8527A11AFA718406F7F5AD1C9B6D078DCAA312241961C47E25B5443BCF`. |
| Composition and cutoffs | PASS | Audit key has 6 `PROPOSE_STAGE0` and 6 `DROP` labels. Named source artifacts use declared 2026-08-02/03/09 cutoffs and all 10 provenance SHA-256 values match. |
| cvc5/Alethe exclusion | PASS | No case source is cvc5/Alethe. |
| Blinding leakage | PASS | Executor input contains no source paths, topic IDs, labels, audit-key rationale, later outcomes, or target-paper identity. |
| Write scope | PASS | Executor produced only decisions, report, handoff, and manifest; no candidate or Stage 0/A/B artifact and no experiment. |
| Executor file set / hashes | PASS | 3/3 manifest-listed files match; decisions `7D7F040D2F82A4CDC439104E7D5E705C48AC110BC79A08FEAB4133B0451B2879`, handoff `7179408C88CA9E61F5A5C4E060555565B5CB5B2452BD037D5BA7100A0D5348C6`. |

Frozen local source hashes give a reproducible input link. They do not independently establish an external archive timestamp beyond declared local cutoff metadata; this is residual provenance risk, not detected contamination.

## Per-case decision audit

| Case | Expected | Executor | Basis checked | Result |
|---|---|---|---|---|
| `q7m2` | PROPOSE_STAGE0 | PROPOSE_STAGE0 | Same proof semantics; live dependency partition; finite replay/checker closure. | TP |
| `h4v9` | PROPOSE_STAGE0 | PROPOSE_STAGE0 | Same archival object; union-external forest construction; strict verifier/exact-small closure. | TP |
| `b8k1` | PROPOSE_STAGE0 | PROPOSE_STAGE0 | Same writer/reader/trainer; retained-cover action; finite scan/checksum closure. | TP |
| `t3c6` | PROPOSE_STAGE0 | PROPOSE_STAGE0 | Same request contract; request-level arbitration; finite trace-model closure. | TP |
| `n5r8` | PROPOSE_STAGE0 | PROPOSE_STAGE0 | Same exact optimizer; future-equivalence action; finite oracle closure. | TP |
| `z1p4` | PROPOSE_STAGE0 | PROPOSE_STAGE0 | Same backend semantics; joint slot/migration construction; finite solver/replayer closure. | TP |
| `f6d0` | DROP | DROP | Current action space directly absorbs global action. | TN |
| `w2j7` | DROP | DROP | Full orchestration action is already exposed; proposal is selector/proxy. | TN |
| `a9x3` | DROP | DROP | No fixed native target object, semantics, or denominator. | TN |
| `m0s5` | DROP | DROP | Existing feedback repair owns action; proposal is selector. | TN |
| `r8e1` | DROP | DROP | Fixed digest/input mapping leaves cache/reuse only. | TN |
| `y4u6` | DROP | DROP | Current union contains entire contemplated pipeline. | TN |

The six retained cases were not dropped merely for missing implementation, interface, format, checker, witness, or result: each has a fixed same-object contract and finite auditable closure. No `FINITE_FIDELITY_GAP` revived direct absorption (`f6d0`, `w2j7`, `y4u6`), wrapper/selector cases (`m0s5`, `r8e1`, `w2j7`), or a changed/unfixed object (`a9x3`).

## Acceptance calculation

- TP=6, FN=0, TN=6, FP=0.
- Positive retention: 6/6; required at least 5/6 — PASS.
- Negative drop: 6/6; required 6/6 — PASS.
- Terminal revival: 0; required 0 — PASS.
- Detected contamination/confusion: none; fail-closed trigger not invoked.

## Residual risk and claim ceiling

This 12-case local calibration cannot establish future precision, novelty, quality, feasibility, correctness, or performance. Positive labels mean only Stage 0 admission is permissible under a finite fidelity-closure plan, not that closure will succeed or that Stage A will pass. Production use must still reject direct union absorption, wrapper/selector status, changed object/guarantee, and no finite faithful closure.

## Final status

`CALIBRATED`; wave 12 production is allowed with the stated ceiling. Lane state: `IDLE_REUSABLE_AWAITING_MAINLINE`, pending mainline acceptance.
