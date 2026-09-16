# Reproducibility and selector-identity audit

## Coefficient domain

`SOURCE_BOUNDED_DOMAIN.json` correctly separates identified first-party/author-measured GH200 facts from unidentified allocation, PTE/fault, page-amplification, overlap, synchronization, delay, and planner terms. The inherited grid is labeled `IDENTITY_DIAGNOSTIC_ONLY_NOT_PLATFORM_EVIDENCE`; its row frequency is not used as a probability, calibration, or performance claim.

The coefficient box is only partially identified, but this does not leave the atomic gate undecided. The absorption proof is universal over every finite nonnegative shared completion because both rules consume the same completed action costs.

## Same information, action, and decision cost

Static inspection confirms:

1. Candidate and selector receive the same frozen region tuple and coefficient tuple.
2. Both evaluate the identical action set `B0_SYSTEM`, `B1_UVM_DEMAND`, `B2_UVM_PREFETCH`, and `B3_EXPLICIT` with the inherited `action_cost` function.
3. Both choose a per-region minimum with the same lexical action-id tie-break.
4. Both are charged `total_bytes × planner_overhead_fraction` as extraction/decision cost.
5. Neither receives future information; unknown page/runtime terms are shared completions and cannot create a differential.

Therefore, for every region `r` and admissible completion `p`, the selected action and summed full cost are identical. A cheaper lookup implementation would only strengthen the selector.

## Natural-program carrier

The diagnostic carrier remains the same source-locked Altis commit `042e2926d1fe9a5ea5b3e2d659b75bf925b152cc`:

- `ALTIS_PATHFINDER_SIZE1`: immutable wall/seed-row structures plus GPU ping-pong state;
- `ALTIS_BFS_65536`: immutable graph nodes/edges plus frontier state and continuation flag.

These are natural public program structures for E1 analytical extraction only. No natural GH200 performance evidence is claimed.

## Double replay and row-level result

The delivered two replays and two independent review-lane replays are byte-identical:

- summary SHA-256: `FA290B1AC03F0A4E04A23F5FDCD2444CF5D0E11F68658045E716B7933E6D3D02`;
- control-table SHA-256: `B55C68AE647196FD1B1F45070A8E3760DF2B963A46A20F16659AD46F185017F2`.

Independent row-level parsing confirms:

| Program | Rows | Plan mismatch | Full-cost mismatch | Strict residual `> 1e-15` |
|---|---:|---:|---:|---:|
| `ALTIS_PATHFINDER_SIZE1` | 3,456 | 0 | 0 | 0 |
| `ALTIS_BFS_65536` | 3,456 | 0 | 0 | 0 |
| **Total** | **6,912** | **0** | **0** | **0** |

The delivered validator's 16/16 checks are consistent with the independent recomputation.

## Evidence ceiling

Confirmed evidence level: `E1_ANALYTICAL_MODEL_AND_IDENTITY`.

Supported: the frozen separable candidate is exactly absorbed by the same-information selector and has zero strict residual.

Unsupported: calibrated GH200 coefficients, speedup, PTE/fault/migration/C2C causality, energy, hardware implementation, PPA, broad workload generality, or `MAIN_CLAIM_ESTABLISHED`.

