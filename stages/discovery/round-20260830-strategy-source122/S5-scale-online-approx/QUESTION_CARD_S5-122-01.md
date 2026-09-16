# Question Card S5-122-01

## Identity

- Assignment: `DISCOVERY-S5-20260830-SOURCE122`
- Seed/RQ: `S5-122-01 / RQ_CANDIDATE_S5-122-01`
- Exact public identity: PyTorch `torch/_dynamo/cache_size.py`, `torch/_inductor/codecache.py`, and `torch/compiler/__init__.py` on current `main`, retrieved 2026-08-30; official stable docs redirect to PyTorch 2.13.
- Carrier kind: `IMPLEMENTATION_CARRIER_ONLY`, with TorchBench as the finite natural/canonical workload route.
- Network-security exclusion: `PASS`.

## Global identity preflight

- Prior canonical identity match: `NO_MATCH_WITHIN_FROZEN_RELATED_REGISTRY__NOT_NOVELTY_EVIDENCE`.
- Five-field relation: object `NONE`; action `NONE`; endpoint `NONE`; guarantee `RELATED_ONLY`; full-cost `NONE`.
- Frozen direct collision: `NO_KNOWN_FATAL_WITHIN_24_CALL_BOUND`.

## Research contract

- Exact object: one TorchDynamo frame's guarded cache entries dispatching to Inductor compiled artifacts.
- Same-object problem: current in-memory Dynamo policy limits entries by counts/ID_MATCH groups, while Inductor `GuardedCache` may store multiple guarded variants and returns the first guard-passing candidate; the inspected loci do not expose cost-aware admission, guard-implication compaction, or dominated-entry retirement.
- Contribution type: `COMPILER_TOOL / METHOD_ALGORITHM`.
- Route: `N2`.
- Claim endpoint: target-native action.
- Counterfactual consequence: replace fixed recompile/fallback behavior with an exact-semantics policy over static, symbolic-generalized, retained, retired, and eager actions.
- Source-grounded non-generic discriminator: entries contain explicit `guards_expr`; multiple compiled versions correspond to different guard sets; lookup evaluates guards and miss creates another entry. Coverage/implication therefore provides compiler-specific structure unavailable to ordinary key-only caching.
- Full-cost boundary: compile wall time, artifact execution time, guard traversal/evaluation, Dynamo and Inductor cache bytes, CUDA Graph recording/pool bytes when enabled, and eager fallback time.

## RAW_REQUIRED evidence

- Problem anchor: `cache_size.py` lines describing linked-list guard lookup, new entry on miss, and count limits.
- Current native locus: `GuardedCache.find_guarded_entry`, `FxGraphCache`, `_write_to_local_cache`, `_save_graph` in `codecache.py`.
- Current policy locus: `torch.compiler.set_stance` modes in `torch/compiler/__init__.py`.
- Known direct fatal: `NONE_FOUND_WITHIN_BOUND`.
- Strongest objection: DISC/Vortex avoid or reduce specialization through dynamic code generation; a generic online cache policy would not be a contribution.
- Preliminary residual: exact guard-region admission/compaction for the current PyTorch guarded artifact cache, retaining fast static variants only when their measured benefit exceeds compile/dispatch/byte cost.

## Cheapest decisive test

- Minimum falsifier: current source at a pinned commit already performs implication-based coverage/retirement; or a safe implication check cannot preserve all PyTorch guard semantics; or default/stance/dynamic baselines match the policy across a frozen shape stream after full cost.
- Small witness: one exact frame with two varying dimensions, overlapping guard regions, one symbolic artifact, and two static artifacts; validate guard implication, dispatch equivalence, and retirement safety.
- Finite closure: pin commit; enumerate current cache/stance/dynamic flags; expose read-only guard expressions and artifact metrics; replay a result-independent 4–8-signature packet; compare with exhaustive offline oracle.

## Bounded debt

- Complete current union: `OPEN_BOUNDED`, owner `STAGE0`, questions: exact default/nondefault dynamic policy, all cache-removal paths, and guard ordering.
- Strongest paper subtractor: `OPEN_BOUNDED`, owner `STAGE0`, extend beyond DISC/Vortex to DietCode/Nimble and recent PyTorch compiler work.
- Native witness/API: `OPEN_BOUNDED`, owner `STAGEA_PRECLAIM`, prove implication without unsafe guard skipping.
- Natural packet: `OPEN_BOUNDED`, owner `STAGE0/STAGEA_PRECLAIM`, pin TorchBench models plus public variable batch/sequence/image signature streams.
- Q1/Q2 calibration: `OPEN_BOUNDED`, owner `STAGE0`.
- Claim ceiling while open: compiler-tool opportunity only; no current-absence, performance, or competitive guarantee claim.

## Disposition

- RQ audit: `RQ_COMPLETE`.
- RAW_REQUIRED: `COMPLETE`.
- Closure debt: `OPEN_BOUNDED`.
- Identity: `SEARCH_BOUNDED_OPEN`.
- Disposition: `EVIDENCE_QUALIFIED_RAW`.
- Eligible for C0: `YES`.

