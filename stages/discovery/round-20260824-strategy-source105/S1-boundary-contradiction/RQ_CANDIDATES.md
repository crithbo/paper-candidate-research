# Source105 S1 — Pre-evidence RQ Candidates

## `RQ-S1-105-01`

- Carrier: Ramulator2 current request/DRAM command pipeline plus one public PIM command interface.
- Stable contract: one fixed LLM/linear tile mapping, command legality, operator data endpoint, and full timing/traffic cost.
- Primary RQ: 是否存在一个 target-specific mapping action，可将固定线性 tile 映射为公开 PIM command trace，并在 Ramulator2 当前 timing state 下保持 command legality 与数据依赖 endpoint，同时改变可部署 mapping decision？
- Primary route: Ramulator2 source → public PIM command model → current compiler/simulator subtractor.
- Null: existing request translation/controller already expresses the action.
- Forbidden reformulation: memory-model wrapper or generic scheduler policy.

## `RQ-S1-105-02`

- Carrier: Ramulator2 timing hierarchy plus one public PIM operation model.
- Stable contract: fixed command completion and consumer-visible result semantics.
- Primary RQ: 对公开 PIM operation，是否存在一个 command-completion/visibility construction，使 compiler mapping 可安全释放依赖消费者而不等同于普通 request reordering？
- Primary route: public timing source → PIM operation semantics → scheduler/ordering baseline.
- Null: existing timing constraints and scheduler already define all legal completions.
- Forbidden reformulation: changing completion definition or reporting only simulator timing.

## `RQ-S1-105-03`

- Carrier: one Ramulator2 memory-standard plugin and a public operator trace carrier.
- Stable contract: exact command prerequisite semantics and one operator's data-dependence endpoint.
- Primary RQ: 能否构造一个非通用、target-specific command prerequisite certificate，使 mapping-induced command coalescing 保留 DRAM state legality与固定 operator endpoint？
- Primary route: plugin state source → public trace carrier → formal/scheduling subtractor.
- Null: generic dependency scheduling or trace validation covers it.
- Forbidden reformulation: generic checker/certificate without command decision consequence.

## `RQ-S1-105-04`

- Carrier: public PIM command model with explicit shared timing/state resource.
- Stable contract: fixed tile mapping and shared-resource timing semantics.
- Primary RQ: 当固定 LLM tile mapping 跨共享 DRAM timing/state resource时，是否有一个 target-specific interference-aware mapping action 可同时维持 endpoint 与完整 cost，而不是复述现有 controller constraint？
- Primary route: exact command model → shared-state source locus → controller/PIM prior work.
- Null: current controller/configuration fully captures the interference.
- Forbidden reformulation: parameter tuning or changed cost denominator.

## `RQ-S1-105-05`

- Carrier: Ramulator2 address mapping and a public PIM tensor-layout carrier.
- Stable contract: fixed logical tensor layout, address-to-command semantics, and same operator output.
- Primary RQ: 是否存在一个超出普通 address-map configuration 的 constrained address decomposition algorithm，使公开 PIM layout 的 command locality 改变而不改变其同对象数据语义？
- Primary route: address mapping source → public PIM layout/spec → mapping-algorithm subtractor.
- Null: address-map options and standard tiling absorb the action.
- Forbidden reformulation: address-map tuning only.

## `RQ-S1-105-06`

- Carrier: Ramulator2 issue/retire pipeline and one public PIM operator interface.
- Stable contract: fixed visibility order, operator output, and all queue/synchronization cost.
- Primary RQ: 能否对公开 PIM operator 构造一个语义可证的 issue/retire overlap action，使仅独立部分重叠且不退化为当前 scheduler/open-page policy？
- Primary route: current issue/retire source → operator boundary → strong scheduler baseline.
- Null: existing request scheduler already represents the overlap.
- Forbidden reformulation: speculative issue without fixed visibility semantics.

## `RQ-S1-105-07`

- Carrier: one public PIM functional model plus Ramulator2 timing carrier.
- Stable contract: same PIM operation result, command completion event, and timing cost.
- Primary RQ: 是否存在一个改变 mapping legality/full-cost decision 的 functional-result-to-timing-event correspondence action，而非跨模拟器包装或测试 harness？
- Primary route: public functional model → Ramulator2 command/timing source → co-simulation/subtractor literature.
- Null: the relation is external harness alignment only.
- Forbidden reformulation: generic co-simulation wrapper.

## `RQ-S1-105-08`

- Carrier: one versioned Ramulator2 public memory-standard/PIM plugin.
- Stable contract: fixed command state graph, canonical operator trace, and guarantee.
- Primary RQ: 在固定 public plugin state graph 和 canonical LLM/linear trace 上，能否给出一个非通用 mapping algorithm/formal guarantee，而不是通用 state-space search？
- Primary route: plugin current source → canonical trace → formal/mapping baseline.
- Null: generic model checking/scheduling covers it.
- Forbidden reformulation: abstract state graph without target command action.

## Pre-evidence audit

- Eight RQs retain a single public command/timing carrier requirement.
- No public source lookup occurred before this RQ file was frozen.
- Selective depth: `OFF`; strong closure request: `NONE`.
