# Rust history-aware CGU partition — Q1/Q2 Shape Calibration

- Stage: `STAGE0`
- Status: `PARITY_CONDITIONAL`
- Conditional tier: `TIER_B_Q2_VIABLE`

| Role | Anchor | Status / relevance |
|---|---|---|
| Contribution-shape | Rust RFC 1298, *Incremental Compilation* | official design anchor: modularization/CGU structure is an incremental-compiler decision, not just a cache switch. |
| Domain / implementation | `rustc_monomorphize::partitioning` official docs/source | current exact constructor, stable/volatile heuristic and native legality comparator. |
| Evaluation | Rust compiler/Cargo official codegen/profile documentation | pins legal count, incremental, LTO and profile configuration grid. |
| Boundary | generic graph partitioning and incremental compilation work | methodological subtractor; not same Rust action or guarantee without a mapping. |

| Dimension | Candidate after gate | Required later evidence | Current status |
|---|---|---|---|
| Contribution | history-aware legal mono-item partition | non-generic state/guarantee | revision |
| Strong baseline | full rustc/Cargo union | exact pin/config mapping | revision |
| Natural structure | versioned crate cohorts | holdout law versus shuffled control | Stage A |
| Full cost | build/rebuild/code-quality/storage ledger | same-profile measurement | Stage A |
| Reproducibility | checksums/lockfiles/rustc pin | finite closure | plausible |

This matrix is venue-shape calibration only. It neither proves novelty nor treats missing measurements as failure.
