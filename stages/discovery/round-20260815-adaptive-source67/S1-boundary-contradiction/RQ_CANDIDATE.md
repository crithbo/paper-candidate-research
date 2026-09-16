# S67-RQ01

- Seed `S67-SEED01`; hypothesis `COMPILER_TOOL / N2`.
- Primary RQ: **For fixed RISC-V Zicboz target features and fixed zero-initialization semantics, can a target-specific whole-function constructor choose CBO.ZERO and residual stores with a non-generic guarantee beyond the current compiler lowering union?**
- No alternative: changing fault/ordering/atomicity or using a different target changes the object/guarantee.
- FINER-lite: feasible CLEAR; interesting CONDITIONAL; novelty threat HIGH; scope PASS; relevance CONDITIONAL.
- Null: legal full-block CBO.ZERO use is a current memset expansion; residual decomposition is conventional block/store lowering.
- Ordinary closure result: `EARLY_FATAL__CURRENT_LOWERING_OR_CHANGED_STORE_SEMANTICS`.
