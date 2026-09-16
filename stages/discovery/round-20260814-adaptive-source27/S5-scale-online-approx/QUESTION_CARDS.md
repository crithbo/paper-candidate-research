# Research Question Cards — Source27 S5

## QC27-01 — Herdtools7 bounded relation reanalysis

- Capsule / seed: `S5_HERDTOOLS7_ARCH_MEMORY_MODEL_LITMUS` / `S27-01`.
- Exact public identity sought: one version-pinned Herdtools7 architecture `.cat` model and a public litmus-test edit, with the stock checker/counterexample semantics fixed.
- Intended contract: `THEORY_FORMAL`, N2; preserve the exact allowed/outcome set while bounding recomputed model relations after the edit. Full cost would include model loading, relation construction, checker/counterexample work, rewritten-state bytes, and peak RSS.
- Non-generic discriminator / cheapest falsifier: the action must be a named architecture-relation update, not cached checking; one two-version litmus pair fails the card if it changes outcome semantics or reduces to a generic graph/cache operation.
- Source roles: precommitted ANCHOR/CURRENT_UNION/CONTRARY routes are recorded in `SOURCE_ROLE_LEDGER.yaml`.
- Required-field audit: INCOMPLETE — current commit, exact `.cat`, public litmus ID, stock action/config union, and checker witness were not observable because both bounded official retrieval routes failed before source response.
- Identity relation / disposition: UNKNOWN; `LOCATOR_ONLY__EXECUTION_TELEMETRY_LIMITED__NO_SCIENTIFIC_INFERENCE`.

## QC27-02 — Herdtools7 litmus relation/outcome N3 law

- Capsule / seed: `S5_HERDTOOLS7_ARCH_MEMORY_MODEL_LITMUS` / `S27-03`.
- Exact public identity sought: two version-pinned public litmus corpus snapshots evaluated under one frozen architecture `.cat` model.
- Intended contract: `MEASUREMENT_CHARACTERIZATION`, N3; estimate a relation/outcome law with predeclared confounders and a decision consequence about relation investigation order. Full cost would include corpus acquisition/parse, all stock checker calls, outcome storage, and analysis time.
- Non-generic discriminator / cheapest falsifier: a stable-law claim fails if corpus/date/model are not frozen, the law does not survive the held-out snapshot, or it does not change a specified same-model decision.
- Source roles: precommitted ANCHOR/CURRENT_UNION/CONTRARY routes are recorded in `SOURCE_ROLE_LEDGER.yaml`.
- Required-field audit: INCOMPLETE — neither a content-addressable corpus version nor model/stock checker union was obtainable from the two allowed routes.
- Identity relation / disposition: UNKNOWN; `LOCATOR_ONLY__EXECUTION_TELEMETRY_LIMITED__NO_SCIENTIFIC_INFERENCE`.

## QC27-03 — RISC-V Sail configuration partial state transition

- Capsule / seed: `S5_RISCV_SAIL_FORMAL_SPEC` / `S27-05`.
- Exact public identity sought: one version-pinned RISC-V Sail ISA configuration, one official test ID, and a stock Sail execution or theorem-prover counterexample semantics.
- Intended contract: `THEORY_FORMAL`, N2; exact state-transition equivalence across a small instruction/configuration edit with a configuration-specific recourse/state-space guarantee. Full cost would include model/config load, transition execution/proof, rewritten-state bytes, peak RSS/temp, and oracle work.
- Non-generic discriminator / cheapest falsifier: it must name a configuration-native partial action rather than theorem-prover memoization; a single edit invalidates the candidate if a stock configuration action already expresses it, behavior differs, or only generic partial evaluation remains.
- Source roles: precommitted ANCHOR/CURRENT_UNION/CONTRARY routes are recorded in `SOURCE_ROLE_LEDGER.yaml`.
- Required-field audit: INCOMPLETE — current commit/config schema/test ID and stock action union are unobservable under the exhausted two-route retrieval budget.
- Identity relation / disposition: UNKNOWN; `LOCATOR_ONLY__EXECUTION_TELEMETRY_LIMITED__NO_SCIENTIFIC_INFERENCE`.

## Funnel

| Stage | Count |
|---|---:|
| Source-origin capsules | 2 |
| Offline seeds (non-scientific) | 8 |
| Selected exact locators | 3 |
| `LOCATOR_ONLY__EXECUTION_TELEMETRY_LIMITED` | 3 |
| `FRESH_RAW` / C0 / D1 / deep / brief | 0 / 0 / 0 / 0 / 0 |

No lack of implementation, result, compute, or AI readiness has been used as a scientific exclusion. The cards await source-telemetry recovery only; they assert neither absence nor novelty.
