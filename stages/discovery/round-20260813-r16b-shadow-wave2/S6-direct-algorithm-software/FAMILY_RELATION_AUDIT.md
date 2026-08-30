# Append-only opportunity-family relation audit — correction 01

## SUNDIALS versus Wave335

**Verdict:** `CONDITIONAL_SPECIALIZATION__NOT_COUNTABLE_AS_NEW_FAMILY`.

Wave335 row R6 is explicitly “SUNDIALS nonlinear solve/preconditioner construction,” with fixed model/tolerance, residual/convergence oracle, public ODE carrier, and preconditioner/solver-control action space. The R16B SUNDIALS row fixes the same solve semantics and residual oracle and narrows the action to sparse-Jacobian-pattern plus preconditioner construction. That narrowing does not supply a materially distinct problem, action kernel, mechanism, guarantee, or full-cost denominator; it is a conditional specialization of the existing opportunity family. It is excluded from the R16B count without any scientific STOP inference.

## Required identity checks

| R16B row | Historical relation | Count decision |
|---|---|---|
| Tesseract DAWG | Distinct from historical Tesseract page segmentation: fixed wordlist-to-DAWG dictionary object and dictionary lookup/build cost, not page/image segmentation | retained |
| HarfBuzz subset | Distinct from a shaping-transform family: fixed reader-accepted subset-font construction and glyph/layout closure versus runtime shaping transform | retained; no graph containment shown |
| Gecode extensional | No current historical family hit found in registry/history/R16A ledger | retained |
| SUNDIALS sparse Jacobian/preconditioner | Conditional specialization of Wave335 SUNDIALS nonlinear solve/preconditioner | excluded and replaced only for dedup |

Replacement is strictly duplicate-only and does not change canonical yield policy.
