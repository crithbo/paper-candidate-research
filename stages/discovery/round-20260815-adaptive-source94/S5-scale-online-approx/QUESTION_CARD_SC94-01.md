# Discovery Question Card: SC94-01

- Exact identity: Racket raco make dependency-file and compiler/cm documentation, current official pages, accessed 2026-08-15; carrier IMPLEMENTATION_CARRIER_ONLY; security exclusion PASS.
- Five-field preflight: NONE exact/terminal; related-only compiler-cache overlap. No-match is not novelty evidence.
- Fixed contract: same source module imports, zo and dep artifacts, bytecode validity, and Racket module-load semantics.
- Full cost: dependency traversal/hash and timestamp checks, compile CPU/RSS, zo/dep I/O, transitive rebuild work, and bytecode equivalence.

## Current union

- raco make uses source/bytecode timestamps and hashes plus imported-module dependency facts, rebuilding transitively as needed.
- compiler/cm implements this management, includes cached timestamp checking across calls, exposes compilation handlers and cache/path behavior, and governs output placement.
- Checked actions: dependency fact traversal, source and compiled hashes, transitive recompilation, timestamp caching, compiled file paths, stock load manager and parallel compilation facilities.
- Known direct fatal: FOUND. The selected maintenance action is already the native compilation manager's timestamp/dependency cache or a generic scheduling policy.

## Disposition

- RQ_COMPLETE; RAW_REQUIRED INCOMPLETE; no non-generic union-external action.
- EXCLUDED_BEFORE_RAW. 当前 Racket compiler/cm 已直接表达跨调用 timestamp cache 和同样的依赖重编译语义；不能将其改称新的 bounded-recourse 构造。
- No queue/debt; eligible for C0: NO.
