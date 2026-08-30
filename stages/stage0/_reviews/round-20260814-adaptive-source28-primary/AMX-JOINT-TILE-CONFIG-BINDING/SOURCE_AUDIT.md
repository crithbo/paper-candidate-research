# AMX-JOINT-TILE-CONFIG-BINDING — Independent Source and Collision Audit

## Scope and result

This is a bounded current-source audit, not an absence claim. It finds a direct current-source subtraction for each component action—configuration placement/reload and physical-TMM-shape writing—but no located source that establishes the candidate's stronger, global joint Pareto/exact algorithm. That residual is therefore `SEARCH_BOUNDED_OPEN`, not claimed novelty.

## Identity and provenance

- Check date: 2026-08-14.
- Official repository query: `git ls-remote https://github.com/llvm/llvm-project.git refs/heads/main`.
- Pinned current commit: `3de6fef89d9f9eb602a5bdaa2a3fe2a75a468030`.
- Retrieval mode: public official Git raw files; no LLVM build, `llc` invocation, candidate code, benchmark or GPU run.

| Frozen source blob | SHA-256 | Relevant independent finding |
|---|---|---|
| `X86PreTileConfig.cpp` | `8DDB7E93A4F6B098BABCACD34B41716E9FBCDD8AA50FF7D53D9A09281A80860D` | ManagedRA-only; obtains shape data, handles destructive calls, allocates config stack and inserts `PLDTILECFGV` before RA. |
| `X86TileConfig.cpp` | `543C3DC76239C15FF866FA50E5CB3046C2367A3CAC9DE8B6F73CA1E619C48713` | ManagedRA-only; post-RA, reads `VirtRegMap`/live intervals and fills physical TMM shape fields. |
| `X86FastPreTileConfig.cpp` | `59FD77756929E6894917420DD31552AAE41463DAB8E35330B461B0DD3CA13C7E` | ManagedRA fast path; reverse CFG walk, config insertion, tile spill/reload and PHI conversion. |
| `X86FastTileConfig.cpp` | `7E13B9A14A03E777A302696621AC829AF4CC10062BE259F4BB8CE55056938FE9` | fast post-RA physical TMM config rewrite. |
| `X86TargetMachine.cpp` | `6EFB2A39AE2127E2EC628751B832C39B011930A314C090EDEE6C715CCC665D72` | `x86-tile-ra` hidden default true; optimized and fast pass ordering. |
| `amx-sink-config-after-calls.mir` | `679426407304782A85A4BB85E5041DF095179FE17A79F2A16AD02E86D712D9F6` | public ManagedRA call-after-config test; its RUN lines exercise fast pre-config, fast RA and fast config. |
| `amx-greedy-ra-spill-shape.ll` | `7F47C3209D722B9923F788FFBF2DEFD43397276F4518C1C36A5ED41E832D6AC5` | public Greedy-RA tile-shape carrier. |

## Current upstream action union

1. **Optimized path.** `X86TargetMachine.cpp` adds `X86PreTileConfig` when optimization is enabled. With non-customized allocator and hidden `x86-tile-ra=true`, it first applies a tile-only Greedy allocator then `X86TileConfig`. The latter is explicitly post-RA and reads the virtual-to-physical map.
2. **Fast path.** The same source selects `X86FastPreTileConfig` at `-O0` and `X86FastTileConfig` after fast allocation. Both guard `ManagedRA`. The in-tree MIR RUN lines prove this is a supported native sequence, not an inferred hypothetical.
3. **Action consequence.** The current union already expresses config insertion, call-sensitive placement/sinking, tile spills/reloads, physical `TMM0…TMM7` shape encoding and post-RA config storage. It does **not** by itself advertise a global joint objective, complete action enumeration, or exact/FPT/certified Pareto guarantee.

Official locators:

- [current `X86TargetMachine.cpp`](https://github.com/llvm/llvm-project/blob/3de6fef89d9f9eb602a5bdaa2a3fe2a75a468030/llvm/lib/Target/X86/X86TargetMachine.cpp#L61-L64)
- [current optimized tile-RA pipeline](https://github.com/llvm/llvm-project/blob/3de6fef89d9f9eb602a5bdaa2a3fe2a75a468030/llvm/lib/Target/X86/X86TargetMachine.cpp#L656-L663)
- [current fast tile pipeline](https://github.com/llvm/llvm-project/blob/3de6fef89d9f9eb602a5bdaa2a3fe2a75a468030/llvm/lib/Target/X86/X86TargetMachine.cpp#L530-L534)
- [pre-config source contract](https://github.com/llvm/llvm-project/blob/3de6fef89d9f9eb602a5bdaa2a3fe2a75a468030/llvm/lib/Target/X86/X86PreTileConfig.cpp#L9-L22)
- [post-RA physical shape contract](https://github.com/llvm/llvm-project/blob/3de6fef89d9f9eb602a5bdaa2a3fe2a75a468030/llvm/lib/Target/X86/X86TileConfig.cpp#L9-L16)
- [fast test contract](https://github.com/llvm/llvm-project/blob/3de6fef89d9f9eb602a5bdaa2a3fe2a75a468030/llvm/test/CodeGen/X86/AMX/amx-sink-config-after-calls.mir#L2-L8)

## Paper/direct-collision audit

| Search target | Primary/official evidence used | Outcome | Interpretation |
|---|---|---|---|
| current LLVM AMX config/RA | official LLVM repository above | component-level direct subtraction | fatal only to a component/wrapper claim |
| integrated RA/scheduling algorithmic shape | [Unison author preprint](https://arxiv.org/abs/1804.02452) | generic algorithmic subtractor | not AMX config/call/TMM same-object direct coverage |
| LLVM framework/domain | [LLVM CGO paper](https://llvm.org/pubs/2004-01-22-CGO-LLVM.html) | ecosystem/venue anchor | not collision evidence |
| AMX-specific global config-binding DP | bounded queries of primary/official materials | no verified direct paper located | `SEARCH_BOUNDED_OPEN`; never treated as proof of absence |

## Fairness and provenance corrections

- The Discovery implication that cross-basic-block configuration deficiency alone supplies a residual is too broad: the current fast pipeline is an official same-ManagedRA action path and the test explicitly checks sink-after-call behavior.
- Conversely, no source located states that the optimized or fast pass sequence searches all configuration-placement/TMM-binding combinations under a shared full-cost objective. This is an inference boundary, not positive novelty evidence.
- Any revision must compare both current paths and explicitly explain why a fixed optimization-level/native semantic choice is not an object change.

## Reproduction route

Static only, before any claim-bearing run:

1. pin the listed commit and recreate the two tests' documented pass sequences;
2. enumerate the candidate's declared action catalog on a single chosen ManagedRA MIR;
3. validate each complete plan with machine verifier, same call regmasks, tile shape and config stack semantics;
4. record config stores/loads, spills/reloads, text bytes, compile CPU/RSS and runtime in one ledger.

No run was performed by this Stage 0 audit.

