# Unique opportunity family

## HTSlib BAI/CSI coordinate-index constructor

- Exact object: fixed sorted BAM/VCF records and region-query semantics under stock HTSlib/samtools/tabix reading.
- Native oracle: exact region-record results and ordering under stock reader/query APIs.
- Current strongest actions: binning, linear index, chunk generation/merging/pruning, BAI/CSI choice and parameters, BGZF virtual offsets, sorted-coordinate input and options.
- Conditional N2: an HTSlib-specific complete index constructor with an exact/FPT/Pareto/approximation/formal bound on query I/O/seeks/index bytes/build cost that exceeds the full current and generic interval-index union.
- Witness requirement: two valid BAI/CSI-like indexes for the same sorted object that return exact same region records, neither merely changing `min_shift`, depth or a known chunk policy.
- Natural route: versioned public genomics BAM/VCF corpus and region-query workload; index-build/query CPU-RSS-I/O/latency, bytes and result equality.
- Status: no brief; no non-generic residual and no complete source/collision closure.
