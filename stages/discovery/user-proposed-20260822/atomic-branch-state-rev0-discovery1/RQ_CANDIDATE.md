# RQ candidate — AtomicBranchState

## Identity

- RQ candidate ID: `S6-ABS-RQ01`
- Seed: `ABS-S1` in `DIVERGENCE_SEED_POOL.md`
- Tentative public object: `ONE_AGENT_BRANCH_CHECKPOINT_BINDING_TRANSCRIPT_AGENT_STATE_WORKSPACE_FILESYSTEM_PROCESS_TERMINAL_TOOL_TRANSACTION_AND_KV_VERSION`.
- Source anchor: `OpenHands/software-agent-sdk@ddac55697c5d15cf8a34495b5ed6d46c86db092a` (official repository; frozen by assignment).
- Stable guarantee envelope: a failed branch operation exposes either one legal pre-commit or one legal post-commit branch state, never a mixed epoch.
- Contribution hypothesis: `SYSTEM_ARCHITECTURE`, `N1_OR_N2_CROSS_LAYER_ATOMIC_BRANCH_PROTOCOL`.

## Primary RQ

Can one pinned OpenHands SDK agent deployment admit a native, finite cross-layer `COMMIT / ABORT / RESTORE` branch operation with a single linearization point that preserves the stated no-mixed-epoch guarantee at lower full cost than global flush/restart, and that is not reducible to the current replay, sandbox C/R, tool transaction, and KV-rollback mechanisms?

No alternate RQ was frozen: changing the model runtime or sandbox substrate changes the exact object rather than resolving an ambiguity.

## Pre-evidence selection

- Decision consequence: a true residual would justify a new target-specific branch protocol; a generic or unpinned composition must not enter raw.
- Primary route: official OpenHands SDK source/docs plus primary Shepherd, Crab, Atomix and KV-rollback papers.
- Transport-only fallback: official source/docs search surfaces for the same projects.
- Early falsifier: the SDK fails to own KV and checkpointed process/workspace state, or the only composed action is ordinary multi-resource transaction/checkpoint coordination.
- Disposition: `RQ_READY_FOR_ORDINARY_CLOSURE`.

