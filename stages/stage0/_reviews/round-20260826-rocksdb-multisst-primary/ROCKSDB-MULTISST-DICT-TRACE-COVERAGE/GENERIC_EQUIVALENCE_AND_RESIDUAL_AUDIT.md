# Generic equivalence and residual audit

## First fatal gate

Question: does the proposed RocksDB solver reduce, without a material scientific residual, to multiple-preset-dictionary compression segmentation, facility location, or k-medoids?

### Mechanical mapping

Let each SST be a client `i`, each trained dictionary be a facility `j`, and let:

- `c_ij` include held-out compressed bytes, the dictionary meta block duplicated into SST `i`, reader/cache cost, and per-assignment costs;
- `f_j` include dictionary training, coreset construction, memory, and temporary-I/O cost;
- `K`, dictionary bytes, sample bytes, and buffer limits be facility/cardinality/capacity constraints;
- no-dictionary be a dummy facility;
- the portfolio and per-SST assignment minimize `sum_j f_j y_j + sum_i,j c_ij x_ij` under the frozen constraints.

This is a standard facility-location/compression-segmentation form. A global retained-sample budget is a capacity/knapsack constraint; repeated per-SST dictionary bytes are assignment costs; compaction/buffer limits are feasibility constraints; baseline initialization and monotone alternating improvement are ordinary local-search safeguards. The proposed “choose the worst-covered group, train a facility, reassign, and retain an improving solution” skeleton does not identify a new approximation, exploitable RocksDB-specific combinatorial structure, data structure, or complexity result.

The retained-fragment → final-dictionary → dictionary-offset match trace is valuable validation, but it is instrumentation/evidence. It does not change the optimization problem or solver class.

## Strict DIRECT_FATAL audit

Primary generic prior: Michael Mitzenmacher, [“On the Hardness of Finding Optimal Multiple Preset Dictionaries,” DCC 2001](https://www.eecs.harvard.edu/~michaelm/postscripts/dcc2001a.pdf). The paper defines compression segmentation as choosing `k` preset dictionaries and assigning each document to the best dictionary, accounts for dictionary storage/testing trade-offs, proves natural Huffman/LZ77 versions NP-hard, and points to heuristics/approximations.

Methodological prior: Pibiri, Petri, and Moffat, [“Fast Dictionary-Based Compression for Inverted Indexes,” WSDM 2019](https://jermp.github.io/assets/pdf/papers/WSDM2019.pdf). It uses suites of dictionaries, per-block selection, selector signaling, dictionary memory/cache costs, and exhaustive selector search on a different object and codec.

| Direct-coverage predicate | DCC/WSDM/current union | Verdict |
|---|---|---|
| Same exact RocksDB object/function/protocol | Generic documents or inverted-index blocks; current RocksDB is file-local | `FAIL` |
| Same multi-SST natural scenario | No exact 20-manifest native collection | `FAIL` |
| Same or weaker information | Offline compression matrices overlap, but builder-visible/result-independent information is not closed | `PARTIAL` |
| Atomic action covered | Portfolio and assignment core covered; coreset construction and exact trace only partial | `PARTIAL` |
| Same/stronger legality, quality, guarantee | No RocksDB reader/checksum/format guarantee in generic papers | `FAIL` |
| Same non-worse full-cost boundary | Some dictionary storage/testing/cache costs; not complete compaction/build/reader/reproduction ledger | `PARTIAL/FAIL` |
| Comparable scale/platform/version/config | Different objects/platforms; current RocksDB implementation lacks the action | `FAIL` |
| Sufficient read depth | DCC and WSDM relevant full sections plus current source/docs | `PASS` |

Therefore `DIRECT_FATAL` is **not** established. Name overlap or theoretical expressivity is not used as an automatic fatal collision.

## Residual novelty audit

After subtracting the generic kernel, the remaining items are:

1. RocksDB-specific cost coefficients and legality constraints;
2. assignment-local integration with compaction/build order;
3. exact mechanism tracing;
4. an evaluation on a fixed 20-manifest collection.

These can make a rigorous implementation/evaluation, but the frozen contribution type is `METHOD_ALGORITHM / N2`. No target-specific algorithmic delta beyond parameterizing a generic facility-location/segmentation problem is named. The trace is an evidence method and the cost model is bookkeeping unless it yields a new solver structure or guarantee.

## Gate disposition

- Strict direct collision: `NO_DIRECT_FATAL`
- Generic-collapse test: `FAIL__NO_NONTRIVIAL_N2_RESIDUAL`
- Contribution-type contract: `METHOD_ALGORITHM_NOT_MET_AFTER_SUBTRACTION`
- Scientific consequence: `BELOW_Q2_STOP`, based on absent nontrivial contribution—not on missing implementation or results.

A rescue would require a genuinely new same-object algorithmic structure/guarantee, or a new measurement/characterization RQ with natural evidence. Either changes the atomic contribution contract and must return under a new ID; it is not a bounded Stage0 repair.

