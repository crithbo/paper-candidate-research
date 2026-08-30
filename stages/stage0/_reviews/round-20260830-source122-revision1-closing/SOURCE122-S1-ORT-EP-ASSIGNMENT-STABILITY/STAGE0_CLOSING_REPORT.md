# SOURCE122-S1-ORT-EP-ASSIGNMENT-STABILITY Revision 1 Independent Closing Report

## 中文摘要

- Closing verdict：`PASS_RECOMMENDED`。
- 质量档：`TIER_B_Q2_VIABLE`，仍是条件性 Stage 0 论文潜力判断，不是主结论已成立。
- 为什么：revision 1/1 保持 exact ONNX/ORT 对象、held-out decision-validity RQ 与 canonical-public evidence ceiling；已把双 endpoint 收敛为固定 ORT 1.26.0 CUDA→CPU 栈上的 `{BASIC, EXTENDED, ALL}` optimizer-level 决策，并闭合 relation-specific L1、L2 oracle、semantic-region quotient、all-cell denominator、Q2 breadth/strong baselines 与机制特异 Stage A killer。
- 下一步：MAINLINE 可建议进入新的 Stage A assignment；首次 claim-bearing run 前必须实际通过 `PRE_CLAIM_CONTRACT_FIDELITY_GATE`。本 closing 不创建或执行 Stage A。
- 用户操作：无。

- Lane id: `STAGE0_SENTRY`
- Assignment id: `STAGE0-CLOSING-20260830-ORT-EP-ASSIGNMENT-STABILITY-REVISION1`
- Input context SHA-256: `E71751F28F601B4A904B02418FBF258D1419E14C59473DFBC7E494285AC0F02F`
- Revision handoff SHA-256: `6BCB0C69C50EF5EC7EF21E11AA48FF27C800A99B3F8B705DB7F1AD5EE1E52985`
- Revision manifest SHA-256: `A926992EE73AC34862CDCEA8C677B4A9461EE75D852D72BFB72E89D8A2591313`
- START SHA-256: `0B1E0DCA7EF4EC3C4758CCC57D9F12FA6849A69338C828B8B08F4D1C1A70E673`
- Model route: `gpt-5.6-sol/high` temporary user-command override
- Scientific revision: consumed `1_of_1`; no second revision authorized or performed
- Search/open: `0/8`
- Implementation/build/experiment/Stage A/Stage B/shared write: `0`
- Claim-bearing observation: `false`
- Evidence ceiling: `STATIC_CONTRACT_ONLY__ZERO_CANDIDATE_RESULT`
- Confidence: `0.94`

## Judge record

- Verification mode: revision re-review / independent Stage 0 closing.
- Judge: current Sol/high SENTRY session; no cross-model pass configured or invoked.
- Evidence seen: frozen closing control, revision handoff/manifest, revised endpoint contract, legality/lineage contract, all-cell denominator, Q2/baseline contract and Stage A killer plan.
- Verification discipline: each required closing item was mapped to an exact revised artifact and independently checked; no author's summary was accepted without matching contract text.
- Judging budget: local read-only verification plus manifest replay; `0` external search/open, `0` execution.
- Single-family caveat: this verification round ran on the same model family that drove the revisions; over-optimization to this judge's latent biases is possible. The project-specific independent-role separation remains satisfied, but model-family independence is not claimed.

## Revision traceability matrix

| # | Original required repair | Revision claim/location | Independent verification | Status |
|---|---|---|---|---|
| C1 | Preserve exact object, RQ, endpoint meaning and evidence ceiling | `REVISED_STAGE0_CONTRACT.yaml: preservation` | Exact ONNX/ORT equivalent-representation object, source-decision held-out-regret RQ and canonical-public ceiling remain; no generic bug-finding or private-QNN substitution | `FULLY_ADDRESSED` |
| C2 | Choose one primary decision endpoint | `REVISED_STAGE0_CONTRACT.yaml: single_primary_endpoint` | Fixed `onnxruntime_gpu==1.26.0`, provider order CUDA→CPU, selectable actions `{BASIC, EXTENDED, ALL}`; `DISABLE_ALL` is diagnostic only; EP selection and per-representation retuning are forbidden | `FULLY_ADDRESSED` |
| C3 | Freeze four legal relation families with L1 preconditions and L2 oracle | `LEGALITY_AND_LINEAGE_CONTRACT.yaml` | All four families have relation-specific preconditions; L0 is explicitly insufficient, L1 remains insufficient without L2, and L2 failure stays denominator-visible | `FULLY_ADDRESSED` |
| C4 | Define complete semantic-region lineage quotient | `LEGALITY_AND_LINEAGE_CONTRACT.yaml: semantic_region_quotient` | Stable semantic regions, zero/one/many mapping and explicit normalized/fused/expanded/unmatched/unsupported/failure outcomes are frozen; ambiguous mappings cannot silently disappear | `FULLY_ADDRESSED` |
| C5 | Freeze an all-cell denominator with no failed-cell exclusion | `ALL_CELL_DENOMINATOR.yaml` | Cartesian dimensions, actions, control arms, status vocabulary, failure inclusion, no imputed success and no denominator redefinition are explicit; every external-validity stratum has a separate complete denominator | `FULLY_ADDRESSED` |
| C6 | Freeze credible Q2 breadth and strongest baselines | `Q2_BREADTH_AND_BASELINES.yaml` | Minimum `12` models, `3` families, `4` relations, held-out models/relations and a separate second-release or public-EP stratum are mandatory; output/timing/structure/native assignment/full-grid/lineage baselines and overhead charging are explicit | `FULLY_ADDRESSED` |
| C7 | Freeze a mechanism-specific Stage A killer | `STAGEA_KILLER_PLAN.yaml` | Two-family/two-relation probe, normalized-away controls, paired instrumentation/process controls, full oracle grid, preclaim gates and eight kill conditions distinguish the hypothesis from observer/cache noise and generic testing | `FULLY_ADDRESSED` |
| C8 | Enforce one revision only and prohibit direct Stage A | `REVISED_STAGE0_CONTRACT.yaml`, revision handoff, closing control | Revision is consumed `1_of_1`; current assignment authorizes no implementation/run/Stage A; a future Stage A must separately pass the fidelity gate | `FULLY_ADDRESSED` |

All Priority-1 closing items are fully addressed. No second-revision request is generated.

## Object, RQ and ceiling preservation

The revised exact object remains semantically equivalent ONNX representations evaluated through a single frozen ONNX Runtime optimizer-level deployment decision. The RQ remains whether a decision learned from one source representation generalizes to held-out equivalent representations under a frozen output-quality threshold and complete full cost. The ceiling remains canonical public benchmarks on a public ORT stack.

The following prohibited substitutions are explicit: EP selection, generic bug finding, per-representation retuning, result-aware model/relation selection and private-QNN evidence. The revision therefore narrows ambiguity without changing the research object or lowering the guarantee.

Verdict: `PRESERVED`.

## Single endpoint closure

The primary action space is exactly `{ORT_ENABLE_BASIC, ORT_ENABLE_EXTENDED, ORT_ENABLE_ALL}` on `onnxruntime_gpu==1.26.0` with ordered `CUDAExecutionProvider, CPUExecutionProvider`. The source representation selects one action by minimizing frozen full cost subject to a frozen quality threshold; that same action is applied to every held-out equivalent representation. The full per-representation grid is an offline regret oracle only and cannot become an online baseline.

`ORT_DISABLE_ALL` is diagnostic, and EP selection is forbidden as a co-primary endpoint. This closes the original dual-endpoint defect.

Verdict: `CLOSED`.

## L1/L2 legality closure

The legality ladder correctly separates:

1. `L0_PROTO_LEGAL`: schema/type/shape/loadability only;
2. `L1_RELATION_JUSTIFIED`: relation-specific semantic preconditions;
3. `L2_NUMERIC_ORACLE`: paired outputs under frozen dtype/shape/NaN/Inf/signed-zero/tolerance policy.

Function expansion, inverse transpose/reshape, Split→Concat and constrained Gemm→MatMul+Add each carry non-generic L1 obligations. Gemm additionally recognizes backend rounding as an L2 obligation. No cell can support a positive claim without all three levels and nonambiguous lineage; failed cells remain visible.

Verdict: `CLOSED`.

## Semantic-region quotient closure

The contract defines source and optimized semantic regions by frozen input/output boundaries and an auditable bipartite relation. It distinguishes `NORMALIZED_AWAY_ZERO`, `PRESERVED_ONE`, `FUSED_MANY_TO_ONE`, `EXPANDED_ONE_TO_MANY`, `UNMATCHED`, `UNSUPPORTED` and legality/session failures. This is sufficient to avoid raw-node-name matching and to retain ambiguous/fused/expanded outcomes without pretending they are ordinary one-to-one mappings.

`UNMATCHED` and `UNSUPPORTED` remain in the denominator and cannot support positive assignment-feature claims. That is the correct claim ceiling.

Verdict: `CLOSED`.

## All-cell denominator closure

The primary denominator is the frozen Cartesian product:

`MODEL × SOURCE_REPRESENTATION × HELDOUT_RELATION_INSTANCE × OPTIMIZER_ACTION × REPETITION × PROCESS_CONTROL_ARM`.

The status vocabulary includes legality, lineage, session, output-quality and infrastructure failures. Failed, normalized-away, unsupported and ambiguous cells cannot be excluded; missing data cannot be imputed as success; the denominator and failure penalty must be frozen before any future Stage A run. Instrumentation-on/off pairs are required for interpretable flips and cost.

External releases/EP routes are separate strata with their own exact stacks and complete denominators, preventing incompatible-version pooling.

Verdict: `CLOSED`.

## Q2 breadth and baseline closure

The Q2 floor is not claimed as a result. It is a minimum evidence shape: at least 12 public models across three families, all four relation families, held-out models and relations, plus a separate second-release or same-version public-EP stratum.

The baseline union is strong and information-separated:

- output-only differential;
- raw timing/full-cost proxy;
- simple static structure;
- native ORT assignment information;
- full per-representation optimizer grid as offline oracle;
- version-compatible public Mobius/QNN lineage where available.

Identical cell inputs/options/controls, charged baseline overhead, mandatory feature ablation and no post-result tuning are explicit. If public lineage components are unavailable, the contract requires honest unavailability rather than private replacement. The Q2 failure conditions prevent a thin profiler/mutation paper from passing.

Verdict: `CLOSED_FOR_STAGE0`; future evidence must still satisfy it.

## Stage A killer closure

The future probe is bounded and mechanism-specific: two model families, two justified relation families, normalized-away negatives, the three-action grid, held-out reuse without retuning, fresh-process controls and paired instrumentation.

It kills the direction if assignment changes vanish after legality/process controls, lineage remains ambiguous, changes are decision-neutral, flips are observer/cache artifacts, assignment features do not beat timing/structure, negative controls flip comparably, or positive interpretation requires failed-cell exclusion/retuning. A positive outcome is explicitly capped at preliminary support.

Verdict: `CLOSED_FOR_FUTURE_STAGEA_ASSIGNMENT`.

## Strongest counter-argument and resolution

The strongest objection is that several exact values remain deferred: model identities, relation instances, holdout split, repetition count, failure penalty, output tolerances and provider-options hash. If these were selectable after results, the repaired denominator would be illusory.

The contracts resolve this at the correct phase boundary: every item must be frozen before any future cell runs, result-aware reassignment/backfill is forbidden, and the Stage A killer lists these freezes as preclaim gates. Stage 0 does not require the Stage A packet to exist; it requires a finite same-object closure plan. Failure to materialize any item later must fail `PRE_CLAIM_CONTRACT_FIDELITY_GATE` and cannot consume the present PASS as scientific evidence.

This residual is therefore an execution-readiness obligation, not an unclosed Stage 0 scientific revision.

## Decision

### Scientific verdict

`PASS_RECOMMENDED`

### Operational disposition

`READY_FOR_MAINLINE_STAGE0_PASS_REGISTRATION_AND_SEPARATE_STAGEA_ASSIGNMENT`

### Quality tier

`TIER_B_Q2_VIABLE`

### Claim ceiling

`CONDITIONAL_PAPER_POTENTIAL_ONLY__STATIC_CONTRACT_CLOSED__ZERO_CANDIDATE_RESULT`

### Non-negotiable next gate

A future Stage A assignment must freeze exact artifacts, model/relation identities, holdouts, R, failure penalty, numeric oracle/tolerances, provider options and all cell IDs before any claim-bearing observation. No second Stage 0 revision is available.

