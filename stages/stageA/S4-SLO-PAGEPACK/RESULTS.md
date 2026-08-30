# S4-SLO-PAGEPACK Stage A Results

## Material Passport

- Assignment: `STAGEA-L1-20260809-S4-SLO-PAGEPACK-INITIAL`
- Verification: `VERIFIED_BY_BYTE_IDENTICAL_DUAL_REPLAY`
- Stable digest: `55A97297FB0A00465CB6414EC7C6F4F2B3BFD57A1BE3F0FFF6AAE8B0FBFB2FFA`
- Decision: `STOP`

## Primary criterion

`STRICT_FULL_COST_RECLAIMED_BYTE_NONDOMINATED_RESIDUAL_AT_FIXED_SLO`

No epoch is positive. The faithful composition envelope absorbs the exact candidate in all three epochs.

| Epoch | Rows | op_count | Cap work | Initial pages / payload | Candidate actual-feasible reclaim | Composition envelope reclaim | Residual | Legality |
|---:|---:|---:|---:|---:|---:|---:|---:|---|
| 1 | 30,000 | 59,337 | 296,686 | 3 / 7,904 B | 0 B (planner infeasible) | 12,288 B | -12,288 B | PASS |
| 2 | 30,000 | 64,721 | 323,605 | 2 / 7,840 B | 8,192 B | 8,192 B | 0 B | PASS |
| 3 | 30,000 | 57,659 | 288,295 | 3 / 7,904 B | 0 B (planner infeasible) | 12,288 B | -12,288 B | PASS |

## Full-cost comparator ledger

| Epoch | Method | Actual full work | Planning work | Migration bytes / objects | Actual remote work | Page-reclaim work | Fast/slow fragmentation | Reclaimed bytes |
|---:|---|---:|---:|---:|---:|---:|---:|---:|
| 1 | Exact candidate | > cap; no selected point | 400,342 | n/a | n/a | n/a | n/a | 0 |
| 1 | Faithful composition envelope | 30,512 | 70 | 4,208 / 3 | 148 | 192 | 0 / 4,384 B | 12,288 |
| 1 | Costed actual-access exact ceiling | > cap; no selected point | 400,342 | n/a | n/a | n/a | n/a | 0 |
| 2 | Exact candidate | 30,333 | 189 | 0 / 0 | 16 | 128 | 0 / 352 B | 8,192 |
| 2 | Faithful composition envelope | 30,207 | 63 | 0 / 0 | 16 | 128 | 0 / 352 B | 8,192 |
| 2 | Costed actual-access exact ceiling | 30,333 | 189 | 0 / 0 | 16 | 128 | 0 / 352 B | 8,192 |
| 3 | Exact candidate | > cap; no selected point | 400,342 | n/a | n/a | n/a | n/a | 0 |
| 3 | Faithful composition envelope | 30,386 | 65 | 2,576 / 4 | 40 | 192 | 0 / 4,384 B | 12,288 |
| 3 | Costed actual-access exact ceiling | > cap; no selected point | 400,342 | n/a | n/a | n/a | n/a | 0 |

Each full-work value includes 30,000 common trace-handling units plus the displayed planning, migration-copy, pointer-validation, metadata-update, page-reclaim, and remote-access units. Retained item metadata is 384 B per epoch and is equal for all methods.

## Exact search and faithful baseline work

| Epoch | Exact states | Exact transitions | Complete layouts | Exact planner work | Baseline thresholds | Baseline target points | Baseline total envelope work count |
|---:|---:|---:|---:|---:|---:|---:|---:|
| 1 | 195,571 | 204,771 | 127,314 | 400,342 | 7 | 28 | 522 |
| 2 | 67 | 122 | 6 | 189 | 4 | 12 | 310 |
| 3 | 195,571 | 204,771 | 127,314 | 400,342 | 5 | 20 | 384 |

The baseline envelope work count is the audit sum across every threshold and target; each selected point is charged only the work used to produce that causal threshold layout and target, as fixed in the contract.

## Measured execution resources (primary)

| Epoch | Exact elapsed | Exact CPU user/system | Exact peak RSS | Composition elapsed | Composition peak RSS |
|---:|---:|---:|---:|---:|---:|
| 1 | 538.623 ms | 563 / 16 ms | 150,073,344 B | 0.302 ms | 149,385,216 B |
| 2 | 0.116 ms | timer resolution: 0 / 0 ms | 153,395,200 B | 0.082 ms | 153,419,776 B |
| 3 | 551.920 ms | 547 / 31 ms | 164,171,776 B | 0.116 ms | 163,606,528 B |

Total Stage A directory size before final reports/manifest was 10,743,947 B, far below 4 GiB. Claim-bearing execution used about 1.1 CPU-seconds, far below 4 CPU-hours. No GPU or exclusive device was used.

## Legality and semantics

All epochs satisfy page capacity, adapter mobility, epoch-boundary-only relocation, zero live handles during relocation, and zero oversized in-epoch replacements. Original, candidate, composition, and ceiling semantic hashes are identical per epoch:

| Epoch | Semantic SHA-256 |
|---:|---|
| 1 | `637FD812BC5F292527EA4DC8594605D9D7F6F94CC825B6C3FA4C3C4E134FF796` |
| 2 | `60F115C9EEEB241BEE87FEC6D630456487AAA8B924BE78BFF31FAAD93AE219D1` |
| 3 | `B50C8CDE06D6A754477A1FA44FEF615A54E2C7D99C9D2C2946AD7B56AA5EA48E` |

## Reproducibility

- Primary nonvolatile file SHA-256: `C4FB253A84F118D828CDACCF7E5F8024EA5FA939C1CD79C86EFBBDE64D942F6E`
- Replay nonvolatile file SHA-256: `C4FB253A84F118D828CDACCF7E5F8024EA5FA939C1CD79C86EFBBDE64D942F6E`
- Byte-identical: yes
- Semantic hashes equal: yes
- Candidate/composition/ceiling optima equal: yes
- State/transition/work counters equal: yes
- Validator: `all_nonvolatile_checks_pass=true`

## Interpretation boundary

This is decisive for the frozen Stage A premise and supports `STOP`. It is not an unbounded theorem and does not claim the candidate can never win on another object, trace, cap, cost model, or production runtime.

