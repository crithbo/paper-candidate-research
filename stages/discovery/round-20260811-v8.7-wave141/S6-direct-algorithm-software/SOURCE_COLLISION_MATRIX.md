# Source / collision matrix

| source | current/source fact | implication |
|---|---|---|
| [PostgreSQL BRIN documentation](https://www.postgresql.org/docs/17/brin.html), checked 2026-08-11 | Existing summarized ranges are updated on new tuples; new ranges can be summarized by vacuum/autovacuum, `autosummarize`, `brin_summarize_new_values`, or `brin_summarize_range`; `brin_desummarize_range` removes stale range summaries. | Current native union covers maintenance/rebuild actions, not just build defaults. |
| [PostgreSQL index-maintenance functions](https://www.postgresql.org/docs/17/functions-admin.html), checked 2026-08-11 | Confirms exact summarize and de-summarize functions and their range semantics. | Direct same-object subtractor. |
| [CREATE INDEX storage parameters](https://www.postgresql.org/docs/13/sql-createindex.html), current documentation route checked | `pages_per_range` default is 128; `autosummarize` default is off. | A pages-per-range/autosummarize selection is configuration, not N2. |
| [NYC TLC Trip Record Data](https://www.nyc.gov/site/tlc/about/tlc-trip-record-data.page), official 2025 releases | Monthly Yellow Taxi Parquet data is public; official data dictionary defines timestamp/trip fields. | Frozen natural carrier: Jan--Jun 2025 Yellow Taxi monthly releases, versioned by official month URL and dictionary dated 2025-03-18. |
| recent direct-collision check | Official BRIN docs already specify the direct maintenance mechanisms. No first-party paper/source was found in this pass establishing a distinct same-object global degradation constructor. | Absence of such a paper is not used as evidence; direct union collision is sufficient for the candidate action. |

Current upstream pin note: PostgreSQL official documentation was checked at cutoff. A source-commit pin for backend BRIN implementation was not necessary to assert a missing action; the documented public action union supplies positive counterevidence. If a future proposal depends on an undocumented absence, it must pin `src/backend/access/brin` at a current exact commit first.
