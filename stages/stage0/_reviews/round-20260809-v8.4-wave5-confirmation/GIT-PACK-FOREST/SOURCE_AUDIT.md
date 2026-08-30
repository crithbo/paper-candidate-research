# GIT-PACK-FOREST Independent Source Audit

- Role: Stage-0 confirmation sentry
- Method: academic-research-suite reviewer/source-verification route
- Cutoff: 2026-08-09
- Source policy: paper originals and official/upstream sources
- Search status: SEARCH_BOUNDED_OPEN
- Experiments/downloads: none

## Package integrity

Discovery:

| File | Recomputed SHA-256 | Match |
|---|---|---|
| TOPIC_BRIEF_GIT-PACK-FOREST.md | 14A2649EF836E804A2A75F3FBD60946AE2FD2533E2A79ABA7B7D5CDA86886526 | yes |
| SOURCE_COLLISION_MATRIX.md | 74A7C80202DDD88CA83BF01635D0097E67A2A6B71EFD33B945E3EE0A7023C6C7 | yes |
| DISCOVERY_LOG.md | 693CE22852943396A226420A90AE449262BB32B730DE13D52BB0A01C4EE19C14 | yes |
| handoff.yaml | 68E38B40BFEC320519BB6CB92712E207FEAF12732B992ABE46AEF5208E66EDF5 | yes |

Discovery manifest file hash: 736638AED4B1C05137301A03C0D6FEF0FFA50E08CE7B11CA60AA5ADBC9980C12.

PRIMARY:

| File | Recomputed SHA-256 | Match |
|---|---|---|
| STAGE0_REPORT.md | AE7C1CB789DE7C9045A6EB3F0FE56B6AFCB2A0AA0CD20ADA55DC39E142E21840 | yes |
| Q1_COMPARATOR_MATRIX.md | 3400BA3BE683FCBD4099540406BC860420BD108E457B493F2A8C6135A9D0A499 | yes |
| SOURCE_AUDIT.md | 70D6FC4619063F01DC7318C1C08867C75BFFD78C28E93D0D6AEA33C7BFA7C185 | yes |
| handoff.yaml | 1FCD7ED16FBE38AC846FF0D669CCD8D3468C0F59F0B6A84C09124B952C19F226 | yes |

PRIMARY manifest file hash: 5BE1D727E9904794272B7593475841A1DB645B6D836F82036766F45ECA59214A.

Registry records the exact Discovery brief/handoff/manifest hashes. Provenance is RESOLVED_BY_MAINLINE_REGISTRATION.

## Verified decisive sources

| Source | Read scope and verified use | Boundary |
|---|---|---|
| Git pack-objects 2.55.0: https://git-scm.com/docs/git-pack-objects/2.55.0 | Official docs; self-containment, window/depth/memory, reuse, name hashes, path-walk, islands/incompatibilities | Grade A deployment behavior; no novelty proof |
| Git v2.55.0 pack-objects.c: https://github.com/git/git/blob/v2.55.0/builtin/pack-objects.c | Official tagged source; try_delta, find_deltas, path-walk, compute_write_order | Grade A implementation shape; absence of a joint optimizer is a bounded inference |
| Git pack format: https://git-scm.com/docs/pack-format | Official delta and self-containment sections | Grade A exact-object authority |
| Boffa et al., JSS 2025: https://upsilon.cc/~zack/research/publications/jss-2025-swh-compression.pdf | Author final paper; SWH object, PPC/MinHash, branching/pruning genealogy, Git v2.44 evaluation | Different collection/codec contract |
| Ouyang et al., WISE 2002: https://research.engineering.nyu.edu/~suel/papers/cluster.pdf | Author/institution original; optimum branching and cluster pruning | Foundational method subtractor, not Git pack/index |
| Finesse, FAST 2019: https://www.usenix.org/conference/fast19/presentation/zhang | Official proceedings page; feature-locality delta detection | Adjacent post-dedup object |
| LoopDelta, ATC 2023: https://www.usenix.org/conference/atc23/presentation/zhang-yucheng | Official page/paper; locality, base access, restore costs | Adjacent backup-chunk object |

No fabricated-reference or predatory-venue signal was found in the decisive set.

## Claim verification

| Claim | Verdict |
|---|---|
| Git 2.55 exposes the named union facets | VERIFIED_WITH_COMPATIBILITY_QUALIFIER |
| Git uses bounded local base search | VERIFIED |
| Tagged source proves absence of every joint optimizer | INFERENCE_ONLY__SEARCH_BOUNDED |
| Generic graph/branching/clustering is known | VERIFIED |
| JSS 2025 directly covers the frozen Git constructor | REJECTED |
| Exact Git-compatible global bounded-depth forest/layout direct fatal | NOT_FOUND_WITHIN_BOUNDARY |
| Candidate already has performance/residual evidence | REJECTED |

## Search log and source correction

Frozen-scope checks covered Git 2.55 options/tagged source/pack format; exact Git-pack global forest/graph/branching phrases; Boffa et al. 2025; Ouyang et al.; and official Finesse/LoopDelta material. No exact-object direct fatal was located; the negative result remains SEARCH_BOUNDED_OPEN.

PRIMARY labels the JSS paper “Zacchiroli et al.” Its first author is Antonio Boffa; Stefano Zacchiroli is a coauthor. Title, venue/year and DOI are consistent. Status: MINOR_SOURCE_LABEL_CORRECTION, no decision impact.

## Limitations

- The search is bounded and cannot support a priority claim.
- Source inspection establishes implemented actions, not the truth of the candidate hypothesis.
- No repository, pack, trace, solver or performance result was produced.
- The Stage-A route is a design/readiness assessment only.
- AI-assisted retrieval and analysis were used; decisive technical statements are anchored above.
