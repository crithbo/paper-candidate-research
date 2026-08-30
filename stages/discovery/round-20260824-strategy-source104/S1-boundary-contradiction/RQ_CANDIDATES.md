# Source104 S1 — Pre-evidence RQ Candidates

## `RQ-S1-104-01`

- Seed: `S1-104-01`; carrier: current TorchAO INT4 weight-only configuration and quantized-linear dispatch.
- Stable object/guarantee: groupwise INT4 `nn.Linear` endpoint under one versioned TorchAO carrier; no format, output, or full-cost substitution.
- Primary RQ: 在固定 TorchAO groupwise INT4 linear contract 下，是否存在一个由当前 source 支持的 target packing/dispatch action，其语义与成本边界不能被既有 layout/dispatch mechanism 完全表达？
- Primary route: current TorchAO source/docs → target dispatch path → closest packing/layout/quantized-linear subtractor.
- Transport fallback: versioned official release source only.
- Null: current layout tensor and dispatch table already express the action.
- Forbidden reformulation: new packing-format name, generic compiler-layout bridge, or checker-only result.

## `RQ-S1-104-02`

- Seed: `S1-104-02`; carrier: one current public ExecuTorch quantizer plus delegate backend/fallback path.
- Stable object/guarantee: one quantized operator's exact parameter/rounding endpoint across graph and selected delegate.
- Primary RQ: 在同一 ExecuTorch quantized operator 与固定 delegate/fallback contract 下，是否存在不同于普通 partition policy 的 backend-native lowering action，可保持规定整数语义并改变部署决策？
- Primary route: exact quantizer source → exact partitioner/backend source → current delegate and compiler subtractor.
- Transport fallback: official versioned source snapshot.
- Null: current quantizer and backend already preserve or prescribe all legal paths.
- Forbidden reformulation: generic delegate selection or serialisation-only change.

## `RQ-S1-104-03`

- Seed: `S1-104-03`; carrier: one public MLIR quant pipeline and one supported target backend.
- Stable object/guarantee: one quantized op's scale/zero-point/rounding endpoint through that one pipeline.
- Primary RQ: 对一个已版本化的 MLIR quant-to-target pipeline，能否定义一个 target-constrained lowering action，使 transform-pipeline 的 rounding/overflow obligation 成为可检验且非通用的 code-selection decision？
- Primary route: MLIR current quant/lowering source → exact backend lowering source → QNN/MLIR/compiler subtractor.
- Transport fallback: official tag or generated documentation at the frozen version.
- Null: existing lowering already fixes the decision or no target-specific residual exists.
- Forbidden reformulation: generic dialect extension or cross-system bridge.

## `RQ-S1-104-04`

- Seed: `S1-104-04`; carrier: one current llama.cpp K-quant format and two named backends.
- Stable object/guarantee: same K-quant tensor format, dequantization/accumulation endpoint, and backend full cost.
- Primary RQ: 对固定 llama.cpp K-quant format，是否存在一个公开 backend-specific representation/lowering action，在一个有限 layout/alignment boundary 保持同一 endpoint，却不等同于现有 backend implementation 或 differential test？
- Primary route: current format source → backend A/B current source → format/kernel literature subtractor.
- Transport fallback: official tag source.
- Null: native backends already implement/constrain the entire action union.
- Forbidden reformulation: backend benchmark, generic pack conversion, or unverified NDP extension.

## `RQ-S1-104-05`

- Seed: `S1-104-05`; carrier: current TorchAO tiled INT4 type/packing/dispatch path.
- Stable object/guarantee: one groupwise INT4 linear result and all pack/dispatch/fallback cost.
- Primary RQ: 当固定 TorchAO tiled INT4 path 遇到一个明确 layout/shape legality boundary时，是否存在一个已定义的 target-native action residual，而不是 layout dispatch 已覆盖的条件分支？
- Primary route: current type/packing code → dispatch conditions → target kernel path and contrary tests.
- Transport fallback: official source release.
- Null: legality is already fully captured by current dispatch or skip behavior.
- Forbidden reformulation: parameter tuning, test generation, or changed shape/format contract.

## `RQ-S1-104-06`

- Seed: `S1-104-06`; carrier: one ExecuTorch quantized-decomposed operator and its public backend partitioner.
- Stable object/guarantee: fixed qparam materialization and same backend-visible integer endpoint.
- Primary RQ: 对固定 ExecuTorch operator，qparam materialization timing 是否留下一个可公开复现、目标 backend 特异、并影响 partition legality/full-cost 的原子 action？
- Primary route: current quantized-decomposed source → backend partitioner → compiler/delegate prior work.
- Transport fallback: versioned official source.
- Null: qparams are either canonicalized already or the effect is only serialization.
- Forbidden reformulation: generic graph rewrite or a private delegate claim.

## `RQ-S1-104-07`

- Seed: `S1-104-07`; carrier: current llama.cpp K-quant tensor contract and public CPU/GPU offload/backend interface.
- Stable object/guarantee: same stored quant tensor, consumer semantics, and host-transfer/conversion denominator.
- Primary RQ: 是否存在一个由当前 llama.cpp carrier 支持的 packed-tensor ownership/offload action，能在同一 K-quant endpoint 下改变 CPU/GPU backend selection，并超过普通 memory-placement policy？
- Primary route: current tensor contract → offload/backend source → low-bit runtime and full-cost subtractor.
- Transport fallback: official tag source.
- Null: current backend/offload code already owns the representation and placement action.
- Forbidden reformulation: NDP sketch without public same-object carrier or cache policy rename.

## `RQ-S1-104-08`

- Seed: `S1-104-08`; carrier: exactly one of the four public anchor families, selected only by source closure.
- Stable object/guarantee: fixed operator endpoint and finite target action set of that carrier.
- Primary RQ: 在已冻结 carrier 内，是否能提出一个不被当前 layout/quantizer/conversion graph 吸收的 representation-state action，并给出可反证的 target decision consequence？
- Primary route: anchor source → current source → generic-kernel/terminal identity subtractor.
- Transport fallback: frozen public release.
- Null: candidate remains a generic graph/selector shell.
- Forbidden reformulation: mixing carriers, changing endpoint, or late replacement after evidence.

## Pre-evidence audit

- All eight RQs preserve their seed's one-carrier boundary.
- No public evidence lookup occurred before this file was frozen.
- Selective depth: `OFF`; strong closure request: `NONE`.
