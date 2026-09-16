# V8-SNAPSHOT-CONSTRAINT-SCHEDULER — Independent Stage 0 confirmation

- Assignment: `STAGE0-C2-20260811-V8-SNAPSHOT-CONSTRAINT-SCHEDULER-CONFIRM-V8.7`
- Role: `INDEPENDENT_CONFIRMATION_SENTRY`
- Decision: `CONFIRM_REVISE_ONCE`
- Tier: `TIER_B_Q2_VIABLE__CONDITIONAL_ON_UNIQUE_GATE`
- Confidence: `0.91`
- Evidence ceiling: `STATIC_CURRENT_SOURCE_AND_CERTIFICATE_ROUTE_ONLY__NO_IMPLEMENTATION__NO_RESULT`
- Latest-collision status: `SEARCH_BOUNDED_OPEN`

## Independent disposition

The PRIMARY's one gate is confirmed, with a tightened interpretation.  Current V8 exposes a native, reader-preserving decision surface—intentional deferral, a deferred container, pending forward references, back references, an eight-entry hot-object mechanism, allocation/alignment and partition transitions—but no checked stock configuration is a complete scheduler for eligible generic non-code objects.  This leaves a conditional N2 route.  It is not enough to claim an object-ordering idea: the revision must define a V8-specific state quotient and formal guarantee.

CAHPs (OOPSLA 2025) and the CGO 2025 Native Image work are strong broad heap-ordering/startup subtractors.  They use GraalVM Native Image, profile/cross-build matching and a distinct image/reader/action grammar.  They therefore narrow the claim to **static same-graph V8 native-deferral scheduling**, but do not directly absorb it or justify STOP.

## Decisive independent checks

### 1. Frozen same-object contract and typed legality

The object is one matching-version V8 snapshot with fixed build/configuration, builtins, roots, snapshot partitions and heap graph.  The matching unmodified deserializer must reconstruct the same graph, identities/aliases and JavaScript-observable behavior.  No new snapshot bytecode, decoder, external compression semantic, profile information, code-cache/object-graph change or cross-version compatibility premise is admissible.

The candidate action grammar is restricted to existing native actions:

1. serialize a currently required object now;
2. defer only an object for which the native `CanBeDeferred`/map/space/partition/phase rules permit deferral;
3. choose among already eligible deferred objects through an explicit deterministic native selection policy; and
4. resolve native pending-forward references and emit existing back-reference/hot-object/no-op forms exactly as the writer protocol dictates.

All root/cache ordering, map-first constraints, read-only/shared/startup/context partitions, nondeferrable classes/slots and serializer phases are hard preconditions.  The schematic `R,A,B,C` witness is not evidence until it binds `R,A,B,C` to actual current object types, tagged slots, allowed partition/space and pre-serialized-map conditions.  Both proposed schedules must emit legal stock bytecodes and pass the unchanged reader/graph/alias oracle.

### 2. Complete current union

The revision must attack this finite union, not a weak default only:

- pinned V8 serializer traversal, LIFO deferred stack, pending-forward-reference, back-reference and eight-hot-object protocol;
- read-only/shared/startup/context partition behavior; fixed `V8_SNAPSHOT_COMPRESSION` and zlib path; `stress_snapshot`, `extensible_ro_snapshot`, checksum/profile controls; `mksnapshot` startup/warmup inputs; and `reorder_builtins`;
- same-information stock traversal, stable legal queue, and finite raw-byte-only, page-only and hot-recency-only score grids; and
- tiny exhaustive legal scheduling only as an oracle.

`reorder_builtins` and related profile inputs are a code-only/profile-dependent baseline, not permission to give the candidate a generic heap profile.  An exhaustive oracle or a theoretical ability to enumerate all legal moves cannot itself absorb a target-specific solver.

### 3. Non-generic state and guarantee test

The sole permissible revision must define a finite state at least containing the current serializer phase/partition/space, the canonical eligible-deferred frontier, pending-forward-reference obligations, live back-reference map quotient, ordered eight-hot-object state, allocation cursor/alignment, exact additive raw-byte token state, and the declared page/allocation proxy.  State equality must preserve every future legal native action and the declared final costs.

The certificate must give base/terminal conditions, transitions, deterministic ties and an exact/FPT or certified-Pareto complexity bound with all parameters—including the number of live identity/backref obligations—visible.  A guarantee over fixed zlib size is disallowed unless it models complete compressor state; compressed size and startup remain measured Stage A objectives.  An arbitrary beam/list, generic topological scheduling, CP/ILP wrapper or scalar weighted local policy is not N2.

### 4. Required static divergence and finite Stage A killer

The typed `R,A,B,C` construction must establish an actual difference from the complete stock/current single-score catalog, not merely different heap positions.  It can demonstrate action divergence only.  The finite Stage A preclaim gate must then: exhaustively replay tiny legal schedules through the native serializer/stock deserializer; compare graph/alias/JS behavior; replay the complete union; use frozen V8/Node carrier configurations; record scheduler, `mksnapshot`, raw/compressed snapshots, decompression/deserialization/cold start/RSS/page-locality, verification and fallback costs; and kill the performance paper on illegality, union reproduction, no strict full-cost Pareto residual or failed natural carrier contract.

## Verdict and unique revision contract

`V8_NATIVE_DEFERRAL_SCHEDULER__NON_GENERIC_STATE_AND_GUARANTEE_CERTIFICATE` is a lawful, finite, single scientific revision gate.  It closes only with one integrated static certificate containing:

1. typed native `R,A,B,C` legality with all four V8 object/slot/partition/map obligations;
2. complete intentional-defer/select/resolve/hot/backref action catalog and current-control union;
3. future-native-action and exact-declared-cost preserving state quotient, recurrence and honest exact/FPT/certified frontier bound;
4. divergence from all declared stock/single-score policies while retaining stock bytecodes and reader; and
5. finite Stage A fidelity and full-cost killer.

The revision must recommend `BELOW_Q2_STOP` if it needs changed reader/bytecodes/profile/graph, hides unbounded identity/history in a purported quotient, makes only a generic heap-ordering or local-score contribution, treats unmodeled zlib size as exact, or finds the full current union reproduces every candidate action/guarantee.  Absence of implementation or positive results is not a STOP reason.

## Sources and independence

- Frozen PRIMARY package hash check: `4/4 PASS`; V8 source pin `c635f0d160b6e988b5ea5a907511a2929beb5d5e`.
- Independent collision check: [CAHPs, OOPSLA 2025](https://www.dag.inf.usi.ch/wp-content/uploads/oopsla25a-preprint.pdf) reports profile-guided Native Image heap-snapshot ordering; [CGO 2025 Native Image](https://www.dag.inf.usi.ch/wp-content/uploads/cgo25.pdf) similarly uses profile-guided code/heap ordering.  These establish the broad-method boundary, not a V8 same-object fatal collision.
- No revision, candidate implementation, experiment, benchmark, Stage A or Stage B work was performed.  No E-drive path was read or written.
