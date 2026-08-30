# ROCKSDB-DICT-COVER — Independent Methodology Review Card

- Assignment: `STAGEA-GATE-20260825-ROCKSDB-R7-INVALID-CONSTRUCTION-REVISION-ELIGIBILITY`
- Reviewer role: methodology / construction validity, denominator integrity, reproducibility
- Recommendation: `RETURN_NO_SCIENTIFIC_INFERENCE_WITH_NO_VALID_REVISION_ROUTE`
- Confidence: high for the frozen packet and source-audited revision gate
- Evidence ceiling: `INVALID_CLAIM_CONSTRUCTION__NO_SCIENTIFIC_INFERENCE`

## Mechanical evidence audit

- `RUN_MATRIX.yaml` contains 560 unique identities: 342 `PASS`, 2 `FAIL`, 216 `PLANNED`; retry and result-based exclusion are false.
- All 344 executed result files exist and independently match the result hashes frozen in the matrix; there are exactly 344 claim-run directories and 344 result files.
- No directory exists for any of the 216 planned identities.
- `FULL_COST_LEDGER.csv` has 344 rows and its run-id set exactly equals the executed matrix set: 342 true and 2 false.
- Both failures are `pypi-django / B1 / G2 / R1,R2`, with exact error `SST has fewer than 16 data blocks` and hashes `C3E5628E...` / `EBC1E67E...`.
- The 5,545-entry owner manifest is syntactically complete with no duplicate paths; MAINLINE accepted it at the no-inference ceiling.

## Construction classification

The failure is an invalid claim construction, not a scientific negative. The frozen contract requires at least 16 data blocks for every SST in the full denominator. The harness enforces this at `rocksdict_claim_harness.cc:615` after confirming the single bottommost L1 SST. `B1/G2` on the frozen Django manifest does not satisfy the gate in either replay. Because the failed process never emits the full valid result schema and the remaining denominator is not executed, no aggregate frontier or mechanism predicate can be evaluated.

The 342 passes are a deterministic execution prefix, not a complete population or a preregistered subsample. Their performance values are therefore excluded from scientific interpretation. The two failures establish repeatability of the construction defect only; they do not falsify candidate `C1`, since the failing method is baseline `B1` and the required same-object table never passed the construction gate.

## One-atomic-revision audit

An eligible revision must preserve the exact object/function, all 20 manifests, seven methods, two cells, two replays, the native-current precision pin, comparator, table format, block size, compression semantics, full-cost denominator, and the 16-block invariant. The frozen experiment contract fixes `block_size: 4096`, the exact sorted KVMAN1 manifests, the Zstd/method configuration, and one bottommost standard BlockBasedTable SST.

Every direct construction workaround violates a frozen dimension:

- reducing block size changes the exact production configuration and makes the observed 16-block test easier by changing its unit;
- padding, duplicating, splitting, or key-transforming records changes the natural manifest/function;
- disabling or changing dictionary/compression semantics changes baseline `B1/G2`;
- excluding Django, G2, or the failure pair changes the denominator;
- lowering or waiving the gate is expressly forbidden.

There is also a second independent closure gap. The frozen contract requires the raw/useful residual ratio plus final-dictionary and compressed-block-match evidence. The candidate source computes fragment digests internally but emits only aggregate selector counters. The frozen aggregator (`aggregate_claim_results.py`, SHA-256 `DFC06184...`) explicitly marks retained-fragment digests, baseline-set membership, dictionary bytes, and compressed-match trace as unobservable. Closing that endpoint would require a separate candidate/instrumentation change after results. It cannot be folded into the authorized single globally applied construction change without becoming a compound revision and violating the frozen source/action boundary.

## Methodology disposition

- Complete valid Stage A PASS evidence: absent.
- Valid same-object scientific negative: absent.
- One globally applied atomic revision that closes all claim-critical gates: absent.
- Scientific revision consumption by r7: false.
- Recommendation: `NOT_ELIGIBLE_FOR_REVISE_ONCE__NO_SINGLE_ATOMIC_SAME_OBJECT_ROUTE` and return the packet with no scientific inference.

## Reproducibility and lifecycle note

The executed prefix is internally reproducible: 172/172 executed replay pairs match on declared nonvolatile fields, and all raw is retained. This supports the construction classification, not the scientific hypothesis. Lifecycle acceptance may cover only the exact 15 reacquirable/ephemeral leaves after downstream handoff; raw results, source, frozen binary/libraries, runtime, summaries, and failure pair remain mandatory retained inputs.
