# Primary research-question candidate

`RQ-S69-01`: For a fixed OpenJDK virtual-thread Java program whose observable Java results, exception behavior, monitor ownership, and native-call semantics are preserved, can a target-specific continuation/monitor state-transition constructor reduce carrier pinning more than the current JDK mechanism, with non-worse scheduler, CPU, memory, and diagnostic cost?

- Contribution type tentatively considered: `SYSTEM_ARCHITECTURE / COMPILER_TOOL`, N2.
- Counterfactual decision: runtime implementers would choose a different continuation/monitor transition construction rather than only configure carrier parallelism.
- Non-generic discriminator sought: a semantic-preserving action at the continuation/monitor boundary, rather than an application lock rewrite or scheduler policy.
- FINER-lite: answerable from the frozen JEP/source route; important if it survived; scope is fixed to JDK virtual-thread semantics; first contrary route is JEP 491.

The RQ was frozen before reading the contrary source. It did not survive the current direct-collision check and never entered evidence-qualified raw.
