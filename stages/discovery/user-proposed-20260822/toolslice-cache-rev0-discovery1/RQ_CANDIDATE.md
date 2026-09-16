# RQ candidate — ToolSliceCache Rev0

## Primary RQ

For `OpenHands/software-agent-sdk@ddac55697c5d15cf8a34495b5ed6d46c86db092a`, can a certificate over executable, argv, environment, runtime/library versions, nondeterminism policy and an **observed** repository read-set safely decide between native execution and reuse of a result from a divergent coding-agent branch, while preserving native observable output and observable post-tool state, and improving end-to-end cost after certificate construction, checking, storage, invalidation and fallback?

## Frozen same-object contract

- Object: same SDK version; two branch histories; one identical supported local tool invocation.
- Supported endpoint: local test runner, compiler/build command with auditable dynamic dependencies, static analysis, or read-only repository query.
- Exclusions: network, clock/random-dependent and irreversible-external-side-effect tools.
- Atomic decision: `EXECUTE_NATIVELY_OR_REUSE_FROM_ANOTHER_BRANCH_ON_CERTIFICATE_ACCEPTANCE`.
- Required guarantee: certificate match implies native observation and observable post-tool-state equivalence, with conservative native fallback.
- Full cost: dependency capture, certificate build/validation, lookup/storage, invalidation, fallback and end-to-end agent cost.

## Pre-evidence decision boundary

The RQ is only viable if an observed read-set can be upgraded to a finite, sound dependency closure for every admitted tool without collapsing into (a) an ordinary hermetic action cache / record-replay system, or (b) cheap read-only memoization. This is a testable boundary, not an assumed residual.

