# CANDIDATE_GRADE_DEEP_REVIEWS

## D01 — Rust unsafe obligation boundary

**Object/contract:** fixed safe API, Rust revision and observable behavior; unsafe code may only implement it if its caller-side proof obligations are discharged. The [Reference](https://doc.rust-lang.org/stable/reference/unsafe-keyword.html) defines unsafe blocks/functions as this boundary. **Atomic action:** choose proof/discharge structure from the API invariants, not a weaker API. **Union:** current compiler semantics and unsafe implementation space; wrapping unsafe in a safe-looking adapter does not create a new complete action. **Natural/full cost:** public Rust crates; compile, runtime, memory and safe-API behavior. **72h killer:** one API call violating the proposed invariant: failure to prevent UB fails the same guarantee; a correct existing unsafe implementation is union replay. **Decision:** `DROP__CHANGED_SAFETY_GUARANTEE_OR_WRAPPER`.

## D02 — LLVM deferred-UB to defined-value boundary

**Object/contract:** fixed LLVM IR with semantics for all defined executions. Current [LangRef](https://llvm.org/docs/LangRef.html) and [UB manual](https://llvm.org/docs/UndefinedBehavior.html) define immediate UB, poison, undef and `freeze`. **Atomic action:** transform values while preserving the lattice and all defined behavior. **Union:** legal optimizations plus `freeze`/verifier; treating poison as a concrete value or weakening behavior changes contract. **Natural/full cost:** LLVM IR tests and compiler output; optimization time, IR/code size, runtime and semantic equivalence. **72h killer:** a minimal poison-to-branch witness: mismatch from `freeze`/native semantics is decisive; matching transformation is absorbed. **Decision:** `DROP__CURRENT_SEMANTIC_UNION_OR_CONTRACT_CHANGE`.

## D03 — Java VarHandle weak/strong ordering

**Object/contract:** fixed concurrent program, variable and required ordering/linearizability outcome. The [official API](https://docs.oracle.com/en/java/javase/16/docs/api/java.base/java/lang/invoke/VarHandle.html) exposes plain, opaque, acquire/release, volatile and atomic modes. **Atomic action:** implement a fixed strong access guarantee using only the same variable/call information. **Union:** native access modes and fences already occupy the ordering action space; selecting weaker mode changes the observable guarantee. **Natural/full cost:** standard concurrent Java workloads, including invocation, fences, contention, allocation and ordering oracle. **72h killer:** a two-thread happens-before witness; a weaker-mode outcome violating the frozen relation kills it, while a correct volatile/acquire-release implementation is native-union replay. **Decision:** `DROP__MODE_SWITCH_OR_CURRENT_UNION`.

Three deep reviews completed. No complete union-external N1/N2/N3 was frozen; no `STAGE0_BRIEF` is produced.
