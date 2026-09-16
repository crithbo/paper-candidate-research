# Source95 S6 divergence seed pool

- Assignment / lane: `DISCOVERY-S6-20260815-ADAPTIVE-SOURCE95-R40-ORDINARY-BREADTH-V1` / `S6_DIRECT_ALGORITHM_SOFTWARE`
- Frozen profile: `RQ_REFINEMENT_STAGED_EVIDENCE_V1 / PRODUCTION`; claim-pack and V9 `OFF`; ordinary R40.
- Seed ceiling: 12; generated: 6. Generation completed before evidence lookup: `YES`.
- Network-security exclusion: `PASS`; none of the seeds concerns a vulnerability, attack, defence, protocol security, or malicious traffic.

| Engine | Used | Seed IDs |
|---|---:|---|
| `BISOCIATION_STRUCTURAL_TRANSFER` | yes | S95-01, S95-05 |
| `CONSTRAINT_MANIPULATION` | yes | S95-02 |
| `NEGATION_OR_INVERSION` | yes | S95-03 |
| `ABSTRACTION_LADDER` | yes | S95-04 |
| `COMPOSE_DECOMPOSE_SIMPLIFY` | yes | S95-06 |

### S95-01 — Bazel Skyframe invalidation/evaluation

- Engine / perspective: `BISOCIATION_STRUCTURAL_TRANSFER` / maintainer.
- Starting anchor: a fixed Bazel workspace, configuration, file-change trace, and configured-target result set.
- Sketch: Could a target-native dependency-invalidation plus re-evaluation constructor choose a globally better frontier than the extant graph walk? The conservative conclusion would only concern reproducible build recomputation cost under unchanged target values.
- Structural tension: bottom-up invalidation preserves dependency correctness, while broad recomputation can add work; the candidate action would couple invalidation and evaluation.
- Anchor candidate / intended role: Bazel Skyframe documentation and current source / `ANCHOR`, then `CURRENT`.
- Noun-swap test: `PASS`; preliminary disposition: `KEEP_FOR_CONVERGENCE`.

### S95-02 — Mercurial revlog snapshot/delta placement

- Engine / perspective: `CONSTRAINT_MANIPULATION` / repository maintainer.
- Starting anchor: a fixed public repository history and fixed revision-content lookup semantics.
- Sketch: Could snapshot placement and delta-base choice be jointly selected while preserving append-only revlog semantics? A positive conclusion would have to improve the exact revlog read/write space-time tradeoff, not merely rename generic delta compression.
- Structural tension: append-only persistence limits rewrites while retrieval needs bounded reconstruction chains.
- Anchor candidate / intended role: Mercurial revlog documentation and current implementation / `ANCHOR`, `CURRENT`, `CONTRARY`.
- Noun-swap test: `PASS`; preliminary disposition: `KEEP_FOR_CONVERGENCE`.

### S95-03 — Pango line layout/justification construction

- Engine / perspective: `NEGATION_OR_INVERSION` / text-layout implementer.
- Starting anchor: fixed Unicode text, font map, attributes, width, and glyph-position result.
- Sketch: Could break placement and justification be constructed jointly with a target-specific guarantee rather than a routine line-breaking dynamic program? The effect would be a same-layout latency or memory claim.
- Structural tension: Pango has explicit break, shaping, layout, and justification phases; changing one phase can silently change the layout contract.
- Anchor candidate / intended role: Pango rendering-pipeline documentation / `ANCHOR`, `CURRENT`, `CONTRARY`.
- Noun-swap test: `PASS`; preliminary disposition: `KEEP_FOR_CONVERGENCE`.

### S95-04 — OpenJPEG packet progression construction

- Engine / perspective: `ABSTRACTION_LADDER` / codec implementer.
- Starting anchor: fixed image samples and JPEG 2000 decoder-visible output.
- Sketch: Could packet progression and tile-part construction yield a target-specific decoder-cost guarantee while retaining the same decoded image? The caution is that quality layers and progression order are standard codec choices, not automatically a new algorithm.
- Structural tension: writer exposes explicit packet-order and progression controls while reader cost depends on access pattern.
- Anchor candidate / intended role: OpenJPEG `opj_compress` source / `ANCHOR`, `CURRENT`, `CONTRARY`.
- Noun-swap test: `PASS`; preliminary disposition: `KEEP_FOR_CONVERGENCE`.

### S95-05 — musl mallocng meta-group construction

- Engine / perspective: `BISOCIATION_STRUCTURAL_TRANSFER` / runtime engineer.
- Starting anchor: a fixed allocation/free trace and C allocation semantics.
- Sketch: Could meta-group selection and size-class reclamation be a bounded target-specific construction rather than allocator tuning? The natural full cost would include allocation latency, RSS, fragmentation, and synchronization.
- Structural mapping: bounded page groups correspond to finite bins, but a valid result must not reduce to a generic allocator/packing rule.
- Anchor candidate / intended role: musl mallocng source route / `ANCHOR`, `CURRENT`.
- Noun-swap test: `PASS`; preliminary disposition: `KEEP_FOR_CONVERGENCE`.

### S95-06 — Libevent pending/active dispatch construction

- Engine / perspective: `COMPOSE_DECOMPOSE_SIMPLIFY` / runtime operator.
- Starting anchor: fixed event registrations, readiness/timeout trace, and callback-visible order contract.
- Sketch: Could event priority queues and backend readiness be jointly organized under identical callbacks and latency semantics? The direct risk is that this is only an event-loop policy/controller.
- Structural tension: a single event base tracks pending and active events while an API configuration selects kernel backends.
- Anchor candidate / intended role: Libevent official API documentation / `ANCHOR`, `CURRENT`, `CONTRARY`.
- Noun-swap test: `PASS`; preliminary disposition: `KEEP_FOR_CONVERGENCE`.

## Clustering and convergence

| Cluster | Seed IDs | Shared surface | Representative |
|---|---|---|---|
| dependency/revision construction | S95-01, S95-02 | dependency state with persistence or invalidation | S95-01, S95-02 |
| semantic output construction | S95-03, S95-04 | reader-visible layout/codestream decisions | S95-03, S95-04 |
| runtime placement/dispatch | S95-05, S95-06 | online local-state organization | none selected |

| Selected seed | Coverage reason | RQ ID |
|---|---|---|
| S95-01 | build graph / compiler-tool semantics | S95-RQ01 |
| S95-02 | persistent revision representation | S95-RQ02 |
| S95-03 | text layout semantics | S95-RQ03 |
| S95-04 | image codec construction | S95-RQ04 |

S95-05 and S95-06 remain non-evidence seed backlog: no source lookup was performed for them in this cycle. `DIVERGENCE_COVERAGE_ADVISORY=PASS` (five engines, five perspectives; no portfolio count is an opportunity denominator).
