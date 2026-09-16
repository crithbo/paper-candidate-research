# WEBGRAPH-REFERENCE-FOREST — Random-Access-Constrained Global Reference Forests for Natural Web Graph Compression

- Status: `PROPOSE_STAGE0`
- Quality tier: `TIER_B_Q2_VIABLE`
- Opportunity origin: `O3`
- Domain tags: graph compression, data structures, algorithms, systems
- Contribution route: `N2` plus testable `N3`
- Discovery date: `2026-08-10`
- Discovery method: accepted `v2/v8.1 + v8.6 + v8.7`

## Research question

For a fixed, naturally ordered immutable graph, can a bounded global backward reference forest jointly assign legal reference parents and residual/interval encodings so that the graph is recovered exactly and retains a fixed random-access contract, while improving charged compression/access cost over WebGraph's fair current parameter/recompression union?

## Paper genealogy and natural carrier

- Anchor: Boldi and Vigna's [WebGraph compression work](https://vigna.di.unimi.it/ftp/papers/WebGraph.pdf) and current [WebGraph upstream project](https://github.com/vigna/webgraph).
- Current deployment baseline: [BVGraph API](https://javadoc.io/static/it.unimi.dsi/webgraph-big/3.6.4/it/unimi/dsi/big/webgraph/BVGraph.html), including referentiation, intervalization, codes, offsets, `windowSize`, `maxRefCount` and random access.
- Competing mechanisms: local/greedy predecessor reference under global bounds; no-reference interval/gap encoding; candidate global forest construction.
- Natural carrier: the project's public datasets gathered from public sources/crawlers. Stage A freezes 20–50 dataset identities/checksums; no synthetic graph is admissible as positive evidence.
- Search boundary: primary project/API sources through `2026-08-10`. Current public facet is API `3.6.4` plus the `master` source tree; local remote-SHA lookup was transport-blocked (`SCHANNEL_SEC_E_NO_CREDENTIALS`), not treated as absence evidence. Stage 0 must independently check all global reference/graph compression papers; no first-of-kind assertion is made.

## Exact object and complete atomic action

- Object/function: a fixed ordered directed graph `G=(V,E)` encoded as an immutable adjacency-list graph; `successors(v)` and graph order are unchanged.
- Quality/guarantee: exact recovery of every successor list, no vertex relabeling, and fixed maximum reference depth/window/random-access contract.
- Complete action: choose a legal backward forest `F` over list positions; for each vertex choose either root encoding or one earlier parent, then choose legal interval/residual coding, construct offsets/directory, and decode under the native access bound. The optimization objective is a frozen additive storage-plus-access surrogate.
- Decision/information: all choices use only `G`, fixed coding options and declared random-access/space budget. No decoder timing measurement is an input.

## Strongest fair baseline union and action gap

- Baseline union: current BVGraph compression/recompression with every documented legal `windowSize`, `maxRefCount`, `minIntervalLength`, code option, offset/load mode and no-reference alternative under the same graph order and access contract.
- Direct subtractors: (1) current BVGraph source already computes an equivalent bounded global forest and objective; (2) a prior encoder uses the same graph/order, joint parent/code construction, random-access guarantee and full-cost ledger; (3) a fair baseline exhaustive optimizer over the same action space.
- Action divergence: local parameter setting regulates what references are allowed; it does not by itself solve coupled parent choices. The three-list witness in the collision matrix separates a greedy local parent choice from a forest decision that reserves depth for a later, cheaper edge.
- No-gain: insufficient near-list similarity; a single root/interval encoding dominates; or an access-depth bound makes every useful reference infeasible.

## Two non-synonymous mechanisms

- Mechanism A — constrained forest optimization: optimize parent/root decisions jointly under backward-window, acyclicity and depth constraints by dynamic programming or a min-cost constrained forest approximation with explicit complexity bound.
- Mechanism B — access-aware representation admission: include a reference only when its metadata, residual/interval code and bounded decode expansion beat root encoding in the frozen full-cost model.
- This is not a controller: it constructs a concrete immutable compressed data structure before queries. It is not a configuration selector: it changes the coupled reference topology and representation directory while preserving the exact graph object.

## Fidelity closure plan

- Status: `FINITE_FIDELITY_GAP`
- Native semantics/comparator: pin WebGraph release/source and its reader/writer; compare exact successor lists and the same `randomAccess()` contract against the full native parameter union.
- Small legality witness: three legal ordered lists exhibiting the `1→0`, `2→0` competing-reference pattern; serialize/decode and compare each list exactly before any corpus run.
- Full-cost denominator: input scan, construction CPU/memory, compressed bits/offsets/reference metadata, encode time, sequential traversal, random successor access and decode expansion. Report build and read costs separately.
- Finite route: inspect every compressor option; implement a bounded `K`/depth forest constructor; test the witness; freeze natural dataset IDs; evaluate 20–50 natural graphs with predeclared access patterns. CPU-only Java route is sufficient.
- Structural failure: native implementation/direct literature offers equivalent forest construction; the reader cannot preserve the fixed access contract; or only synthetic graphs show an effect.

## 72-hour preclaim falsifier

After authorization, first pin source/options and execute the witness. Drop the candidate if (a) native BVGraph already expresses the complete same-information forest action; (b) exact decode/random-access closure fails; (c) all natural structural strata are weakly dominated after offsets, metadata, construction and decode costs; or (d) an apparent gain requires vertex permutation, altered query semantics or omitted access costs. None of these measurements has been performed here.

## Q1/Q2 sufficiency and evidence honesty

- Structural paper potential: `TIER_B_Q2_VIABLE` conditional on a reproducible natural locality/overlap regime, exact-reader compatibility, full-cost wins and a characterized no-gain region. Tier A requires stronger generalization, formal approximation/complexity result and cross-corpus evidence.
- Current evidence readiness: `FINITE_FIDELITY_GAP`; source/corpus route is public, but no implementation/result is claimed.
- AI execution: `AI_CORE_EXECUTABLE` for graph parsing, forest construction, exact verifier and ledger; JVM/performance validation remains supervised.
- Same-object/latest-collision/full-cost/natural-input: all are frozen above. Stage 0 independently reviews paper collision; Stage A must pass the fidelity gate before claim-bearing runs.
