# Candidate-grade deep reviews

## CD-81-01 — joint Brotli phase-meta-block constructor

- Exact object/function: encode a fixed input byte stream into a legal Brotli stream that decodes to exactly those bytes.
- Natural route: a frozen public web-asset corpus can supply text/JS/CSS inputs; the hypothesized phase structure is a measurement precondition, not positive evidence.
- Proposed N2 action: construct boundaries, block partitions and context-map/code choices jointly across local entropy phases.
- Direct subtractor / strongest union: the current official encoder's block splitting and metablock/context construction; same input and all encoder/decode costs.
- Action-divergence witness: none survived. The named output decisions are native encoder construction decisions, not an action outside its union.
- Finite StageA killer if it had survived: on 20–50 frozen web assets, reject if a complete legal constructor cannot beat the current encoder under identical decoder, compressed-size and encode-time denominator. This is not authorized or run.
- Fidelity closure: legal decoder round-trip; byte equality; encode time, compressed bytes, decode time and memory. The route is finite but its action gap is not.
- Structural-paper potential: `BELOW_Q2_STOP` for this exact residual due direct action absorption. Current-evidence readiness is not used as the reason.

## CD-81-02 — phase-aware CDS archive constructor

- Exact object/function: run the same Java application/classpath with equivalent class-loading semantics, using an archive generated from its natural class-load history.
- Natural route: a public Java application with a recorded `DumpLoadedClassList` / class-load log; the JDK specification gives a deterministic archive-generation and `-Xlog:class+load` verification route.
- Proposed N2 action: jointly choose startup-phase archive membership and construction mode rather than a flat hot list.
- Direct subtractor / strongest union: current JDK 25 default CDS, static class-list dump, `-XX:ArchiveClassesAtExit`, `-XX:SharedArchiveFile`, `jcmd VM.cds`, and `Xshare` modes, all charged with trial-run/archive-build/runtime costs.
- Action-divergence witness: none. The full class-set/archive path is exposed by current semantics and documentation; proposed ordering has no separately frozen executable guarantee.
- Finite StageA killer if it had survived: one app/classpath, compare verified class-source logs and full build/startup/footprint cost; reject on absent action divergence or no gain. Not run.
- Fidelity closure: same classpath, verifier/class-load log, archive-build cost, startup latency and footprint. Finite, but no action-gap certificate.
- Structural-paper potential: `BELOW_Q2_STOP` for this exact residual by direct union absorption.

## CD-81-03 — V8 IC feedback-epoch constructor

- Exact object/function: preserve JavaScript program observable semantics while constructing IC-feedback epochs, specializations and invalidation/deoptimization decisions.
- Candidate N2/N3: use repeatable shape-state phase changes in a frozen natural JavaScript workload to form a nonlocal epoch constructor rather than per-site local transitions.
- Current upstream reality: the official V8 current source tree confirms IC, handler-configuration and stub-cache subsystems. No absence claim is made; docs/source/flags/configs needed to establish the *complete* current action union have not been frozen.
- Natural-positive route and fidelity plan: would require a public, real Chromium/Node workload corpus, frozen revision, feedback-state extractor, semantics oracle and bounded replay. The only immediately obvious V8 fuzzers are not acceptable natural carriers.
- Minimal action-divergence witness / 72-hour killer: before any performance claim, either name an epoch action not replayable by the frozen current union and validate a semantics-preserving tiny workload, or reject. This is a finite proposed closure only after the carrier/union are frozen.
- Status: `NOT_ADMITTED_UNFROZEN`, not `DROP`; lack of implementation/results/resources/AI readiness is not the reason. No Stage0 brief is emitted.
