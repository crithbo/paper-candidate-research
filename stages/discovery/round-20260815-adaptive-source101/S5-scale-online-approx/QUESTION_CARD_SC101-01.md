# DISCOVERY_QUESTION_CARD — SC101-01

- Exact identity: NODEJS_MODULE_COMPILE_CACHE__BOUNDED_RECOURSE_MODULE_GRAPH_TRANSFER.
- Current official locus: Node.js v26.5.1 `node:module` API, accessed 2026-08-15: https://nodejs.org/api/module.html.
- Same-object boundary: stock CommonJS/ESM/TypeScript compilation and module loader execution under a fixed Node version; no source, loader, or cache-validity semantic change.
- Current union: current-instance enablement and status; on-disk V8 code cache per freshly loaded module; disk write at exit or explicit `flushCompileCache`; portable relative-layout reuse; separate version caches; current/child worker inheritance controls; disable path and directory/status APIs.
- Candidate action tested: a bounded-recourse dependency-aware module-cache transfer.
- Strongest contrary result: the documented cache is a per-module compilation cache with current module-content validity, layout portability, version separation and explicit sharing flush. The proposed dependency-graph transfer adds only a generic cache dependency/flush policy, not a target-native module-loader action.
- Full cost considered: code cache generation/write, cache bytes, module load/compile time, filesystem work, version/layout compatibility, child-worker sharing and execution equivalence.
- Minimum falsifier satisfied: current union already supplies the concrete per-module state generation/persistence/portability operations; no new same-object atomic action survived.
- Identity preflight: no exact registry identity was used as exclusion; broad runtime/cache overlap is RELATED_ONLY.
- RAW_REQUIRED audit: INCOMPLETE. Disposition: EXCLUDED_BEFORE_RAW__GENERIC_CACHE_GRAPH_RESIDUAL.

The exclusion is structural and independent of implementation, result, resource, or AI readiness. It does not claim general novelty absence.
