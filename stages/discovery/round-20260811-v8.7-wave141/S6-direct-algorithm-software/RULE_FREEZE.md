# Rule freeze

- Assignment: `DISCOVERY-S6-20260811-V8.7-WAVE141-POSTGRES-BRIN-NATURAL-TRANSITION-DEPTH-REDTEAM`
- Frozen cutoff: 2026-08-11; `v8.7-authoritative-plus-r3-p0-clarity-compatibility__r5-p0-funnel-clarity__r7-p0-repair-vector-dormant-off__discovery-six-lanes-direct-20260811__p1-shadow-not-authoritative`; `DISCOVERY_QUALITY_MODE: OFF`.
- Object: fixed PostgreSQL BRIN index, table, SQL query results and normal build/insert/summarize/desummarize/vacuum/scan semantics. Changing reader/index semantics, input records, or merely sweeping `pages_per_range`/`autosummarize` is out.
- This is a directed closure of Wave138 `NOT_ADMITTED_UNFROZEN`, not revival of a STOP. No experiment or downstream stage was run.
