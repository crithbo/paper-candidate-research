# R42 audit input snapshot

## Scope and exclusion

- Audit ID: `RULE-AUDIT-20260815-SOURCE55-56-ANCHOR-FIRST-EXPIRY-R42`
- Included: completed Source55 and Source56 canonical six-lane handoffs/controls, the installed R40 Discovery skill, and R41 proposal semantics.
- Excluded: any Source57 or later outcome; all MIPS FCSR closure-CQ01 contents/results; Stage 0/A/B; external retrieval, experiments, downloads, and shared controls.
- The MIPS closure was read only at assignment-header level to confirm it is a separate `ACTIVE_SOURCE_CLOSURE_ONLY` task with `source56_input_allowed: false`; it contributes no R42 outcome or inference.

## Frozen controls

| Artifact | Path | SHA256 / status |
|---|---|---|
| Installed Discovery skill | `.agents/skills/research-topic-discovery/SKILL.md` | `FC041AE3DB89DDEA1771076E0824929C6AA29C9A34A08BE30C7F322F51721CD2` |
| R41 manifest | `stages/rule-audit/RULE-AUDIT-20260815-SOURCE53-54-R40-ZERO-BRIEF-R41/HASH_MANIFEST.sha256` | `A68477B3D9E4F2729462BDB51D00C8FE059B902EF43392791337FBFDCCA25D5B` |
| Source55 control | `stages/discovery/round-20260815-adaptive-source55/control/CONTROL.yaml` | `3F0CB1B1269A78E112A27DBB0DA7478DB840AC045705215D55F6844AC35BE006` |
| Source56 control | `stages/discovery/round-20260815-adaptive-source56/control/CONTROL.yaml` | `C2A3595D292D7A5733F3401BE4D06F8CBFD4809715BBBA4F422F6AF635B40AA5` |

## Process-only telemetry

- Active profile: `ANCHOR_FIRST_ENTRY_REBALANCE_V1`, Source56 only, S1/S3 only, explicitly expired after Source56.
- S1: `seed cluster 1 → exact Zawrs 1.01 anchor → primary RQ → ordinary closure → generic-policy shell`, with no raw or brief.
- S3: six candidate anchors considered, `NO_EXACT_ANCHOR`, with no RQ/raw/brief.
- Ordinary control lanes S2/S4/S5/S6: 0 clean brief; their results are not counterfactual estimates of S1/S3.
- No persisted resources, experiments, or model-route/budget changes were used in this profile.
