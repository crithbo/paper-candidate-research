# Discovery log — DISCOVERY-M1-20260809-V8.4-WAVE2

## Mandate and boundary

- Lane: periodic M1 measurement / discovery observatory.
- Method: accepted, calibrated production discovery method `v2/v8.1` only. The TLS-blocked two-axis `v8.2r2` method was neither used nor claimed.
- Cutoff: 2026-08-09. Sources were limited to paper originals and official/upstream issue, release, repository, and artifact metadata.
- Boundary: source inspection only. No reproducer, test corpus, reducer, oracle, GPU, benchmark, download, or experiment was executed.

## Search result

This wave asked whether a real upstream fault/regression corpus supports a nontrivial verifier, debugger, reducer, differential oracle, or evidence-quality tool. Two natural directions were examined. Both have real upstream anchors, but neither clears the required residual-mechanism and paper-shape gates. **No `PROPOSE_STAGE0` brief is emitted.**

### D1 — LLVM source-to-IR miscompile reproducer reduction / semantic oracle

- Real anchor: LLVM issue [#170026](https://github.com/llvm/llvm-project/issues/170026), opened 2025-11-30 and labelled `c99`, `codegen`, and `miscompilation`, supplies two separately compiled C translation units and an `-O3 -g` end-to-end failure involving array `static` parameter semantics and an LLVM `dereferenceable` lowering.
- Initial paper shape considered: a reducer that preserves a *source-contract-to-IR* semantic predicate across separately compiled units, rather than merely preserving a crash.
- Current baselines already cover the decisive generic components: [llvm-reduce](https://www.llvm.org/docs/CommandGuide/llvm-reduce.html) preserves user-supplied interestingness predicates while reducing LLVM IR; [Alive2](https://github.com/AliveToolkit/alive2) provides LLVM/Clang translation validation and counterexample-oriented diagnosis for IR-level transformations.
- Residual assessment: one fault is an authentic upstream repro but does not establish a reusable family, a stable reduction pathology, or a new predicate that current reducer plus validation cannot express. Packaging that composition now would be a wrapper/engineering claim, not N1/N2/N3.
- Decision: `DROP_NOT_PROPOSED` (insufficient independent real-fault family and no demonstrated residual). This is not a scientific STOP claim about future source/IR-contract reducers.

### D2 — database differential evidence / regression reproducer reduction

- Real anchor: DuckDB issue [#21514](https://github.com/duckdb/duckdb/issues/21514), titled “ASOF LEFT join with empty right table returns empty result.” The official [DuckDB release record](https://github.com/duckdb/duckdb/releases/) records “Fix #21514: ASOF join empty right” in the v1.5 release series.
- Initial paper shape considered: an AST/plan-aware reducer whose oracle preserves the empty-side ASOF semantic relation and produces audit-quality evidence, rather than an arbitrary SQL shrink.
- Direct current collisions: [SQLancer](https://github.com/sqlancer/sqlancer) already provides multiple DBMS oracles (including NoREC, TLP, DQE, QPG, CERT, DQP, and CODDTest), reproducer logs, and reducer integration. Its successor paper [SQLancer++](https://arxiv.org/abs/2503.21424) adds adaptive generation across 17 DBMSs and reports 195 unique bugs. [SQLxDiff](https://arxiv.org/abs/2501.01236) and [Squirrel](https://arxiv.org/abs/2006.02398) independently occupy differential and validity/coverage-guided DB testing space.
- Residual assessment: the single frozen DuckDB regression establishes neither a new cross-engine semantic equivalence class nor a reduction/evidence failure not already testable by the above baselines. A “better report” or a fixed ASOF checker would be a dashboard/rule wrapper.
- Decision: `DROP_NOT_PROPOSED` (direct collision plus no demonstrated unabsorbed mechanism).

## Conditional finite Stage A killers for a future residual

These are restart conditions only, not proposed Stage A work and not experiments performed in this wave.

| Object | Minimum future frozen evidence | Fair strong comparison | Killer |
|---|---|---|---|
| LLVM source/IR contracts | At least two independent, publicly reproducible upstream miscompiles with pinned revision, command, and source/IR predicate | llvm-reduce with an equivalent interestingness test; Alive2 where its documented IR scope applies | Kill if the combined baseline preserves the same predicate at no worse full cost, or the purported predicate is unstable across reruns/revisions. |
| DB semantic regression evidence | At least two independent public regressions sharing a formal SQL semantic relation, with upstream repro/test artifacts | SQLancer’s applicable oracle/reducer path, plus SQLancer++/SQLxDiff where applicable | Kill if an existing oracle/reducer expresses the relation and yields equally auditable minimal evidence at no worse full cost. |

## Integrity record

- “Real fault” is reserved here for the cited upstream issue/release records. No synthetic fault was introduced or labelled natural.
- No performance, reduction ratio, detection rate, reproducibility rate, or cost number is claimed, because no execution occurred.
- The zero-proposal result is intentional: a named bug plus a generic tool idea is not sufficient for a Q2 paper shape.
