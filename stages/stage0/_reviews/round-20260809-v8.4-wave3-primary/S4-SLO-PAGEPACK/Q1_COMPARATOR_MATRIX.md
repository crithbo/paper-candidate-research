# S4-SLO-PAGEPACK Q1/Q2 Paper Calibration

- Stage: `STAGE0`
- Candidate venue family: systems/data-management/memory-management
- Calibration status: `PARITY_CONDITIONAL`
- Quality tier: `TIER_B_Q2_VIABLE`
- Search/cutoff date: `2026-08-09`

## Reference set

| Role | Paper | Venue/status | Quartile/equivalent basis | Year/source | Read scope | Why selected |
|---|---|---|---|---|---|---|
| CONTRIBUTION_SHAPE_ANCHOR | OBASE | OSDI 2026, official proceedings | top systems venue / Q1-equivalent | USENIX official page | abstract+metadata | same pointer-based object layout and runtime relocation |
| EVALUATION_ANCHOR | MDK | OSDI 2026, official proceedings | top systems venue / Q1-equivalent | USENIX official page | abstract+metadata | SLO-constrained reclamation objective, MPC and policy ceiling |
| DOMAIN_NEIGHBOR | HADES / Tidying Up the Address Space | DIMES 2025, ACM workshop | closest precursor, not Q1 calibration alone | official author PDF | paper-level targeted read | object hot/cold organization, pointer migration, natural page fragmentation |
| BOUNDARY_OR_NEGATIVE_ANCHOR | BRUMM | ECRTS 2026, LIPIcs | strong real-time systems neighbor | Dagstuhl official page | abstract+metadata | reclamation latency accounting, but L4Re mappings rather than object page packing |

## Comparator matrix

| Dimension | Candidate | Anchor evidence | Gap | Current disposition |
|---|---|---|---|---|
| Problem importance/readership | reclaim fast-tier bytes under SLO | OBASE: datacenter overprovision; MDK: SLO-constrained reclamation | same audience | plausible |
| Contribution type | N2 constrained packing | OBASE N1 system; MDK framework/policy tools | closest works are OSDI strength | Tier B only until residual shows breadth |
| Nearest-prior delta | layout + SLO/migration joint decision | OBASE layout; MDK policy | must resist composition | executable Stage A gap |
| Algorithm/mechanism substance | flow/Lagrangian/rounding on page composition | temperature grouping; policy/MPC | nontrivial only if not threshold wrapper | conditional |
| Baseline strength/fairness | mandatory composition + exact ceiling | both anchors individually strong | composition must be faithfully replayed | gate frozen |
| Natural workload/platform | CacheLib/cacheMon CPU route | OBASE uses production traces; HADES uses structures/YCSB | need frozen same-object trace/mobility model | readiness risk |
| Full-cost coverage | move/pointer/CPU/backend/fault costs | OBASE relocation; MDK policy cost | full combined ledger absent today | planned |
| Main result/statistics | no claim | OBASE/MDK present evaluation | missing by design at Stage 0 | later evidence |
| Ablation/mechanism evidence | no-gain regions + exact reduced ceiling | OBASE/MDK provide mechanisms | must show residual driver | executable |
| Scale/generalization | cache structures/epochs hypothesis | OBASE ten structures/backends | no current breadth | Tier B |
| Failure boundary | homogeneous/drifting/no mobility/tight SLO | HADES/OBASE scope limitations | well-defined | pass |
| Artifact/reproducibility | public CacheLib/cacheMon route | OBASE/MDK artifacts/status differ | need frozen slice/hashes | finite route |

## Reviewer-shape assessment

- Editor/venue-fit view: Q2 systems/data-management paper is credible if the contribution is positioned as an optimizer for a fixed backend, not a new memory manager.
- Methodology view: exact reduced solver and faithful composition baseline make the decisive claim falsifiable; an oracle is a ceiling, not a deployment baseline.
- Domain-contribution view: OBASE is unusually close. The contribution survives only as full-cost joint packing, never as “more object reorganization.”
- Devil's-advocate view: if OBASE's guide/relocation can implement the exact packing with its published action at no additional cost, or MDK can consume that layout and absorb all points, the candidate is dead. No current source establishes that fact.

## Decision

- Quality tier: `TIER_B_Q2_VIABLE`
- Status: `PARITY_CONDITIONAL`
- Closed gaps: exact object, algorithmic decision space, finite fair baselines, strong union, full-cost contract, CPU killer.
- Executable next gaps: source-bound mobility metadata, OBASE/MDK composition replay, residual/no-gain table, small-instance solver check.
- Human/resource-dependent gaps: concurrency-safe production integration; not a Stage 0 stop gate.
- Bounded near-Q1 gaps: cross-structure/trace breadth, production integration and correctness validation, stronger approximation/theory or unusually large robust residual.
- Gap that would invalidate the paper: composition fully absorbs joint packing at same full cost, or candidate is only a threshold/selector.
- Why this is calibration rather than novelty or baseline evidence: venue shape establishes expected contribution/evidence level; it does not prove absence of a collision or baseline outcome.
- Why Tier B still closes gates: same object and full-cost contract are explicit; current one-source audit finds no direct fatal; composition is mandatory; public natural route is finite; reproducibility conditions are frozen for Stage A. Current missing results remain readiness, not a relaxed gate.
