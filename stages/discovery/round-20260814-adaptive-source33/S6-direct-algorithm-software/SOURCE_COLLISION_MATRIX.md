# Source33 collision and subtraction matrix

| Exact family | Current/primary subtractor | Result | Scientific disposition |
|---|---|---|---|
| NVPTX tcgen05 tensor-memory allocation/copy state | Current LLVM NVPTX target semantics; source-only closure | No direct same-object algorithm collision asserted. Union and literature closure remain bounded debts. | `NOT_READY_FOR_CLEAN_BRIEF__NON_PRODUCT_UNPROVEN` |
| NVPTX shared-symbol cross-block folding | Current `NVPTXAddressFolder` plus generic CSE/address-folding family | Current source itself retains shared moves for CSE and describes regressions from rematerialization; residual reduces to generic compiler construction. | `STRUCTURAL_DROP__GENERIC_PRODUCT_OR_CURRENT_UNION_ABSORPTION` |

No paper limitation, issue, or future-work statement was used as absence proof.

