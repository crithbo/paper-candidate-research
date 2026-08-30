# Candidate-grade deep reviews

## D1 — egg e-graph extraction

- **Object/oracle:** fixed e-graph, rewrite equivalence and extracted expression semantics; native evaluation/equality checking is the oracle.
- **Union and witness:** the official project exposes equality saturation and extraction; two choices of representatives can yield equivalent expressions with different sharing. The official discussion identifies tree-cost extraction and an LP/DAG-cost extractor, with DAG extraction NP-hard.
- **Possible N2 / failure:** a bounded-treewidth e-graph exact/FPT extractor would be target-specific only if it beats both tree and DAG extractors under a named native cost. No such theorem or action union is frozen. A generic extraction DP/ILP is excluded.
- **Natural route/full cost/killer:** Bril/egg examples and public rewrite workloads; equality/evaluation, saturation/extraction/check CPU-RSS-bytes. Killer: a finite e-graph whose sharing optimum separates from tree optimum under the same cost.
- **Decision:** `NOT_ADMITTED_UNFROZEN` — source-level union and direct extraction collision are insufficiently closed.

## D2 — CBMC equation construction

- **Object/oracle:** fixed C/C++ program, unwind bound, property and verdict; CBMC verdict/counterexample replay is the oracle.
- **Union and witness:** CBMC performs bounded unwinding and passes the resulting equation to a decision procedure. Equivalent slicing/unwinding construction histories can yield equivalent bounded verification input.
- **Possible N2 / failure:** a property-aware exact/FPT equation constructor parameterized by a bounded dependence structure. Current candidate is only an order/selector over slicing and unwind actions; full current union and direct collision are unclosed.
- **Natural route/full cost/killer:** CBMC regression and SV-COMP C programs; construction, solve, replay, CPU/RSS, equation bytes/temp. Killer: a small program that proves the claimed structural bound without changing bound/property semantics.
- **Decision:** `NOT_ADMITTED_UNFROZEN`.

## D3 — KLEE state-merge/test construction

- **Object/oracle:** fixed LLVM bitcode, symbolic environment and test semantics; native replay of generated test inputs is the oracle.
- **Union and witness:** KLEE has core symbolic execution, POSIX emulation and native replay infrastructure. Two merge/frontier histories can preserve a test result while changing solver/load cost.
- **Possible N2 / failure:** a bounded-interface exact/FPT state-merge constructor with coverage-preserving cost guarantee. KLEE's official publication catalogue itself records extensive directed/chopped/merging/caching work, so a generic state-merging proposal is strongly absorbed unless target-specific residual is closed.
- **Natural route/full cost/killer:** KLEE regression or public C suites; replay, solver, path, test-byte and CPU/RSS cost. Killer: a finite path pair where coverage and replay semantics either certify a new bound or show direct absorption.
- **Decision:** `NOT_ADMITTED_UNFROZEN`.

## D4 — Ceres Schur/elimination construction

- **Object/oracle:** fixed nonlinear least-squares problem, residual tolerance and solution semantics; residual/checker is the oracle.
- **Union and witness:** legal block-elimination and solver choices can give equivalent residual-quality outputs with different fill/work. Current source/default/non-default solver, ordering and preconditioner union was not closed.
- **Possible N2 / failure:** a graph-parameterized elimination constructor with certified time-memory/residual Pareto frontier. Without a Ceres-specific invariant, it reduces to generic sparse ordering/packing.
- **Natural route/full cost/killer:** public bundle-adjustment datasets; residual, solve, factor, CPU/RSS/temp and memory ledger. Killer: finite camera-landmark graph validating an invariant beyond standard sparse elimination.
- **Decision:** `NOT_ADMITTED_UNFROZEN`.

## Result

`COMPLETE_ZERO_PROPOSALS`. No row simultaneously has a closed current union, direct collision subtraction and a target-specific non-generic exact/FPT/approximation/certified-Pareto guarantee.

