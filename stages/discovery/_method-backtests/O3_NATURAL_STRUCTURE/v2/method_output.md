# Executor method output — O3 v2

Role: `DISCOVERY-BACKTEST-EXECUTOR`. Only sealed inputs are used; this is not a candidate proposal or calibration verdict.

## S3-POS-01

- **Recovered problem shape.** Natural graphs exhibit degree skew and evolving frontier density; a GPU graph system should expose and exploit these stable-enough structural signals across primitives rather than impose one traversal policy.
- **Baseline limitation.** Vertex-centric generality and fixed sparse/dense traversal choices leave duplicate work, imbalance, and irregular memory access untreated in changing regimes.
- **Decision structure.** Select advance/filter representation, sparse versus dense mode, load-balancing and memory-access strategy from frontier/degree signals. Competing mechanisms: direction/mode-adaptive traversal versus a unified primitive framework that dynamically composes work-efficient operators.
- **Contribution route.** N1: reusable graph-primitive abstraction; N2: adaptive scheduling/data representation; N3: measured frontier and degree regularity.
- **Evidence entry.** Profile signal stability and predict regime transitions; evaluate multiple algorithms and real graphs against fixed GPU BFS/framework baselines, pricing conversion, duplicate handling and no-gain uniform/small-frontier cases.
- **Abstain.** No.

## S3-POS-02

- **Recovered problem shape.** Weight and activation zeros coexist but their irregular patterns do not naturally align; exploit joint sparsity only with a dataflow that makes matching, routing, accumulation, metadata, and balance cheaper than skipped work.
- **Baseline limitation.** Weight-only sparse engines and activation skipping independently save operations but can lose benefit in matching/indexing and imbalance; dense reuse-oriented dataflows do not represent the joint decision.
- **Decision structure.** Encode, match, route, and accumulate nonzeros; choose dataflow/granularity and fallback per layer. Competing mechanisms: coordinated dual-sparsity execution versus independent weight/activation sparsity pipelines.
- **Contribution route.** N1: joint-sparsity execution representation; N2: matching and load-balancing algorithm/dataflow; N3: empirical joint sparsity distribution.
- **Evidence entry.** Cross-model/layer measurements of zero overlap, utilization, energy, metadata and accuracy; falsify where sparsity is unbalanced, low, or metadata dominates.
- **Abstain.** No.

## S3-POS-03

- **Recovered problem shape.** High-recall graph ANN needs navigable, irregular graph access while collections exceed DRAM; restructure the index/search so storage-hierarchy access preserves search quality at bounded latency.
- **Baseline limitation.** In-memory graph search assumes memory-resident random accesses; compression helps capacity but not storage-latency locality, and generic SSD retrieval can destroy graph navigation.
- **Decision structure.** Partition/layout graph and vectors, batch/cache/prefetch expansion, and choose search traversal under recall, latency, RAM, SSD IO, and build-cost constraints. Competing mechanisms: locality-aware graph layout/search versus memory-resident compressed graph search.
- **Contribution route.** N1: storage-aware graph-index abstraction; N2: layout/prefetch/traversal algorithm; N3: measured graph-access locality.
- **Evidence entry.** Recall–latency–memory–IO curves against HNSW/NSG/PQ baselines at growing corpus sizes; price build, SSD reads, cache and tail behavior, with random/no-locality boundaries.
- **Abstain.** No.

## S3-NEG-01

- **Recovered finding.** Uniform independent random keys establish no repeatable structural signal.
- **Baseline limitation / decision structure.** Exact dictionaries already have strong universal-hashing baselines; finite-sample coincidence cannot support a structural action.
- **Contribution/evidence route.** None within O3.
- **Abstain.** Yes.
