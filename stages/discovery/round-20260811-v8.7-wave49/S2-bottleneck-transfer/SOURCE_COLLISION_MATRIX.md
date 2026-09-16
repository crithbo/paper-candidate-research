# Candidate-grade source, collision, and fidelity matrix — WAVE49 S2

## Current-upstream reality records (observed 2026-08-11)

| Family | Official current documentation and source | Current action/guarantee facts and contrary evidence | Strongest same-object union |
|---|---|---|---|
| Linux eBPF verifier state pruning | [Kernel verifier documentation](https://docs.kernel.org/bpf/verifier.html); [Linux current selftest](https://github.com/torvalds/linux/blob/master/tools/testing/selftests/bpf/test_verifier.c). | The documentation specifies register/stack liveness-aware state pruning: a current branch is pruned when a previous state contains it, with `regsafe()` and `states_equal()` as the safety relation.  Current selftests explicitly cover `is_state_visited()` pruning behavior. | All state-cache entries, liveness cleanup, subset/equality checks, `is_state_visited()`, verifier limits, and all program-type/helper semantics.  This is a complete current safety-preserving pruning action, not merely an API hook. |
| Lucene immutable-segment merging | [Apache Lucene upstream](https://github.com/apache/lucene); [Lucene releases](https://github.com/apache/lucene/releases). | Current release material documents `TieredMergePolicy` and its legal merge-set controls, including `floorSegmentSize`, `segmentsPerTier`, and `maxMergeAtOnce`; contrary evidence is that the current union already makes multi-segment selection part of the policy. | Current TieredMergePolicy plus all legal merge-policy configuration, immutable segment rewrite, deletion handling, index writer merge controls, and unchanged reader/query semantics. |
| Rust incremental queries | [rustc-dev-guide current overview](https://github.com/rust-lang/rustc-dev-guide/blob/main/src/overview.md); [Rust upstream](https://github.com/rust-lang/rust). | Current rustc is query-organized; cached on-disk query results support incremental compilation and per-item recomputation.  This is contrary evidence to a claimed missing retention/invalidation primitive. | Query dependency graph, on-disk work products, invalidation/recomputation, compiler flags/configuration, and the normal output/link contract. |

## Six-dimensional candidate-grade audit

| Family | Exact object/function/guarantee and atomic action tested | Same information, complexity/resource, quality/guarantee | Natural/formal carrier and full-cost denominator | Finite fidelity closure and 72-hour killer | Decision |
|---|---|---|---|---|---|
| eBPF verifier | Fixed BPF program and kernel verifier decision (`accept`/`reject`) with the same safety semantics.  Proposed action: build the full dominance antichain of visited abstract states per instruction before pruning. | Candidate sees the same abstract state/liveness/CFG information.  It must preserve the existing subset safety proof and charge construction memory/time.  But the native union already compares cached states under a containment relation and liveness cleanup. | Official verifier documentation and Linux selftests are a formal-natural carrier.  Charge verifier CPU, peak state memory, log/output behavior, accepted/rejected decision and all setup. | Small witness: two cached states at one instruction, one containing the other after liveness cleanup.  Killer: native `states_equal()`/pruning replay expresses the antichain decision, or any decision differs. | `DROP__DIRECT_ABSORPTION`. |
| Lucene merging | Fixed Lucene index and identical reader/query results.  Proposed action: choose one batch of segments jointly, then jointly construct replacement layout under write-amplification/space budget. | Candidate has segment sizes, deletions, and policy-visible metadata only.  It must preserve index semantics and charge selection/merge CPU and temporary space.  The current union already exposes multi-segment TieredMergePolicy selection and all legal policy settings. | Official Lucene source/release lineage and public Lucene test/index corpora are finite routes.  Charge merge selection CPU, rewrite I/O, temporary disk, final index size, ingest disruption and query behavior. | Small witness: three legal segments under fixed floor/tier/max limits.  Killer: a TieredMergePolicy configuration selects the same merge set/layout or candidate merely changes a policy score. | `DROP__CONTROLLER_OR_DIRECT_UNION`. |
| Rust incremental queries | Fixed Rust crate graph, compiler flags, and emitted binary/diagnostics.  Proposed action: jointly construct an invalidation frontier and choose work-product materialization/reuse. | Candidate sees only query dependencies/fingerprints also available to rustc; it must retain compiler output semantics.  Existing query cache/invalidation/work products already express reuse; a new admission score is a controller. | Rust upstream compiler tests/crate suites offer a finite CPU route.  Charge dependency computation, fingerprint/cache I/O, memory, compile wall time, link/output equality and cold/warm states. | Small witness: two queries with one changed dependency.  Killer: native query dependency invalidation reproduces the reuse/recompute frontier, or output/diagnostics differ. | `DROP__DIRECT_UNION_OR_CONTROLLER`. |

## Latest primary-paper/artifact discipline

For every candidate-grade row, the current official upstream documentation and
source/artifact are the grounding record; they establish present semantics, not
an absence inference.  No recent paper is offered as a stand-in for a missing
current-source check.  The associated current project test suites (Linux BPF
selftests, Lucene upstream tests, and Rust compiler test suites) provide finite
fidelity routes, but none is authorized because the action gaps above are
already closed.

## Admission conclusion

The candidates have CPU/public-carrier feasibility in principle but fail the
academic mechanism gate, not the readiness gate.  A future proposal requires a
new atomic action that is not replayable by the recorded union while preserving
the exact function/guarantee and full-cost denominator.
