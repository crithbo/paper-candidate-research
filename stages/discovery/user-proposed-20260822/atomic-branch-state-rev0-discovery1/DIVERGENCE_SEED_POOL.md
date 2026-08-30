# AtomicBranchState divergence seed pool

## Pool metadata

- Assignment / lane: `DISCOVERY-S6-20260822-ATOMIC-BRANCH-STATE-REV0` / `S6`
- Frozen profile: canonical v8.7; claim-pack and RQ frontend `OFF`; `gpt-5.6-terra/high`
- Seed ceiling: `<=12`; generated: `4`
- Network-security exclusion check: `PASS` — this is normal state-consistency/runtime semantics, not a vulnerability or attack topic.
- Generation completed before evidence lookup: `YES`

## Divergence coverage

| Engine | Used | Seed IDs |
|---|---:|---|
| `CONSTRAINT_MANIPULATION` | yes | ABS-S1 |
| `JANUSIAN_TENSION` | yes | ABS-S2 |
| `COMPOSE_DECOMPOSE_SIMPLIFY` | yes | ABS-S3 |
| `ABSTRACTION_LADDER` | yes | ABS-S4 |

### ABS-S1

- Engine / perspective: `CONSTRAINT_MANIPULATION` / runtime maintainer.
- Starting anchor: an agent branch can logically abort while transcript, workspace/process state, tool effects and model KV have different durability boundaries.
- Exact public anchor candidate: `OpenHands/software-agent-sdk@ddac55697c5d15cf8a34495b5ed6d46c86db092a`.
- Sketch: introduce one branch epoch and make a single cross-plane commit record decide whether the entire branch becomes visible. A failure must resolve to the whole pre-epoch or whole post-epoch vector, never a mixed vector.
- Conclusion-first test: at most, a protocol could offer atomic branch recovery with lower cost than global flush/restart; it matters only if its action is not ordinary transaction/checkpoint composition.
- Risk: absent a target-specific cross-plane primitive or theorem, this is generic two-phase commit.

### ABS-S2

- Engine / perspective: `JANUSIAN_TENSION` / serving-runtime engineer.
- Starting anchor: transaction-local KV restoration repairs attended-state rollback, while sandbox checkpoint/restore preserves files and processes.
- Sketch: test whether tying their version identifiers at a branch lineage boundary creates a new action rather than merely invoking two restores.
- Conclusion-first test: a Q2 claim needs a non-generic linearization mechanism and a finite no-mixed-epoch guarantee, not a checklist of per-plane restores.
- Risk: each plane may retain its own commit authority, reducing the proposal to an adapter.

### ABS-S3

- Engine / perspective: `COMPOSE_DECOMPOSE_SIMPLIFY` / formal-methods reviewer.
- Starting anchor: Shepherd records reversible agent/environment traces; Atomix controls transactional tool effects.
- Sketch: decompose the proposed state vector and ask whether the commit decision is already exactly an epoch/frontier transaction plus existing copy-on-write snapshots.
- Conclusion-first test: if the composed protocol has no agent-specific decision variable beyond generic prepare/commit/abort, it must be dropped.
- Risk: current union absorption.

### ABS-S4

- Engine / perspective: `ABSTRACTION_LADDER` / systems operator.
- Starting anchor: branch lineage may need a stable recovery point across a conversation, model runtime and sandbox.
- Sketch: descend from “atomic agent state” to a concrete native action on one pinned agent/model/sandbox deployment, then look for two legal plans and a finite cost comparison.
- Conclusion-first test: a viable paper must freeze one deployable carrier and one linearization locus; otherwise the object is an open integration programme.
- Risk: the SDK anchor is deliberately provider- and workspace-substrate-agnostic.

## Clustering and convergence

| Cluster | Seed IDs | Shared object/mechanism | Representative |
|---|---|---|---|
| Cross-plane branch atomicity | ABS-S1–ABS-S4 | one branch-epoch binding transcript, workspace/process, tool and KV state | ABS-S1 |

Selected seed: `ABS-S1`. The other seeds are adversarial tests of the same exact opportunity, not additional families.

