# Source88 S5 divergence seed pool

## Pool metadata

- Assignment / lane: DISCOVERY-S5-20260815-ADAPTIVE-SOURCE88-R40-ORDINARY-BREADTH-V1 / S5
- Frozen profile: RESEARCH_TOPIC_DISCOVERY_SKILL_CONSOLIDATED_R40_V1__ORDINARY_BREADTH_ONLY
- Seed ceiling: <=12; generated: 6
- RQ candidate ceiling after seed convergence: <=8; selected: 1
- Network-security exclusion check: PASS
- Generation completed before evidence lookup: YES

## Seed records

### SC88-01

- Engine: CONSTRAINT_MANIPULATION
- Perspective role: MAINTAINER
- Starting anchor or hunch: a reproducible Bazel action/CAS cache must stay exact while a bounded local disk budget forces eviction or compaction.
- Exact public anchor candidate: Bazel Remote Caching documentation, current page.
- Intended source role: ANCHOR
- Two-sentence idea sketch: Ask whether exact action-result reuse can admit a bounded-recourse cache-maintenance constructor rather than a periodic deletion policy. The immutable boundary is Bazel action keys, Action Cache/CAS semantics, and reproducible build outputs.
- Conclusion-first test: If successful, the cautious conclusion would be an exact, target-native online cache-maintenance guarantee; maintainers would care only if it changes reuse-versus-storage behavior without changing action semantics.
- Likely generic/current-union/changed-object risk: HIGH; cache eviction and size flags may make this merely a generic maintenance policy.
- Preliminary disposition: KEEP_FOR_CONVERGENCE

### SC88-02

- Engine: BISOCIATION_STRUCTURAL_TRANSFER
- Perspective role: COMPILER_OR_BACKEND_ENGINEER
- Starting anchor or hunch: Buck2 incremental dependency evaluation might expose a fixed-graph state migration invariant.
- Exact public anchor candidate: Buck2 documentation/source.
- Intended source role: ANCHOR
- Idea sketch: Consider online retention of dependency-node state after a graph edit, preserving the same analysis result. It is only a future locator because the exact invariant and natural carrier are not yet frozen.
- Preliminary disposition: KEEP_FOR_CONVERGENCE

### SC88-03

- Engine: JANUSIAN_TENSION
- Perspective role: MAINTAINER
- Starting anchor or hunch: SCons signature databases trade deletion recourse against exact derived-file validity.
- Exact public anchor candidate: SCons manual/source.
- Intended source role: ANCHOR
- Idea sketch: A state representation that preserves validity while reducing rebuild churn could be interesting only if its action is not ordinary signature-cache pruning. No current-object assertion is made at seed time.
- Preliminary disposition: KEEP_FOR_CONVERGENCE

### SC88-04

- Engine: ABSTRACTION_LADDER
- Perspective role: THEORIST
- Starting anchor or hunch: C++ module BMI reuse under revisions could admit a bounded-recourse dependency certificate.
- Exact public anchor candidate: a compiler module-format specification and stock reader.
- Intended source role: ANCHOR
- Idea sketch: Frame module artifact reuse as a certificate maintenance problem with exact import semantics. This seed is distinct from a particular compiler cache only if a target-native reader invariant can be fixed.
- Preliminary disposition: KEEP_FOR_CONVERGENCE

### SC88-05

- Engine: NEGATION_OR_INVERSION
- Perspective role: OPERATOR
- Starting anchor or hunch: Autotools dependency tracking may make an always-rebuild safety rule unnecessarily global.
- Exact public anchor candidate: GNU Automake manual.
- Intended source role: ANCHOR
- Idea sketch: Reverse the usual trigger question: which information is sufficient to avoid a global regeneration while preserving generated dependency semantics? The likely outcome is a generic dependency policy unless a concrete native action survives.
- Preliminary disposition: KEEP_FOR_CONVERGENCE

### SC88-06

- Engine: COMPOSE_DECOMPOSE_SIMPLIFY
- Perspective role: END_USER
- Starting anchor or hunch: project-local artifact and action caches might have a non-Cartesian cross-workspace state representation.
- Exact public anchor candidate: a build-system cache specification.
- Intended source role: ESCAPE
- Idea sketch: Separate immutable action identity from evictable materialized bytes, then test whether the resulting decision is more than cache sizing. This is a broad seed, not an opportunity claim.
- Preliminary disposition: KEEP_FOR_CONVERGENCE

## Clustering and convergence

| Cluster | Seed IDs | Shared tension | Representative |
|---|---|---|---|
| exact build-state maintenance | SC88-01, SC88-02, SC88-03, SC88-05, SC88-06 | exact incremental reuse under bounded state | SC88-01 |
| module artifact semantics | SC88-04 | fixed import/output semantics under revisions | SC88-04 |

| Selected seed | Reason | RQ candidate |
|---|---|---|
| SC88-01 | It has an exact public anchor, fixed action/CAS semantics, and a smallest current-source route; this selection was frozen before lookup. | S5-88-RQ01 |

SC88-02 through SC88-06 remain non-evidence backlog. They were not searched or counted as locators, raw opportunities, or proposals.

## Advisory

- Engines used: 6
- Perspective roles used: 5
- DIVERGENCE_COVERAGE_ADVISORY: PASS
- Plain-Chinese note: 本轮只把一个最小、可核验的 build-cache 张力送入证据漏斗；其余想法没有被当作候选或负证据。
