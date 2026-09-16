# Question cards

## QC-S71-01 — LLVM musttail whole-function construction

| Required raw field | Frozen value / disposition |
|---|---|
| Exact public identity | current LLVM LangRef/Clang musttail and current `TailRecursionElimination.cpp` |
| Carrier kind | `IMPLEMENTATION_CARRIER_ONLY`; LLVM test suite/Clang C/C++ corpus would be relevant only if action survived |
| Same-object problem | legal construction/lowering of a fixed LLVM `musttail` IR call/function graph |
| Tentative endpoint | non-worse frame/stack/codegen cost with mandatory tail-call and ABI/unwind behavior unchanged |
| Counterfactual | compiler chooses a different target-specific legal frame/tail construction |
| Non-generic discriminator | cannot be ordinary TRE, generic alias/side-effect proof, pass ordering, or target/ABI change |
| Current locus | LangRef call rules; Clang musttail contract; TailRecursionElimination source |
| Minimum falsifier | proposed construction either is current generic TRE/analysis or must move non-movable work/change ABI, return, destructor, or unwind semantics |
| Initial full cost | compiler CPU/RSS, stack/frame bytes, code bytes, tail-call count, runtime; no measurement run |
| Finite route | completed spec/current-source closure |

**Disposition: `EXCLUDED_BEFORE_RAW__CURRENT_GENERIC_UNION_OR_CHANGED_GUARANTEE`.** `musttail` is not an optional profitability hint: the LangRef and Clang contract constrain return adjacency, ABI-impacting attributes, prototypes/calling conventions, source lifetimes, and stack guarantee. LLVM's current tail-recursion pass already performs the generic legal transformation and analyses the generic movable/side-effect/alloca conditions. A putative residual either is that current/generic analysis or makes an ineligible site legal by changing the frozen semantic/ABI/unwind contract. No target-specific atomic action skeleton survives.

No closure debt is transferred to Stage 0.
