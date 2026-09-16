# S1 Discovery log — Wave1

- Assignment: `DISCOVERY-S1-20260809-V8.4-WAVE1`
- Lane: `DISCOVERY-S1-BOUNDARY-CONTRADICTION`
- Date/cutoff: 2026-08-09
- Scope: O1 assumption failure and O6 interface/semantic-boundary contradiction, using only accepted production method `v2/v8.1`.
- Explicit exclusion: TLS-blocked two-axis `v8.2r2` was not used, cited as a discovery result, or treated as calibrated.
- No experiment, download, benchmark execution, Stage 0/A/B creation, master-file edit, or registry edit was performed.

## Search families and outcomes

1. **Mobile semantic scheduling / XPU coexistence.** Searches: `mobile semantic gap scheduling 2026 OSDI`, `NPU UI jank shared resource OSDI 2026`, and official USENIX pages. MUSched supplies a production-scale interaction-semantic scheduler; Sereno and XSched absorb software/XPU policy variants. The remaining request-to-first-arbiter direction is the pre-existing S1-O6 reserve and was excluded by assignment.
2. **GPU ownership versus asynchronous graphs.** Searches: `GPU Rust ownership asynchronous CUDA graph 2026`, author/NVIDIA pages, and public artifact. Fearless Concurrency/cuTile Rust directly covers host and kernel ownership contracts plus async/replay composition. No admissible residual beyond checker/wrapper/API rename remained.
3. **Semantic-cache offline/deployment contradiction.** Searches: `semantic caching calibration deployment 2026`, `freshness semantic cache 2026`, and `asynchronous verified semantic cache`. Calibration metrics, temporal freshness, and asynchronous verification are current direct mechanisms; a merely new evaluation metric or threshold would not qualify.
4. **Program/memory-controller information loss.** Searches: `stream guided hardware software memory controller 2026`, `fine grained stream descriptor multi channel DRAM`. InterStellar 2.0 directly performs stream descriptor propagation, per-channel segmentation, and DRAM policy steering; it absorbs the generic cross-layer mechanism.

## Verification discipline

- Recorded technical statements rely on official USENIX/NVIDIA/project pages, author-linked arXiv records, an official repository, or the publisher DOI page.
- Preprints are treated as fresh collision evidence, not as peer-review quality proof.
- No negative result is inferred from unavailable hardware, artifact, or resource. Each drop is due to same-object absorption, lack of an independently defined decision structure, or the explicit non-revival boundary.

## Outcome

`ZERO_PROPOSALS`. None reaches the required `TIER_B_Q2_VIABLE` structural threshold after current collision, baseline, natural-evidence, full-cost, and non-revival checks. This is a valid small-batch result; no TOPIC_BRIEF is emitted.
