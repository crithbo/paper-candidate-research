# User Stage B Review Packet — S6-JS-PREFIXBOUND

## Current eligibility

- independent gate: `REVISE_ONCE`
- structural potential: conditional `TIER_A_Q1_POTENTIAL`
- Stage B review status: `NOT_READY`
- `stageb_user_approval_id`: `null`
- Stage B authority: `FORBIDDEN`

## What is real in the current result

The candidate built an exact finite merge-join join+sort model, found many concrete counterexamples to the unsafe final-`Omega`-only prefix rule, and preserved the finite optimum when grouping orders by a vector of costs to every legal next demand. The package also reports broad no-gain regions rather than hiding them. JOB 4a is used only for its real SQL graph/equality structure, not presented as natural performance evidence.

## Why it is not ready for Stage B approval

Two linked implementation-fidelity issues prevent deciding whether the finite mechanism is economically non-vacuous:

1. The frozen contract specifies simple NDV formulas for `A` and `B`, but the program uses a different SHA-256-derived formula. The recorded result is therefore not the preregistered finite family.
2. The reported `404,450` signature constructions count only a post-hoc audit loop. It omits signature construction on the `873,620` reported quotient transitions and does not separate exact DP, quotient DP, signature, bound and audit time/RAM.

The observed 3.63% logical-state reduction and 0.38% transition reduction are accurate structural counts for the executed model. They do not show that a full future-demand vector saves time or retained memory after its own construction, hashing and storage costs.

## One bounded revision

`CONTRACT_FAITHFUL_COSTED_NONVACUITY_GATE`

On the unchanged finite JS object, the revision must execute the frozen cost profile, separately measure the exact control and quotient, count every signature/vector operation and retained byte, and show at least one predeclared positive local residual at the identical optimum. If the full vector is absorbed, only one same-mechanism compact representation/pivot may be tested; without a nonempty residual, the recommendation becomes `STOP`.

This revision does not require an unbounded theorem, DPomega source reproduction, PostgreSQL integration, real JOB performance or the complete Stage B workload suite.

## What may remain for Stage B if the revision passes

- unbounded future-equivalence and admissibility proof;
- compact-signature and cheap-bound analysis;
- DPomega algorithm-level executable fidelity;
- JOB/TPC-DS/SYN-S with real statistics and full optimizer time/RAM;
- topology, scale, bound-strength and failure-region ablations;
- final latest-collision closure.

The 10,036/19,440 no-gain cases are an honest boundary, not an automatic failure. Public CPU resources and AI can execute the next gate, so human reserve is not recommended.

## User action now

No Stage B approval is requested. Mainline should first determine whether the single Stage A revision/pivot allowance is available and, if so, assign only the bounded gate above. This packet is not Stage B authorization; `stageb_user_approval_id` must remain `null`.
