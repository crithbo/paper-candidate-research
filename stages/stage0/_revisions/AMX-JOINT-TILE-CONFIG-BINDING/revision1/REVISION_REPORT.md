# AMX-JOINT-TILE-CONFIG-BINDING — Stage 0 Revision 1 PRIMARY Report

## 裁决

`RECOMMEND_BELOW_Q2_STOP`。唯一 scientific revision 已消耗；不建议进入 closing 或 Stage A/B。

唯一门 `SAME_MANAGEDRA_MF_TWO_PLAN__UNION_EXTERNAL_CONFIG_BINDING_FRONTIER_CERTIFICATE` **未闭合**。这不是因没有实现、编译、性能结果或硬件：本次静态审查在冻结 public in-tree `ManagedRA` witness 上给出了完整 current action catalog、两条 native-legal normalized plans 和 oracle table。它们没有严格 Pareto divergence；因此所谓“joint”只剩 current config placement/reload 与 ordinary tile RA 的 product/renaming，而非 target-specific N2。

## Frozen identity and integrity

- Assignment: `STAGE0-P1-20260814-AMX-JOINT-TILE-CONFIG-BINDING-REVISION1-V8.7`
- Gate: `SAME_MANAGEDRA_MF_TWO_PLAN__UNION_EXTERNAL_CONFIG_BINDING_FRONTIER_CERTIFICATE`
- LLVM official pin: `3de6fef89d9f9eb602a5bdaa2a3fe2a75a468030`.
- Same object: `x86_64`, `+amx-tile`, fixed `ManagedRA` MachineFunction, x86-64 ABI, identical call regmask, tile numerical operations, frame/config object and output semantics.
- Pinned witness: `llvm/test/CodeGen/X86/AMX/amx-sink-config-after-calls.mir`, SHA-256 `679426407304782A85A4BB85E5041DF095179FE17A79F2A16AD02E86D712D9F6`.
- No changed allocator, optimization level, IR, ABI, target, AMX semantics, candidate implementation, build, benchmark or claim-bearing execution occurred.

## Gate proposition and result

The required proposition was that one frozen same-MachineFunction admits two complete native-legal plans and one strictly union-external full-cost Pareto point, certified by a future-action/cost preserving AMX-specific finite frontier.

It fails for the selected public witness. Its one active tile shape is loaded into an AMX global configuration before the first tile group and reloaded after the `csr_64` call; the call is followed by the same shape use. Relabelling the assigned physical tile from `TMM0` to `TMM1` (and writing the corresponding config slot) preserves every native legality condition but preserves the complete declared cost vector as well. The only strict plan distinction supplied by the source is the current fast configuration sink/reload behavior, already in the fair union.

## Two complete normalized plans

The test's documented RUN pipeline is `X86FastPreTileConfig → regallocfast → X86FastTileConfig` with `-verify-machineinstrs`. Its checked native output exhibits `PLDTILECFGV` before the first tile sequence and a second `PLDTILECFGV` after `CALL64pcrel32 &foo`; both loads implicitly define all `TMM0…TMM7`.

| Field | Plan F0 (current checked representative) | Plan F1 (label-normalized legal alternative) | Same-object status |
|---|---|---|---|
| config dominance/reload | config before first tile group; global reload after `csr_64` call | identical | same CFG/call obligation |
| config stack/frame | one same 64-byte config stack object and initialization | identical object; indexed field changes 0→1 only | same frame/layout contract |
| physical tile binding | active tile `TMM0` | active tile `TMM1` | legal target register relabelling |
| tile instructions | `PTILELOADDV/ PTILESTOREDV` use `TMM0` | identical instruction sequence with `TMM1` operands | identical numerical/ABI semantics |
| caller-clobber handling | no tile value may survive the call; config is reissued | identical | call regmask applies to all TMMs |
| config loads | 2 | 2 | identical |
| shape-field stores generated around config loads | 8 (four per checked config load) | 8 | identical instruction count and displacement class |
| allocator-induced cross-call tile spill/reload | 0 | 0 | identical |
| code bytes / compile control / runtime coordinate | normalized equal | normalized equal | no strict point claimed |

F1 is not presented as a candidate method or an observed generated output. It is the complete action-space symmetry check required by the gate: a legal TMM-label variant has no strict full-cost improvement. The source test itself is the public native semantics carrier; no altered MIR was introduced.

## Why no AMX-specific non-product frontier remains

Let a state at a program point contain configuration obligation `C`, call-clobber bit `K`, frame/config-stack status `F`, live virtual-tile interference `I`, and physical TMM binding `b`. In the frozen contract:

1. `PLDTILECFG` establishes a **global** tile configuration and the checked output marks all eight TMMs as implicit definitions. The required reload after a destructive call is therefore a function of `C`, `K` and reachability—not of which free physical TMM label is assigned to a live tile.
2. `X86PreTileConfig` operates before RA on virtual shapes and inserts config stack/load actions; `X86TileConfig` then reads `VirtRegMap` to fill the matching physical config fields. The current fast pair implements the same separation around FastRA, including call-sensitive insertion and tile spill/reload transformations.
3. For any legal permutation `π` of simultaneously compatible TMM labels, rename every tile operand by `π` and write each shape at the corresponding `π(i)` config offset. AMX tile instructions, call clobber status, config count, spill/reload count and the assignment's declared full-cost coordinates are invariant. The only changed datum is an unobservable physical-label name.
4. When the permutation is not legal because live ranges overlap, the remaining constraint is conventional register coloring/spilling. It does not create an AMX-specific placement/binding interaction; it is exactly the ordinary RA component that the assignment excludes as a generic substitute.

Thus a purported frontier factors as `Frontier_config(C,K,F) × Frontier_RA(I,b)`, followed by a label-invariant projection. Enumerating or Pareto-packing that product is generic RA/Pareto packaging. There is no finite target-specific recurrence with a nontrivial exact/FPT/certified guarantee left after this factorization. The honest degeneration boundary is immediate: with any one active tile (the pinned witness), all legal bindings are label-isomorphic; with multiple live tiles, only ordinary interference constraints survive.

## Fair-union and collision disposition

The fair union remains:

1. `X86PreTileConfig → tile-only Greedy RA → X86TileConfig` on optimized compilation; and
2. `X86FastPreTileConfig → FastRA → X86FastTileConfig` on fast compilation.

Both are `ManagedRA` paths. The latter's current in-tree test specifically checks configuration sinking after a call; `X86TileConfig`/`X86FastTileConfig` both materialize physical TMM shape fields after allocation. Hence every component-level interpretation is already current-native. No direct paper was needed for the failure: the mandatory static gate collapses under the same-object action grammar itself. Paper collision status remains `SEARCH_BOUNDED_OPEN` and is not used as an absence inference.

## Stage A disposition

A finite Stage-A falsifier would have been: same pinned MIR, all legal plans, native legality/equivalence checks, both current pipelines and a complete full-cost ledger. The static gate shows this route cannot test a non-generic AMX-specific mechanism: any purported result would compare config/reload components already supplied by current LLVM or conventional RA. Stage A is therefore unauthorized.

## Scientific revision accounting

- Revision 1/1 consumed: **yes**. This report performs the first gate-bearing scientific static construction, not a resource attempt.
- Pre-registered terminal sentinel: `BELOW_Q2_STOP__CURRENT_AMX_SEQUENTIAL_UNION_OR_GENERIC_RA_WRAPPER`.
- Structural-potential vs readiness distinction: the stop follows same-object factorization/current-union absorption, not missing execution evidence.

