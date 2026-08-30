# DISCOVERY_QUESTION_CARD — S59-RQ01

## Exact identity

`GCC_GENAUTOMATA_CFG_JOIN_RESERVATION_STATE_UNION_CONSTRUCTOR__FIXED_TARGET_MD_AND_CFG_RESERVATION_SEMANTICS__STOCK_DFA_HAZARD_RECOGNIZER_ORACLE__PRECISION_BUILD_MEMORY_COST`.

The fixed object is a GCC target processor-reservation description and a fixed control-flow region whose incoming paths carry lawful, distinct reservation states.  The semantic endpoint is the stock DFA hazard recognizer's conservative acceptance of instruction issue; it is not a changed instruction scheduler, target description, ABI, or processor model.

## Same-object question

Can a target-specific constructor represent the set of reservation states arriving at a CFG join, and generate conservative transitions for that set, with an exact bounded-interface/FPT or certified precision–generator-size frontier, beyond GCC `genautomata`'s current individual-state deterministic/nondeterministic construction, minimisation and comb-vector representation choices?

## Contribution and counterfactual

Contribution type: `COMPILER_TOOL`; route `N2` (with an optional N1 state-set representation).  The counterfactual is the current generator's omission of union states at a join: source comments identify this exact omission and its scheduling-precision consequence.  The candidate must either give a bounded target-specific set-state recurrence and soundness/precision guarantee, or fail.

## Minimum evidence and falsifier

Current source supports the absence/intent at GCC 15.2 and a current rendered `genautomata.cc` view; GCC documentation establishes stock DFA semantics.  The immediate falsifier is a current supported path that already emits equivalent CFG-join union states, or a proof that every bounded construction reduces to generic DFA minimisation without a target-reservation-specific guarantee.

## Finite closure route and cost boundary

Stage 0 will pin GCC mainline and one public GCC release target `.md` carrier, enumerate `genautomata`'s default/non-default action space, and use a two-predecessor reservation witness.  Cost is generator CPU/RSS/temp, generated recognizer bytes, scheduler/hazard-recognizer precision and compile-time effect; no experiment or build was run in Discovery.
