# Rule freeze — Wave75 determinism / incremental equivalence boundaries

- Assignment: `DISCOVERY-S1-20260811-V8.7-WAVE75-DETERMINISM-INCREMENTAL-EQUIVALENCE-BOUNDARIES`.
- Date/current-upstream cutoff: 2026-08-11; authority `v8.7 + R5-P0`, `DISCOVERY_QUALITY_MODE=OFF`.
- A valid action must preserve a frozen observable contract: the same input/environment and requested target produce the same accepted artifact, diagnostics/error category, and declared ordering as the clean/batch comparator.  Incremental latency alone is not the object.
- Excluded by rule: canonical emitter, ordering flag, postprocessor, test flakiness, generic cache/controller/retry selector, or any route changing the observable contract.
- No R7/v8.8/shadow behavior was used. Absence of an implementation, result, resource, or AI readiness is not a drop reason.

| Frozen input | SHA-256 |
|---|---|
| `AGENTS.md` | `66231f71ef6ab250a1ad9ff576d5840978f09efc03bf5d2f0527d47f4d82b063` |
| `plan.md` | `03745070dc80ea37e7c063ed109927bd3e2be84c2baf8b3fa3016c0842034000` |
| `registry.yaml` | `a3a11ca2498fb8ff4ba6da8d10c1e8a03829d210059b9407acd25467fe20dd32` |
| `rules/ROLE_DISCOVERY.md` | `fcb9bd73c39f39d31f6c8154e6b48ea23187ff28bdf2bb3d9c59e3d28fa518a3` |
