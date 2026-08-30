# FLATBUFFERS-PROFILED-WHOLE-BUFFER-LAYOUT Q1/Q2 Paper Calibration

- Stage: `STAGE0`
- Candidate venue family: systems/data-management or PL implementation venues
- Calibration status: `PARITY_CONDITIONAL`
- Quality tier: `TIER_B_Q2_VIABLE` conditionally; current decision is `REVISE_ONCE`, not PASS.
- Search/cutoff date: `2026-08-11`

## Reference set

| Role | Paper | Venue/status | Quartile/equivalent basis | Year/source | Read scope | Why selected |
|---|---|---|---|---|---|---|
| CONTRIBUTION_SHAPE_ANCHOR | Chilimbi, Hill, Larus, “Cache-Conscious Structure Layout” | ACM PLDI, peer reviewed | top PL conference equivalent | 1999, ACM/author institutional record, DOI 10.1145/301618.301633 | abstract, mechanism, evaluation summary | shows that a data-placement mechanism needs a defined layout algorithm and natural cache evidence, not merely a placement knob |
| EVALUATION_ANCHOR | Ramananandro et al., “EverParse: Verified Secure Zero-Copy Parsers for Authenticated Message Formats” | USENIX Security, peer reviewed | top security/systems conference equivalent | 2019, USENIX proceedings | abstract, formal contract, implementation/evaluation scope | calibrates formal same-format correctness plus real integrations and performance evidence |
| DOMAIN_NEIGHBOR | Wolnikowski et al., “Zerializer: Towards Zero-Copy Serialization” | HotOS, peer-reviewed workshop | domain-neighbor only; not treated as Q1/Q2 parity | 2021, ACM/author PDF | abstract, design proposition, preliminary evidence boundary | confirms serialization/zero-copy relevance while changing the object and mechanism |
| BOUNDARY_OR_NEGATIVE_ANCHOR | FlatBuffers upstream source/docs and issue #4827 | current first-party mechanism, not a paper | current-union boundary, not venue evidence | release/master through 2026-08-11 | builder actions, internals, verifier, object API, maintainer ordering statement | establishes that caller ordering and several layout controls already exist; it cannot establish novelty |

Primary URLs:

- https://doi.org/10.1145/301618.301633
- https://www.usenix.org/conference/usenixsecurity19/presentation/delignat-lavaud
- https://doi.org/10.1145/3458336.3465283
- https://github.com/google/flatbuffers/issues/4827

## Comparator matrix

| Dimension | Candidate | Anchor evidence | Gap | Current disposition |
|---|---|---|---|---|
| Problem importance/readership | zero-copy serialized buffers can be read selectively; placement may affect locality | PLDI layout papers and zero-copy systems establish broad importance | FlatBuffers-specific natural headroom unmeasured | finite Stage A evidence gap |
| Contribution type | N2 complete-action optimizer with formal result | anchors pair algorithmic layout with explicit correctness/evaluation | current certificate does not define a sufficient global state | `REVISE_ONCE` hard gate |
| Nearest-prior delta | same FlatBuffers object/reader, optimizer over existing legal actions | upstream offers actions but no located profile optimizer | collision remains bounded-open; generic ordering literature not fully closed | require continued bounded search; no absence inference |
| Algorithm/mechanism substance | proposed bounded-frontier DP/FPT | PLDI anchor has concrete layout techniques; EverParse has concrete formal machinery | current `O(n 2^d poly(d))` statement lacks recurrence/history parameters | revision must prove bijection/guarantee |
| Baseline strength/fairness | current native union, hot-first, tiny exhaustive oracle | strong papers compare against the real current mechanism | union catalog incomplete in Discovery and both witness orders are already native | corrected contract specified |
| Natural workload/platform | official LiteRT/TFLite plus second corpus | anchors use real applications/protocols | no corpus result yet | acceptable Stage0 gap; required later |
| Full-cost coverage | profile, plan, build, memory, bytes, verify, load/read/cache | systems anchors account for integration costs | not instantiated | finite plan, not evidence |
| Main result/statistics | none required at Stage0 | anchors report measured gains and multiple integrations | full gap | Stage A/B only |
| Ablation/mechanism evidence | planned action/history/profile ablations | layout anchors isolate mechanism | no result | Stage A/B only |
| Scale/generalization | bounded arity/frontier and reuse width proposed | anchors span multiple programs/formats | complexity parameters and fallback not certified | revision then natural scale sweep |
| Failure boundary | flat profiles, small buffers, high width/arity, padding/planning dominance | strong papers state applicability boundaries | needs operational thresholds | finite later gap |
| Artifact/reproducibility | pinned source, schemas/objects/profiles, byte checker and oracle planned | EverParse demonstrates spec/implementation discipline | no artifact yet | finite Stage A route |

## Reviewer-shape assessment

- Editor/venue-fit view: the object is important and the no-reader-change constraint is attractive, but the current text is not yet a paper-shaped algorithm; conditional Q2 potential survives one static revision.
- Methodology view: a local subtree/boundary state cannot silently ignore global vtable/string history, alias availability, alignment and vector constraints. Exactness must be checked against an action-complete oracle before any performance observation.
- Domain-contribution view: the native format is flexible enough that both example orders are already legal. The paper delta must be the optimizer/guarantee, not “a new layout action.”
- Devil's-advocate view: after deleting the product name, this currently resembles generic topological scheduling/packing. Only a FlatBuffers-specific decomposition or guarantee, plus strongest-union evidence, rescues N2.

## Decision

- Quality tier: `TIER_B_Q2_VIABLE` as conditional structural potential.
- Status: `PARITY_CONDITIONAL`
- Closed gaps: same-object reader/verifier route, natural official carrier, finite native oracle and full-cost plan.
- Executable next gaps: correct pin; complete action catalog; identity/vector semantics; reuse-aware state; recurrence/bijection; exact byte witness; tiny oracle equivalence.
- Human/resource-dependent gaps: none decisive at Stage0.
- Bounded near-Q1 gaps: multiple natural corpora, scale, statistics, broad collision closure, and artifact quality; these do not replace the N2 certificate.
- Gap that would invalidate the paper: no non-generic solver/guarantee remains after representing the complete native union, or representing it requires changing the object.
- Why this is calibration rather than novelty or baseline evidence: the papers calibrate contribution and evidence shape; upstream source and a separate bounded collision audit determine current actions/collisions.
- Why Tier B, if applicable, still closes same-object, latest-collision, fair-baseline, natural-evidence, full-cost and reproducibility gates: it is only conditional here. A confirmation PASS would require the unique revision certificate and retain `SEARCH_BOUNDED_OPEN` honesty; Stage A must close fidelity before any claim-bearing run.
