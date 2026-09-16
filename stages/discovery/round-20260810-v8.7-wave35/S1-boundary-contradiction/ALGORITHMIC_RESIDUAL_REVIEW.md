# Candidate-grade six-dimensional algorithmic residual review

## A. FUSE-over-io_uring entry-recycling schedule

**Exact object / same function.** A native FUSE operation submitted by the kernel must receive the same FUSE reply and filesystem-visible result through the FUSE-over-io_uring contract.

| Dimension | Deep-review finding |
|---|---|
| Decision rule | Candidate M1: choose a pending kernel request for each recycled ring entry. Candidate M2: co-schedule response-copy and fetch ordering by operation class. They are non-synonymous descriptions. |
| Information condition | The documented user-space protocol exposes the completed CQE/current request when it issues `COMMIT_AND_FETCH`; it does not expose a user-space queue on which to choose an arbitrary pending request. Kernel queues and assigns the next request. |
| Complexity/resource | A local policy has O(1) per completed request, but no legal choice point. A hypothetical global reordering needs kernel-side visibility/state not in the frozen user-space interface. |
| Quality/guarantee | Same FUSE reply and ordering semantics are required. The official design says notifications and interrupts still use `/dev/fuse`; routing them through a separate path breaks the proposed full same-object contract. |
| Full cost | Any claimed gain must include response copies, ring-entry occupancy, queueing delay, kernel wakeups, and the `/dev/fuse` path for unsupported requests. |
| Generalisation / no-gain | For supported requests, M1 has singleton action per recycled entry. M2 merely changes completion timing under dependencies; it cannot select work. A fallback classifier is wrapper space. |

**Decision:** `DROP_NO_LEGAL_ALGORITHMIC_ACTION`.  
**Finite fidelity route if it had survived:** implement both paths against the current kernel interface and compare native replies for a small FUSE operation corpus.  
**72-hour falsifier:** one trace with two pending kernel requests showing that user-space can legally choose their assignment at `COMMIT_AND_FETCH`; if absent, no algorithmic action exists. The official sequence documents immediate next-request delivery, so this falsifier is already strongly negative.

## B. io_uring DBMS registered-buffer allocation

**Exact object / same function.** A DBMS buffer-manager or shuffle operation must return the same committed pages/query tuples under the same I/O request trace and durability semantics.

| Dimension | Deep-review finding |
|---|---|
| Decision rule | Candidate M1: allocate registered-buffer groups to concurrent request classes under a fixed pin budget. Candidate M2: choose SQ/CQ task-run/polling mode and submit batch boundaries. |
| Information condition | Request class, sizes, queue depth, page residency and pin budget are already visible to the native DBMS/runtime; no additional cross-layer semantic information is introduced. |
| Complexity/resource | M1 is an online partition/replacement policy; M2 is configuration plus batching. Both share the same fixed pinned-memory and queue-depth budget with the native registered-buffer / buffer-selection API. |
| Quality/guarantee | Both preserve normal completion semantics only if every I/O request remains legal; no stronger correctness, latency bound, or approximation guarantee was derived. |
| Full cost | Registration/unregistration, pinning, cache displacement, submission CPU, completion polling, tail latency and recovery/durability path must all be charged. |
| Generalisation / no-gain | The 2025 primary DBMS study already evaluates registered buffers and passthrough in storage-buffer-manager and network-shuffle settings. M1 is an ordinary online allocation policy within the same information/budget; M2 is explicitly configuration. No source-supported new constraint or guarantee separates it. |

**Decision:** `DROP_FAIR_UNION_REPLAY_OR_CONFIGURATION_ONLY`.  
**Finite fidelity route if it had survived:** pin a DBMS release, native io_uring interface, and public query/shuffle traces; verify returned pages/tuples plus full pin/CPU/tail cost.  
**72-hour falsifier:** write the decision-state tuple and show an action unavailable to all legal registered-buffer groups, buffer selection, batching, and task-run modes under identical pin budget. No such action was found; without it, M1 is a fair-union replay.

## C. Component Canonical-ABI shared-memory co-planning

**Exact object / same function.** A WIT component function crossing a component/core boundary must preserve the same abstract arguments/results and Canonical-ABI resource/lifetime rules.

| Dimension | Deep-review finding |
|---|---|
| Decision rule | Candidate M1: globally plan `lift`/`lower` allocations and `post-return` releases. Candidate M2: link components into a shared-memory core ABI to eliminate copies. |
| Information condition | M1 sees canonical type/options and call graph. M2 requires changing component composition/memory ownership beyond the canonical boundary. |
| Complexity/resource | M1 is a lifetime scheduling problem over allocator and post-return calls. M2 adds linker/relocation and a shared-memory deployment resource. |
| Quality/guarantee | M1 must preserve Canonical-ABI `realloc` and optional `post-return` semantics. M2 changes the isolation/representation boundary that the object fixes; same component-function semantics alone is insufficient. |
| Full cost | Allocation/copy/realloc, post-return destruction, component instantiation/linking, memory isolation and code-size costs all belong in the denominator. |
| Generalisation / no-gain | M1 remains allocator/runtime scheduling without a new semantic action. M2 is not same-object: it replaces a shared-nothing component boundary with a fixed shared-everything ABI. The official design calls this producer-toolchain territory, not a frozen native action. |

**Decision:** `DROP_M1_RUNTIME_POLICY_ONLY__M2_CHANGED_OBJECT`.  
**Finite fidelity route if it had survived:** use a pinned component toolchain and WIT corpus, validate component calls and resource drops, then account for instantiated memory/code and all copies.  
**72-hour falsifier:** produce one standards-valid multi-component binary that shares the proposed memory while preserving the exact Canonical-ABI ownership/isolation object. If it requires a different linking ABI or changes the component boundary, M2 is invalid; current specification text makes that the expected result.

## Cross-candidate outcome

None satisfies the six-dimensional residual test. No topic brief is emitted. This does not convert Wave30’s nonterminal raw leads into STOP records and does not revise Wave30 materials.
