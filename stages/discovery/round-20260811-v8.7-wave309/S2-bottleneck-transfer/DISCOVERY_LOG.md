# Discovery log — Wave309 ThinLTO summary/import/backend joint-plan depth

## Freeze and exact object

- Assignment: DISCOVERY-S2-20260811-V8.7-WAVE309-THINLTO-SUMMARY-IMPORT-BACKEND-JOINT-PLAN-DEPTH.
- Cutoff 2026-08-11; v8.7+R5-P0; DISCOVERY_QUALITY_MODE=OFF.
- Frozen controls: AGENTS 66231F71EF6AB250A1AD9FF576D5840978F09EFC03BF5D2F0527D47F4D82B063; plan C4DD13AFB6B3A8C3238F706EF1D56C924ADD2496444E3AA18F09AF9EC600C029; registry EC3CC9AA5D1A753C8D4E8452CE9812B8341184C563814DA69441697D12EA0C20; ROLE FCB9BD73C39F39D31F6C8154E6B48EA23187FF28BDF2BB3D9C59E3D28FA518A3.
- LLVM source pin: llvm-project main d95ab96f543203258f02c0aec1d3abb8aed40ca8.

The fixed object is one bitcode module set, target/toolchain, native executable, ABI and program semantics. All compared plans receive the same module summaries, target information and profile information when applicable. A different bitcode source/module partition, changed ABI, changed executable semantics, external scheduler, or changed linker/backend contract is outside the object.

## Current source and action-union audit

Official ThinLTO documentation states the current commit-point pipeline: compilation emits bitcode with compact summaries; thin link reads and merges summaries into a combined module-summary index; whole-program analysis then guides importing; fully parallel backends perform transformations and return native objects to final linking. Existing non-default surface includes linker-specific backend jobs, incremental cache directory, cache pruning policy and distributed backend invocation. DTLTO additionally exposes an external distributor and consistent module IDs while retaining ThinLTO link/backend composition.

The current source pin is frozen. Relevant source facets for a future complete audit are ThinLTO summary/index construction, import decision computation, LTO ThinBackend abstraction, LLD ThinLTO and DTLTO options. The Doxygen API confirms ThinBackend already encapsulates a backend function plus thread-pool parallelism. This pass does not claim a source-exhaustive absence of all internal decisions.

## Candidate action and minimum divergence test

A possible retained proposition would need a legal state that jointly chooses summary precision, imports/exports and backend partition/recourse for fixed modules, then offers exact, FPT, approximation or certified Pareto guarantee over total compile/link/binary/runtime cost. The minimal witness would require two complete stock-legal ThinLTO plans P0/P1 on the same modules and flags, yielding ABI/program-equivalent native executables; P1 must differ through a source-authorized joint action not expressible as cache policy, import threshold/budget, generic graph partition/knapsack/ILP, backend jobs, distributor policy or online scheduler.

No such native-legal action domain or P0/P1 witness is frozen. Summary precision is not an independent stock action on a fixed bitcode set; changes that manufacture it alter the input/compiler contract. Import choices without a new target-specific structural action reduce to existing optimizer heuristics or generic selection. Backend partition/recourse is either current ThinBackend/distribution/parallelism surface or scheduling. Therefore no complete N2 algorithm/guarantee can be stated under the fixed object.

## Direct-collision matrix

The primary ThinLTO paper describes the design and implementation of ThinLTO itself, while current LLVM documentation covers ThinLTO and DTLTO operational composition. These sources constitute strong same-object baseline mechanisms, but do not by themselves establish an exhaustive latest-paper collision. Since no legal candidate action has passed the witness test, a novelty clearance would be invalid. Collision status is SEARCH_BOUNDED_OPEN and cannot support a brief.

## Natural route, full cost and 72h killer

A finite Stage-A closure can use version-pinned LLVM test-suite or other public C/C++ bitcode corpus, 20–50 link units, and stock execution/ABI checks. It must charge summary generation, thin link, backend and final link CPU/RSS/temp/cache bytes; final binary size; and necessary runtime cost. The killer fails closed if P1 relies on a flag, threshold, cache policy, graph/knapsack/ILP solver, scheduler/distributor, changed bitcode/module partition, changed ABI/output, or lacks a certified target-specific guarantee; it also fails if source enumeration absorbs the action or stock executable equivalence fails.

## Decision

COMPLETE_ZERO_PROPOSALS; NOT_ADMITTED_UNFROZEN. The ineligible generic-action alternatives are explicitly rejected, while current source/collision closure is incomplete. No conclusion relies on missing implementation, results, resources or AI readiness, and this is not terminal STOP.
