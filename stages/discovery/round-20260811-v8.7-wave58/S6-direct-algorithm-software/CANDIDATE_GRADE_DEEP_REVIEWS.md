# Candidate-grade deep review — Wave58

## XOR-FUSE-BUILD

- Exact object: a fixed key set to a static approximate-membership filter with fixed query semantics and stated false-positive contract.
- Current direct union: XOR/fuse-filter peeling, fingerprint allocation and legal construction retries; original filter constructions are direct same-object subtractors.
- Candidate action tested: a global core-peeling/assignment constructor intended to reduce bits or construction failures under the same keys and FPR.

| Dimension | Review |
|---|---|
| Decision | Assign keys/fingerprints to filter cells after peeling. |
| Information | Same complete key set and hashes; no query-distribution oracle. |
| Complexity/resource | Charge peel/retry CPU/RAM, bits, build failures and lookup. |
| Quality | Same membership/FPR contract; exhaustive fixed-key query witness is finite. |
| Full cost | Hashing, construction/retries, memory, FPR and lookup. |
| Generalization/no-gain | Natural URL/dictionary keys exist; no gain if proposed action is a retry/seed/config selector. |

The explicit global assignment collapses to the known static-filter construction family. No new representation, approximation guarantee, or union-external complete action is named; a generic matching/ILP would violate the no-generic-oracle rule. `DROP_DIRECT_STATIC_FILTER_CONSTRUCTION_FAMILY__NO_N2`.
