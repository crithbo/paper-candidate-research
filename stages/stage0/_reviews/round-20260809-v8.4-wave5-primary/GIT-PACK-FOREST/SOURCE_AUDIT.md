# GIT-PACK-FOREST Source and Collision Audit

- Role: independent Stage 0 PRIMARY
- Cutoff: `2026-08-09`
- Search status: `SEARCH_BOUNDED_OPEN`
- Source policy: technical decisions use upstream Git documentation/source, paper originals, official proceedings pages or author-hosted final manuscripts.

## Input integrity

| Input | SHA-256 | Status |
|---|---|---|
| `TOPIC_BRIEF_GIT-PACK-FOREST.md` | `14A2649EF836E804A2A75F3FBD60946AE2FD2533E2A79ABA7B7D5CDA86886526` | matches mainline |
| `handoff.yaml` | `68E38B40BFEC320519BB6CB92712E207FEAF12732B992ABE46AEF5208E66EDF5` | matches mainline |
| `HASH_MANIFEST.sha256` | `736638AED4B1C05137301A03C0D6FEF0FFA50E08CE7B11CA60AA5ADBC9980C12` | file hash matches mainline; listed Discovery inputs recomputed 4/4 by mainline |

## Primary-source ledger

| Source | Verified fact used | Collision role | Boundary |
|---|---|---|---|
| [Git `pack-objects` documentation](https://git-scm.com/docs/git-pack-objects), version 2.55.0, updated 2026-06-29 | self-contained pack semantics; window/depth/memory; name hash v1/v2; path-walk two-pass compression; delta reuse; delta islands and incompatibilities | `DEPLOYMENT_BASELINE` / `DIRECT_SUBTRACT` | documents actions, not a globally optimized forest/layout objective |
| [Git `pack-objects.c` upstream source](https://raw.githubusercontent.com/git/git/master/builtin/pack-objects.c) | same-type `try_delta`; depth and bounded-window loop; per-path regions followed by type/size pass; delta-family write order | `DEPLOYMENT_BASELINE` / `DIRECT_SUBTRACT` | current master was audited for action-space shape; Stage A must pin an exact commit/tag |
| [Git pack heuristics](https://www.kernel.org/pub/software/scm/git/docs/technical/pack-heuristics.html) | name/type/size sorted candidate search, sliding window and separate physical write ordering | genealogy and mechanism subtractor | explanatory upstream technical document; current source takes precedence where changed |
| [Git pack format](https://git-scm.com/docs/pack-format) | legal pack/index and delta representation boundary | exact-object authority | no constructor novelty claim |
| [Git `index-pack.c` upstream source](https://github.com/git/git/blob/master/builtin/index-pack.c) | native pack verification and delta-chain checking implementation | oracle/validation boundary | checker is not the paper contribution |
| [Zacchiroli et al., JSS 2025 author manuscript](https://upsilon.cc/~zack/research/publications/jss-2025-swh-compression.pdf) | Git pack configurations and generic PPC/MinHash/graph source-collection compression genealogy | `DIRECT_SUBTRACT` for generic graph/PPC claims; calibration | broader Software Heritage collection and other codecs are not the same one-repository Git pack object |
| [Finesse, FAST'19 official page](https://www.usenix.org/conference/fast19/presentation/zhang) | feature-locality resemblance detection and throughput/compression evaluation | `METHODOLOGICAL_ADJACENT` | post-deduplication chunks, not Git pack semantics |
| [DeepSketch, FAST'22 official page](https://www.usenix.org/conference/fast22/presentation/park) | learned reference search for delta compression | `METHODOLOGICAL_ADJACENT` | different object, information and learned mechanism; not equal baseline |
| [LoopDelta, USENIX ATC'23 official page](https://www.usenix.org/conference/atc23/presentation/zhang-yucheng) | locality, base access and restore cost jointly matter | `METHODOLOGICAL_ADJACENT` / evaluation anchor | deduplicating backup storage, not Git format |

## Current Git action-space audit

The complete fair baseline cannot be “Git default.” It must include a finite preregistered set spanning:

- `--window`, `--depth`, `--window-memory` under equal CPU/RSS budgets;
- `--name-hash-version=1/2` where legal;
- `--path-walk`, which first compresses path regions and then performs the ordinary cross-path pass;
- object/delta reuse variants under the same initial state;
- delta islands only when their ref-reachability constraint belongs to the frozen object/mode, noting that path-walk and islands are incompatible;
- the native family-aware write order and strict Git validators.

Upstream source shows that the normal search still evaluates a bounded prior window and greedily retains the best base, while enforcing type and depth. The write phase constructs delta-child/sibling families after selection. This supports—but does not prove—the inference that a joint global forest/layout action remains outside the current implementation.

## Collision and facet decision

- `DIRECT_FATAL`: not found in the bounded primary-source search.
- `DIRECT_SUBTRACT`: all claims based on sorted sliding windows, path-aware grouping, name-hash changes, larger window/depth/memory, reuse/islands, generic content-similarity graphs, PPC/MinHash and generic delta-reference search.
- `METHODOLOGICAL_ADJACENT`: Finesse, DeepSketch and LoopDelta; valuable mechanism/evaluation subtractors but different exact objects.
- `SEARCH_BOUNDED_OPEN`: a Git-format-preserving, bounded-depth global delta forest jointly costed with legal write layout and random reconstruction under the same one-pack contract.

The residual must be killed if selected useful edges can be reproduced by any member of the finite current-Git union. A generic forest/MST/cluster algorithm without Git depth, order, validation and full-cost constraints is not residual novelty.

## Reproducibility and claim ceiling

- Current evidence: source and design audit only; no candidate, corpus or numerical result.
- Acquisition route: public CPU build; pinned Git commit and repository commits; hashed manifests; scripts/commands and raw per-repository ledgers; deterministic fallback and strict validators.
- Current claim ceiling: “credible conditional N2 residual with a decisive executable test.” It is not “better compression,” “novel global delta compression,” or “proven outside Git.”
- Registry finding: the topic was not present in the registry snapshot searched at PRIMARY start. Mainline should correct or explain this before accepting a transition; the scientific report remains valid.

