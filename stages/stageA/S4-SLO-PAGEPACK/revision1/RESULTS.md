# S4-SLO-PAGEPACK Stage A Revision 1 Results

## Material passport

- Assignment: `STAGEA-L1-20260809-S4-SLO-PAGEPACK-REVISION1`
- Atomic gate: `FAITHFUL_SAME_OBJECT_OBASE_MDK_COMPOSITION_GATE`
- Contract SHA-256: `86A55019EC2A55B8F1ACC83EDC2359E3D01FAED57D11CE3C0419C16EBEF389A4`
- Trace SHA-256: `E5D16D849BCD2E015C5E54A161E202241E7B7D25696F4055C742D51649DDF2A8`
- Primary/replay stable file SHA-256: `2CA67973C4A80A0470CF354B13F80B48F4802F995BD161CFDF474EFBEF40E19B`
- Stable object SHA-256: `4A3CE1B1088554F345D03025B7DAA7D2D7CADCDE246A87869806CD9D724500C9`
- Validator: `all_nonvolatile_checks_pass=true`
- Scientific decision: `STOP_RECOMMENDED_FROZEN_NARROW_MECHANISM`

## Primary criterion

The preregistered criterion is `STRICT_LEGAL_FULL_COST_RECLAIMED_BYTE_NONDOMINATED_RESIDUAL_AT_FIXED_SLO`. A positive epoch must be legal, remain within the same 5% windowed promotion-rate cap, reclaim strictly more time-averaged fast-tier bytes than the faithful composition, and be no worse on every registered non-common deterministic cost component.

No epoch satisfies the full criterion (`0/3`). This result is deliberately more precise than “the composition absorbs all candidate benefit”: benefit absorption is false in epochs 1 and 3, but the candidate's exact planning vector prevents either benefit residual from being full-cost non-dominated. Epoch 1's fixed AGE replay also violates its SLO, so it is not counted as a legal comparator benefit.

| Epoch | Initial pages | Candidate avg/end reclaim | Candidate SLO | OBASE→AGE avg/end reclaim | Comparator SLO | Raw avg-byte residual | Full-cost positive |
|---:|---:|---:|---|---:|---|---:|---|
| 1 | 3 | 4,096 / 4,096 B | PASS, max PR 0 | 1,092 / 0 B | FAIL, max PR 1.0 | +4,096 B against legal-zero fallback | no |
| 2 | 2 | 0 / 0 B | PASS, max PR 0 | 4,232 / 12,288 B | PASS, max PR 0 | -4,232 B | no |
| 3 | 3 | 4,096 / 4,096 B | PASS, max PR 0 | 1,501 / 4,096 B | PASS, max PR 0 | +2,595 B | no |

The byte metric is the mean reclaimed fast-tier capacity after each of 30 logical scan windows (1,000 trace rows per window). No work-to-byte conversion is used.

## Frozen configurations actually replayed

- Candidate: exhaustive joint object-to-page assignment and initial slow-page subset, selected using only the previous epoch. Slow pages promote on first later access; the action does not tune or change after seeing evaluation data.
- OBASE layout: `NEW/HOT/COLD`, CIW threshold 3, separate deterministic SAMA-style temperature runs, Guide/SODA access metadata, and boundary ODM relocation.
- MDK-compatible policy: named `AGE`, fixed `R_A=20` logical scan intervals, with the 5% per-window promotion-rate target. This is the 20-scan ratio of the MDK paper's Linux AGE setting; the trace has no wall-clock timestamp, so no seconds/minutes claim is made.
- Offline OPP was not used as a deployment baseline because the MDK paper's OPP is a two-pass future-aware ceiling.

## Full deterministic cost vector

There is no scalar total. Bytes, retained bytes, layout footprint, and counted events remain separate.

| Epoch | Method | Migration | Layout footprint / fragmentation | Retained metadata | States / transitions / target subsets | Capacity probes | Policy checks / promotions / demotions |
|---:|---|---:|---:|---:|---:|---:|---:|
| 1 | Candidate | 2,152 B | 12,288 / 4,384 B | 483 B | 195,571 / 204,771 / 1,018,512 | 204,788 | 0 / 0 / 0 |
| 1 | OBASE→AGE | 5,856 B | 12,288 / 4,384 B | 497 B | 0 / 0 / 0 | 39 | 90 / 1 / 1 |
| 2 | Candidate | 0 B | 8,192 / 352 B | 482 B | 67 / 122 / 24 | 125 | 0 / 0 / 0 |
| 2 | OBASE→AGE | 7,840 B | 16,384 / 8,544 B | 502 B | 0 / 0 / 0 | 28 | 120 / 0 / 3 |
| 3 | Candidate | 2,568 B | 12,288 / 4,384 B | 483 B | 195,571 / 204,771 / 1,018,512 | 204,781 | 0 / 0 / 0 |
| 3 | OBASE→AGE | 3,712 B | 12,288 / 4,384 B | 497 B | 0 / 0 / 0 | 28 | 90 / 0 / 1 |

Common replay rows are 30,000 per method/epoch. Selected operation rows are 15, 3, and 6. Fallback events and fallback/rollback bytes are zero for all methods. All copy bytes, guide loads, TAG/ATC events, CAS attempts, hashes, comparisons, classifications, probes, page-window checks, promotions and demotions are retained in `results/primary_stable.json`.

The candidate fails the no-worse cost test in every epoch on exact states, exact transitions, target-subset evaluations, capacity probes and hash invocations. This is why the positive raw byte differences in epochs 1/3 are not strict full-cost residuals.

## Pointer-semantic relocation replay

Each of original, candidate and composition received a separate heap/Guide state. Every replay executed `INACTIVE→PREPARE→ACTIVE→INACTIVE_COMPLETE`, checked TAI/handle drain, and for every moved object executed guide load, ATC check, lock CAS, capacity allocation, payload copy, commit CAS and old-slot retirement. GET/SET/DELETE created/destroyed TAGs and incremented/decremented ATC. No constant legality flag or shared precomputed transcript was used.

| Epoch | Selection SHA-256 | Semantic SHA-256 | Final-state SHA-256 | Candidate relocation SHA-256 | Composition relocation SHA-256 |
|---:|---|---|---|---|---|
| 1 | `9F65F9C8...FEE9B` | `C07003D3...78061` | `DF636F56...C388E` | `2C0D0233...72C5` | `8B22E3B5...8CFA` |
| 2 | `FE44C591...428D7` | `08A04AD4...2599` | `B3C3E355...390F` | `4712AE0B...BE91` | `21FF3BA4...4BED` |
| 3 | `3E403E89...224A6` | `6F87EA2E...D63` | `8A037142...02EE` | `10A601FC...4580` | `85F536F3...9976` |

Full hashes are in the stable JSON. Across independently executed method states, semantic and final-state hashes are equal within each epoch; relocation hashes are method-specific as expected. All handles drain, all locks clear, capacity remains legal, and there are no oversize/fallback events.

## Volatile resource measurements (primary only)

Candidate exact planning elapsed 73.73 ms, 1.83 ms and 80.18 ms. OBASE layout elapsed 0.073 ms, 0.041 ms and 0.062 ms. Peak recorded RSS was 161,087,488 B (about 153.6 MiB). These measurements are supporting evidence only and are excluded from stable replay equality.

## Reproducibility

Primary and replay stable files are byte-identical. The validator separately confirms input hashes, selection, exact optimum, composition, semantic digests, relocation-transition digests, cost vectors, decisions and Stage B boundary. The final validation artifact SHA-256 before manifest generation is `75D311672EC3F2B134AAFF271F39A767A208270CD933CA7B3A70B70286F3AF4E`.

## Claim boundary

Supported: on the three frozen reduced MetaKV epochs, under this explicit pointer-safe replay and the frozen OBASE→AGE comparator, the candidate has no strict legal full-cost non-dominated residual (`0/3`). This consumes the sole Stage A scientific revision and supports a narrow scientific STOP recommendation.

Unsupported: unbounded impossibility, all OBASE/MDK configurations, production performance, wall-clock SLO equivalence, a different solver, another trace, or a paper-wide conclusion.

