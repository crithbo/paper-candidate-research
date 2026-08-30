# Revision Traceability Matrix

Original required gate: `LEAF_LOCAL_NONVACUITY_AND_BTREE_ABSORPTION_GATE`.

| Item | Initial gate requirement | Revision claim | Independent verification | Status |
|---|---|---|---|---|
| R1 | Add plain COW B+tree and B+tree + affine-hint controls under the same information, capacity, atomic publication and local cost ledger. | Two default controls plus a guarantee-preserving affine action frontier are frozen. | Contract and code preserve the leaf object, `capacity=4`, `epsilon=1`, operation/key information and COW publication; the local vector charges payload, metadata, certificate work and auxiliary images. | `FULLY_ADDRESSED` |
| R2 | Determine whether controls generate the same transitions and caps. | Affine frontier contains every PDEC transition/guarantee/cost point. | `ABSORBER` and `PDEC` share the same certificate requirement, affine metadata rule, partitioner, update path and query profile. Equality follows inductively from the common empty state and is also recorded for all frozen cases. | `FULLY_ADDRESSED` |
| R3 | Exhibit at least one reachable/natural PDEC-specific state, transition, guarantee or fully priced metric not inherited by either control. | No such witness exists. | Exhaustive strict residual `0`; natural strict residual `0`; capacity-4 query window reaches all four slots. | `NEGATIVE_RESULT__STOP_TRIGGER` |
| R4 | Preserve failures and do not launch an unreviewed global/directory pivot. | Early-split costs, absent effective deletes and full-leaf-width cases are reported; no global mechanism is added. | Frozen outputs contain the negative regions and remain leaf-local. | `FULLY_ADDRESSED` |
| R5 | Reproduce the atomic result. | Original plus two independent deterministic replays are byte-identical. | Six result-file hashes reduce to two values, one per mode; validator records exact identity and stable verdict. Reviewer did not rerun. | `HASH_AND_STRUCTURE_VERIFIED` |

## Re-review disposition

The revision successfully answers the requested question, but the answer is decisively negative. “Fully addressed” for R1/R2/R4/R5 does not imply PASS: R3 was the preregistered scientific success condition, and its zero residual fires the preregistered STOP condition.

