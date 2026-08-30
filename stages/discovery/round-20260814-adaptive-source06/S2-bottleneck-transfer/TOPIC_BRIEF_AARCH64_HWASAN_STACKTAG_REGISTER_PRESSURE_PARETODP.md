# Conditional topic brief — AArch64 HWASan stack-tag/register-pressure Pareto construction

**Disposition:** `PROPOSE_STAGE0`; `TIER_B_Q2_VIABLE`; `FINITE_FIDELITY_GAP`. This is structural potential only, not an implementation or result claim.

## Frozen claim package

- **Exact object / function:** one fixed AArch64 Linux C/C++ function, source/LLVM IR, ABI, output and defined memory behavior, compiled with HWASan. The observable protection contract is the stock HWASan report/no-report behavior for a fixed predeclared tagged-stack witness class; stock runtime/reader remains unchanged.
- **N2 action:** a bounded trace DP jointly chooses legal alloca placement/grouping, a base-tag and re-tag derivation class, and temporary-register/spill realization at prologue, access and epilogue. State records live tagged pointers, tag class, stack granules and target register pressure. It returns the nondominated `(instrumentation bytes, tag operations, spills, stack bytes)` frontier subject to the frozen tag/report contract.
- **Mechanism/information:** current HWASan uses a single base tag then `ReTag(BaseTag,M)` because independent tags increase live pointer/register pressure. Given the full local alloca/access liveness and fixed target ISA, a bounded state can jointly charge both tag-layout and pressure rather than selecting layout then accepting downstream spills.
- **Strong comparator:** current Clang HWASan instrumentation/lowering, AArch64 register allocation/frame lowering, documented default and non-default HWASan ABI/mode settings, compiler-rt runtime, plus any directly matching target-specific literature found in Stage0.
- **Guarantee shape:** for an acyclic function trace with at most `w` simultaneously live tagged alloca pointers and finite tag/layout forms `F`, return every legal nondominated realization in FPT time parameterized by `w` and bounded frontier size. No claim covers cyclic/interprocedural cases, changed allocator/runtime, or changed detection semantics.
- **Natural/formal route:** official compiler-rt HWASan tests and Clang sanitizer tests, augmented only in StageA by 20–50 public C/C++ stack-heavy functions. Oracles: compiler acceptance, fixed semantic tests, stock HWASan report class, object/unwind inspection.
- **Full cost:** planner/compile CPU and RSS; text/object bytes; stack frame bytes; tag instructions; spills/reloads; runtime shadow/tag accesses and execution time once the fidelity gate passes.
- **72-hour StageA killer:** pin one Clang/LLVM revision; enumerate the stock pass/flag union on a small witness with two proposed legal layouts; STOP preclaim if (a) report/no-report or ABI/unwind changes, (b) current union realizes each frontier point, or (c) the finite tag contract cannot be made identical. No experiment is run here.

## Finite fidelity closure plan

1. Pin current Clang, LLVM HWASan pass and compiler-rt commits; enumerate default/non-default HWASan ABI/mode, target features and sanitizer exclusions.
2. Specify two stock-runtime-compatible tagged-stack layouts for one minimal alloca/liveness witness, including identical report expectation and unwind/ABI check.
3. Mechanically derive the bounded action grammar and prove the DP only over that grammar; direct collision search covers LLVM/Clang sources and primary HWASan/tag-layout literature.
4. Reject at Stage0 if current pass composition already expresses the full certified frontier or if tag equivalence requires weaker detection.

**Claim ceiling:** `E1_STATIC_PREFLIGHT`; `SEARCH_BOUNDED_OPEN` for collision. Structural potential is separate from current evidence readiness.
