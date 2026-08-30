# Rule freeze

- assignment: `DISCOVERY-S6-20260811-V8.7-WAVE168-MACHO-CHAINED-FIXUPS-GLOBAL-CONSTRUCTOR-DEPTH-REDTEAM`
- rules revision: `v8.7-authoritative-plus-r3-p0-clarity-compatibility__r5-p0-funnel-clarity__r7-p0-repair-vector-dormant-off__discovery-six-lanes-direct-20260811__p1-shadow-not-authoritative`
- `DISCOVERY_QUALITY_MODE=OFF`; frozen date 2026-08-11.
- Scope: fixed Mach-O bind/rebase targets, pointer locations and executable semantics, emitted with `LC_DYLD_CHAINED_FIXUPS` and accepted by stock dyld/LLVM parser. Changed section/image layout, load semantics, local emitter changes, parameter sweeps, generic packing/ILP and reader changes are excluded.
- Static source/specification red-team only. No Mach-O corpus download, link, parse, load or benchmark was run.
