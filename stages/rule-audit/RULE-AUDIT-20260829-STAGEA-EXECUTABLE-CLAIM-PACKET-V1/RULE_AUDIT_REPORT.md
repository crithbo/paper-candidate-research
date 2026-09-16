# Stage A Executable Claim Packet V1 审计报告

## 中文摘要

- 发现的问题：APX、PPC、RVV 多次在首个 claim-bearing observation 前因路径、复制、命令顺序、collector、分母和自然输入合同缺失而 fail closed；大量 preclaim handoff 没有转化为有效科学观察。
- 影响：工程纠错被拆成连续微型 assignment，重复复制数百 MB 工具链，主看板把 preclaim PASS 显示得过于接近科学进展。
- 建议：先以 assignment-local pilot 运行 `STAGEA_EXECUTABLE_CLAIM_PACKET_V1`；共享工具链只读复用，E0–E2 隔离结果，control row 后运行小型自然 pilot，并以决定性观察更新看板。
- 用户批准：已批准执行 pilot；只有 pilot 达标后才安装 skill/rules/templates。

## Identity

- `audit_id`: `RULE-AUDIT-20260829-STAGEA-EXECUTABLE-CLAIM-PACKET-V1`
- `requested_by`: USER
- `date`: 2026-08-29
- `write_directory`: `stages/rule-audit/RULE-AUDIT-20260829-STAGEA-EXECUTABLE-CLAIM-PACKET-V1`
- `shared_files_modified: false`

## Evidence

| Observation | Artifact | Classification |
|---|---|---|
| APX R8 copied 8,191 files but first prepare command exited before any claim row | `r8-natural-claim-execution-20260829/handoff.yaml` | integrated execution contract missing |
| PPC R10 completed 0/32 because per-row subcommand order was missing | `r10-natural-claim-execution-20260829/handoff.yaml` | command-DAG gap |
| PPC R10B abandoned because 56 real baseline command metrics were not in full-cost denominator | `r10b-baseline-denominator-refreeze-20260829/handoff.yaml` | method/full-cost contract gap |
| PPC R11P copy omitted fixture and four tool binaries | `r11p-baseline-cost-collector-preclaim-20260829/handoff.yaml` | dependency-closure gap |
| RVV R6 has no exact natural inputs, baselines, argv or output schema | `r6-natural-claim-contract-20260829/NATURAL_CLAIM_CONTRACT.yaml` | natural execution packet gap |

## Recommendation

- Decision: `PATCH_RECOMMENDED__ASSIGNMENT_LOCAL_PILOT_FIRST`
- Scientific thresholds changed: no
- Global production cutover now: no
- Pilot population: APX, PPC, RVV
- Pilot success: at least two topics produce a valid positive or negative natural Stage A observation within one packet plus one engineering correction each.
- Rollback: if threshold fails, retain existing rules and evidence; no skill/rule install.

## Risk controls

- Engineering control rows are excluded from scientific denominators.
- Candidate/baseline effect values remain hidden during E0–E2.
- First natural observation freezes packet, corpus, baselines and denominator.
- One correction does not permit changing scientific fields.
- Stage B remains unauthorized.

## Mainline handoff

- User approval already present: yes
- Required current action: freeze three assignment-local pilot packets and register read-only shared assets
- Shared rule/template edits now: forbidden until pilot acceptance
- Existing PASS/STOP/HOLD topics affected: none
- Shared files modified: `false`
