# Candidate-Grade Deep Review — QC01

## AMX configuration placement and physical binding

- Exact semantic contract: fixed AMX machine function; identical tile operation results, call-clobber behavior, `x86_amx` restrictions, code-object ABI and observable non-AMX behavior.
- Current strongest composition: LLVM `X86PreTileConfig` establishes configuration reachability and reloads across destructive calls; normal register allocation establishes `VirtRegMap`; `X86TileConfig` maps physical tile registers to shape bytes/rows. This is the mandatory fair baseline.
- Candidate N2: a target-specific FPT dynamic program over CFG cut state, up to eight physical AMX tile registers, finite shape descriptors and caller-clobber status. It jointly selects configuration-dominance sites and a compatible physical binding, minimizing `(ldtilecfg reloads, configuration spill/reload/code bytes)`.
- Why not generic RA: the state and legality depend on a unique shared hardware configuration object; `ldtilecfg` reachability/call reloads and an 8-entry shape encoding are not generic register-allocation output.
- Static action-divergence promise: an AMX CFG containing two shape regions separated by a destructive call has at least two *candidate* legal plans—preserve/bind a compatible configuration through a dominance region versus reconfigure and bind a second shape—provided the frozen Stage0 witness confirms both plans with stock semantics. This remains a closure debt, not an established fact.
- Carrier/oracle: public LLVM AMX test/MIR/MC programs; stock assembler/disassembler plus fixed IR/MachineFunction semantics. Stage0 must establish a public AMX workload complement before empirical claim.
- Full cost: compile + preconfig + RA + config passes CPU/RSS/temp, code bytes/instructions, config reloads, tile spills/reloads; runtime only as a later same-machine dimension.
- 72-hour killer: on one in-tree AMX call/shape witness, fail if no two legal plans exist, existing composition returns the same lexicographic optimum, candidate requires ABI/semantics change, or the recurrence collapses to generic RA.
- Direct collision: `SEARCH_BOUNDED_OPEN`; bounded official/current-source query found no direct constructor. Stage0 owner must perform independent primary-paper genealogy.
- Review result: `DEEP_DIVE_REQUIRED__FINITE_FIDELITY_GAP`; structural potential is at least `TIER_B_Q2_VIABLE` if the finite witness and independent collision closure survive; current evidence readiness `FINITE_FIDELITY_GAP`.
