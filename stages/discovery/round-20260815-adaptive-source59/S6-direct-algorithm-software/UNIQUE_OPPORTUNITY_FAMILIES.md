# Unique opportunity families

## UOF-S59-01 — GCC CFG-join reservation-state union constructor

- Canonical signature: `GCC_GENAUTOMATA_CFG_JOIN_RESERVATION_STATE_UNION_CONSTRUCTOR__FIXED_TARGET_MD_AND_CFG_RESERVATION_SEMANTICS__STOCK_DFA_HAZARD_RECOGNIZER_ORACLE__PRECISION_BUILD_MEMORY_COST`
- Identity preflight: `NO_EXACT_HISTORICAL_HIT_FOUND_WITHIN_BOUNDED_REGISTRY_READ`; adjacent GCC scheduler, automata and instruction-selection identities are `RELATED_ONLY`, not exclusion evidence.
- Anchor: GCC `genautomata.cc` source comments and the GCC Summit automaton-scheduler paper.
- Exact object: fixed target machine-description reservation model and fixed CFG join; instruction issue/hazard semantics stay those of the stock recognizer.
- Candidate whole action: construct a canonical bounded set state at each join; generate each transition by pointwise stock reservation transitions; use a target-reservation interface bound to produce an exact/FPT frontier or a conservative certified precision–size frontier.
- Same-object witness: two predecessor blocks can lawfully reach distinct reservation states before the same join and successor instruction.  The stock generated recognizer carries one state per path; the proposed constructor explicitly retains the lawful set `{s_left,s_right}` and computes a common safe successor relation.  It does not alter either path's instructions or the target `.md` semantics.
- Strongest current union: deterministic and nondeterministic automata, minimisation/no-minimisation, `ndfa`/`collapse-ndfa`, comb-vector/no-comb-vector representation selection, and ordinary generated DFA hazard recognition.
- Proposed guarantee shape: exact conservative recognition for join-set cardinality at most `k` and reservation horizon `h`, parameterized/FPT in the target-specific `k,h`; alternatively a certified safe coarsening frontier whose loss of precision is explicit.  This is a proposal shape, not a proven result.
- Carrier/oracle: deterministic Stage0 selection of a public GCC release target `.md` and a two-predecessor scheduler regression; stock GCC hazard recognizer/scheduler validity and generated automaton consistency are the oracle.
- Full cost: generator CPU/RSS/temp; automaton and generated-code bytes; compile/scheduling time; hazard-recognizer precision; no-gain and code-size regions.
- Current disposition: `PROPOSE_STAGE0__FINITE_FIDELITY_GAP`.
- Claim ceiling: No assertion of new algorithm, performance gain, direct-current absence at a pinned mainline commit, or Q2 proof is made before Stage0.
