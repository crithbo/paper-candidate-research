# Current AMX action and frontier audit — revision 1

## Current native catalogue at pinned LLVM

| Pipeline | Native action | Source-level role | Candidate relation |
|---|---|---|---|
| optimized | `X86PreTileConfig` | virtual shape collection; dominance/reachability; destructive-call handling; config stack and `PLDTILECFGV` insertion | absorbs placement/reload component |
| optimized | tile-only Greedy RA (`x86-tile-ra=true` default) | chooses physical tile assignment before general RA | absorbs ordinary binding/RA component |
| optimized | `X86TileConfig` | post-RA `VirtRegMap`/live intervals → physical TMM config fields | absorbs physical-shape component |
| fast | `X86FastPreTileConfig` | reverse CFG configuration, PHI conversion, tile spill/reload support | absorbs call-sensitive fast component |
| fast | FastRA | physical binding | ordinary RA component |
| fast | `X86FastTileConfig` | post-RA physical config-field stores | absorbs physical-shape component |

Official source locators are frozen in the PRIMARY [source audit](../../../_reviews/round-20260814-adaptive-source28-primary/AMX-JOINT-TILE-CONFIG-BINDING/SOURCE_AUDIT.md). The current source has no declared global Pareto search; that fact alone does not establish a residual. The residual must survive the following action test.

## Same-MF static oracle

`amx-sink-config-after-calls.mir` is a `ManagedRA` function with one tile shape class, user tile load/store sequences, and `CALL64pcrel32 &foo` under `csr_64`. Its official RUN lines use the current fast three-pass native path and `-verify-machineinstrs`.

| Action/path | Optimized union status | Fast union status | F0 | F1 | Strict union-external point? |
|---|---|---|---|---|---|
| common config dominates initial tile group | PreTileConfig action | FastPreTileConfig action | yes | yes | no |
| call invalidates global tile state | source contract | source test's reason for sink | reload needed | reload needed | no |
| config after call | native `PLDTILECFGV` | checked native `PLDTILECFGV` | yes | yes | no |
| physical shape assignment | post-RA `VirtRegMap` | post-RA fast rewrite | TMM0 | TMM1 | no, label symmetry |
| stack/frame/config ownership | one config stack slot | one config stack slot | same | same | no |
| tile spill/reload action | native if required | fast pre-config supplies it | none required | none required | no |
| full-cost vector | current action path | current action path | `(2 configs,8 field stores,0 cross-call spills, equal normalized bytes)` | same | no |

The table is a static semantic/action audit, not the result of running `llc`. Its counts are visible in the checked output recorded in the pinned test. No elapsed-time, RSS or runtime number is fabricated.

## Future-action preservation test

For every future native action from a state `(C,K,F,I,b)`, a legal physical label permutation `π` maps it to `(C,K,F,I,π(b))`:

- AMX instruction operands and config offsets rename together;
- `PLDTILECFG` and a destructive call apply globally to all TMMs;
- stack/config ownership, ABI and numerical effect remain unchanged;
- declared fixed costs remain unchanged; and
- a conflict under `π` is precisely the original live-range interference condition.

So the proposed quotient cannot distinguish F0 and F1 without treating physical labels as artificial weight features. If it does, it violates cost preservation; if it does not, it reduces to ordinary allocation and sequential config obligations. This discharges the gate negatively.

## No-gain boundary and rejected recurrences

| Proposed recurrence form | Result | Reason |
|---|---|---|
| `DP(C,K,F) × DP(I,b)` | rejected | Cartesian product of current config planning and ordinary RA; no AMX-specific joint action |
| arbitrary TMM label state | rejected | label symmetry is not a semantic/future-cost distinction |
| generic ILP/CP/Unison | rejected | assignment expressly excludes generic solver framing as the core contribution |
| call-sink/reload heuristic | rejected | current fast path/test already supplies it |
| post-RA shape rewrite | rejected | current TileConfig and FastTileConfig already supply it |

The strongest honest complexity statement is therefore not a new FPT result: the only residual is existing placement plus ordinary register allocation. The required non-product target-specific algorithm/guarantee does not exist under this fixed object.

