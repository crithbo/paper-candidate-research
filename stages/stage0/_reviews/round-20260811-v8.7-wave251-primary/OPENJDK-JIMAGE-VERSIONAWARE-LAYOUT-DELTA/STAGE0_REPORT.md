# OPENJDK-JIMAGE-VERSIONAWARE-LAYOUT-DELTA — Stage 0 PRIMARY Report

- Lane id: `STAGE0-BATCH-GATE-PRIMARY`
- Assignment id: `STAGE0-P1-20260811-OPENJDK-JIMAGE-VERSIONAWARE-LAYOUT-DELTA-PRIMARY-V8.7`
- Input freeze SHA-256: AGENTS `66231F71...B063`; plan `B4F51DBA...95B1`; registry `0AE48BAA...F8B2`; role `741EC354...626E`; source handoff `0F317223...AB93`; source manifest self `DD14DDB5...C79F` (`7/7 PASS`)
- Cross-assignment contamination declaration: only the frozen Wave251 package, this role/template and independently audited sources in `SOURCE_AUDIT.md` were used. Discovery's recommendation and all prior candidates were not treated as evidence.
- Decision: `STOP`
- Quality tier: `BELOW_Q2_STOP`
- Confidence: `0.93`
- Evidence ceiling: `CURRENT_SOURCE_AND_STATIC_MECHANISM_REVIEW_ONLY`
- Novelty route assessed: proposed `N2`; **not established**
- Candidate venue family: systems / programming languages / software tools
- Stage semantics: conditional paper-potential screen; no implementation or performance result was required for this decision.

## Structural paper potential vs current readiness

- Structural paper potential if successful: `BELOW_Q2_STOP` for the frozen candidate. Its final selector is a generic shortest-path dynamic program over an explicitly materialized finite layer of complete order lists, followed by stock `jlink` and a stock strong delta encoder. The claimed exactness is only exactness over that pre-chosen finite family; it supplies no jimage-specific state, transition, approximation, complexity advance or guarantee.
- Current evidence-acquisition readiness/risk: a 20–50-tag route, stock reader oracle and full-cost ledger are finite. Their absence now is **not** a negative result and does not drive the decision.
- Why missing implementation/results/proof/hardware is not structurally fatal: none is used as a stop reason. The stop follows from the action/algorithm collapsing to a current native list input plus a generic finite layered-DAG selector even under the hypothetical assumption that all proposed results are positive.

## Discovery provenance

- Opportunity origin: natural temporal structure—adjacent official OpenJDK releases and update/delta costs.
- Domain tags: OpenJDK, jimage, jlink, versioned artifacts, compression, algorithms.
- Paper genealogy: JEP 220 runtime image and `jrt:/` semantics; current `jlink` resource ordering and image creation; JEP 493/linkable runtime; generic VCDIFF/delta selection; Native Image heap-ordering work as paper-shape comparator only.
- Discovery method revision: no Discovery backtest or self-score is inherited as candidate evidence.
- Reminder: method calibration is not candidate evidence.

## Frozen object and claim

The object is an adjacent-version, fixed-platform/configuration OpenJDK runtime image with each version's fixed logical module/resource set. The matching stock `ImageReader`, `jrt:/` filesystem and launcher must return the same paths and bytes. No reader, module/resource content, compressor, class format or deployment semantics may change.

The Discovery claim is a predecessor-aware, bounded-window constructor for a complete class order supplied to `jlink --order-resources`, followed by a release-chain DP over actual final-image delta edges. It asserts exactness only after materializing a declared finite family of candidate orders.

## Positive opportunity map

- Natural workload: chronological official OpenJDK tags under one platform, toolchain, JMOD/module configuration and explicit plugin list.
- Expected headroom: not observed. A different resource order can change the `lib/modules` byte stream and therefore binary-delta behavior; this is a valid hypothesis.
- Mechanism-specific prediction: not paper-bearing in the frozen formulation. Once a finite list family has been generated, using its measured pairwise delta weights across releases creates an ordinary layered shortest-path instance.

## Named baselines and fairness contract

1. **Current OpenJDK `jlink` full pipeline at current/pinned commit `bc674c21af6123be4a247e758728de870aa96eb5`**, including module selection, default build image invocation, `order-resources`, all finite plugin options, compression, endian and linkable-runtime conditions.
2. **Stock/default image ordering**. Current `make/Images.gmk` supplies `module-info.class`, optionally `link_opt/classlist`, and package-pattern priorities to `--order-resources`; this is a material native baseline, not a missing feature.
3. **Same-information layout controls**: no supplied class list; the actual stock/default list; an input class list from the frozen bounded family; and each per-version best list from that same family.
4. **Same-information final-image deltas**: VCDIFF and one independently pinned strong binary delta implementation, applied only after the final legal jimage has been built.
5. **Exact generic layer-DAG shortest path** over the identical materialized candidate family. This is a fair algorithmic subtractor, not an oracle masquerading as a baseline: it has exactly the candidate's stated inputs, edge weights, output and guarantee.
6. **Current `JimageDiffGenerator`/`ResourceDiff`** as a source-level subtractor for linkable-runtime resource diffs. It is not an adjacent-version final-image delta comparator, so it does not independently kill the candidate.

All comparative paths must charge JMOD/source acquisition hashes, class-list generation, `jlink` and delta CPU/RSS/temp, final image and delta bytes, stock semantic enumeration, launcher/startup and resource-read costs, plus failed/reverted construction.

## Collision analysis

### Nearest-prior facet matrix

| Mechanism | Exact object / information | Action and guarantee | Result | Disposition |
|---|---|---|---|---|
| Current `OrderResourcesPlugin` | Same jlink resource pool, caller-defined patterns/class list | Orders every `CLASS_OR_RESOURCE` by ordinal then path; ordinary input list/pattern action | Native writer action | Direct same-object action baseline |
| Current OpenJDK build `JLINK_ORDER_RESOURCES` | Same standard JDK build | Default package patterns and optional generated class list | Native build configuration | Strong same-object baseline; contradicts any “no current ordering” narrative |
| `ImageFileCreator` | Same jimage writer | Writes resource stream in transformed `ResourcePool` traversal order, then creates index/location structures | Native implementation | Confirms ordering influences bytes but not a new algorithm |
| `JimageDiffGenerator` / `ResourceDiff` | Linkable-runtime same-version packaged-vs-optimized resources | Resource-level add/remove/modify diff | Native reverse-linking facility | Adjacent, not equal-function final-image delta comparator |
| VCDIFF / strong binary delta | Same predecessor/final complete images | Generic delta encoding | Deployment comparator | Required full-cost baseline |
| Discovery release-chain DP | Same complete candidate images/actual edge costs | shortest path over pre-materialized finite order family; exact only for that family | No result claimed | Generic kernel; no target-specific N2 |

### Seed-distance and method-name deletion test

- Removing “predecessor-aware jimage” leaves: “enumerate a finite set of list-valued configurations per release, measure pairwise delta edges, then run a layered shortest path.” This is a generic controller/selection pattern.
- The only jimage operation is passing a list to the existing plugin. The candidate neither changes the legal action grammar nor supplies a state representation that avoids full candidate enumeration.
- Direct same-object paper collision remains `SEARCH_BOUNDED_OPEN`; the stop does not depend on literature absence/presence because source-level and algorithmic absorption already establish the failure.

## Competing mechanism decision

- Selected mechanism: none retained.
- Registered backup: none. A resource-index-aware streaming DP, new exact/FPT jimage layout theorem, new delta-aware codec, altered resource grammar or custom writer would be a materially new mechanism, not a repair to the frozen list-selector candidate.
- Pivot boundary: a future topic may keep the same object only with a new ID and a complete target-specific non-product action/state/guarantee that is not “generate lists then select them.”

## Residual paper kernel

No residual qualifies for the frozen candidate. The nontrivial target-specific work is already performed by current `jlink`'s legal ordering/writer path; the proposed additional work is an external finite candidate generator plus generic weighted layer selection. Positive image/delta results would demonstrate a good configuration controller, not a sufficiently new jimage algorithm.

## Evidence route

- `PARETO_APPROXIMATION / PERFORMANCE` was proposed, but no publishable N2 mechanism remains to carry those results.

## Performance-optimization admissibility

- Same-function contract: definable and source-verifiable.
- Algorithmic delta: **fails**. The DP is a standard exact shortest path after the candidate family is fully materialized.
- Full-cost ledger: well designed, but does not create an algorithmic contribution.
- Strong-implementation fairness: current default and nondefault jlink ordering, final-image deltas and full build/read costs are all required.
- Generality and failure boundary: natural tag route is finite, but cannot rescue a generic controller.
- Why routine tuning: the proposed class list is exactly native plugin input; choosing it from a bounded family with generic DP is a configuration/list-selection wrapper.

## Q1/Q2 paper shape

- Problem: version-to-version runtime-image delivery cost is relevant.
- Contribution: insufficient. A Q2 paper would need an algorithmic core beyond candidate-list selection and a guarantee not inherited from generic layered shortest path.
- Evidence plan: finite but non-dispositive.
- Expected paper narrative if carried forward would be “pick a jlink order list to improve VCDIFF,” which is ordinary configuration composition rather than a Q2 mechanism paper.

## Q1/Q2 shape calibration

- Comparator file: `Q1_COMPARATOR_MATRIX.md`
- Reference set: Basso et al. CGO 2025; Basso et al. PACMPL/OOPSLA 2025; OpenJDK current source/docs as exact-object boundary.
- Status: `PARITY_NOT_PLAUSIBLE`
- Contribution-shape gap: structural, not an evidence gap.
- Evidence-shape gap: natural evaluation remains unperformed but is not the reason for STOP.
- Stage A closure plan: none authorized.

## Non-relaxable quality audit

- Same-object: `PARTIAL_FAIL`. The frozen description says non-class resources retain their current stream, but actual `OrderResourcesPlugin` sorts all `CLASS_OR_RESOURCE` entries. Unmatched entries fall to the same maximum ordinal and lexicographic path order; `@` entries are converted to `.class`. The candidate must use actual plugin semantics, not an assumed class-only transformation.
- Latest collision: `SEARCH_BOUNDED_OPEN`; no literature-absence inference.
- Strong fair baselines: `PASS`, and they expose the generic layered-DP collapse.
- Natural input/evidence: `FINITE_ROUTE`, not yet run and not required for this STOP.
- Full-cost: `PASS_AS_DESIGN`.
- Reproducibility: `FINITE_ROUTE` with current HEAD/pin, tag/JMOD/toolchain/config hashes.
- Evidence/claim honesty: Discovery correctly avoided claiming results, but overstates “target-specific complete N2” before the algorithmic kernel is present.

## Evidence path and AI completion

- AI executability class: `AI_CORE_EXECUTABLE`
- Estimated ai_core_fraction: `0.86`
- 72-hour first evidence: would have been source/JMOD pinning, stock reader enumeration, actual plugin list creation and full-cost small-tag replay. This route is not authorized because it cannot cure the structural mechanism failure.
- Human-only items: none decisive.

## Fidelity closure plan audit

- Discovery status: `STRUCTURALLY_UNCLOSABLE` for the frozen candidate's claimed contribution, not because the reader/format route is missing.
- Complete action/native semantics: current source makes the action finite, but contradicts the stated class-only/nonclass-current-stream abstraction.
- Comparator/denominator/full-cost/small witness: finite and adequate.
- Why missing implementation is not fatal: the stop is independent of implementation. A candidate output could be valid yet still be a generic configuration result.

## Independent current upstream reality check

- Current upstream: OpenJDK `jdk` master was checked through the official upstream GitHub mirror on 2026-08-11. GitHub API reported HEAD `bc674c21af6123be4a247e758728de870aa96eb5` dated 2026-08-10T19:52:18Z, matching the Discovery pin.
- Official docs checked: current JDK 25 `jlink` manual; JEP 220; JEP 493 boundary as documented by the frozen source package.
- Actual source paths/symbols checked: `OrderResourcesPlugin.transform/configure`; `ImageFileCreator.generateJImage`; `JimageDiffGenerator.generateDiff`; `ResourceDiff`; `JlinkTask`; `make/Images.gmk` `JLINK_ORDER_RESOURCES`/`JLINK_TOOL`.
- Default/non-default surface: `--order-resources` patterns and `@` class list; default build order patterns and conditional generated class list; `--compress=0/1/2` and filter; strip/endian/module and plugin controls; `--generate-linkable-runtime` boundary; `jlink --list-plugins` requirement.
- Discovery action claim: narrowed/contradicted. Current plugin is not a class-only local reorderer; it transforms all class/resource entries according to ordinal/path. The current standard build already supplies a nontrivial order-resource action.
- Any non-tuning residual: none in the frozen method after the generic finite-layer DP subtraction.

## Stage A highest-risk probe plan

- Risk-bearing premise: not applicable; primary scientific decision is STOP.
- Cheap discriminating probe: source-level action/guarantee audit was sufficient. Any future new-ID study must first prove a non-enumerative jimage-specific state and guarantee against exact generic selection on the same candidate family.
- Negative result that kills the direction: already observed—the contribution is a generic finite candidate selector and the stated plugin semantics are incomplete.
- Positive-result ceiling: a positive delta measurement would be engineering support for a selected configuration only, not paper-proof.

## Stop conditions

1. `OrderResourcesPlugin` already admits the complete order-list action and default builds exercise it.
2. The complete stated algorithm reduces to generic shortest path over a materialized finite family.
3. The class-only/nonclass-current-stream model is inconsistent with the current plugin's all-`CLASS_OR_RESOURCE` transformation.
4. Repairing these defects requires a new jimage-specific action/state/guarantee rather than one atomic clarification, so this ID may not be rewrapped or revised.

## Dual-axis score

- Academic value: `31/70` (problem 8/15; N2 clarity/nontriviality 3/20; nearest-work delta 4/15; baseline/venue 8/10; falsifiability route 8/10)
- AI executability bonus: `26/30`
- Total: `57/100`
- Scores do not define the decision; the structural N2 and same-action failures do.

## STAGE0_REPAIR_VECTOR

- `OMITTED_CURRENT_SAME_OBJECT`
- `OMITTED_FIRST_PARTY_FEATURE`
- `OMITTED_GENERIC_KERNEL`
- `ATOMIC_ACTION_UNCLEAR`
- `Q2_SHAPE_GAP`

## Authorizations

- Stage A: `false`
- Stage B: `false`
- Experiment/benchmark: `false`
- Next route: no confirmation required for a non-borderline scientific STOP; mainline alone controls final state.

