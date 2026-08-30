# Reproducibility Audit

- Reviewer label: `HASH_AND_STRUCTURE_VERIFIED__THREE_RUN_OUTPUT_IDENTITY`
- Candidate replay run by reviewer: no
- Revision manifest: `16/16` matched
- Initial candidate manifest after revision: `17/17` matched

| Output | Original SHA-256 | Replay A | Replay B | Result |
|---|---|---|---|---|
| `exhaustive.json` | `B47573CD39A1B720C1DCE2AECED4EA76635A1DFF9A8118625210D53192010269` | same | same | byte-identical |
| `natural.json` | `E376E6FDCDB4B15D527DB3AD4E49CAD11ADE530A56B1C00974FDA4B67623713B` | same | same | byte-identical |

The supplied validator reports zero semantic/accounting failures and a stable `STOP_RECOMMENDED` verdict in both modes across all three result trees. Static inspection confirms that the validator checks byte identity, zero recorded failures and verdict stability. It does not independently prove the scientific fairness of the affine frontier; that question is handled in `STATIC_ABSORPTION_AUDIT.md`.

Because the user prohibited candidate execution, the reviewer does not claim `VERIFIED_REPLAY`. The frozen deterministic evidence is nevertheless fully checkable at hash and structure level.

