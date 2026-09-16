# Current-upstream and collision audit — ToolSliceCache Rev0

Date of bounded lookup: 2026-08-22. All conclusions below distinguish direct evidence from bounded-open source availability.

## Source ledger

| ID | Role | Primary/official source | Pinned identity / currentness | What it establishes | What it does **not** establish |
|---|---|---|---|---|---|
| U1 | SDK semantic anchor | [OpenHands SDK overview](https://docs.openhands.dev/sdk/index) | current official docs, accessed 2026-08-22 | SDK is a coding-agent framework with tools and local/cloud execution. | No absence claim about a native cross-branch cache. |
| U2 | SDK workspace anchor | [OpenHands workspace API](https://docs.openhands.dev/sdk/api-reference/openhands.sdk.workspace) | current official docs, accessed 2026-08-22 | Workspace exposes a working directory and command/file operations. | No complete API inventory for the frozen commit. |
| U3 | SDK tool boundary | [OpenHands architecture overview](https://docs.openhands.dev/sdk/arch/overview) | current official docs, accessed 2026-08-22 | Tools run in the configured workspace and use action/observation/executor structure. | No proof that a particular current SDK action is absent. |
| P1 | direct paper collision | [TVCACHE paper](https://arxiv.org/abs/2602.10986) | arXiv:2602.10986, Feb. 2026 | Stateful cache uses exact full tool-call history to preserve sandbox state; it only filters a call when correct state-preserving annotations exist. | It does not provide a read-slice certificate for arbitrary mutable tools. |
| B1 | current build-cache subtractor | [Bazel remote caching](https://bazel.build/docs/remote-caching) | current official docs, accessed 2026-08-22 | An action is defined by declared inputs, outputs, command line and environment; the disk cache supports switching branches/multiple workspaces. | It does not make undeclared tools/environment sound; its own docs note untracked external tools. |
| N1 | current hermetic-action subtractor | [Nix 2.35 building](https://nix.dev/manual/nix/2.35/store/building.html) | Nix 2.35.2 manual | Deterministic caching requires a precisely defined build input and process-observable state; sandboxed builders expose a limited filesystem/environment. | It is not a generic coding-agent tool cache. |

## Frozen SDK current-upstream reality check

The assignment requires the SDK pin `ddac55697c5d15cf8a34495b5ed6d46c86db092a`. Direct read-only retrieval of the pinned GitHub commit page and raw `README.md` was attempted twice within the bounded route; both returned cache-miss/internal-error responses. No source tree was downloaded and no execution was attempted.

Consequently:

- The official current docs close the generic workspace/tool semantics needed to define the object.
- Whether that exact SDK commit exposes a native cache/replay acceptance action is `SEARCH_BOUNDED_OPEN`; this audit makes **no absence claim**.
- The final `DROP` below does not depend on asserting SDK absence. If native support exists, it can only strengthen current-union absorption; if it does not, the proposed observed-slice guarantee still fails its non-generic/soundness discriminator.

## Current union and direct-subtractor comparison

| Comparator | Same endpoint portion | Information/action | Relationship to proposed action | Result |
|---|---|---|---|---|
| TVCACHE | stateful tool observation and sandbox-state preservation | exact tool-call history; optional declared state-preserving tools | Its conservative full-history rule is the safe stateful baseline. A dependency-slice rule must prove a stronger dependency closure, not merely observe one run. | `DIRECT_SUBTRACTOR` |
| Bazel remote/disk cache | compiler/build output reuse across branches/workspaces | explicit action inputs, output names, command line, env; action hash/CAS | Covers any ToolSlice formulation restricted to declared/hermetic build actions. | `DIRECT_FATAL_FOR_BUILD_SUBSCOPE` |
| Nix derivation/cache model | deterministic process output from precisely defined observable inputs | closed store inputs, args, env, sandbox-visible state | Covers the required semantic shape once the candidate makes the observed slice complete enough to be sound. | `DIRECT_SUBTRACTOR` |
| shell memoization/content-hash cache | simple command result reuse | shallow key | Too weak as a fair baseline, but the candidate becomes this if it gives up the requested post-state guarantee. | `NO_REMAINING_PAPER_RESIDUAL` |

## Decisive logical action witness

Let branch A run `pytest` with certificate recording the files actually read on that run. Branch B has the same recorded files, executable, argv and environment, but changes an unrecorded file that is read only after a conditional import, plugin hook, path discovery, subprocess, dynamic loader lookup or test-data branch becomes enabled. The certificate can match even though branch B’s native output/post-state differs. This witness is legal under the stated supported scope because the scope admits local test/build/static tools but does not impose a complete hermetic dependency contract.

To reject that witness safely, the candidate must prove a complete per-tool observable dependency closure before reuse. For compiler/build commands this is the same information/action class as Bazel/Nix-style hermetic action caching. For the remaining heterogeneous tools, the assignment supplies no target-specific closure mechanism beyond generic dynamic tracking/record-replay or falls back to native execution. Neither path yields the frozen non-generic N2 residual.

## Collision disposition

- Direct collision: not claimed for the full heterogeneous SDK tool object.
- Direct fatal: yes for the compiler/build subset once a sound complete closure is required.
- Structural fatal for the whole proposed claim: yes. The stated `observed read-set` certificate cannot support the required universal output-and-post-state equivalence; strengthening it to a complete closure collapses the only specified construction into current generic cache/replay/hermetic-action families.
- Search boundary: bounded official/primary route; no novelty/absence inference is drawn from the unavailable exact-commit page or unrecovered syscall-replay source.

