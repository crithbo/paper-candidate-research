# CRFEPOCH-HBMPIM-LLM-GEMV-REV0 — CRF-resident epoch scheduling for HBM-PIM LLM GEMV

## 中文摘要

- 研究机会：公开 HBM-PIM carrier 同时有 CRF/mode/PC 语义与 LLM GEMV mapping artifact。stock PIMSimulator 在每次 `executeGemv()` 中 program CRF 并围绕计算切换模式；UniNDP 以 instruction/status model 编译 LLM MVM，但当前固定 commit 未显式出现 CRF/programCrf/HAB_PIM state。
- 为什么可能值得做：若连续同模板 GEMV 可共享有限 CRF program 和 PIM mode epoch，mapping 可以优化真实 command/state transitions，而不是只优化 tile 或带宽。
- 为什么保留：当前未发现同一原子 action 的 direct fatal；UniNDP 和 DCC 是强 subtractor，必须由 Stage 0 重建其 source-level action coverage。
- 下一步：独立 Stage 0 先判定 DCC/UniNDP 是否已涵盖 CRF residency；若未涵盖，再审查 Llama2 trace 中是否有足够 template reuse 与可复现 full-cost witness。

- Status: `PROPOSE_STAGE0`
- Quality tier: `TIER_B_Q2_VIABLE`
- Opportunity origins: `O1 / O6`
- Domain tags: `HBM_PIM`, `NDP_COMPILER`, `LLM_INFERENCE`, `COMMAND_TIMING`, `MEMORY_SYSTEM`
- Contribution route: `N2`
- Discovery date: `2026-08-24`
- Discovery method revision: `RESEARCH_TOPIC_DISCOVERY_R1_R40_20260815`
- Discovery claim-pack mode: `OFF`
- Discovery RQ frontend mode/revision: `PRODUCTION`; `RQ_REFINEMENT_STAGED_EVIDENCE_V1`
- Opportunity family ID: `CRFEPOCH-HBMPIM-LLM-GEMV-REV0`
- Contribution type: `COMPILER_TOOL`
- Front-end disposition before deep review: `EVIDENCE_QUALIFIED_RAW`
- Carrier kind: `CANONICAL_BENCHMARK_ONLY`

## Research question

Can a compiler partition dependent public Llama2 GEMV sub-operators into CRF-resident HBM-PIM epochs that minimize legal CRF/mode transitions while preserving stock PIMSimulator command, PC, and result semantics under a 32-instruction CRF bound?

## Canonical research claim package

- Exact object and same-function/protocol/quality contract: PIMSimulator `dev` HBM2-PIM GEMV command protocol, including CRF programming, SB/HAB/HAB_PIM modes, command-triggered CRF PC, GRF output/reset, and identical GEMV result trace.
- Natural/canonical scenario or workload: public Llama2 7B/13B decode/prefill MVM shape artifacts from UniNDP; only canonical benchmark conclusions are claimed.
- Observed problem/opportunity and quantitative/static anchor: current stock code programs CRF in `executeGemv()`, resets PC at each output/batch PIM enable, and performs explicit park/mode/barrier transitions; UniNDP reports command/row-change metrics but its fixed current source does not name the CRF state.
- Intervention and atomic action: CRF-compatible epoch partition and schedule over adjacent same-template GEMV sub-operators.
- Claimed mechanism and prediction: reuse of a legal resident program/mode epoch removes only redundant program/mode transitions; it cannot cross an incompatible command template, PC state, dependency, or 32-entry capacity.
- Available/unavailable information: static shape and program-template information are available; dynamic values do not influence epoch legality. DCC source action coverage remains a bounded debt.
- Named comparator and fairness contract: stock PIMSimulator per-GEMV sequence; UniNDP HBM-PIM compiler; DCC; no-reuse schedule. All charge program writes, modes, barriers, commands, data movement, and result reset/readback.
- Expected effect target, output or guarantee: same output/command-PC semantics with non-worse full cost on reusable sequences; explicit no-gain region otherwise.
- Full-cost boundary: CRF writes, park/mode commands, barriers, DRAM/PIM commands, row changes, input broadcast, GRF operations, host interaction, and compiler time.
- Scope, no-gain/failure region and competing explanation: no gain when templates differ, program capacity is exceeded, data dependencies force a boundary, or current compiler already encodes the action; DCC/UniNDP may fully absorb it.
- Minimum falsifier: a two-GEMV reusable-template witness that fails legality/output equivalence or maps identically under the named baseline.
- Dependencies/resources and claim ceiling: public UniNDP source commit and public PIMSimulator source. Stage A may run only after a dedicated preclaim/resource contract; no implementation/hardware result is claimed now.

## Paper genealogy

- Anchor artifact: SAITPublic/PIMSimulator `dev`, `src/tests/PIMKernel.cpp`.
- Current compiler baseline: UniNDP (HPCA 2025), public artifact commit `c8b21684358441d29fc81fa0866d07cec20582ed`.
- Strong current comparator: DCC (ISCA 2026), public data-centric PIM compiler.
- Contrary evidence: UniNDP command/status-space simulation and stock PIMSimulator program/mode sequence.
- Artifact / benchmark: UniNDP Llama2 MM/MVM public workload descriptions and PIMSimulator GEMV validation path.
- Search boundary: public first-party sources and open academic material; `SEARCH_BOUNDED_OPEN`.

## Nearest-prior facet matrix

| Facet | Candidate | Closest prior | Residual |
|---|---|---|---|
| Exact object | PIMSimulator CRF/mode GEMV | UniNDP HBM-PIM MVM | current UniNDP source action coverage of CRF state is debt |
| Decision variable | CRF epoch boundary and program residency | instruction/data mapping, code/layout tuning | CRF capacity + command-PC + mode state |
| Guarantee | stock result/PC/mode legality | command timing/data dependency | requires small witness |
| Cost | program/mode plus memory/compute | instruction/DRAM/row-change and data rearrangement costs | add explicit CRF/park transition cost |

## Current collision classification

- DIRECT_FATAL: none found within bounded current sources.
- DIRECT_SUBTRACT: UniNDP instruction scheduling; DCC data/code-layout co-optimization.
- METHODOLOGICAL_ADJACENT: Ramulator2 state/timing model, PIMID full-system simulation.
- DEPLOYMENT_BASELINE: stock PIMSimulator `executeGemv()`.
- SEARCH_BOUNDED_OPEN: full DCC source-level CRF coverage remains bounded Stage 0 debt.

## Decisive falsifier

If DCC or UniNDP current source already represents a finite CRF program-residency/mode/PC state and chooses equivalent epochs, or if all public Llama2 template sequences fail CRF reuse/capacity/semantic equivalence, this candidate must be dropped.

## Executable evidence path

### Fidelity closure plan

- Status: `FINITE_FIDELITY_GAP`
- Complete atomic action and interface: epoch schedule emits stock-compatible PIMSimulator CRF program writes, mode commands, command-triggering reads, and result read/reset transitions.
- Real comparator: PIMSimulator stock `executeGemv()`, UniNDP HBM-PIM output, and DCC action coverage.
- Same-object boundary: no changed PIM ISA, format, LLM operator endpoint, or hidden PIM hardware assumptions.
- Common denominator/full cost: command trace, CRF/mode/park events, rows, data movement, latency, and compiler time.
- Small witness: two public Llama2-shape GEMV templates with same CRF instruction form.
- Finite closure steps: inspect DCC current source; pin PIMSimulator commit; generate static epoch plan; then dedicated Stage A preclaim gate before claim-bearing runs.
- Structural failure: direct DCC/UniNDP absorption, no reusable template, capacity/PC violation, or changed semantics.

### 72-hour first evidence

Static extraction of CRF templates and Llama2 GEMV shape sequences; build no simulator until Stage A resource/preclaim approval.

## Q1/Q2 sufficiency hypothesis

- Why this supports at least a complete Q2 paper: it supplies a new compiler scheduling variable tied to real HBM-PIM command state, reproducible public artifacts, strong named baselines, a finite equivalence oracle, and full-cost evaluation route.
- Why it may reach Q1, or why it remains Tier B: it remains Tier B until multi-model/architecture generality, DCC distinction, and broad evidence are demonstrated.
- What would still be required at Stage B: current collision closure, implementation, semantic witness suite, LLM workload matrix, full-cost sensitivity, and reproducible package.

## Non-relaxable quality audit

- Same-object: fixed PIMSimulator HBM-PIM command/mode/CRF GEMV contract.
- Latest collision: UniNDP and DCC explicitly named; Stage 0 must rebuild coverage.
- Strong fair baselines: stock PIMSimulator, UniNDP, DCC, no-reuse.
- Natural input/evidence: canonical public Llama2 MVM shapes; no natural deployment claim.
- Full-cost: mode/program/barrier/command/data movement charged.
- Reproducibility: public sources pinned or bounded for pinning; localized source inventory exists.
- Evidence/claim honesty: no performance, hardware, or absence result is claimed.

## AI and researcher boundary

- AI core fraction: `AI_CORE_CONDITIONAL`.
- Human/resource boundary: public CPU simulation can support the core path after Stage A; no commercial HBM-PIM hardware is assumed.
