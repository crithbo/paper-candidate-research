# Bounded non-evidence seed portfolio

Seeds are creativity prompts only; none asserts novelty or a residual.

| ID | Engine | Boundary prompt | Disposition before evidence |
|---|---|---|---|
| S01 | representation mismatch | LLVM `callbr` fallthrough value versus indirect-label path | selected |
| S02 | ownership seam | C++ coroutine final-suspend destruction versus continuation visibility | unselected; recent coroutine identities are saturated |
| S03 | guarantee split | language unwind state versus target landing-pad metadata | unselected; no exact natural anchor retained |
| S04 | commit-point inversion | JIT code publication versus stack-map visibility | unselected; no public fixed carrier in budget |
| S05 | primitive mismatch | vector predicate state across ABI call lowering | unselected; related architecture identities require separate evidence |
| S06 | cross-layer contradiction | inline-assembly label constraints versus compiler CFG construction | merged into S01 |

Coverage engines: representation mismatch, ownership seam, guarantee split, commit-point inversion, primitive mismatch, and cross-layer contradiction.
