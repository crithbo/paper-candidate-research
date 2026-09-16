# Question card — ToolSliceCache Rev0

## Exact public anchor

- Implementation anchor: `OpenHands/software-agent-sdk@ddac55697c5d15cf8a34495b5ed6d46c86db092a` (assignment-frozen Git commit).
- Official current semantic anchors checked 2026-08-22:
  - [OpenHands SDK overview](https://docs.openhands.dev/sdk/index): SDK offers coding tools and local/cloud execution.
  - [OpenHands workspace API](https://docs.openhands.dev/sdk/api-reference/openhands.sdk.workspace): a workspace has a working directory for agent operations/tool execution and command/file operations.
  - [OpenHands architecture overview](https://docs.openhands.dev/sdk/arch/overview): tools run in the configured workspace and follow action/observation/executor structure.
- Primary paper anchor: [TVCACHE: A Stateful Tool-Value Cache for Post-Training LLM Agents](https://arxiv.org/abs/2602.10986), Feb. 2026.
- Strongest official current subtractors: [Bazel remote caching](https://bazel.build/docs/remote-caching) and [Nix 2.35 building semantics](https://nix.dev/manual/nix/2.35/store/building.html).

## Identity / endpoint / contribution

| Field | Frozen value |
|---|---|
| Opportunity family | `TOOLSLICE_CACHE__DEPENDENCY_CERTIFIED_CROSS_BRANCH_TOOL_REUSE` |
| Same-object problem | decide reuse versus native execution for one supported SDK tool across divergent branch histories |
| Endpoint | native output plus observable post-tool state, with a conservative fallback |
| Candidate contribution | N2 dependency-certified reuse decision rule |
| Carrier | natural coding-agent workspaces; no workload was run in Discovery |
| Minimum falsifier | one admissible tool/input pair for which a certificate match yields a different native observation or post-state; alternatively proof that sound closure reduces to a current generic cache/replay action |

## Evidence-qualified raw gate

| Required raw field | Result | Evidence-qualified disposition |
|---|---|---|
| Exact identity | Closed | assignment pin plus official SDK public documentation |
| Same-object RQ / endpoint | Closed | this card and frozen assignment |
| Current-source locus | Partially closed | official SDK documents workspace/tool execution; exact pinned-commit source page was attempted twice and cache-missed |
| Non-generic discriminator | Fails | observed read-set cannot establish the required universal guarantee for the stated mixed tool scope without a complete dependency closure |
| Falsifier | Closed | hidden dependency / generic-cache collapse are finite killers |
| Current collision / union | Closed for decisive boundary | TVCACHE covers stateful history protection; Bazel/Nix cover sound hermetic build-action reuse |
| Natural carrier / full-cost initial boundary | Closed at routing level | SDK workspaces and complete cost denominator frozen; no result claimed |

## Decision

`DROP` before evidence-qualified raw promotion. This is not a bounded-search novelty claim and not a claim that the SDK has no cache/replay facility. It follows from the requested safety guarantee: a single observed read-set is not a complete dependency proof for the broad admitted tool scope. Making it complete requires a hermetic/recorded action closure that is either already represented by the current build-cache family for builds or has no differentiated, finite, non-generic action specified for the other tools.

