# Action and guarantee audit

## Required actions versus verified semantics

| Required action/guarantee | Static evidence | Verdict |
|---|---|---|
| Existing collector/runtime reader | LLVM says the collector and runtime must be provided externally. | FAIL: none is frozen. |
| Relocate plan | LLVM supports explicit relocation and records base/derived locations. | Component exists; not a complete same-reader plan. |
| Explicit alloca-root plan | LLVM emits the address of an alloca region; generator supplies store/fill. | Component exists; no base-id field. |
| Same logical `(root-id, base-id, order, update, post-use)` | Alloca has no corresponding base pointer; only collector-derived-base use is allowed. | FAIL. |
| Same reader accepts both plans | No reader blob/version or runtime ABI is named. `statepoint-example` is not a collector. | FAIL. |
| Target-specific finite frontier | Its state must preserve reader-defined root update/base recovery. | Undefined; generic packing is forbidden. |
| Stage A preclaim killer | Would require a same-reader acceptance oracle for both plans. | Undefined for this ID. |

## Why the apparent two-plan witness is invalid

1. The official `manual_frame` illustration is annotated for a **non-relocating** collector.  It cannot stand in for a moving collector’s update semantics.
2. In an explicit alloca plan, the runtime sees a stack-region address.  Without the named runtime’s base-derivation and update contract, neither the root/base mapping nor post-use visibility can be established.
3. In a relocate plan, base and derived locations are part of the relocation relation.  Treating it as equivalent to an alloca solely because both place physical locations in a StackMap erases the contract the candidate is supposed to preserve.
4. A new parser/collector would create the missing acceptance rule, violating `custom_reader` and `changed_runtime_contract` prohibitions.

## Current-source pointers

- [LLVM Statepoints — status and runtime boundary](https://llvm.org/docs/Statepoints.html): statepoints support runtime/collector updates, but are experimental across versions; explicit alloca restriction is documented there.
- [LLVM Garbage Collection — integration requirements](https://llvm.org/docs/GarbageCollection.html): LLVM provides framework/strategies rather than a collector; the runtime defines allocator, stack-map reader/crawler, global roots and barriers.
- [llvm-statepoint-utils](https://github.com/kavon/llvm-statepoint-utils): a public parser/indexer expressly intended for incorporation by a collector, not evidence of a stock collector accepting both contracts.

Conclusion: `NO_SINGLE_STOCK_COLLECTOR_TWO_PLAN_ACCEPTANCE` is established for the frozen candidate package.  This is not a claim that no future runtime could be built; such construction is outside the frozen object.

