# Candidate-grade depth review — CBMC equation construction

## Fixed object and oracle

The input is a fixed C/C++ program, CBMC target/configuration, unwind bound and property. The output must retain the same verdict and, for failures, a replayable counterexample under the stock CBMC semantics. The stock oracle is CBMC's verdict plus trace/replay path.

## Current action/configuration union

Official CBMC material closes the core producer: source is transformed into a GOTO program; `goto-symex` traverses, branches/merges and unwinds it into a `symex_target_equationt` consisting of incrementally appended SSA steps; the equation is converted to a decision procedure; the same machinery supports trace construction. The current documented union includes GOTO conversion/instrumentation, unwind and unwind-set controls, unwinding assertions, formula/simple slicing, partial loops, incremental loops/path exploration, complexity limits, dereference caching, property selection and solver/trace paths. The source also records that formula slicing is disabled in threaded cases rather than silently changing its semantics.

## Minimal legal action-divergence witness

Take a single-threaded bounded program whose assertion uses only one of two independent assignments. With the fixed property and same unwind bound, stock full equation construction and stock `--slice-formula` construction are two native legal histories: the latter can mark assignments unrelated to the property ignored while preserving the verdict. This witness is directly within the current union; it is not evidence of a residual primitive.

## Requested N2 test

The proposed contribution would need a property-aware equation constructor parameterized by a dependence width, with an exact/FPT/approximation/certified bound on equation size and construction-plus-solve cost. It would further need to preserve every relevant bounded execution and trace condition.

No target-specific recurrence or invariant was found. “Choose a slice/unwind order based on a dependence graph” is a generic selection/scheduling kernel over existing native controls. It neither changes the fixed bounded semantics nor supplies a new CBMC-specific formal guarantee. Replacing it with graph DP/ILP or a solver script is expressly outside the contribution class.

## Fair subtractors and collision

The fair strongest union contains the documented current formula/simple slicing and incremental/path-explorer modes, not merely monolithic encoding. The primary CProver material also documents partial-order BMC encodings, and CBMC's own documentation treats symbolic equation construction as a mature core. Thus a claim based only on reordering/dependence pruning is directly absorbed by existing same-object construction mechanisms.

## Natural route / full cost / 72h killer

- **Natural carrier:** CBMC regression cases and SV-COMP-style public C programs with fixed property/bound.
- **Oracle:** verdict, witness/counterexample replay and unchanged property semantics.
- **Full cost:** GOTO conversion/instrumentation, symex/equation construction, slicing, solver, trace/replay, CPU/RSS/temp and equation/witness bytes.
- **Killer:** a finite program with an irrelevant bounded branch. A candidate must prove its dependence guarantee differs from `--slice-formula` and replay identically; otherwise it collapses to current slicing. The stated candidate already collapses statically.

## Disposition

`STRUCTURAL_DROP`. The failure is not missing implementation, a result, AI readiness or resources. The only available legal divergence is already expressed by the current slice/unwind/path union; the remaining proposal is generic order/selector/controller work, not a distinct CBMC-specific N2.

