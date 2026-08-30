# Reproducibility audit

## Classification and authority boundary

- Experiment class: deterministic.
- Expected comparison: exact semantic equality, excluding wall-time/RSS telemetry.
- Reviewer authority: read-only validation; solver/test/experiment rerun prohibited by assignment.
- Reviewer verdict: `SEALED_OUTPUTS_AND_SERIALIZED_TRACES_REPRODUCIBLE__FULL_SOLVER_RERUN_NOT_PERFORMED`.

## Checks

| Check | Independent result |
|---|---|
| Revision manifest | 17/17 files match; zero mismatch |
| Raw source | exact 17,477 bytes; SHA-256 and Git blob SHA-1 match |
| Run semantic payloads | run1 and run2 compare equal after removing `nondeterministic_full_cost` |
| Canonical validator hash | both sealed runs report `90adbdefb2ede0797366f125e839e0cacc7b3ee5b670fa417ab8ae90aa37c82c` |
| Serialized schedule record count | 81 = 29 joint + 29 memory-first + 23 runtime-first |
| Independent schedule replay | 81/81 pass; zero missing-child, illegal-delete, cost, peak, operation-count, materialization, recomputation, root-emission or budget violation |
| Sealed validation | `REPRODUCIBLE`, 81 checks, zero violations, fallacy scan 11/11 |

The independent trace replay used only the sealed projection and serialized actions. It did not call candidate Python modules or regenerate oracle results. Consequently, it verifies trace legality and recorded metrics, while global optimality remains supported by static code inspection plus the sealed exhaustive result, not by an independent second solver implementation.

## ARS re-review judge record

- Verification judge route: registry-declared `gpt-5.6-sol/high`; exact runtime model identifier is not exposed in the artifact.
- Round-1/revision producer provenance: migration one-off candidate owner; exact model id not independently attested in the package.
- Independent cross-model pass: `not_configured`.
- Rubrics: project Stage A role v8.4; ARS academic-paper-reviewer re-review protocol; ARS source-verification and reproducibility protocols.
- Evidence seen: initial Stage A package, revision1 contract/code/inputs/results/reports/handoff/manifest; no other candidate.

This verification round ran on the same model family that drove the revisions; over-optimization to this judge's latent biases is possible (Ren et al. 2026, arXiv:2607.13104 §8.1.2).

The decision is nevertheless dominated by mechanically checkable equality and replay surfaces rather than stylistic agreement with the owner.
