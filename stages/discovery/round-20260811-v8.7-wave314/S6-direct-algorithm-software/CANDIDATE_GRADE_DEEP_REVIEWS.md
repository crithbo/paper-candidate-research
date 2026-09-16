# Candidate-grade deep reviews

## D1 Redis `rax` sequential-key path

- **Object/oracle:** fixed key/value sequence and Redis command semantics; stock lookup/full-scan results are oracle.
- **Seed and union:** release material lists an optimisation for sequential-key `rax` insert/lookup. Current Redis includes the resulting native implementation plus configuration/allocator paths; the fix itself cannot evidence an unresolved action absence.
- **Candidate test:** a whole-tree constructor with a certified sequential-run update/lookup frontier would require fixed persistence/replication/memory semantics. The available idea is a local radix traversal/representation optimisation, not a global target-specific constructor.
- **Route/cost/killer:** public versioned key traces; command equality; build/update/query CPU/RSS/bytes/latency. Killer: a finite run-pattern trace showing a semantic-preserving global invariant beyond the patched native traversal.
- **Decision:** `STRUCTURAL_DROP` — remaining action is local implementation work, not N2.

## D2 Redis simultaneous-expiry path

- **Object/oracle:** fixed key TTLs, commands, persistence and expiration-visible semantics; stock command/replication outcomes are oracle.
- **Seed and union:** release material reports lower overhead where many keys expire together. Expiration actions, scheduling, server configuration and replication/persistence paths constitute a broad current union.
- **Candidate test:** a certified global expiration constructor would need a same-object semantics-preserving order/recourse theorem. Available formulations choose expiration scheduling/controller policy, which is excluded.
- **Route/cost/killer:** public TTL workload traces; visible commands plus persistence; update/expire/replication CPU-RSS/latency. Killer: finite simultaneous-expiry trace separating a theorem from a scheduling policy.
- **Decision:** `STRUCTURAL_DROP` — controller rather than complete constructor.

## D3 LLVM X86 vector-compare lowering

- **Object/oracle:** fixed LLVM IR, target features and machine-code behavior; LLVM test/oracle semantics.
- **Seed and union:** upstream issues identify missed target patterns. The current backend/pass/target feature union is a strong subtractor.
- **Candidate test:** a cross-basic-block target-specific exact selection theorem would need go beyond the local pattern repair. No whole-object invariant, natural carrier or direct-collision closure was frozen.
- **Route/cost/killer:** LLVM test-suite; codegen/verify/size/runtime CPU/RSS. Killer: two legal selections under identical IR/features proving a nonlocal guarantee.
- **Decision:** `NOT_ADMITTED_UNFROZEN` — local emitter repair is excluded and global closure is incomplete.

## D4 Arrow-RS lexsort/interleave path

- **Object/oracle:** fixed Arrow arrays/null/order semantics and stock result equality.
- **Seed and union:** upstream PRs cite avoiding index materialisation and specialised primitive-child interleave. These are kernel-specific improvements, with current planner/kernel/config union not frozen.
- **Candidate test:** an exact/FPT multi-column construction with a memory/latency guarantee must retain Arrow semantic equality and exceed all current kernels. No target-specific recurrence was identified; generic ordering/materialisation is excluded.
- **Route/cost/killer:** versioned public Arrow tables; equality/digest oracle; construct/query CPU/RSS/temp/bytes. Killer: finite nested-array witness separating a global guarantee from current kernel dispatch.
- **Decision:** `NOT_ADMITTED_UNFROZEN`.

## Result

`COMPLETE_ZERO_PROPOSALS`: 8 raw families, 4 deep reviews, 2 structural drops and 2 source/collision-unfrozen rows. No decision relies on missing implementation, results or resources.

