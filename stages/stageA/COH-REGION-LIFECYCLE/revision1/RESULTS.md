# Revision result: same-information selector absorption

## Material Passport

- Artifact ID: `COH-RL-STAGEA-R1-RESULT`
- Assignment: `STAGEA-L2-20260809-COH-REGION-LIFECYCLE-R1`
- Verification status: `VERIFIED`
- Evidence level: `E1_ANALYTICAL_MODEL_AND_IDENTITY`
- Claim ceiling: `ANALYTICAL_SELECTOR_ABSORPTION_ONLY`
- External upload: none

## Outcome

`STOP_RECOMMENDED`.

On the unchanged two programs and inherited B0–B3 equations, the same-information simple selector exactly reproduces every candidate action. With the selector charged the same extraction/decision cost as the candidate, full costs are equal and the strict candidate-only residual is empty.

| Program | Diagnostic rows | Candidate/selector plan mismatches | Full-cost mismatches | Strict positive residuals | Residual range |
|---|---:|---:|---:|---:|---:|
| `ALTIS_PATHFINDER_SIZE1` | 3,456 | 0 | 0 | 0 | `[0, 0]` |
| `ALTIS_BFS_65536` | 3,456 | 0 | 0 | 0 | `[0, 0]` |
| **Total** | **6,912** | **0** | **0** | **0** | **`[0, 0]`** |

The candidate still visits 11 distinct Pathfinder plans and 13 distinct BFS plans across the inherited grid, but plan diversity is not an algorithmic residual: the selector visits the identical plans.

## Why the result is decisive without GH200

For each region `r` and shared coefficient completion `p`, both methods compute the same four costs `C(r,p,a)` and choose the same lexically tie-broken `argmin_a C(r,p,a)`. Both are charged the same decision cost. Therefore:

```text
candidate_full_cost(p) = selector_full_cost(p)
candidate_only_residual(p) = 0
```

This equality holds for every finite nonnegative shared cost completion; the original 6,912-row grid is only an exhaustive implementation diagnostic. Hardware coefficients cannot break an algorithmic identity while the frozen mechanism remains separable.

## Coefficient-domain disposition

Primary sources identify the GH200/CUDA tuple, memory/page semantics, 900 GB/s aggregate coherent interface, and author-measured HBM3/LPDDR5X/H2D/D2H bandwidths. They do not bound all allocation, PTE/fault, page-amplification, overlap, synchronization, access-counter-delay, or planner terms. Those terms remain `UNIDENTIFIED`; no arbitrary coefficient frequency is treated as platform evidence.

This partial identification cannot support a positive GH200 claim. It does not force `RESERVE_RECOMMENDED`, because selector absorption is coefficient-independent and is already decided in software.

## Full-cost and control interpretation

- The selector sees exactly the same region tuple and coefficient tuple.
- It evaluates exactly B0–B3 with the inherited cost equations.
- It receives no future information.
- It is charged the same planner/extraction/decision cost, a candidate-favorable assumption; any cheaper lookup would only make the candidate worse.
- Unknown page/runtime costs are shared completions and cannot create a candidate-only difference.

## Reproducibility

Two fresh output directories are byte-identical for summary, 2.72 MB control table, and run manifest. `VALIDATE_REVISION.py` passes 16/16 checks, including all six frozen hashes, 6,912 rows, plan identity, full-cost identity, residual zero, honest ceiling, and absence of GH200 execution.

## Supported and unsupported claims

Supported: the frozen separable candidate is absorbed by the strongest same-information simple selector; strict residual is zero; no GH200 measurement is needed for this absorption decision.

Unsupported: GH200 performance, calibrated ATS/NUMA coefficients, speedup, measured migration/PTE/C2C behavior, energy, hardware, RTL, FPGA, PPA, silicon, or any main paper claim.

## Phase recommendation

- Decision-ready finding: `kills` the frozen N2 mechanism.
- Runner recommendation: `STOP`.
- Pipeline recommendation: `STOP_RECOMMENDED / BELOW_Q2_STOP` for this same object and mechanism.
- Next experiment: none under this topic ID. A nonseparable coupled optimizer would be a materially different mechanism and requires mainline adjudication/new intake rather than another revision.

