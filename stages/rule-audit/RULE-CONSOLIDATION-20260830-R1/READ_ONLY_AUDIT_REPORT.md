# Rule Surface Consolidation Audit

## Decision

`PATCH_RECOMMENDED__WAIT_TEMP_MAINLINE_LEASE_RELEASE_FOR_LOCKED_FILES`.

The live rule surface has accumulated repeated global gates, operational state, dormant modes and parallel protocols. The problem is rule duplication, not missing policy.

## Highest-priority consolidation

1. Remove obsolete four-seat/two-hot-Discovery scheduling from `ROLE_MAINLINE`; keep current lane state and stop targets in plan/registry.
2. Make `AUTONOMOUS_SOFT_BLOCKER_RECOVERY` the single blocker/recovery owner; role files retain only detection and handoff duties.
3. Consolidate common Stage A A0/A1/A2, cumulative budget, fidelity and directional full-cost semantics into one existing/canonical protocol surface; Mainline/Owner/Reviewer roles reference it rather than copy it.
4. Separate resource localization from lifecycle: the former owns paths/redirection/inventory; the latter owns retention/capsule/closeout/GC. Resolve cleanup authority as explicit in-run ephemeral leaf cleanup versus MAINLINE closeout/recursive GC.
5. Keep `DISCOVERY_CLAIM_PACK` as one protocol; archive dormant R7 blocks and remove current rollout status from live rules.
6. Move Discovery operational runbook detail to the existing research-topic-discovery skill; role rule retains permissions, hard gates, output and handoff.
7. Remove approval receipts, current mode values, portfolio percentages and historical hashes from rules; place them in registry/plan/history.
8. Preserve frozen-rule semantics: no running assignment is retrospectively rejudged under a new rule.
9. Split `scientific_verdict` from `operational_disposition` in stage outputs.
10. Preserve minimal terminal identity stubs in registry to prevent renamed revival.

## Template consolidation

- Keep RQ Candidate, Question Card, Topic Brief, Stage reports, Q1 Comparator Matrix, Stage A readiness ledger and terminal capsule.
- Fold bounded maturation repair into existing Question Card bounded-debt closure after prospective calibration; do not retain a parallel live rule or three split templates.
- Merge Stage A engineering status into readiness ledger.
- Slim HANDOFF to transport identity/hashes/decision/next gate/artifact pointers/authority/blocker/lifecycle.
- Remove dormant R7 blocks and Discovery 70/30 compensatory score from live Topic Brief.
- Remove zero-reference StageA lightweight manifest after moving its one useful statement into the canonical manifest rule.

## Rule-update discipline

The project-level invariant must live once in `AGENTS.md`: if a proposed rule overlaps an existing object, state, authority, gate or workflow, it must `REPLACE / MERGE / RETIRE` the canonical owner, delete superseded live text and migrate references. New parallel micro-rules are forbidden unless the semantic is genuinely orthogonal and cross-role reusable. Current state belongs in plan; status/cutover/hash records in registry; completed rollout history in history; superseded bytes in archive.

Mainline acceptance must require an overlap matrix, canonical owner, replaced ranges, retired files, reference migration, rollback, zero-reference scan and active-mode-count delta. Rule Audit proposals must prove why in-place update is insufficient before proposing a new file.

## Safety

No locked file was modified by this audit. Existing assignments retain their frozen hashes. Semantic-preserving deduplication still requires cold-start, state-transition, blocker-route, evidence and lifecycle regression checks at the next safe assignment boundary.

