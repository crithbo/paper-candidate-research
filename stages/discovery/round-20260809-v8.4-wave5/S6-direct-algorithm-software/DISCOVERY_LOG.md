# Discovery log — DISCOVERY-S6-20260809-V8.4-WAVE5

## Scope and method boundary

- Assignment directory only: `stages/discovery/round-20260809-v8.4-wave5/S6-direct-algorithm-software`.
- Used: accepted and calibrated `DISCOVERY_METHOD_V2_V8_1` / O7 v2 backtest.
- Explicitly not used: TLS-blocked two-axis `v8.2r2`.
- Retrieval boundary: paper originals plus official/upstream Git documentation/source/artifact, current through 2026-08-09.
- No E-drive source was used. No experiment, benchmark, pack build, Stage 0/A/B creation, master-file edit, or status transition occurred.

## Baseline-residual-first sequence

1. Selected a CPU-only public object with a machine-checkable correctness contract: one self-contained Git pack/index for a fixed repository object set.
2. Froze the current baseline union before proposing a method: Git's sorted bounded-window delta construction, depth/memory limits, current ordering modes, and only semantically applicable reuse/island modes.
3. Charged its observable full cost (writing, pack/index bytes, strict verification, construction CPU/RSS and reconstruction) and the prospective candidate's graph/optimization work.
4. Subtracted generic delta graph/PPC work using JSS 2025, rather than treating it as an unexplored seed.
5. Retained only the possible Git-format constrained sparse-forest residual. It receives `PROPOSE_STAGE0`, not a Stage 0 creation or novelty verdict.

## Primary-source observations

- Upstream [git-repack](https://git-scm.com/docs/git-repack) states that objects are sorted and compared within `--window`; `--depth` bounds delta chains and deep chains harm unpacking. It also documents memory and multi-pack constraints.
- Upstream [pack heuristics](https://www.kernel.org/pub/software/scm/git/docs/technical/pack-heuristics.html) explains the local sliding-window delta search and the separate recency-oriented physical write order.
- Upstream [pack format](https://git-scm.com/docs/pack-format) defines OFS/REF deltas, base reconstruction, and the stored-pack self-containment condition.
- JSS 2025 is the closest paper subtraction: it inspects Git v2.44's sorted sliding-window chains, evaluates enlarged window/depth settings, and separately studies PPC/MinHash graph routes for source-code collections. Its results are not imported as candidate evidence.

## Screened outcomes

| Seed | Outcome | Reason |
|---|---|---|
| Git-compatible bounded delta forest and layout | `PROPOSE_STAGE0` | Frozen same-object residual, nontrivial N2 decision structure, strict verifier and finite CPU killer; structural potential Tier B, readiness moderate. |
| Cross-repository archive delta graph/PPC | Drop | JSS 2025 directly covers the source-collection object; Git pack is a changed object. |
| Window/depth/thread/compression adjustments | Drop | Current action union / ordinary parameter tuning. |
| External path ordering then unchanged packer | Drop | Wrapper/controller, not direct N2 construction. |

## Evidence honesty

No performance, compression, memory, access, or correctness result was produced in this assignment. `current_evidence_readiness` is a route assessment only. Failure to implement or absent hardware would not itself defeat structural potential; the retained candidate nevertheless has a finite public CPU Stage A killer.
