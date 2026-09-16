# Discovery log — S5 Source24

## Result

`COMPLETE_ZERO_PROPOSALS__QUESTION_CARD_PRECOMMIT_RETAINS_TWO_RAW_BUT_BOTH_FAIL_TYPE_SPECIFIC_C0`.

Funnel accounting: locator 8; excluded 4; locator-only 2; fresh raw 2; C0 2; D1/deep/brief 0.  The rows reconcile: excluded and locator-only cards do not count as raw or C0.

## Type-specific C0

### RISC-V ACT (`THEORY_FORMAL`)

The ACT upstream documentation supplies a canonical checker route: it compiles signature-generating tests, executes them on Sail, stores a signature and recompiles self-checking tests.  This closes the fixed oracle and a finite canonical instance family.  However, the alleged “retain fragments after ISA-profile change” action has not been shown to preserve the ACT test-generation semantics or to be distinct from generic test selection/cache reuse.  It therefore fails the non-generic construction skeleton and cannot enter D1.

Disposition: `NOT_ADMITTED_UNFROZEN__GENERIC_TEST_RETENTION_RISK`.

### hls4ml (`SYSTEM_ARCHITECTURE`)

hls4ml documents a broad current union of backend, I/O, model/layer precision, reuse and strategy configuration.  Its documentation also makes the user responsible for input formatting and shows that the model/layer configuration determines precision and parallelism.  No exact versioned public trained model/input/device bundle was frozen in bounded source inspection, and a prospective “Pareto construction” would otherwise be an option-grid/configuration selector.  It therefore fails the required fixed workload/hardware contract and union-external cross-layer action.

Disposition: `NOT_ADMITTED_UNFROZEN__CONFIGURATION_GRID_NOT_TARGET_SPECIFIC_ACTION`.

Neither C0 has all other D1 fields closed, so the one-witness survival trace is not triggered.  No implementation/resource/result inference is made.

## Primary sources

- [RISC-V Architectural Certification Tests](https://github.com/riscv/riscv-arch-test).
- [hls4ml current repository](https://github.com/fastmachinelearning/hls4ml).
- [hls4ml configuration documentation](https://github.com/fastmachinelearning/hls4ml/blob/main/docs/api/configuration.rst).
- [Boolector source, only as BTOR2 locator](https://github.com/Boolector/boolector).
- [CIRCT current repository, only as exclusion check](https://github.com/llvm/circt).
