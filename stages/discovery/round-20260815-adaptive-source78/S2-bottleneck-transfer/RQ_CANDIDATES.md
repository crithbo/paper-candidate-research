# Source78 primary RQs

## RQ-01 — JDK 25 CDS archive constructor

- Exact object: fixed JDK 25 build, classpath/module path, class set and Java program semantics; stock CDS loader/mmap behavior.
- Primary RQ: Can a same-object archive constructor jointly choose class admission/layout with a target-specific construction/quality guarantee beyond JDK 25 static/dynamic/automatic CDS actions?
- Boundary: no changed JDK build/classpath correctness, custom class loader, weakened archive validation, or startup controller.
- Primary source route: Oracle JDK 25 CDS guide and `java` tool specification. Fallback only for transport: current OpenJDK CDS source.
- Result: `EXCLUDED_BEFORE_RAW__CURRENT_STATIC_DYNAMIC_AUTOMATIC_ARCHIVE_CONSTRUCTOR_UNION_AND_GENERIC_PACKING_SHELL`.

## RQ-02 — Fontconfig cache construction and lookup

- Exact object: fixed font files, fontconfig XML, patterns and stock match result.
- Primary RQ: Can a same-fontset cache constructor jointly decide physical cache/index layout with a target-specific matching/lookup guarantee beyond the current scan/cache/configuration machinery?
- Boundary: same font set, configuration semantics and `FcConfig`/matching result; no private matcher, XML policy controller, cache-directory selector or generic packing.
- Primary source route: current Fontconfig configuration/manual page. Fallback only for transport: current Fontconfig source.
- Result: `EXCLUDED_BEFORE_RAW__CURRENT_SCAN_CACHE_AND_MATCH_COMPOSITION_GENERIC_LAYOUT_SHELL`.

No selective/pre-RQ nomination: selective depth is OFF. S78-03 did not become an RQ because its primary anchor was not frozen; it remains non-evidence backlog.
