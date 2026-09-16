# Candidate-grade deep review

## F1 — LLVM coverage-mapping counter-expression DAG planner

**Disposition:** `NOT_ADMITTED_UNFROZEN`; no brief.

| Required facet | Source-grounded status |
|---|---|
| Same-object semantics | Fixed decoded source regions/files and profile-counter meanings; stock `llvm-cov` report acceptance/equivalence is the oracle. |
| Native action catalog | Build binary add/sub expression records; assign expression IDs; encode counters with LEB tags; emit file and source-ordered region records; regenerate every reference. |
| Current strongest fair union | Current LLVM coverage generation plus `CounterExpressionBuilder`, `CoverageMappingWriter`, format-required expression/region serialization, all relevant instrumentation and coverage options, and any direct native tool/paper found during closure. The exact complete source union remains unpinned. |
| Static witness | Shared `C0-C1` used in two regions can be assigned another legal expression ID with all references regenerated; byte length can differ around ULEB boundaries. It proves only representational freedom. |
| Putative N2 | A globally optimized, semantically equivalent expression DAG plus ID/record assignment with an explicit size/parse-cost guarantee. Current evidence does not establish it as distinct from builder CSE/canonicalization or routine emitter work. |
| Natural carrier | Versioned LLVM Test-Suite/Clang coverage tests; fixed compiler inputs and profiles. |
| Full-cost denominator | Compile/write wall+CPU+RSS+temporary files; object/mapping bytes; profile overhead held fixed; `llvm-cov` parse/query CPU+RSS+latency. |
| 72h finite killer | Pin one LLVM commit; enumerate `CoverageMappingGen`, `CounterExpressionBuilder`, `CoverageMappingWriter`, reader/decoder, and coverage/MC/DC flags; construct the two-use derived-count witness; regenerate a native-legal map; reject if the builder already realizes the action, reports differ, only ID order changes, or complete costs remove any effect. |
| Fidelity closure | Finite but incomplete: source pin/config enumeration and collision closure are required before a claim-bearing run. |

### Six-dimensional residual audit

1. **Decision rule:** a complete constructor would choose the DAG and all references jointly, rather than one expression order.
2. **Information:** it may use only the same source mapping and counter-expression semantics available to LLVM’s producer.
3. **Complexity/resource:** a valid contribution would need a stated algorithm/guarantee over DAG sharing and serialized size or reader cost; none is frozen.
4. **Quality/guarantee:** byte changes alone do not establish a coverage-quality, compatibility, or complexity contribution.
5. **Full cost:** compilation and reader cost are mandatory, so mapping bytes alone cannot support a paper claim.
6. **Generalization/no-gain:** any advantage restricted to ULEB index crossings or local CSE is a no-gain zone and below N2.

The item is not dropped for missing implementation or result. It is withheld because current-union and collision closure do not yet distinguish a complete residual from existing native expression construction.
