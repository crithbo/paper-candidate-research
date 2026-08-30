# Source and collision matrix

Frozen cutoff: 2026-08-11. Sources are official Apache DataSketches or DuckDB documentation/source-facing APIs.

| id | official source | current guarantee/action evidence | collision conclusion |
|---|---|---|---|
| R01 | [KllSketch API](https://apache.github.io/datasketches-java/9.0.0/org/apache/datasketches/kll/KllSketch.html) | lazy compaction, rank error, retained/serialized size, merge | current KLL union |
| R02 | [DataSketches dictionary](https://apache.github.io/datasketches-java/7.0.1/resources/dictionary.html) | theta estimation, nominal entries, sampling, set/seed semantics | current Theta union |
| R03 | [DataSketches server](https://github.com/apache/datasketches-server) | native CPC family/update/query/merge/serialization API | current CPC union |
| R04 | [DataSketches server](https://github.com/apache/datasketches-server) | frequent-item weighted updates and declared error modes | current heavy-hitter union |
| R05 | [DuckDB aggregates](https://duckdb.org/docs/lts/sql/functions/aggregates) | `approx_quantile` uses T-Digest | no complete action witness beyond parameters |
| R06 | [DuckDB aggregates](https://duckdb.org/docs/lts/sql/functions/aggregates) | `approx_top_k` uses Filtered Space-Saving | no complete action witness beyond parameters |

Latest-collision finding is positive current constructor absorption, not an absence claim.
