# User Approval and Implementation Directive

## Identity

- `audit_id`: `RULE-AUDIT-20260810-SCREENING-THROUGHPUT-PARALLELISM-R4`
- `proposal_id`: `ADAPTIVE-WIP-FAST-HANDOFF-BURST-R4`
- `approved_by`: user
- `approval_received_at`: 2026-08-10（Asia/Shanghai）
- `shared_files_modified_by_audit_sentry: false`

## Approved scope

The user explicitly approved execution of the R4 parallelism recommendation:

1. retain `BASE_ACTIVE_SEATS=4`;
2. permit one temporary `MAINTENANCE_COEXISTENCE_BURST` seat when maintenance/backtest is active and ready, authorized scientific work has an idle existing long-lived lane;
3. reuse existing long-lived lanes only; do not create per-candidate tasks;
4. do not raise any per-stage maximum above four;
5. prioritize completed scientific handoff acceptance over starting another noncritical refactor block;
6. keep two rotating Discovery hot slots; do not expand production Discovery before consolidated v8.8 backtest PASS;
7. activate candidate/gate lane2 only with at least two independently confirmed, resource-ready Stage A assignments;
8. preserve Stage 0 independence and same-packet `PACKER → EXECUTOR → AUDITOR` serial independence;
9. run the scheduling change first as a two-cycle shadow/pilot and report telemetry before authoritative cutover.

## Binding safety boundaries

- No relaxation of Q2, same-object, latest collision, fair current strong baseline, natural evidence, full-cost, reproducibility or claim ceiling.
- No duplicate assignment, shared-writer expansion, pre-reading next assignments or merging independent review roles.
- No Stage B, formal project, large download, automation or terminal revival authorization is created by this directive.
- Existing assignments retain their frozen rule revision and input hashes.
- Mainline remains the only shared-file writer.

## Next requested audit after implementation

After the R4 scheduling pilot is implemented and reported, the user requests a separate audit of why at least 238 registered screening units produced only six Stage 0 proposals and how to improve the quality of initial research-topic discovery, including whether deeper/broader literature work would help.

This second audit must distinguish:

- healthy abstention from inefficient shallow screening;
- raw quantity from source quality and genealogy completeness;
- literature volume from strategically selected anchor/current/contrary/generic-kernel coverage;
- Discovery recall from Stage 0 precision and Stage A yield;
- quality improvement from any prohibited lowering of academic gates.
