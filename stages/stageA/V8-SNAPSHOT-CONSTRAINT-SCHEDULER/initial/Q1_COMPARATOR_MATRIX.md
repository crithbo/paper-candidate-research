# V8-SNAPSHOT-CONSTRAINT-SCHEDULER Q1/Q2 Paper Calibration

- Stage: `STAGEA`
- Candidate venue family: software systems / managed runtimes / VM implementation
- Calibration status: `PARITY_NOT_PLAUSIBLE` for Q1; inherited conditional Q2 shape is resource-blocked
- Quality tier: inherited `TIER_B_Q2_VIABLE__CONDITIONAL_STATIC_CERTIFICATE`
- Search/cutoff date: `2026-08-11`; no new search in this resource-failed assignment

## Reference set

| Role | Paper/source | Read scope in frozen upstream | Relevance here |
|---|---|---|---|
| CONTRIBUTION_SHAPE_ANCHOR | Basso et al., “Heap-Snapshot Matching and Ordering using CAHPs,” OOPSLA 2025 | inherited primary source audit | broad heap-ordering/startup subtractor; different VM/profile/format |
| EVALUATION_ANCHOR | Basso et al., “Improving Native-Image Startup Performance,” CGO 2025 | inherited primary source audit | full-pipeline startup/page-fault evaluation anchor |
| DOMAIN_NEIGHBOR | Shuf et al., OOPSLA 2002 locality work | inherited metadata/contribution boundary | long-standing heap-locality genealogy |
| IMPLEMENTATION_BOUNDARY | pinned V8 serializer/deserializer source | inherited source audit at `c635f0d...` | same-object native action and reader boundary |

## Comparator matrix

| Dimension | Frozen candidate/comparator requirement | Current StageA evidence | Gap/disposition |
|---|---|---|---|
| Same object | matching V8 writer/reader, identical graph/aliases/partitions/JS behavior | static definition only | pinned executable chain missing |
| Algorithm substance | V8-DSP bounded-interface exact frontier/certified cap failure | static certificate only | no implementation/oracle replay |
| Strong union | stock LIFO + complete flags/partitions/zlib + stable queue + finite scalar grids | frozen, not executed | resource blocked |
| Native fidelity | actual writer bytecodes and stock deserializer | none | preclaim item 1 blocked |
| Natural workload | 20–50 official V8/Node carriers | 0 frozen, 0 run | prohibited before preclaim PASS |
| Full cost | planner, mksnapshot, raw/zlib, decompression, deserialization/startup, RSS/pages, verification/fallback | ledger frozen only | no measurements |
| Mechanism result | action coverage/state reduction/frontier outside union | none | no claim-bearing observation |
| Reproducibility | pinned source/build/carriers/scripts/hashes | upstream hashes closed; runtime missing | blocker package only |

## Decision

- Quality tier: inherited conditional `TIER_B_Q2_VIABLE`; not re-adjudicated by resource failure.
- Status: `PARITY_NOT_PLAUSIBLE` for Q1.
- Closed gaps: exact object definition, static action grammar, bounded state/guarantee, fair-union design, full-cost ledger design.
- Executable next gaps: all five ordered preclaim obligations, then frozen natural/full-cost killer.
- Gap that would invalidate the paper: native illegality, state/frontier mismatch, current-union absorption, or no strict p50/p90 full-cost residual.
- Resource failure is not novelty, baseline or scientific negative evidence.
