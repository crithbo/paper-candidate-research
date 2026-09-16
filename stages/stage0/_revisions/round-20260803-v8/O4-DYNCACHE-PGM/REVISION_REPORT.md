# O4-DYNCACHE-PGM — Stage 0 `REVISE_ONCE` hypothesis review

- **Revision recommendation:** `RECOMMEND_STAGE0_PASS_FOR_CLOSING_REVIEW`
- **Structural paper potential:** `TIER_A_Q1_POTENTIAL`
- **Current evidence readiness:** `DESIGN_READY__INVARIANT_AND_NATURAL_WITNESS_UNOBTAINED`
- **Revision budget:** consumed (`1/1`); no same-ID revision remains
- **Stage A/B authorization:** none; recommendation requires closing review

## Single atomic proposition

At fixed epsilon, page size and auxiliary-space cap, a page-local PDEC representation can preserve exact predecessor/output-sensitive range semantics while jointly bounding per-update page touches and dual-version peak space, leaving a full-ledger natural-stream residual against ESA, PGM, B+tree and ALEX.

**Structural falsifier:** ESA or another same-object source already supplies the same page-local/dual-version certificate and result, or the PDEC transition system cannot be coherently specified without weakening exact semantics. **Not a falsifier:** no current PDEC code, proof, second stream, or benchmark result.

## Structural paper potential

**Confirmed conditional potential.** ESA 2025 establishes the strongest same-problem theorem/artifact baseline and documents an engineering tension; PDEC changes representation and maintenance state, rather than selecting a pre-existing index. The paired page-touch and visibility/credit invariants form one meaningful N1+N2 research kernel. If verified with the mandatory strong baselines and natural chronological data, this has a Tier A algorithmic-systems shape.

## Current evidence readiness and claim ceiling

The official ESA artifacts are verified, but no PDEC implementation, proof/checker, replay or natural witness exists yet. These are acquisition/validation work for Stage A, not structural failure. Current ceiling is a falsifiable design hypothesis; it must not claim bounded updates, bounded space or a Pareto win.

## Fairness, collision and killer

- [ESA 2025](https://drops.dagstuhl.de/entities/document/10.4230/LIPIcs.ESA.2025.64) officially lists `DynamicLearnedIndex` and `LearnedIndexBench`; the obsolete code-not-found assertion remains corrected.
- PGM, ALEX and a B+tree are finite same-semantics baselines. Static PGM is a ceiling only; HIRE remains a paper-level subtractor until scope/code parity is established.
- No direct-fatal collision covers the page-local certificate plus bounded dual-version space kernel.
- **Minimal killer:** formalize the PDEC transition system and exhaustive small alternating-update checker first; then pin ESA artifact commands and compare one OSM interval plus an independent chronological stream under an exact oracle. Stop in Stage A on either invariant counterexample or full-ledger dominance.

## Non-relaxable design audit

| Gate | Status |
|---|---|
| Same object | exact order/range and fixed page/epsilon/space parameters defined |
| Latest collision | ESA artifact source reverified; no direct fatal |
| Fair strong baseline | ESA/PGM/ALEX/tree fixed as finite set |
| Natural input/evidence | OSM + independent chronological route; results pending |
| Full cost | cache/update/space ledger specified |
| Reproducibility | official artifact and open baseline route exists |
| Claim honesty | only conditional invariant/residual potential claimed |

## Closing handoff

Submit to closing review as `TIER_A_Q1_POTENTIAL`; no downstream action is created by this recommendation.
