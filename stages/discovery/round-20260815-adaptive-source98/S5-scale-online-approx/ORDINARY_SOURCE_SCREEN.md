# Source98 ordinary R40 source screen

| Role | Official first-party source | Finding |
|---|---|---|
| ANCHOR / CURRENT | https://www.erlang.org/doc/apps/mnesia/mnesia.html | Defines transform_table, copy-type and fragment-change native actions. |
| CONTRARY / current boundary | https://www.erlang.org/docs/25/apps/mnesia/mnesia_chap3 | transform_table changes all records and requires Mnesia stopped on all db_nodes; metadata-only ignore is inconsistent/offline. |
| CURRENT alternative | Same official guide | move_table_copy retains other reads/writes while moving a copy, so it is a strong same-system but distinct transition baseline. |

One bounded official documentation route was used. It supports a scoped online-vs-offline transition tension, not a current-absence or novelty assertion. Source symbols, flags, collision and legality remain explicitly bounded debt.
