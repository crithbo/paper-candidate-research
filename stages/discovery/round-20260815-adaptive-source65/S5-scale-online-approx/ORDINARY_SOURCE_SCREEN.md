# Source65 ordinary source screen

| Role | First-party source | Frozen result |
|---|---|---|
| ANCHOR/CURRENT | https://www.scala-lang.org/blog/2017/11/03/zinc-blog-1.0.html | Zinc aims to preserve clean-compile output while choosing affected source subsets. It implements class-based dependency analysis, mappings from sources/classes/products/dependents, and fine-grained invalidation. |
| CURRENT | https://github.com/sbt/sbt | Current sbt source identifies sbt/zinc as its incremental compiler and exposes analysis/cache/compiler integration. |
| CURRENT/CONTRARY | https://github.com/sbt/sbt/blob/develop/main/src/main/scala/sbt/Defaults.scala | Current build integration includes persistent compile analysis, compiler cache and transactional-manager interfaces. |

Zinc already owns the exact class-level selective invalidation and persistent analysis state central to the seed. The remaining language is generic graph/cache maintenance; no union-external Zinc action, natural carrier, or target-specific guarantee was frozen. S65-RQ-01 is LOCATOR_ONLY, not raw or STOP.
