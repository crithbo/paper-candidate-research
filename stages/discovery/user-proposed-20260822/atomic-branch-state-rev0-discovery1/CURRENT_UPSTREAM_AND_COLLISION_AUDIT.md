# Current-upstream and collision audit — AtomicBranchState

## Scope and sources

Bounded review completed 2026-08-22. It uses only official GitHub/docs and primary papers. The GitHub web transport could not retrieve the frozen commit page directly; the commit remains assignment-frozen and the official current repository/docs establish the API boundary. This is not treated as evidence of absence.

| Role | Frozen/current source | Action actually covered | Relevance to candidate |
|---|---|---|---|
| Agent anchor | OpenHands `software-agent-sdk@ddac556…`; current official README/docs | `LLM`, `Agent`, `Conversation`, `Tool`, local/ephemeral workspace and remote agent server | No native API binding a KV handle, sandbox snapshot/process tree and tool settlement into a branch epoch. |
| Branch/replay | Shepherd official repository and paper | durable reversible traces; agent/environment copy-on-write fork; replay/revert; retained outputs; KV-cache reuse | Directly covers agent/environment branch trace and replay plane. |
| Sandbox C/R | Crab, arXiv:2604.28138 | turns aligned with semantic state effects; filesystem, process and runtime C/R | Covers workspace/process recovery plane, not all-plane agent commit. |
| Tool transaction | Atomix, arXiv:2602.14849 | epoch tags, resource frontiers, delayed/compensated effects and abort/commit settlement | Covers the generic transaction discipline proposed as the only apparent linearization device. |
| KV rollback | Zhang & Yang, arXiv:2608.15939 | rollback consistency and transaction-local cache restoration | Covers agent KV’s stale-attention rollback plane without global flush. |
| Serving control | vLLM official prefix-caching documentation | content-addressed prefix-cache blocks, allocation/free/eviction and KV transfer surfaces | Confirms KV state is owned by a serving runtime rather than the SDK anchor. |

## Proposed action attack

The strongest charitable candidate action is:

`SEAL(branch_id, epoch, transcript_ref, sdk_state_ref, sandbox_snapshot_ref, tool_frontier_ref, kv_version_ref)`, followed by commit or abort, with publication of the sealed record as the claimed linearization point.

This does not survive the target-specific test:

1. The OpenHands SDK does not natively own `sandbox_snapshot_ref` or `kv_version_ref`; the action is not an SDK-native legal action on the frozen object.
2. If independent owners prepare and publish those references, the linearization point is precisely the standard atomic-transaction/checkpoint coordinator pattern. Atomix already supplies epochs/frontiers for tool settlement; Crab and KV-local restore supply resource-local recovery.
3. No agent-semantic decision variable or structural theorem was identified that selects a non-generic cross-plane action rather than applying that composition. The required no-mixed-epoch guarantee is a standard atomicity invariant conditional on all resource managers’ prepare/restore contracts, not an AtomicBranchState-specific guarantee.

## Same-object two-action witness test

Required witness: two legal plans over the *same pinned deployment* where one uses the claimed native all-plane operation and the other uses global flush/restart, while observables retain the same branch semantics.

Result: `NO_NATIVE_WITNESS`.

- Plan A cannot be expressed by the frozen SDK alone: it lacks a KV runtime and a checkpoint substrate.
- Plan B (global flush/restart) also belongs to external serving/sandbox implementations, not the SDK’s native operation set.
- Choosing Shepherd or a new OpenHands+vLLM+Crab+Atomix integration would silently replace the exact object. The former is a distinct existing runtime; the latter is a four-system integration whose remaining action is generic coordination.

## Decisive classification

- `DIRECT_SUBTRACT`: Shepherd for reversible agent/environment branch traces; Crab for filesystem/process recovery; Atomix for transactional tool settlement; transaction-local KV restore for logical/KV rollback consistency.
- `STRUCTURAL_FATAL`: the only plausible cross-layer linearization mechanism is generic transaction/checkpoint composition and the frozen agent anchor cannot express the necessary all-plane action.
- `SEARCH_BOUNDED_OPEN`: no claim of exhaustive literature absence is made. The decision does not rely on absent implementation, missing result, or resource failure.
- `FINAL`: `DROP__GENERIC_CROSS_LAYER_TRANSACTION_COMPOSITION_AND_NATIVE_OBJECT_UNCLOSABLE`.

## Reproducibility and full-cost boundary

A hypothetical integrated system would have to count KV quiesce/transfer/rebuild, sandbox filesystem/process snapshot and restore, tool buffering/compensation, durable lineage log, recovery latency, aborted work, and global flush/restart. Because the candidate fails before a native same-object action exists, no 72-hour Stage A route can measure this denominator without changing the frozen object. That is a scientific structural failure, not a runtime-resource blocker.

## Primary URLs

- https://github.com/OpenHands/software-agent-sdk
- https://docs.openhands.dev/sdk/arch/agent-server
- https://github.com/shepherd-agents/shepherd
- https://arxiv.org/abs/2604.28138
- https://arxiv.org/abs/2602.14849
- https://arxiv.org/abs/2608.15939
- https://docs.vllm.ai/en/stable/design/prefix_caching/

