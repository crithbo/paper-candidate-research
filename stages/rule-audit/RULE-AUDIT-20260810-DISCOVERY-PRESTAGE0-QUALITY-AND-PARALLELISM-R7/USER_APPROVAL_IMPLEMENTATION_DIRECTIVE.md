# User approval implementation directive

## Verbatim approvals

1. `好的，按这个建议执行`
2. `先忽略主线的插入任务，让他另找一个会话执行，先优先我的要求，并且按这个建议执行后，修改对应规则文件，并自己分析并适配一下目前的并行执行方案`

## Frozen interpretation

- This long-lived RULE-AUDIT-SENTRY stops work on the mainline-inserted `RULE-AUDIT-20260810-V8_8-NOT-CALIBRATED-RESOLUTION-R6`; mainline must route that independent audit to another compliant session.
- The user approves the exact R7 staged package in `RULE_CHANGE_PROPOSAL.md` and `DRAFT_PATCH.diff`.
- `POLICY_AUTHORITY=USER` and `SHARED_FILE_WRITER=MAINLINE` remain in force. This approval does not make the audit sentry a second shared writer.

## Authorized now

1. Mainline may apply P0 nonbehavioral telemetry and dormant activation scaffolding at a safe assignment boundary.
2. Mainline may freeze and dispatch the R7 independent backtest after the separately routed v8.8 resolution reaches a calibrated gate that permits it.
3. After independent R7 PASS, mainline may run two noncanonical shadow waves using existing long-lived lanes.
4. If and only if all frozen backtest and shadow thresholds pass and the applied patch is byte/scope-equivalent to this approved package, mainline may switch the exact R7 mode to production at the next safe assignment boundary without asking the same generic approval again.

## Not authorized

- No production behavior before the independent gates pass.
- No modification of an active frozen assignment.
- No new per-candidate task, extra permanent lane, second shared writer, combined backtest roles, experiment, download, Stage0/A/B dispatch by the audit sentry, StageB approval, formal project, external communication or automation.
- No weakening of Q2, same-object, latest collision, fair current strong baseline, natural evidence, full-cost, reproducibility, evidence honesty or claim ceiling.
- No inherited STOP from failure-kernel similarity and no revival of terminal topics.
- No automatic second revision/repack after one failed or contamination-unknown audit.

## Scope-change rule

Any modification to acceptance thresholds, blind-holdout composition minimums, permanent concurrency, source-depth cap, quality gates, state machine or production semantics beyond `DRAFT_PATCH.diff` requires fresh user approval.

