# Source103 S1 — RQ Candidates（预证据冻结）

所有卡均由 `DISCOVERY_DIVERGENCE_SEED_POOL.md` 的完整 seed pool 收敛而来；本文件在读取定向公开证据前冻结。其内容不是 locator、raw、候选证据、新颖性或 Q1/Q2 结论。

## `RQ-S1-103-01`

- Seed / anchor candidate: `S1-103-01` / public MLIR quantization representation plus a public W4A16 runtime backend, version to be frozen.
- Stable object and immutable guarantee envelope: a packed W4A16 linear operator's declared output semantics and full operator-boundary result.
- Primary RQ: 对于固定 W4A16 线性算子的输出语义，是否存在一种由公开 compiler IR 表达并映射到公开后端的 lowering action，能在不把 conversion 当 wrapper 的条件下改变 unpack/scale/accumulate placement，同时保持固定语义与完整成本边界？
- Decision-relevant consequence: determine whether compiler lowering may choose the action as a distinct legal alternative rather than inheriting an opaque kernel conversion.
- Contribution type hypothesis: `COMPILER_TOOL`; route `N1/N2` unresolved.
- Alternative/null: current quantization legalization or backend kernel selection already expresses the same action.
- Primary evidence route: exact IR semantic contract → current official/runtime source locus → closest compiler/kernel subtractor.
- Transport-only fallback: archived release source if the current official route is mechanically unavailable.
- Selection: `YES`; forbidden outcome-aware reformulation: changing the operator endpoint, using a different precision format, or replacing lowering with a checker.
- Pre-RQ closure nomination: `ORDINARY_CLOSURE`.

## `RQ-S1-103-02`

- Seed / anchor candidate: `S1-103-02` / public W4A16 GEMM/GEMV operator contract and public target implementation, versions to be frozen.
- Stable object and immutable guarantee envelope: fixed quantized linear operation, fixed rounding/saturation endpoint, and full cost of tile merge.
- Primary RQ: 在固定 W4A16 GEMM/GEMV 数值合同下，是否存在目标约束的 K-tile partial-sum merge algorithm，使 tile partition 不改变规定的 rounding/saturation 结果，并在完整计算、metadata 与同步成本下留有非平凡 residual？
- Decision-relevant consequence: choose a correctness-constrained split/merge plan instead of generic tiling.
- Contribution type hypothesis: `METHOD_ALGORITHM`.
- Alternative/null: current split-K/mixed-precision implementations or standard accumulation semantics fully absorb the algorithm.
- Primary evidence route: operator arithmetic specification → current target source → split-K/quantized GEMM prior work.
- Transport-only fallback: public release tag/documentation when source transport fails.
- Selection: `YES`; forbidden outcome-aware reformulation: relaxing endpoint semantics, changing quantization scheme, or claiming speed without full-cost accounting.
- Pre-RQ closure nomination: `ORDINARY_CLOSURE`.

## `RQ-S1-103-03`

- Seed / anchor candidate: `S1-103-03` / public groupwise packed-weight format plus public target layout transform.
- Stable object and immutable guarantee envelope: groupwise W4 metadata-to-weight association, fixed logical operator result, and legal target layout.
- Primary RQ: 对于固定 groupwise W4 格式，能否定义并实现一个目标特异 layout transformation action，使 physical tile/remap 后的每个 weight 仍绑定原合同要求的 scale/zero-point group，而非只保证地址合法？
- Decision-relevant consequence: decide when a compiler may apply layout remapping or must choose a different lowering.
- Contribution type hypothesis: `COMPILER_TOOL`.
- Alternative/null: existing layout propagation or metadata packing already preserves/expresses the same group ownership.
- Primary evidence route: exact public format specification → current layout-lowering source → metadata/layout subtractor.
- Transport-only fallback: versioned public package source.
- Selection: `YES`; forbidden outcome-aware reformulation: reducing the claim to address checking or changing group granularity.
- Pre-RQ closure nomination: `ORDINARY_CLOSURE`.

## `RQ-S1-103-04`

- Seed / anchor candidate: `S1-103-04` / public quantized fusion pass and public operator semantics.
- Stable object and immutable guarantee envelope: fixed quantized operator endpoint including rounding/saturation and full fusion cost.
- Primary RQ: 是否存在一个面向公开 target backend 的 quantized fusion legality/action rule，能区分保持固定 endpoint 的融合与改变中间量化语义的融合，并使该区分改变实际 lowering 决策？
- Decision-relevant consequence: choose or reject a target-native fused form under the same operator contract.
- Contribution type hypothesis: `COMPILER_TOOL`.
- Alternative/null: existing fusion legality rules or operator specs already prescribe the result with no residual action.
- Primary evidence route: fusion source/specification → current backend execution form → contrary fusion/compiler literature.
- Transport-only fallback: public release documentation.
- Selection: `YES`; forbidden outcome-aware reformulation: generic differential testing or checker-only output.
- Pre-RQ closure nomination: `ORDINARY_CLOSURE`.

## `RQ-S1-103-05`

- Seed / anchor candidate: `S1-103-05` / public W4A16 runtime with current tail/alignment fallback path.
- Stable object and immutable guarantee envelope: same packed-weight format, same output endpoint, and same deployment fallback semantics.
- Primary RQ: 在公开 W4A16 runtime 的 fixed shape-tail/alignment domain 中，是否存在可部署的 compiler/runtime selection action，使 fast path、fallback 与混合路径都保持同一 quantization contract，并给出完整 fallback cost？
- Decision-relevant consequence: make tail execution a semantics-bearing selection problem rather than a performance-only exceptional case.
- Contribution type hypothesis: `SYSTEM_ARCHITECTURE` or `COMPILER_TOOL`, to be closed by anchor.
- Alternative/null: current native code already preserves the contract, or the residual is only test coverage.
- Primary evidence route: current docs/source/flags → one tail-path carrier → nearest low-bit runtime baseline.
- Transport-only fallback: official released source snapshot.
- Selection: `YES`; forbidden outcome-aware reformulation: asserting a bug from missing access or changing the fallback's output guarantee.
- Pre-RQ closure nomination: `ORDINARY_CLOSURE`.

## `RQ-S1-103-06`

- Seed / anchor candidate: `S1-103-06` / public LLM runtime exposing separate low-bit decode GEMV and prefill GEMM paths.
- Stable object and immutable guarantee envelope: one packed weight format and its declared logical linear-operator semantics.
- Primary RQ: 当 decode GEMV 与 prefill GEMM 共享固定 packed-weight format 但具有不同 reduction/information structure 时，是否存在可审计 IR/lowering action，能选择不同 target execution path 而保持同一 logical format contract，并优于普通 kernel specialization 的解释？
- Decision-relevant consequence: choose per-phase lowering under one same-format contract.
- Contribution type hypothesis: `COMPILER_TOOL`.
- Alternative/null: runtime's existing separate kernels/formats fully absorb any action.
- Primary evidence route: runtime exact format anchor → decode/prefill source loci → current kernel/format union.
- Transport-only fallback: versioned public source release.
- Selection: `YES`; forbidden outcome-aware reformulation: treating distinct formats or changed endpoints as one object.
- Pre-RQ closure nomination: `ORDINARY_CLOSURE`.

## `RQ-S1-103-07`

- Seed / anchor candidate: `S1-103-07` / public NDP execution model and public quantized reduction contract.
- Stable object and immutable guarantee envelope: fixed distributed reduction endpoint, target memory/transport model, and full data/control cost.
- Primary RQ: 在公开 NDP/PIM execution carrier 的固定 quantized reduction endpoint 下，是否存在联合选择 inter-slice representation 与 final quantization 的 mapping action，使语义保证、traffic、metadata 与 synchronization 成本同时可比？
- Decision-relevant consequence: decide where to widen/quantize under a single exact or explicitly bounded-error contract.
- Contribution type hypothesis: `SYSTEM_ARCHITECTURE` or `METHOD_ALGORITHM`.
- Alternative/null: existing quantized collectives, mapping controls, or simulator-specific schedules fully cover the action.
- Primary evidence route: public NDP carrier/specification → current mapping/source locus → nearest collective/quantized-reduction subtractor.
- Transport-only fallback: publicly archived source/specification.
- Selection: `YES`; forbidden outcome-aware reformulation: treating theoretical internal bandwidth as application benefit or changing the reduction endpoint.
- Pre-RQ closure nomination: `ORDINARY_CLOSURE`.

## `RQ-S1-103-08`

- Seed / anchor candidate: `S1-103-08` / public compiler lowering framework and public low-bit operator specification.
- Stable object and immutable guarantee envelope: representation-state transitions for one fixed operator contract and complete conversion/memory/launch cost.
- Primary RQ: 对于固定低比特 operator contract，能否构造一个 target-constrained representation-transition optimization whose atomic actions and legality/guarantee labels are not reducible to generic conversion-graph or instruction-selection choice？
- Decision-relevant consequence: select a legal transition sequence with an explainable guarantee/cost trade-off.
- Contribution type hypothesis: `METHOD_ALGORITHM`.
- Alternative/null: e-graph, instruction selection, or generic shortest-path/cost-model methods already absorb the formulation.
- Primary evidence route: compiler IR state model → target action/source locus → generic-kernel and closest prior-work search.
- Transport-only fallback: versioned official repository snapshot.
- Selection: `YES`; forbidden outcome-aware reformulation: generic format conversion, an unconstrained shortest path, or an altered endpoint.
- Pre-RQ closure nomination: `ORDINARY_CLOSURE`.

## Pre-evidence convergence audit

- All eight RQs retain their seed's object, semantic boundary and proposed contribution type hypothesis.
- No RQ was selected or rewritten from evidence results; public search has not begun.
- Selective depth request: `NONE` (`OFF` in frozen assignment).
