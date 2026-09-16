# Source37 RQ candidates

## LoongArch LSX/LASX vector-memory construction — three same-object versions

1. For a fixed LoongArch function and fixed vector memory semantics, what legal LSX/LASX representation is constructed?
2. Under the same function and target feature set, can a whole target-specific constructor jointly select LSX/LASX-width actions while preserving stock machine-code semantics?
3. Can the same constructor state a non-generic cost/guarantee endpoint rather than an ordinary instruction selector?

Current official source confirms the distinct LSX and LASX features and target backend loci, but the limited evidence did not freeze a complete action and target-specific endpoint. Therefore this remains `LOCATOR_ONLY`, not raw.

## RISC-V Zilsd pair construction — three same-object versions

1. Pre-allocation rescheduling/pair formation.
2. Post-allocation legal-pair repair.
3. Their joint construction.

The identity certificate establishes that all decisive fields are the Source36 exact family; it is excluded before raw.

