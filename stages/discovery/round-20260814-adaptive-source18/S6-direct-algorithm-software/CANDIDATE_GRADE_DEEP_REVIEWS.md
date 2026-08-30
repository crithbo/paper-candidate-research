# Candidate-grade deep reviews — Source18

No card reached the mandatory pre-outcome D1 threshold.

| Requirement | GPUDirect Storage | Transformer Engine FP8 scaling |
|---|---|---|
| Fixed same-object semantics | File bytes and GPU-address I/O can be fixed. | Tensor/value and stated numerical-tolerance contract can be fixed. |
| Two complete native plans | Possible placements require topology/driver control rather than a native target-specific whole algorithm. | Recipe variants exist, but changing scale granularity/format changes the numerical representation/guarantee. |
| Current union / strong subtractor | GDS API, drivers and topology controls cover the legal path. | Current, delayed, block and microscaling recipe union covers the named actions. |
| Non-generic target-specific residual | Only generic data placement/buffer management remains. | Only recipe selection, numerical-contract change or generic quantization remains. |
| D1 result | Fail: no target-specific complete residual. | Fail: no same-contract target-specific residual. |

The contract forbids promoting a failed D1 merely to fill the two-depth capacity.
