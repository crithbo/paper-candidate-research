# Research Question Cards — Source26

All cards derive from the offline pool in `DIVERGENCE_SEED_POOL.md`. The source triad was precommitted before any lookup and is recorded in `SOURCE_ROLE_LEDGER.yaml`. No Question Card was promoted through a score or quota.

## QC26-01 — Binaryen incremental WebAssembly structuring

- Identity: `BINARYEN_INCREMENTAL_WASM_STRUCTURING_REGION_STABILITY`; Source seed `S26-01`, `BISOCIATION_STRUCTURAL_TRANSFER`, compiler binary/state cluster.
- Exact identity / carrier: a WebAssembly binary module processed by current Binaryen `wasm-opt`; canonical formal validation carrier, WebAssembly 3.0 validation specification dated 2026-08-12.
- Problem / proposed insight: Bound the structured-control-flow region rewritten after a module edit while preserving valid stock-consumable WebAssembly. The intended non-generic discriminator is typed-stack control-flow structure, not a generic CFG rewrite.
- Contract if it survived: `COMPILER_TOOL`, N2; fixed module validation and observable semantics; full cost would include parse, all optimization/validation work, module bytes, peak RSS/temp, and debug/source-map preservation.
- Current union / contrary: the official Binaryen repository documents `wasm-opt`, a many-pass optimizer, and the `ReReloop` pass that transforms structured control flow to CFG and back. The official validation specification supplies validity rules but does not on its own certify semantic recovery after the proposed edit.
- Cheapest falsifier: a two-edit module pair whose regional constructor is expressible by the current `wasm-opt`/ReReloop union, or whose output fails validator/observable-behavior equivalence.
- Required-field audit: INCOMPLETE. The current union is adverse and this batch did not freeze a distinct semantic-equivalence oracle or versioned natural edit carrier.
- Identity relation / disposition: `CONTAINED`; `EXCLUDED_BEFORE_RAW__BINARYEN_RERELOOP_CURRENT_UNION_AND_WAVE224_CONTAINMENT`.
- Plain reason: 当前 Binaryen 已将 Wasm structuring/restructuring 纳入优化 pass union；进一步把它称作局部重构并不能形成明确的 union 外动作。

## QC26-02 — Yosys fixed-library incremental technology mapping

- Identity: `YOSYS_FIXED_LIBRARY_INCREMENTAL_TECHMAP_RECOVERY`; Source seed `S26-03`, `CONSTRAINT_MANIPULATION`, logic/RTL exact-constructor cluster.
- Exact identity / carrier: fixed target cell-library mapping for a Verilog-2005 RTL delta in current Yosys; candidate carrier would need a dated public RTL mutation history and stock equivalence result.
- Problem / proposed insight: Keep exact logic-equivalence under a fixed library while limiting remapped cones after a local RTL change. The needed non-generic discriminator would be a target-library recourse theorem, not a SAT-backed generic resynthesis call.
- Current union / contrary: Yosys officially describes a synthesis framework composed by combining existing passes and scripts; YosysHQ's EQY is an equivalence-checking front end for Yosys flows. Registry records existing active/reserved Yosys/ABC/AIGER and Yosys technology-mapping families, including a `YOSYS_MEMORY_BANKING_PORT_MAPPING_TECHNOLOGY_MAPPING_N2` family.
- Cheapest falsifier: show the proposed action is a stock pass/script composition or generic SAT/ABC mapping; otherwise, a fixed library plus two RTL revisions must pass stock equivalence while meeting a predeclared recourse bound.
- Required-field audit: INCOMPLETE. No target-cell library, dated natural delta carrier, or non-generic action survives the existing mapping/checking union.
- Identity relation / disposition: `CONTAINED`; `EXCLUDED_BEFORE_RAW__ACTIVE_YOSYS_MAPPING_FAMILY_AND_GENERIC_KERNEL_RISK`.
- Plain reason: 固定库局部映射尚未形成与已有 Yosys/ABC 映射族清晰分离的原子动作，不能把现有 pass 脚本重命名为论文构造器。

## QC26-03 — IREE bit-exact layout state transfer

- Identity: `IREE_BITEXACT_LAYOUT_BOUNDED_STATE_TRANSFER`; Source seed `S26-07`, `JANUSIAN_TENSION`, accelerator state-layout cluster.
- Exact identity / carrier: a named IREE backend layout/dispatch action under bit-exact output; no target backend, versioned model carrier, or stock oracle was frozen.
- Problem / proposed insight: An on-chip memory-budget change might motivate a bounded-movement target backend constructor. The question would matter only if it has a named backend and bit-exact checker rather than a layout-option grid.
- Current union / contrary: official IREE identifies itself as a retargetable MLIR-based compiler/runtime toolkit. The frozen assignment expressly forbids generic MLIR-layout primary origins; registry additionally records prior IREE AMDGPU/LLVMGPU scheduler/config absorption.
- Cheapest falsifier: a purported action reduces to target config or generic MLIR scheduling; no backend-specific state/action is then left.
- Required-field audit: INCOMPLETE.
- Identity relation / disposition: `CONTAINED`; `EXCLUDED_BEFORE_RAW__FORBIDDEN_GENERIC_MLIR_ORIGIN_AND_PRIOR_IREE_ABSORPTION`.
- Plain reason: 未冻结某一后端的 bit-exact 语义与原子状态动作，当前线索只是可重定向 MLIR 框架，合同明确不录取。

## QC26-04 — Protobuf compatible descriptor-table update

- Identity: `PROTOBUF_DESCRIPTOR_SET_COMPATIBLE_BOUNDED_RECOURSE_UPDATE`; Source seed `S26-08`, `COMPOSE_DECOMPOSE_SIMPLIFY`, structured-artifact cluster.
- Exact identity / carrier: a version-pinned Protobuf language binding's descriptor/schema update under stock reader acceptance and cross-version runtime contract. Current public repository `main` is not a reproducible release pin; its README recommends a release commit because head can be source-incompatible or insufficiently tested.
- Problem / proposed insight: Update a compatible descriptor-table state with bounded rewrites while preserving a fixed runtime/wire semantic contract. The non-generic discriminator would have to be a concrete descriptor graph action and a fixed language binding, not external serialization or generic graph packing.
- Current union / contrary: official Protobuf documents an extensible structured-data serialization system and official cross-version documentation distinguishes generated code from runtimes, with explicit unsupported version-skew boundaries. These are strong contract constraints, not evidence for an unexpressed descriptor-update action.
- Cheapest falsifier: a two-version release-pinned schema pair where stock reader behavior changes, where the action changes gencode/runtime contract, or where it is merely generic graph packing.
- Required-field audit: INCOMPLETE. A dated public schema-mutation carrier, release-pinned current descriptor update union, fixed language binding, and exact reader oracle were not simultaneously frozen.
- Identity relation / disposition: UNKNOWN; `LOCATOR_ONLY__PUBLIC_EVIDENCE_UNCLOSED`.
- Plain reason: 这个方向没有因“当前没查到”被否定；只是本轮小证据路线不足以同时闭合版本、同对象 runtime contract、自然变更载体和原子动作，不能进入 raw。

## Funnel result

| Stage | Count |
|---|---:|
| Offline divergence seeds (non-scientific) | 12 |
| Precommitted selected locators | 4 |
| Source-triad ledgered locators | 4 |
| `FRESH_RAW_OPPORTUNITY` | 0 |
| C0 / D1 / deep | 0 / 0 / 0 |
| Grounded briefs / `PROPOSE_STAGE0` | 0 / 0 |
