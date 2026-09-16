# Discovery question card — AtomicBranchState

## Identity

- Card ID: `S6-ABS-QC01`
- Assignment: `DISCOVERY-S6-20260822-ATOMIC-BRANCH-STATE-REV0`
- Exact public identity: `OpenHands/software-agent-sdk@ddac55697c5d15cf8a34495b5ed6d46c86db092a`; the assignment requires an exact model/KV runtime, sandbox C/R substrate and public branching carrier before collision conclusions.
- Carrier kind: `IMPLEMENTATION_CARRIER_ONLY`.
- Network-security exclusion: `PASS`.

## Five-field identity preflight

- Frozen registry surface declared by assignment: `B881A9831355008AA7388225225630628222D9462AC10466B317A2C047FC14FB`.
- Runtime registry surface observed on 2026-08-22: `A3B7D0AA9D69D06A251A626E5B88F2C708EC93E9E3DDE2EF15415E82F1AE89AC`; this is a post-freeze drift, not a new scientific input.
- Relation to stopped CoupledAgent family: object `NONE`; action/endpoint/guarantee `RELATED_ONLY`; full-cost `RELATED_ONLY`. The assignment explicitly prohibits status inheritance.
- Frozen direct current collision: `NO` for the literal all-plane action; this does not establish novelty.

## Contract and decisive checks

- Exact object: one agent branch whose transcript/agent state, filesystem/process/terminal state, tool transaction and model KV version are committed or restored together.
- Immutable endpoint: no mixed epoch visibility after a failure at any protocol point.
- Required action: native `ATOMIC_COMMIT_ABORT_OR_RESTORE_OF_ONE_VERSIONED_CROSS_LAYER_BRANCH_STATE` with a specified linearization point.
- Full-cost: KV quiesce/transfer; filesystem and process snapshot; tool logging/compensation; recovery; aborted work; and a global-flush/restart comparator.
- Current SDK locus: the official README specifies a composable `LLM`, `Agent`, `Conversation`, `Tool`, and a local or ephemeral workspace; it does not define a model-KV ownership interface, a process checkpoint/restore interface, or a multi-plane branch commit primitive.
- Current counterevidence: Shepherd provides reversible agent/environment traces with copy-on-write forks and KV reuse; Crab provides semantics-aware filesystem/process C/R; Atomix provides epoch/frontier-gated transactional tool settlement; `Aborted but Not Forgotten` supplies transaction-local KV restoration.

## Raw gate result

- Same-object native two-action witness: `FAIL`. The frozen SDK source is an agent-building API surface. It leaves KV ownership and process/workspace checkpointing to independent deployments, so there are no two native SDK branch actions whose differing legal outcomes can witness the proposed all-plane atomic action.
- Non-generic discriminator: `FAIL`. Once external components are added, the sole identified linearization candidate is a durable epoch/prepare/commit record coordinating independent resource managers. That is generic transaction/checkpoint composition, explicitly disallowed by the assignment.
- Natural/canonical carrier: `FAIL_FOR_EXACT_OBJECT`. Shepherd is a relevant public branching carrier, but it is a different runtime and cannot silently supply the missing OpenHands+KV+sandbox exact object.
- Finite closure route: `NO_FOR_THIS_OBJECT` without changing the object to a specifically integrated runtime and then proving an action above generic multi-resource commit.

## Front-end disposition

- RQ audit: `RQ_COMPLETE`
- RAW_REQUIRED audit: `INCOMPLETE_BY_STRUCTURAL_FATAL`, not a source/resource failure.
- Closure debt: `STRUCTURALLY_UNCLOSABLE`
- Disposition: `EXCLUDED_BEFORE_RAW`
- Reason: the anchored current system does not contain the required cross-plane state authority; adding it makes the proposal a generic coordination wrapper over current specialised mechanisms. No raw, C0, D1, deep review, or Stage 0 brief is authorized.

