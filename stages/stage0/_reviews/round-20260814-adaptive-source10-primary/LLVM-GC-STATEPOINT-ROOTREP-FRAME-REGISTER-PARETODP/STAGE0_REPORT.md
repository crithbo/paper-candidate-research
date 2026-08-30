# LLVM-GC-STATEPOINT-ROOTREP-FRAME-REGISTER-PARETODP — Stage 0 PRIMARY

## 结论

- Decision: `REVISE_ONCE`
- Conditional quality tier: `TIER_B_Q2_VIABLE`
- Confidence: `0.73`
- Evidence ceiling: `E1_STATIC_PREFLIGHT__FINITE_FIDELITY_GAP`
- Route: `N2` — same-runtime bounded joint root-representation/frame/register frontier.
- Stage A / Stage B: not authorized.

若原子门闭合，该题可形成可信二区的编译器/运行时联合优化论文：不是压缩 stackmap 元数据，而是在固定 GC collector、root identity/order/update 与 reader 语义下，对 root 的 relocate 或显式 alloca 表达、帧槽和寄存器/溢出实现做共同构造并给出有界前沿保证。当前不能 PASS，因为“文档允许 alloca root”并不证明它与标准 relocation 在同一 stock collector 下可交换、可更新且生成完整两计划。

## Structural paper potential vs current readiness

**Structural potential if successful.** LLVM 官方状态点文档将可更新 root 位置、`gc.relocate`、stackmap location 和显式 alloca-root 都放在同一状态点接口中；其约束不是一个标量参数。若能在一个固定 collector/ABI 下给出 union 外的两计划、future-action-preserving bounded state 和 exact/FPT/certified Pareto frontier，N2 与全成本账本均可成立。

**Current readiness.** 文档明确：alloca root 会在 stackmap 中记录其地址，spill/fill 由生成器保证；但也说明它不能表达相应 base pointer，且只有 collector 可由指针导出 base 时才适用，`RewriteStatepointsForGC` 目前不处理 alloca。于是最低闭合路径是有限的静态 same-collector witness/reader contract 审计；没有实现、对象文件或性能结果不构成 STOP。

## Frozen object and fairness contract

`fixed LLVM IR function + gc.statepoint locations + gc-live root order + one
stock collector/runtime convention + target/ABI + stackmap reader -> same
observable result and root-update semantics`.

The candidate may choose, for each root live across a bounded statepoint
interface, an ordinary relocation-compatible location or a documented explicit
alloca-root location, together with native frame slot and register/spill
realization.  It may not change GC strategy, collector, reader, root order,
root identity/base relation, ABI, IR program behavior, or use profile/custom
runtime information.

The fair union is: current `gc.statepoint`/`gc.relocate`,
`RewriteStatepointsForGC`, alloca-root semantics, target RA/frame/prologue and
epilogue paths, stackmap emitter/reader contract, stock statepoint-example
collector convention and every compatible flag/pipeline branch.  Generic
register allocation, frame packing, ILP and metadata compression are ceilings
or subtractors, never the candidate method.

## Independent current-upstream reality check

Checked 2026-08-14/15 against current official LLVM documentation; moving-main
source retrieval for `RewriteStatepointsForGC.cpp` had no cached body, so no
absence is inferred and Stage A must pin a 40-hex LLVM commit/blob.

- Statepoints requires relocated values after a relocating safepoint and records
  live pointer mappings; the documented lowering may spill a relocated value to
  a stack slot.
- The same official page explicitly allows alloca addresses in the gc pointer
  list.  It makes the address a stackmap location, requires generator-provided
  spill/fill, restricts use when a base cannot be derived from the pointer, and
  says the rewrite utility does nothing for allocas today.
- StackMaps is a runtime contract: locations can be register, stack offset or
  constant.  This confirms that frame/register costs and reader interpretation
  must be charged together, not that any two location encodings are equivalent.

## Collision and competing mechanisms

No reviewed first-party source supplies the proposed same-collector bounded
joint frontier or its guarantee.  This is `SEARCH_BOUNDED_OPEN`, not a novelty
claim.  The nearest direct subtractors are (1) current relocation lowering and
target RA/frame composition and (2) the documented explicit alloca-root form.
They are fatal only if a fixed compatible union realizes every complete plan.
The opposite danger is that explicit roots require a different collector or
weaken base/update semantics; then the object is invalid, not a paper residual.

### Eight-predicate direct-coverage audit

| Predicate | Result | Reason |
|---|---|---|
| Same object / collector protocol | UNKNOWN | no single stock collector convention is pinned |
| Same root/update semantics | UNKNOWN | alloca-base restriction not discharged |
| Same information | PARTIAL | current statepoint/target facts are common; no custom oracle allowed |
| Atomic joint action | NOT COVERED | docs expose components, not the bounded joint constructor |
| Same guarantee | NOT COVERED | no target-specific frontier guarantee found |
| Same full-cost | NOT COVERED | docs do not provide joint frame/stackmap/runtime ledger |
| Version/config parity | PARTIAL | current doc surface checked; source pin remains required |
| Sufficient reproduction depth | PARTIAL | no reader-accepted two-plan witness supplied |

No `DIRECT_FATAL` is established.

## Single revision gate

`SAME_STOCK_COLLECTOR_TWO_PLAN_ACCEPTANCE__ROOT_UPDATE_PRESERVING_BOUNDED_FRONTIER_CERTIFICATE`

On one pinned LLVM commit, target/ABI and **one named stock collector/runtime
reader**, provide one fixed function with a base root live across a statepoint
and two complete accepted plans:

1. relocation-compatible root location with the required `gc.relocate` update;
2. explicit alloca-root with native store/fill and the same root identity,
   update visibility, stackmap order and reader interpretation.

The certificate must enumerate the applicable current union, reject its
reproduced points, and define a bounded state
`(root/base-derived class, representation, ordered live bundle, register/spill
availability, frame slot/alignment, stackmap location, post-statepoint use)`
that preserves future legal actions and declared full cost.  It must state an
exact/FPT/certified Pareto recurrence for width `w`, its complexity and a
no-gain boundary.  A generic RA/frame packing solver, a collector/reader swap,
metadata-only comparison, or alloca use without a same-update proof fails the
gate.

## Stage A plan if independent confirmation accepts the revision

Before any claim-bearing run, pin full LLVM/collector blobs; materialize both
plans; make the stock parser, stackmap reader and root-update oracle accept
them; enumerate the union; then use 20–50 existing statepoint-bearing
functions.  Charge transform/compile CPU/RSS, frame and spill bytes, code and
stackmap bytes, root processing/read cost and fallback.  Stop the direction if
either plan is illegal, root/base/update/order differs, the union covers every
point, the state reduces to generic packing, or full-cost Pareto gain vanishes.

## Q1/Q2 and AI assessment

- Calibration: `PARITY_CONDITIONAL`; Tier B only after the single static gate.
- Academic potential: `53/70`; AI bonus `22/30`; total `75/100` (non-decisive).
- `AI_CORE_CONDITIONAL`, estimated `ai_core_fraction=0.70` for union replay,
  bounded-frontier implementation and fidelity ledger after authorization.
- Claim ceiling: no runtime acceptance, code-size/frame/stackmap result,
  natural prevalence or theorem is claimed now.

`STAGE0_REPAIR_VECTOR: [OMITTED_CURRENT_SAME_OBJECT, ATOMIC_ACTION_UNCLEAR,
FULL_COST_GAP, EVIDENCE_LOCATOR_OR_VERSION_GAP]`.
