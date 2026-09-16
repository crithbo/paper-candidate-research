# S72-01 question card

Exact identity: fixed LLVM IR function, MemorySSA/alias semantics and optimization legality. Carrier: `IMPLEMENTATION_CARRIER_ONLY`; a public LLVM test-suite route is finite but not acquired. Candidate `COMPILER_TOOL/N2` action: jointly form MemoryDef/Use/Phi, alias-assisted clobber walks and cached answers. Endpoint/full cost: valid memory-dependence queries, compiler CPU/RSS, analysis cache, code size and runtime effects.

The current official design and source expose arbitrary-function MemorySSA construction, a walker using alias-analysis stacks, MemoryDef/Use/Phi, optimized/caching walker variants, clobber searches and `-verify-memoryssa`. The candidate has no non-generic action or guarantee beyond SSA/dominance/alias querying. It is `EXCLUDED_BEFORE_RAW__STRUCTURAL_DROP__CURRENT_MEMORYSSA_UNION_PLUS_GENERIC_SSA_ALIAS_KERNEL`; this is not an absence claim about future LLVM memory optimization.
