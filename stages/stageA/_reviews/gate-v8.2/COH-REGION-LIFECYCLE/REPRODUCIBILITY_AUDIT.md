# Reproducibility Audit

- Label: `HASH_AND_STRUCTURE_VERIFIED`
- Candidate replay: not run; the user prohibited new research experiments and a replay was unnecessary for the gate defect.
- Manifest: 17/17 entries independently recomputed and matched.
- Run 1 / Run 2 summary SHA-256: `CD7341F341249588F2CCF167B78AC2BC705D6A79D350FD738BD7C59ADD54AC98` for both.
- Run 1 / Run 2 grid SHA-256: `BA53B59365936D421B4BAC2B1A4FF7F173A300152F90A5952C5446447C2C53E3` for both.
- Supplied validator result: 11/11 checks pass and records `VERIFIED`.
- Static invariant confirmed from code and frozen output: `candidate_cost = oracle_cost + planner_cost`.

The deterministic artifact is reproducible at the hash/structure level. This label validates execution identity and internal calculations only; it does not validate the model's GH200 calibration or establish the paper claim.

