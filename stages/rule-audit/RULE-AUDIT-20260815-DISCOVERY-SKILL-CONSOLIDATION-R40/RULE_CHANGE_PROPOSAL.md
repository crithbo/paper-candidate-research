# Rule change proposal

## Identity

- Audit: `RULE-AUDIT-20260815-DISCOVERY-SKILL-CONSOLIDATION-R40`
- Decision: `MAINLINE_IMPLEMENTATION_AUTHORIZED`
- Scope: Discovery workflow consolidation, project skill installation, two-slot selective depth, retirement of ineffective zero-yield micro-rules
- Shared writer: `MAINLINE`
- Effective boundary: first newly frozen six-lane cycle after paused, unstarted Source52 snapshot

## Files

1. Add `.agents/skills/research-topic-discovery/SKILL.md`.
2. Add `.agents/skills/research-topic-discovery/agents/openai.yaml`.
3. Add `.agents/skills/research-topic-discovery/references/source-portfolios.md`.
4. Add `.agents/skills/research-topic-discovery/references/selective-depth.md`.
5. Modify `AGENTS.md` to register the skill as a mandatory Discovery read and summarize the consolidated funnel.
6. Modify `rules/ROLE_DISCOVERY.md` to move operational ideation/closure instructions to the skill, install pre-RQ anchor closure, and define the global two-slot model boundary.
7. Modify `rules/ROLE_MAINLINE.md` to freeze the skill hash, allocate the two strong packets after a six-lane nomination barrier, and prevent repeated zero-yield micro-rule stacking.
8. Modify the three Discovery templates to remove mandatory engine/RQ-version counts and record pre-RQ bundle closure plus selective-depth nomination/result.
9. Update `plan.md`, `history.md`, and `registry.yaml` only as normal mainline implementation/state records.

## Exact semantic delta

- Keep six breadth lanes at `gpt-5.6-terra / high`.
- Enable at most two `gpt-5.6-sol / high` one-level subagents per full six-lane cycle.
- Select strong packets only after all lanes freeze at most one nomination or none; no result-aware backfill.
- Change selective-depth eligibility from “complete final RQ and at most one missing tuple field” to “one exact anchor, stable object/guarantee, one decision consequence, one anchor question, <=2 named primary sources, no known fatal.”
- Allow one source to jointly close a co-defined carrier/action/estimand bundle.
- Keep the evidence-qualified raw gate and every scientific hard gate unchanged.
- Do not categorically exclude mature surfaces; broad saturation only changes next-cycle source weighting.
- Make divergence-engine count and RQ alternative count advisory.
- Replace the universal action/non-product check with a contribution-type-specific cheapest anti-collapse check.
- Require each future zero-yield experiment to retire, downgrade, or retain the previous one before adding another behavior change.

## Rollback

If the new skill causes object drift, known-fatal revival, outcome-aware replacement, raw admission without the existing authoritative fields, or both strong packets produce no source-backed closure, set selective depth `OFF` for the next cycle. Keep the installed skill's ordinary breadth/identity/queue workflow, revert only the two-slot section, and preserve all artifacts. If skill/rule hashes conflict, stop new dispatch until mainline re-freezes a consistent assignment; do not change scientific states.

## Non-regression

No change to Q1/Q2, same-object, current collision, fair strong baseline, natural/canonical evidence, full-cost, reproducibility, claim ceiling, STOP non-revival, independent Stage 0/A, Stage B user gate, lane count, retrieval/storage/CPU/network budgets, V9 OFF, or network-security exclusion.
