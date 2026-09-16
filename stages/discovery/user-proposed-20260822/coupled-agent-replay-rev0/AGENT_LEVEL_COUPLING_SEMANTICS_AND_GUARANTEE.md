# Agent-level coupling semantics — non-claiming specification sketch

This document records the intended target, not a validated contribution.

For a fully frozen agent state `S` and fixed pair `(do_0, do_1)`, each branch would retain a state ledger covering conversation/context, model sampling state, tool calls and results, workspace files, process state, test state, evaluator-relevant state, and terminal status. At each divergent token or tool boundary, an algorithm would choose one of: `KEEP_SHARED`, `SPLIT`, `RECOUPLE_IF_LEGAL`, `STOP`, or `UNCOMPARABLE`.

The intended nontrivial core is a divergence-aware shared-exogenous-randomness construction (for example, an explicit Gumbel-Max SCM or equivalent maximal coupling) coupled with legal handling of tool and workspace state. Any future claim would need to establish at least one of unbiased/consistent paired estimation, a variance or sample-complexity comparison with independent branches, direct-effect separation from CAR forward replay, or a conservative fallback guarantee.

No semantic claim is admitted here: the required commit-pinned native union, exact two-branch witness, and collision review were not canonically reachable after the pre-evidence identity sequencing failure.
