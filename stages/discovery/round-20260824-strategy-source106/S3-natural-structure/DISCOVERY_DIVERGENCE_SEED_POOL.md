# Source106 S3 离线发散 Seed Pool

本池在外部检索、下载、资源动作和科学判断之前一次性冻结。所有 seed 为非证据草图，不声称低比特模型/内核存在缺口、值分布规律或性能收益。

## Pool metadata

- Assignment / lane: `DISCOVERY-S3-20260824-SOURCE106-ACCELERATOR-SOFTWARE-ROTATION-V1` / `DISCOVERY_S3`
- Seed ceiling: `<=12`; 本池: `6`
- Network-security exclusion check: `PASS`
- Generation completed before evidence lookup: `YES`
- Forbidden identity hold: `CRFEPOCH-HBMPIM-LLM-GEMV-REV0` exact/contains excluded; its Stage0 outputs/chat were not read.

## Seed records

### `S3-106-01`

- Engine / perspective: `BISOCIATION_STRUCTURAL_TRANSFER` / `HARDWARE_ARCHITECT`
- Starting anchor: A public ternary/low-bit LLM may have a value alphabet and group structure that permits a target-specific accumulation/data-movement construction beyond generic format conversion.
- Public anchor candidate: Versioned open ternary LLM model artifact and current reference kernel.
- Idea sketch: A valid action must preserve the published low-bit numerical contract and account for scales, packing, metadata, and accumulation exactly. It cannot merely rename bit-serial or ternary GEMV.
- Conclusion-first test: One public value-structure property changes a defined target accumulator/mapping decision under full cost.
- Main risk: Current BitNet/ternary kernels already cover the action.
- Evidence required: exact model/kernel semantics, target interface, fair current comparator, and bit-exact witness.
- Generic-shell test / disposition: `PASS` / `KEEP_FOR_CONVERGENCE`

### `S3-106-02`

- Engine / perspective: `CONSTRAINT_MANIPULATION` / `COMPILER_OR_BACKEND_ENGINEER`
- Starting anchor: Public block-scaled activation formats may induce a fixed relation between scale blocks, tiles, and accumulator reuse that is not visible from nominal bitwidth.
- Public anchor candidate: Versioned low-bit model/checkpoint metadata and a current GPU/accelerator kernel artifact.
- Idea sketch: The candidate would be a target-specific scale-layout or reduction construction with same output semantics and charged scale traffic. It cannot be a new packing name or a generic block-size sweep.
- Conclusion-first test: A named scale-block/value relation changes a fixed kernel/mapping decision and has an explicit no-gain region.
- Main risk: MXFP/Marlin/FlashInfer/current quantized kernels already implement it.
- Evidence required: public format definition, kernel source, target action, full-cost ledger, and checker.
- Generic-shell test / disposition: `PASS` / `KEEP_FOR_CONVERGENCE`

### `S3-106-03`

- Engine / perspective: `JANUSIAN_TENSION` / `MEASUREMENT_REVIEWER`
- Starting anchor: A public quantized model's layerwise activation/value structure may make a single global low-bit accuracy or cost figure invalid for one target placement decision.
- Public anchor candidate: Public quantized-model statistics/benchmark and current kernel/runtime.
- Idea sketch: This can be a measurement contribution only if a frozen statistic changes a decision threshold with a held-out model/operator witness. It must be more than reporting outliers or recommending mixed precision.
- Conclusion-first test: One exact public statistic reverses a stated target mapping/precision conclusion.
- Main risk: AWQ/SmoothQuant/KIVI-style saliency/outlier methods absorb the claim.
- Evidence required: exact statistic, decision endpoint, strong baseline, and held-out falsifier.
- Generic-shell test / disposition: `PASS` / `KEEP_FOR_CONVERGENCE`

### `S3-106-04`

- Engine / perspective: `COMPOSE_DECOMPOSE_SIMPLIFY` / `SYSTEM_ARCHITECT`
- Starting anchor: Decode-stage low-bit GEMV and prefill-stage matrix operations may share weight values but have incompatible natural reuse/mapping units.
- Public anchor candidate: Open LLM operator trace/benchmark and current quantized kernel source.
- Idea sketch: A target action may jointly organize immutable weight blocks across two execution modes only if same-format semantics and transition costs remain explicit. It cannot become a generic cache or a scheduler policy.
- Conclusion-first test: A public operator-mode structure changes one fixed placement/mapping construction under full cost.
- Main risk: Existing serving runtimes already separate or reuse the relevant weights fully.
- Evidence required: mode trace, exact kernels, target memory interface, and no-gain witness.
- Generic-shell test / disposition: `PASS` / `KEEP_FOR_CONVERGENCE`

### `S3-106-05`

- Engine / perspective: `ABSTRACTION_LADDER` / `THEORIST`
- Starting anchor: Repeated low-bit group/scale layout in a public LLM may define a canonical mapping instance family with a non-product capacity/legality constraint.
- Public anchor candidate: Public quantized operator format plus open mapping interface.
- Idea sketch: A theory/method route requires a fixed guarantee, construction, and checker; group size alone is insufficient. The construction cannot reproduce the held CRFEPOCH/PIM epoch object.
- Conclusion-first test: A non-product mapping construction holds for one named low-bit operator family.
- Main risk: Collapses to generic GEMM tiling, format packing, or the held CRFEPOCH identity.
- Evidence required: exact format/operator contract, target constraint, current mapping comparator, and oracle.
- Generic-shell test / disposition: `PASS` / `KEEP_FOR_CONVERGENCE`

### `S3-106-06`

- Engine / perspective: `NEGATION_OR_INVERSION` / `MEASUREMENT_REVIEWER`
- Starting anchor: A published low-bit operator benchmark may hide scale/metadata/activation conversion costs that reverse one target comparison.
- Public anchor candidate: Versioned public low-bit kernel benchmark and source implementation.
- Idea sketch: A benchmark-validity contribution needs an exact omitted cost, conclusion endpoint, and held-out check; it is not a general accounting complaint. It must avoid the existing low-bit format/pipeline terminal identities.
- Conclusion-first test: One omitted complete-cost component changes a named benchmark ranking or decision.
- Main risk: Existing papers already report all costs or the proposed endpoint is only a dashboard correction.
- Evidence required: benchmark protocol, source path, cost boundary, counter-comparator, and falsifier.
- Generic-shell test / disposition: `PASS` / `KEEP_FOR_CONVERGENCE`

## Coverage-constrained convergence

Selection was frozen before evidence lookup.

| Selected seed | Intended exact action family | RQ Candidate ID |
|---|---|---|
| S3-106-01 | ternary value-aware accumulator/mapping | S3-106-RQ01 |
| S3-106-02 | block-scale layout/reduction construction | S3-106-RQ02 |
| S3-106-04 | immutable low-bit weight mapping across prefill/decode | S3-106-RQ03 |
| S3-106-06 | benchmark full-cost decision validity | S3-106-RQ04 |

## Advisory

- Engines used: 6
- `DIVERGENCE_COVERAGE_ADVISORY`: `PASS`
- Plain-Chinese note: 候选只在相同低比特语义、完整 scale/metadata/转换成本和明确 target action 同时存在时才可能进入 raw；不得以格式/packing 改名进入。
