# Source104 S1 — Public-Carrier-First 离线 Seed Pool

本池在公开检索前冻结；每个 seed 先指定一个可能定义同对象的版本化公开 carrier。它们不主张当前缺口、新颖性、性能、论文质量或 Source103 审计结论。

## Pool metadata

- Assignment / lane: `DISCOVERY-S1-20260824-SOURCE104-PUBLIC-CARRIER-DIVERSIFIED-V1` / `DISCOVERY_S1`
- Allocation mode: `EXACT_PUBLIC_CARRIER_FIRST_DIVERSIFICATION`
- Seed ceiling: `<=12`；本池：`8`
- RQ candidate ceiling: `<=8`
- Network-security exclusion check: `PASS`
- Generation completed before evidence lookup: `YES`
- Rule-Audit input used: `NO`
- Group-repository input used: `NO__FORBIDDEN_BEFORE_PUBLIC_CARRIER_FREEZE`

## Divergence coverage

| Engine | Used | Seed IDs |
|---|---:|---|
| `BISOCIATION_STRUCTURAL_TRANSFER` | yes | S1-104-03, S1-104-07 |
| `PROBLEM_REFRAMING` | yes | S1-104-01, S1-104-05 |
| `CONSTRAINT_MANIPULATION` | yes | S1-104-02, S1-104-06 |
| `NEGATION_OR_INVERSION` | yes | S1-104-04 |
| `ABSTRACTION_LADDER` | yes | S1-104-08 |
| `ADJACENT_POSSIBLE_OR_BOUNDARY` | no | — |
| `JANUSIAN_TENSION` | no | — |
| `COMPOSE_DECOMPOSE_SIMPLIFY` | yes | S1-104-05, S1-104-07 |

## Seed records

### `S1-104-01`

- Engine: `PROBLEM_REFRAMING`; perspective: `COMPILER_OR_BACKEND_ENGINEER`
- Exact public anchor candidate: TorchAO current `Int4WeightOnlyConfig` and its current quantized-linear dispatch source.
- Idea sketch: Treat target packing as an observable quantized-linear semantic contract, not merely a tensor layout choice. Ask whether a compiler-visible action can preserve groupwise INT4 endpoint semantics while selecting a target packing path under a finite device/layout condition.
- Conclusion-first test: A viable result would be a target-specific lowering decision with a small equality witness and full packing/dispatch cost, not a new format name.
- Structural tension: one logical groupwise format versus distinct packing/dispatch conditions.
- Generic/current risk: TorchAO may already encode exactly this action through layout and dispatch.
- Evidence needed: current source for type/dispatch, one finite target condition, and an action that survives the generic-layout subtractor.
- Preliminary disposition: `KEEP_FOR_CONVERGENCE`

### `S1-104-02`

- Engine: `CONSTRAINT_MANIPULATION`; perspective: `MAINTAINER`
- Exact public anchor candidate: current ExecuTorch quantizer and a concrete public backend/delegate lowering source.
- Idea sketch: Freeze one quantized operator and ask whether a delegate-selection boundary changes the required integer rounding/scale/zero-point semantics under a documented fallback. The candidate action must be a backend-native lowering choice, not a diagnostics wrapper or a generic delegate policy.
- Conclusion-first test: At most, this could establish a compiler/runtime choice that keeps a fixed operator contract across an exact delegate/fallback boundary.
- Structural tension: edge graph quantization representation versus delegate-native operator contract.
- Generic/current risk: the existing quantizer/backend may already define the action, or the residual may be a configuration test.
- Evidence needed: one versioned current carrier, exact default/nondefault delegate path, and a smallest semantics-separating witness.
- Preliminary disposition: `KEEP_FOR_CONVERGENCE`

### `S1-104-03`

- Engine: `BISOCIATION_STRUCTURAL_TRANSFER`; perspective: `THEORIST`
- Exact public anchor candidate: current MLIR quant dialect and a single public target backend lowering it supports.
- Idea sketch: Model rounding responsibility as an explicit lowering obligation carried to a target action rather than left as a generic conversion detail. The candidate is admissible only if one backend has a finite action set where the rounding/overflow decision changes target code selection under a fixed endpoint.
- Conclusion-first test: The narrow claim would be a target-constrained quantized-lowering construction, not a general MLIR extension.
- Structural tension: quant type semantics specify scale/zero-point but defer lower-level rounding choices to the transform pipeline.
- Generic/current risk: MLIR lowering or target legalize passes may already make the construction ordinary.
- Evidence needed: exact backend carrier, current source locus, and a non-generic target action.
- Preliminary disposition: `KEEP_FOR_CONVERGENCE`

### `S1-104-04`

- Engine: `NEGATION_OR_INVERSION`; perspective: `COMPILER_OR_BACKEND_ENGINEER`
- Exact public anchor candidate: llama.cpp current quantization source for one fixed K-quant format and one current backend implementation.
- Idea sketch: Treat a backend's quantized decode as the reference and ask whether an alternate current backend must preserve a fixed dequantization/accumulation endpoint under a finite layout/alignment boundary. The contribution cannot be a cross-backend differential tester; it needs an atomic backend lowering or representation action.
- Conclusion-first test: A valid result would be a same-format backend action with a stated no-gain region and full conversion/memory cost.
- Structural tension: format-level reference semantics versus backend-specific packed arithmetic.
- Generic/current risk: llama.cpp may already implement or explicitly constrain the relevant action.
- Evidence needed: one exact format, two current backend loci, and a source-supported residual decision.
- Preliminary disposition: `KEEP_FOR_CONVERGENCE`

### `S1-104-05`

- Engine: `COMPOSE_DECOMPOSE_SIMPLIFY`; perspective: `OPERATOR`
- Exact public anchor candidate: TorchAO current tiled INT4 path, including its type/packing/linear dispatch sequence.
- Idea sketch: Decompose the fixed path into qparam choice, pack, dispatch-condition, and quantized-linear action, then test whether a change in shape/layout legality can be handled by a distinct semantics-preserving compiler action. The object remains the same quantized-linear endpoint; changing bit width, group rule, or output contract is forbidden.
- Conclusion-first test: The only acceptable conclusion is a target-native legality/action residual beyond the current tiled-layout mechanism.
- Structural tension: target shape/layout constraints versus stable groupwise endpoint.
- Generic/current risk: the path may collapse to TorchAO's existing layout dispatch or a simple no-op fallback.
- Evidence needed: exact source branch, one small legality witness, and an alternative current path.
- Preliminary disposition: `KEEP_FOR_CONVERGENCE`

### `S1-104-06`

- Engine: `CONSTRAINT_MANIPULATION`; perspective: `MAINTAINER`
- Exact public anchor candidate: current ExecuTorch quantized-decomposed representation plus one backend partitioner.
- Idea sketch: Hold the graph-level quantized operator fixed and change only which quantization parameters are materialized before delegate partitioning. The possible residual must alter a documented backend-native action and account for fallback/data-movement cost, not merely change graph serialization.
- Conclusion-first test: A successful result would establish one finite, same-object materialization/partition decision with a precise semantic witness.
- Structural tension: graph-level parameter materialization versus backend partition legality.
- Generic/current risk: existing quantizer/delegate passes may already own the decision.
- Evidence needed: current source/docs for both graph representation and partitioner, plus a public minimal carrier.
- Preliminary disposition: `KEEP_FOR_CONVERGENCE`

### `S1-104-07`

- Engine: `BISOCIATION_STRUCTURAL_TRANSFER`; perspective: `HARDWARE_ARCHITECT`
- Exact public anchor candidate: llama.cpp current K-quant tensor contract and its CPU/GPU offload/backend interface.
- Idea sketch: View a quantized tensor handoff between host and device as a representation-ownership boundary: the consumer must know the exact packed group and accumulator contract, not merely byte storage. The candidate action must be a public same-object backend/offload choice with full host-transfer and conversion cost.
- Conclusion-first test: The narrow claim would be a semantics-bearing offload/lowering action, not a generic memory-placement policy.
- Structural tension: persistent packed weight ownership versus backend-specific compute representation.
- Generic/current risk: existing offload and backend quantization code may absorb the action; an unverified NDP bridge is forbidden.
- Evidence needed: versioned public carrier, consumer contract, current source counterexample, and full-cost denominator.
- Preliminary disposition: `KEEP_FOR_CONVERGENCE`

### `S1-104-08`

- Engine: `ABSTRACTION_LADDER`; perspective: `COMPILER_OR_BACKEND_ENGINEER`
- Exact public anchor candidate: one current public compiler/runtime low-bit lowering source selected from TorchAO, ExecuTorch, llama.cpp, or MLIR after anchor closure.
- Idea sketch: Raise the question from one packed kernel to a finite representation-state decision, then immediately require a single carrier and an atomic target action before it survives. This seed exists to test whether a non-generic decision construction can be named without reproducing the prohibited generic compiler-layout bridge.
- Conclusion-first test: If it remains only an abstract conversion graph after anchor closure, it must be excluded rather than promoted.
- Structural tension: reusable state abstraction versus target-native action/guarantee.
- Generic/current risk: high; generic conversion graph or selector shell.
- Evidence needed: one public carrier whose state/action/endpoint cannot be expressed by the current generic mechanism.
- Preliminary disposition: `KEEP_FOR_CONVERGENCE`

## Coverage-constrained convergence

All eight seed identities are frozen before evidence lookup. They differ by carrier and atomic boundary (TorchAO packing/dispatch, ExecuTorch delegate/materialization, MLIR target lowering, llama.cpp backend/offload); no new seed will be added after results appear.

| Selected seed | Intended carrier boundary | RQ candidate ID |
|---|---|---|
| S1-104-01 | TorchAO INT4 format → packed linear dispatch | RQ-S1-104-01 |
| S1-104-02 | ExecuTorch graph quant → delegate/fallback | RQ-S1-104-02 |
| S1-104-03 | MLIR quant → one target backend | RQ-S1-104-03 |
| S1-104-04 | llama.cpp K-quant → backend arithmetic | RQ-S1-104-04 |
| S1-104-05 | TorchAO tiled legality → packed execution | RQ-S1-104-05 |
| S1-104-06 | ExecuTorch qparam materialization → partition | RQ-S1-104-06 |
| S1-104-07 | llama.cpp packed ownership → backend/offload | RQ-S1-104-07 |
| S1-104-08 | one public carrier → non-generic state/action | RQ-S1-104-08 |

## Advisory

- `DIVERGENCE_COVERAGE_ADVISORY`: `PASS`
- Plain-Chinese note: 本轮只改变“先找同对象公开 carrier”的工作顺序。每个 seed 都先把通用 layout、format rename、checker 和旧 vLLM terminal 当作强反例。
