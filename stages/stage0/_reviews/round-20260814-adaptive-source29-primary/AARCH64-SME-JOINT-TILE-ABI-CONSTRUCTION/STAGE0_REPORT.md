# AARCH64-SME-JOINT-TILE-ABI-CONSTRUCTION — Stage 0 PRIMARY Report

## 中文摘要

- 结论：`STOP_RECOMMENDED`，`BELOW_Q2_STOP`；不授权 revision、Stage A 或 Stage B。
- 为什么：固定 SME ABI 的 PSTATE.SM/ZA/lazy-save action 已由 current `MachineSMEABI` 作为 whole-CFG edge-bundle state construction 实现；固定 ArmSME virtual tile-ID 的 action 由 MLIR `TileAllocation` 在 CF 层独立处理。对冻结 object，ABI save/transition 只依赖函数/call 属性与“ZA 是否需要”的 state，不依赖 tile ID、tile mask 或其 liveness 分配；反向地，tile-ID 更换不能改变 ABI 合法 transition/lazy-save。所谓联合前沿因而分解为现有 ABI state construction 与普通 tile allocation 的 product。 
- 下一步：同 ID 停止。若以后研究纯 tile allocator，或改变 ABI/reader/object，必须新 ID，不得重包装本题。
- 是否需要用户操作：否。

- Lane id: `STAGE0-BATCH-GATE / PRIMARY`
- Assignment id: `STAGE0-P1-20260814-AARCH64-SME-JOINT-TILE-ABI-CONSTRUCTION-PRIMARY-V8.7`
- Input freeze SHA-256: `639A3E893CA39B8E35995CF5617F993F72507AC0331EFF79BF4D80DA7F7E02AA`
- Cross-assignment contamination declaration: 未读取或使用 AMX、SME 以外任务的事实、测试、代码或结论。
- Decision: `STOP_RECOMMENDED`
- Quality tier: `BELOW_Q2_STOP`
- Confidence: `0.90`
- Evidence ceiling: `E1_STATIC_STAGE0_ONLY__NO_IMPLEMENTATION_NO_RESULT_CLAIM`
- Novelty route audited: `N2` — structural failure。
- Stage semantics: conditional paper-potential screen; this report does not make a performance claim.

## Structural paper potential vs current readiness

缺实现、编译结果、硬件或自然收益均不是停止理由。本题停止的原因是更早的结构门：在明确同一 ABI 的函数上，tile-ID allocation 和 SM/ZA/lazy-save state 的后续行为没有可定义的互相影响 action。一个把二者放入同一个 DP 表的实现只会包装独立的现有 state construction 和普通 allocation。

## Frozen object and claim

- Exact object: `FIXED_ARMSME_MLIR_LLVM_CFG__CALL_ATTRIBUTES__TARGET_FEATURES__AARCH64_SME_ABI`。
- Action: `JOINT_VIRTUAL_TILE_ID_BINDING__PSTATE_SM_ZA_BOUNDARY_AND_LAZY_SAVE_CONSTRUCTION`。
- Semantics: same ordinary result, fixed SME function/call attributes, `+sme`, AArch64 calling convention, PSTATE.SM/ZA requirements, TPIDR2/save-buffer behavior, object semantics.
- Prohibited substitutions: altered attributes/ABI, non-SME allocator, new call protocol, generic ILP/scheduling, or a standalone tile-allocation heuristic.

## Current upstream reality check

- Current LLVM official `main` pin queried 2026-08-14: `81ac5c7c26efb70ffaffb91b26053437093ee085`.
- `MachineSMEABIPass.cpp` collects required ZA states per instruction, assigns each CFG edge bundle a ZA state, inserts state changes, and allocates a save buffer only when required. It explicitly encodes transitions such as `ACTIVE → LOCAL_SAVED` and restore paths.
- `AArch64TargetMachine.cpp` installs `MachineSMEABI` for optimized and O0 paths; the SME peephole optimization is enabled by default at optimized levels. Nondefault `force-streaming` / `force-streaming-compatible` affect function streaming classification, hence would change the frozen action contract and are comparator controls, not candidate actions.
- MLIR `TileAllocation.cpp` states it is a greedy linear-scan tile allocator at `func.func`/CF level; it computes live ranges, mask-overlap legality, coalescing, tile IDs, and in-memory spill IDs. It does not receive or choose SME ABI call attributes, edge-bundle ZA states, TPIDR2 ownership or lazy-save representation.
- The LLVM codegen test `aarch64-sme-za-call-lowering.ll` gives a public call/lazy-save carrier but no virtual-tile allocation. The MLIR tile allocation source supplies tile IDs but no same-function ABI call action. These are not two plans of one frozen native object.

## Claim-package completeness audit

| Required question | Independent answer | Result |
|---|---|---|
| Is the ABI action finite and same-object? | Yes; states/edge bundles and transition table are native LLVM actions. | PASS |
| Is tile binding finite and same-object? | Yes; finite tile masks and CF live ranges are current MLIR actions. | PASS |
| Does tile-ID alter SM/ZA/call/lazy-save legality or cost? | No source locus exposes tile ID to `MachineSMEABI`; ABI state is function/call-interface driven. | FAIL for joint mechanism |
| Does ABI-state choice alter tile-ID legality/cost? | No source locus exports edge-bundle ZA state to MLIR `TileAllocation`; tiles are allocated before the backend ABI pass. | FAIL for joint mechanism |
| Can a two-tile/one-call same-function two-plan witness be made without changing the contract? | No public in-tree carrier combines both complete native action spaces; joining them would require a new interstage action/changed representation. | FAIL |
| Is there a target-specific N2 recurrence after factorization? | No; remaining choices are current ABI construction × generic/known tile allocation. | FAIL |

## Named baselines and fairness contract

| Baseline | Action scope | Fair role |
|---|---|---|
| Current LLVM `MachineSMEABI` + `SMEPeepholeOpt` | current complete call-boundary ZA state construction, lazy save/restore, edge bundles | strongest ABI baseline |
| Current MLIR ArmSME `TileAllocation` | tile-mask legality, liveness/coalescing, greedy allocation/spill handling | strongest tile binding baseline |
| Current MLIR streaming/ZA mode conversion | function-mode/action preparation | same-object mode baseline |
| Generic linear scan / CP / ILP | allocator-only comparator or oracle | cannot establish a joint SME contribution |

The full-cost ledger that a valid topic would require is compiler CPU/RSS/temp, emitted state-transition instructions, save-area bytes, code bytes, tile spill/recompute and stock verifier/object equivalence. No value was measured here.

## Collision analysis

### Eight-predicate direct-coverage audit

| Predicate | Current primary/official evidence | PASS / FAIL / UNKNOWN |
|---|---|---|
| Same object/function/protocol | LLVM SME ABI docs and `MachineSMEABI` describe fixed call attributes/ABI state | PASS |
| Same scenario/workload | public codegen lazy-save call test; MLIR tile allocation carrier separately | PARTIAL |
| Same or weaker information | ABI pass sees call/interface/CFG state; allocator sees CF tile liveness | PASS, separately |
| Atomic action covered | each component action is current native; no coupling input exists | PASS for component subtraction |
| Same/stronger legality, quality and guarantee | ABI state transition table is native legality; tile allocation checks mask/liveness legality | PASS, separately |
| Same non-worse full-cost boundary | no proposed coupling can alter component costs under same ABI | PASS structurally |
| Comparable scale/platform/version/config | pinned current LLVM/MLIR and `+sme` | PASS |
| Sufficient source depth | full pinned sources and in-tree call test read | PASS |

**Disposition:** no paper-absence inference is needed. Current source exposes a direct **factorization/absorption**: a purported joint constructor has no native coupling channel under the frozen object.

### Nearest-prior facet matrix

| Mechanism | virtual tile ID | SM/ZA transition | lazy save | same-function joint objective/guarantee |
|---|---:|---:|---:|---:|
| MLIR `TileAllocation` | yes | no input | no input | greedy allocator only |
| LLVM `MachineSMEABI` | no tile-ID input | yes | yes | current CFG state constructor |
| `SMEPeepholeOpt` | no | adjacent transition cleanup | no tile-ID input | local component optimization |
| proposed DP | would concatenate both | would duplicate ABI state | would duplicate lazy save | no non-product action remains |

## Residual paper kernel

Let `A` be the ABI state record `(SM interface, ZA/ZT0 state, call attributes, edge-bundle state, TPIDR2/save-buffer status)` and `T` be the tile record `(tile type/mask, CF live ranges, virtual tile IDs, tile spill/recompute state)`. Current source establishes:

`legal(A,T) = legal_ABI(A) ∧ legal_tile(T)`

and, under the frozen full-cost declaration,

`cost(A,T) = cost_ABI(A) + cost_tile(T) + fixed_code_cost`.

The necessary cross term is absent: saving/restoring ZA is whole-ZA ABI state, not a selected virtual-tile-ID action; the call attribute fixes whether state must be preserved, while tile allocation cannot change it. A DP over `(A,T)` is only the Cartesian product of `MachineSMEABI`’s current state construction and an allocator. Its removal of SME state reduces to ordinary tile allocation, exactly the assignment's rejected generic substitute.

This is a structural N2 failure, not a request for a stronger algorithm or another revision.

## Two-plan witness audit

The required public two-tile/one-call witness must contain two complete stock-native-legal plans with identical ABI and ordinary behavior. The available current public carriers split the required facts:

- `aarch64-sme-za-call-lowering.ll` is a real one-call lazy-save/restore test. It has ABI state actions but no MLIR virtual tile-ID plan.
- `TileAllocation.cpp` is a real tile allocator, but its CF function action catalog contains no ABI call-state/lazy-save decision.

Splicing a tile test into the codegen test, inventing a bridge action, or selecting a different call attribute would change the frozen representation/action contract. A tile-ID relabel with a fixed `aarch64_inout_za` call is a cost-neutral allocation variation; a private-ZA call's lazy-save is required for the whole ZA state independently of that label. Hence no union-external native two-plan witness exists under the specified object.

## Q1/Q2 paper shape

An accepted Q2 paper would need a non-product target-specific algorithm and a finite fidelity route. This direction can only offer a sequential composition already present in the compiler plus an ordinary allocator improvement. It fails the minimal Tier-B contribution shape.

See `Q1_COMPARATOR_MATRIX.md`: general integrated RA and SME kernel papers are calibration/subtractors, not evidence of the claimed coupling.

## Fidelity and Stage A disposition

- Discovery status: `STRUCTURALLY_UNCLOSABLE` for this topic identity.
- A finite Stage-A test could validate the current ABI pipeline and tile allocator, but cannot validate a new joint action without changing the object.
- No Stage A fidelity killer is therefore legitimate; proxy experiments would risk inventing a non-native coupling.
- Stage A/B authorization: `false / false`.

## Stop conditions met

1. no stock-native-legal same-object two-plan witness with a joint action;
2. current component composition directly absorbs all declared ABI/lazy-save and tile-ID actions;
3. recurrence reduces to generic allocation/product packaging.

## Discovery repair vector

- Codes: `R1_ABI_TILE_ACTION_FACTORISATION`, `R2_NO_SAME_OBJECT_TWO_PLAN_CARRIER`, `R3_CURRENT_WHOLE_CFG_ABI_CONSTRUCTOR`.
- Materiality: structural.
- Does this alter the independent scientific decision?: `NO`; this is the independent decision.

## Dual-axis score

- Academic value: `31/70`
- AI executability bonus: `18/30`
- Total: `49/100`

