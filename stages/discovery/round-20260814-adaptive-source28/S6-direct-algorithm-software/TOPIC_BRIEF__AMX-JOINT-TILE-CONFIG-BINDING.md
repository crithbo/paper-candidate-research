# AMX-JOINT-TILE-CONFIG-BINDING — fixed-function x86 AMX configuration placement and tile binding

## 中文摘要

- 研究机会：LLVM 目前把 AMX `ldtilecfg` 可达性/调用后重载与寄存器分配后的物理 tile shape 配置拆成顺序 pass。固定 AMX machine function 上可研究一个以八个 TMM、有限 shape 和调用破坏状态为参数的联合构造算法。
- 为什么可能值得做：若有限 witness 证实存在两个同语义原生合法计划，可形成 target-specific N2：对配置重载、配置相关 spill/reload 与代码字节给出 exact/FPT 或 certified Pareto 保证，而不是调 pass 顺序。
- 为什么保留：官方 current source、语义边界、canonical carrier、最小 falsifier、full-cost 和有限闭合计划均已冻结；最强同对象论文碰撞与完整双计划 witness 尚未完成，但路径有限、无已知 direct fatal。
- 下一步：独立 Stage0 首先固定 commit 并攻击双计划 witness、主论文碰撞和现有 sequential union 是否已经取得同一词典序最优；任一失败即淘汰或收缩。

- Status: `PROPOSE_STAGE0`
- Quality tier: `TIER_B_Q2_VIABLE`
- Opportunity origins: `OTHER_EVIDENCE_BACKED_ORIGIN`
- Domain tags: `LLVM; X86; AMX; compiler backend; target-specific algorithm`
- Contribution route: `N2`
- Discovery date: `2026-08-14`
- Discovery method revision: `V8_7_POTENTIAL_READINESS_SEPARATED`
- Discovery claim-pack mode: `OFF`
- Discovery RQ frontend mode/revision: `PRODUCTION`; `RQ_REFINEMENT_STAGED_EVIDENCE_V1`
- Opportunity family ID: `AMX-JOINT-TILE-CONFIG-BINDING`
- Contribution type: `COMPILER_TOOL`
- Local audit coordinates: `A1`, `C0`, `D1`, `E0`
- Discovery divergence seed ID/path: `S01` / `DIVERGENCE_SEED_POOL.md`
- Discovery RQ candidate ID/path: `RQ01-A` / `RQ_CANDIDATES.md`
- Discovery question card ID/path: `QC01` / `QUESTION_CARDS.md`
- Front-end disposition before deep review: `EVIDENCE_QUALIFIED_RAW`
- Carrier kind: `CANONICAL_FORMAL_ORACLE`

## Research question

For a fixed x86 AMX machine function, can an FPT construction jointly choose `ldtilecfg` dominance/reload placement and physical tile-shape binding, preserving all AMX, call-clobber and ABI semantics while minimizing a lexicographic configuration-cost frontier?

## Canonical research claim package

- Exact object and same-function contract: same machine function, tile shapes, AMX instruction results, call behavior, `x86_amx` operation restrictions and code-object ABI.
- Natural/canonical scenario: public LLVM AMX MIR/MC/codegen tests; Stage0 must add a public AMX kernel carrier before performance extrapolation.
- Intervention and atomic action: jointly choose configuration placement/reloads and TMM-to-shape binding for a fixed CFG; not generic RA or pass ordering.
- Mechanism: the AMX configuration is a shared finite hardware object (eight TMM slots) whose legality couples dominance, destructive calls and physical bindings.
- Fair comparator: current LLVM `X86PreTileConfig → register allocation → X86TileConfig` composition under identical source/target features.
- Expected guarantee: exact/FPT or certified Pareto optimum on configuration reloads, configuration spill/reload/code bytes, conditional on frozen witness class.
- Full-cost: construction time, compiler CPU/RSS/temp, code bytes/instructions, reloads/spills; runtime is deferred until a same-machine Stage A path is authorized.
- Minimum falsifier: no legal two-plan witness; current composition already lexicographically optimal; candidate changes semantics/ABI; or recurrence is generic RA.

## Current collision classification

The official current source establishes the sequential union and explicitly distinguishes preconfiguration/reachability from post-RA physical configuration. Bounded official/current-source search found no decisive same-object joint constructor, but this is `SEARCH_BOUNDED_OPEN`, not absence. Independent Stage0 must complete primary-paper genealogy and directly test absorption.

## Fidelity closure plan

- Status: `FINITE_FIDELITY_GAP`.
- Complete action interface: choose `(config-placement set, physical-tile shape binding)` under fixed CFG/call/shape legality.
- Comparator/native semantics: stock LLVM source path and x86 AMX semantics; no custom reader/format.
- Small witness: one public AMX test with two shape regions and a destructive call.
- Finite Stage0 questions (maximum three): (1) do two stock-legal plans exist? (2) does current union already obtain the same frontier? (3) does primary literature directly cover this exact co-construction?
- Structural failure condition: any answer makes it generic RA, a semantic change, directly absorbed, or no legal witness.

## Q1/Q2 sufficiency hypothesis

If the witness survives and the FPT/certified-frontier algorithm yields nontrivial full-cost advantage over current LLVM composition on a public AMX carrier, it has a credible Q2 compiler-tool shape. It is not yet a Q1 claim.

## Non-relaxable quality audit

- Same-object: frozen.
- Latest collision: bounded-open debt to independent Stage0.
- Strong fair baseline: frozen sequential LLVM composition.
- Natural/canonical evidence: canonical public tests now; natural workload route required before later generality claim.
- Full-cost: frozen.
- Reproducibility: source paths, carrier route, witness and killer frozen.
- Evidence honesty: no implementation, witness, empirical result or global absence is asserted.
