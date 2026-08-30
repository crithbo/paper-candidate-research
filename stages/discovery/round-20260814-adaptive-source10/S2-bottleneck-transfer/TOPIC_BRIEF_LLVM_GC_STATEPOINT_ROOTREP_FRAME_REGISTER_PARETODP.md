# LLVM-GC-STATEPOINT-ROOTREP-FRAME-REGISTER-PARETODP — Joint GC-root representation, frame and register construction

## 中文摘要

固定 LLVM statepoint-example GC 的函数、目标 ABI、GC root 集、statepoint 位置、程序输出以及 collector 对 stackmap 的解释。官方 Statepoints 文档允许将 alloca 放入 gc pointer list，使其栈区域被列进 stackmap；同时明确 RewriteStatepointsForGC 当前不会处理该类 alloca，生成器负责正确 spill/fill。候选动作不是换 GC、换 stackmap reader 或压缩 metadata，而是在同一 runtime 解释下，为跨 safepoint root 联合选择 relocated-register 或 explicit-alloca-root 表示、对应 frame-slot 布局和 register/spill realization。

## Research question

在固定 statepoint-example collector convention、相同 GC root/更新语义、相同 ABI 和 StackMaps reader 下，是否可对 safepoint interface 宽度 w 给出一个目标特定 FPT/Pareto 构造，联合 root 表示、frame slot 与 register/spill，实现 stackmap bytes、frame/RSS pressure 与 generated-code cost 的严格前沿？

## Canonical research claim package

- Route: N2 compiler/runtime joint algorithm.
- Exact object: fixed LLVM IR function with gc.statepoint, gc-live roots, target/ABI, statepoint locations, collector convention, stackmap order/reader, program output and GC update semantics.
- Complete atomic action: for each bounded cross-safepoint root choose a documented relocated-register location or explicit alloca-root location, then jointly choose the alloca/frame-slot placement and register/spill realization. Every state must preserve location order, root identity and collector update visibility.
- Information parity: same IR, GC strategy, liveness, target, ABI, root set and runtime convention as current union; no profile or custom collector oracle.
- Candidate guarantee: exact Pareto frontier in f(w) poly(n) for code bytes/instructions, explicit frame slots/bytes, stackmap bytes and root reload/store count, subject to a stock stackmap/collector equivalence predicate.
- Fair union: current gc.statepoint and RewriteStatepointsForGC behavior, target RA/frame/prolog/epilog, stackmap emitter, stock statepoint-example runtime convention and all relevant documented flags.
- Natural route: LLVM GC/statepoint and codegen tests plus public language/runtime examples using statepoints. The Stage-A set is 20–50 existing functions only after stock collector acceptance is demonstrated.
- Full cost: pass/compile CPU/RSS/temp; frame bytes and spills; code bytes; stackmap section bytes; runtime root processing/read cost; no partial metadata-only denominator.

## Mechanism and competitor attack

Statepoints makes pointer locations at safepoints visible to the runtime; alloca roots provide a documented alternate location form and shift cost from ordinary relocation/register state to frame construction and stackmap processing. The direct competitors are: current relocation and explicit-root facilities already compose to all Pareto points; the collector rejects explicit roots; the state reduces to generic packing; or a proposed plan changes root/update semantics. All are decisive falsifiers.

## Current-upstream reality check

- Snapshot date: 2026-08-14; Stage A must pin concrete llvm-project main and its statepoint-example convention.
- Official docs specify that an alloca listed in a statepoint causes its address to be listed in the stackmap, and that the generator must ensure spill/fill. They also warn RewriteStatepointsForGC does not act on allocas today.
- Current source facets: RewriteStatepointsForGC handles statepoint rewriting; StackMaps emits object-format records; target RA/frame stages choose physical locations. No absence is inferred from their separation.
- Stage A finite audit: enumerate statepoint operands/flags, GC strategy, target/ABI, stackmap record order, alloca-root conditions and default/non-default pipeline hooks; reject if any union option already realizes the whole frontier.

## Minimal two-plan witness and closure

- Witness: one fixed function with a root live across exactly one statepoint. Plan A uses ordinary gc.relocate-compatible register/standard spill location; Plan B uses a documented explicit alloca-root location with matching spill/fill. Both must be accepted by the same stock parser/collector convention, preserve observable output and expose equal root update semantics.
- Status: FINITE_FIDELITY_GAP. Runtime acceptance is a finite question, not assumed.
- First 72 hours: pin source and runtime convention; write/locate a minimal legal IR witness; inspect produced stackmap locations with stock tooling; apply stock root/update oracle; reconstruct all union paths; compare bounded frontier.
- Stop if explicit alloca roots are rejected or require a different collector/reader, if union realizes every frontier point, if state changes root/update semantics, or if algorithm collapses to generic packing.

## Potential and readiness

- Structural potential: TIER_B_Q2_VIABLE only if the two-plan stock-acceptance witness and a non-absorbed bounded frontier both survive; it then has an exact same-runtime algorithm/guarantee and end-to-end cost.
- Current readiness: E1_STATIC_PREFLIGHT__FINITE_FIDELITY_GAP. No implementation, measurement or positive result exists or is claimed.
- Recommendation: PROPOSE_STAGE0 for independent reconstruction; no downstream stage is created by this brief.
