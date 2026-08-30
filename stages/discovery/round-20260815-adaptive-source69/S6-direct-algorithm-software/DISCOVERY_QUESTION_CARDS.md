# Discovery question card

## S69-01 — Go PGO interleaved devirtualization/inlining

| Required field | Frozen record |
|---|---|
| Exact public identity | Go compiler current `devirtualize` implementation and Go 1.22 documented PGO behavior, fixed program/profile/build configuration. |
| Carrier kind | `IMPLEMENTATION_CARRIER_ONLY`; a public versioned Go module/profile route exists for a later authorized Stage-A plan, but no asset was acquired. |
| Same-object contract | Same Go source semantics and observable direct/indirect call behavior; a guarded direct call retains the indirect fallback. |
| Contribution hypothesis | `COMPILER_TOOL`, N2: joint PGO devirtualization/inlining construction. |
| Endpoint | Semantics-preserving runtime, code-size, and compilation-cost frontier. |
| Current locus | `src/cmd/compile/internal/devirtualize/devirtualize.go`; current compiler README; Go 1.22 PGO/inlining release description. |
| Non-generic discriminator hypothesis | Go interface semantics and guarded fallback might constrain a special joint constructor. |
| Minimum falsifier | Current composition and a primary general profile-guided inline/devirtualization kernel leave no Go-specific decision/guarantee. |
| Full-cost boundary | Profile collection provenance; compile CPU/RSS; binary/code size; runtime CPU/latency and allocation effects. Not measured here. |
| Finite route | Current docs/source plus primary contrary check; no build or experiment required for the raw decision. |

### Decisive outcome

The current Go source explicitly implements static devirtualization and profile-guided guarded direct calls, and Go 1.22 documents interleaving devirtualization with inlining. Profile-guided inline expansion and guarded devirtualization are established general compiler-construction kernels. No source-supported Go-specific atomic action or formal guarantee beyond that composition was identified. Therefore the non-generic discriminator fails before raw; this does **not** claim that all future Go PGO work is impossible.
