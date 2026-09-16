# QREFINE-TRITON-W4A16 Q1/Q2 calibration

- Stage: `STAGEA`
- Candidate venue family: compiler verification / systems software
- Calibration status: `PARITY_CONDITIONAL_WITH_EXECUTABLE_GAP`
- Frozen quality floor: `TIER_B_Q2_VIABLE`

| Dimension | Candidate contract | Current evidence | Gap |
|---|---|---|---|
| Problem | Exact target-local validation of a frozen W4A16 Triton lowering | Static Stage 0 certificate | No executable Stage A observation |
| Contribution | Restricted mixed bit-vector/IEEE compositional validator | Contract only | Interpreter, obligations, composition not run |
| Baselines | Native verifier/tests plus four strong formal/safety subtractors | Scope matrix only | Exact same-object executions absent |
| Natural/current artifact | vLLM v0.26.0 kernel and Triton v3.7.1 | Exact source anchors hashed | Frozen modules not materialized |
| Full cost | Capture through solver/compiler and later legal schedule witness | Units preregistered | No measurements |
| Reproducibility | Frozen source, contracts, hashes and blocker | Strong resource audit | Exact executable environment absent |

The paper-shape calibration remains conditional. Resource failure neither lowers the academic tier nor supports it; all same-object, full-cost, mutant, composition, and baseline gates remain open. Independent Stage A scientific review is premature until a resumed owner run closes the fidelity gate.
