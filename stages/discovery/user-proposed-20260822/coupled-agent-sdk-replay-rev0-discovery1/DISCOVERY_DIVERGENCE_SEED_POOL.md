# Divergence seed pool — COUPLED-AGENT-SDK-REPLAY-REV0

Non-evidence ideation only; none of these seeds asserts novelty or feasibility.

1. Couple continuation randomness at an agent intervention boundary rather than merely reusing a PRNG seed.
2. Treat tool/workspace observations as explicit coupled state transitions, with an auditable split rule when branch state differs.
3. Re-couple token sampling after contexts diverge by retaining one exogenous Gumbel field while preserving each branch's marginal token law.
4. Replace silent loss of paired samples with a conservative independent-continuation fallback from an isolated shared snapshot.
5. Measure variance/sample-complexity at fixed terminal-outcome error under full branch cost, rather than token cost alone.
6. Use an absorbing native terminal state to avoid synthetic post-terminal continuations.

Selected seed: the joint token-and-agent-state coupling route (1–5). Network-security topics and the prior CoupledAgentReplay observations were not used.
