# Source76 Question Card outcomes

## QC-S76-01 — Clang PCH

- Same-object/full-cost: fixed header graph/translation units, diagnostics and object output; precompile CPU/RSS/temp/bytes plus repeated reader/compile cost.
- Current union reality: official current material documents `-emit-pch`, `-include-pch`, serialized AST, chained PCH/preamble mechanisms, relocatable PCH, and an explicit ignore control. This is contrary evidence to an assumed missing materialization primitive.
- Minimum falsifier: identify one target-specific whole-AST constructor/guarantee not replayable by the native serialized-AST/PCH-chain composition while retaining the stock reader. No such action was specified; the remaining statement is generic serialization/packing.
- `RAW_REQUIRED=INCOMPLETE`; `EXCLUDED_BEFORE_RAW__GENERIC_SERIALIZATION_OR_NATIVE_COMPOSITION`.

## QC-S76-02 — GHC `.hi`

- Same-object/full-cost: fixed module DAG, `.hi`/`.o` output and recompilation correctness; compile/interface read/check CPU/RSS/bytes and downstream work.
- Current union reality: current guide exposes interface-file options, extended interface files, recompilation checking and force/ignore controls. The candidate decision resolves to whether/when to rebuild or validate, which is policy rather than a whole artifact constructor.
- Minimum falsifier: name a static same-DAG interface action with a guarantee distinct from recompilation policy. None was supplied by the anchor route.
- `RAW_REQUIRED=INCOMPLETE`; `EXCLUDED_BEFORE_RAW__RECOMPILATION_POLICY_SHELL`.

## QC-S76-03 — Go unified export data

- Same-object/full-cost: fixed package DAG/API/toolchain and stock importer; compiler/export generation, package cache, import decode, CPU/RSS/temp/bytes and downstream compile time.
- Current union reality: the compiler’s current README says unified export data is a serialized object graph with an index for lazy partial decoding, with native reader/writer; current `cmd/go` also owns a concurrent build-output cache and explicit `GOCACHE` controls. No absence is claimed.
- Minimum falsifier: one producer graph/index action with a target-specific guarantee, distinguishable from generic graph serialization/index packing and from cache policy, while retaining the native importer. The current bounded route does not define it.
- `RAW_REQUIRED=INCOMPLETE`; `LOCATOR_ONLY__SOURCE_CLOSURE_QUEUE_S76_CQ01` (not a DROP and not resource failure).

Counts: `EVIDENCE_QUALIFIED_RAW=0; C0=0; D1=0; DEEP=0; CLEAN_STAGE0_BRIEF=0`.
