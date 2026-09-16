# Current RVV Action and Quotient Audit

- Topic: `LLVM-RVV-GROUP-MASK-SPILL-PARETODP`
- Cutoff: `2026-08-11`
- LLVM pin: `5bb2565693f062a9e99929db1814a7a076d4dc76`
- Search status: `SEARCH_BOUNDED_OPEN`
- Transport status: `REVISION_REFETCH_FAILED__PINNED_ACCEPTED_SOURCE_PACKET_USED__NO_ABSENCE_INFERENCE`

## Pinned first-party source boundary

| Source | Blob identity | Material boundary |
|---|---|---|
| [RISCVTargetMachine.cpp](https://github.com/llvm/llvm-project/blob/5bb2565693f062a9e99929db1814a7a076d4dc76/llvm/lib/Target/RISCV/RISCVTargetMachine.cpp) | `517e48faa104348f5ae22bed6001cfe8deb500a8` | vector-first allocator selection/order, `RISCVInsertVSETVLI`, then scalar RA and downstream passes |
| [RISCVRegisterInfo.td](https://github.com/llvm/llvm-project/blob/5bb2565693f062a9e99929db1814a7a076d4dc76/llvm/lib/Target/RISCV/RISCVRegisterInfo.td) | `9d43277bcdafef2ac3110f5e91424be6cad4f051` | `VR/VRNoV0`, fractional values using ordinary `VR`, aligned `VRM2/4/8`, NoV0 variants, allocation order |
| [RISCVRegisterInfo.cpp](https://github.com/llvm/llvm-project/blob/5bb2565693f062a9e99929db1814a7a076d4dc76/llvm/lib/Target/RISCV/RISCVRegisterInfo.cpp) | `f51f56cb10a46d8ac4092c910ccd4b460072ffe2` | current whole-register spill/reload lowering families |
| [RISCVInsertVSETVLI.cpp](https://github.com/llvm/llvm-project/blob/5bb2565693f062a9e99929db1814a7a076d4dc76/llvm/lib/Target/RISCV/RISCVInsertVSETVLI.cpp) | `feceefe1b8550c2191267342ea781d78223508de` | complete VTYPE/VL propagation and insertion; naive vset counting is an unfair baseline |
| [RISCVVMV0Elimination.cpp](https://github.com/llvm/llvm-project/blob/5bb2565693f062a9e99929db1814a7a076d4dc76/llvm/lib/Target/RISCV/RISCVVMV0Elimination.cpp) | `d72d27c983ada7c0310915be4d71820e660bff92` | physical-v0 copies and mask class recomputation before allocation |
| [LLVM RVV documentation](https://llvm.org/docs/RISCV/RISCVVectorExtension.html) | official current documentation checked in accepted source packet | corroborates split vector/scalar RA and RVV register-class semantics |
| [Typed-spill PR #105661](https://github.com/llvm/llvm-project/pull/105661) and [RFC](https://discourse.llvm.org/t/rfc-riscv-vector-register-spill-optimization-pass/80850) | open/proposed at accepted audit; live-head refetch unavailable in revision | local typed-spill/vset action is a direct subtractor and candidate extension, not landed current-native behavior at the pin |

## Current/default/non-default catalog audit

The identical-trace comparator must include `-riscv-rvv-regalloc={fast,basic,greedy}`, the optimized/default selection, current vector-bit assumptions, mask mutation, whole-vector-move valid-vtype behavior, group/NoV0 allocation orders, eviction/splitting/spilling, complete `RISCVInsertVSETVLI`, scalar RA, PEI and MC. Source-level GCC `-mrvv-max-lmul` and other pre-trace controls are external/end-to-end subtractors, not same-MIR arms.

| Action family | Landed at pin | Candidate may use | Baseline treatment |
|---|---:|---:|---|
| aligned group placement and current mask copies | yes | yes | complete B1/B2 |
| current whole register spill/reload | yes | yes | complete B1/B2 |
| typed partial spill/reload from PR #105661 | no | yes, behind exact guard | complete B2/direct subtractor; never called native |
| exact current vset dataflow/insertion | yes | yes | complete B1/B2; candidate state must reproduce |
| generic CP/ILP/exhaustive selection | external | oracle only | B4 subtractor, not mechanism |
| arbitrary grouping or changed ISA | no / changed object | no | negative control only |

## Forced-pressure arithmetic

At the frozen cut:

- three live `VRM8NoV0` values consume `v8...v31` in three aligned groups;
- physical `v0` is live as mask;
- eight pairwise-interfering fractional values each require one ordinary `VR` physical register;
- only `v1...v7` remain.

Therefore `8 > 7` forces at least one spill. Full-lane group liveness, pairwise interference, fixed mask liveness, non-rematerializable definitions, and no call/inline-assembly escape are part of the trace contract. This is an exact capacity proof, unlike the rejected one-group/one-temp witness.

The current whole-spill plan and guarded typed-spill plan preserve the same trace semantics but trade spill traffic/frame extent against vset/code cost. The typed plan is explicitly `UNLANDED_CANDIDATE_ACTION`. The stronger sequential comparator may apply typed spilling after the current victim decision; it may not be weakened to whole spill only.

## Quotient soundness audit

The accepted state never merges labeled semantic values or spill slots. It quotients only complete physical placements through RVV-dyadic subtree/block swaps certified against the full remaining action/cost tensor. The following are merge blockers:

- any `v0`, NoV0, fixed/reserved, inline-assembly, ABI, or terminal distinction;
- any difference in aligned group/subregister alias incidence;
- any suffix operand/use/kill or mask-copy transition difference;
- any whole/typed spill eligibility, identity, slot, frame, or reload difference;
- any AVL/VTYPE/VL transition or vset-cost difference; and
- any declared byte, traffic, instruction, schedule, frame, or terminal-cost difference.

The generator set is computed recursively on the four-block/depth-three RVV group forest. A failed signature or tuple audit yields singleton classes. Hence arbitrary register-bank permutations and the old occupancy bitmap are not used.

## Comparator/action/guarantee map

| Comparator | Same information/semantics | Guarantee | What it subtracts |
|---|---|---|---|
| B1 complete current LLVM | yes | production scalar output | weak current baselines and omitted vset/PEI actions |
| B2 current victim + complete typed sequential transform | yes | complete local whole/typed action after irrevocable allocation | typed-spill novelty and local postpass/controller claims |
| B3 labeled Pareto DP | yes | exact frontier, no physical quotient | fixed-register enumeration and identity-state claims |
| B4 exhaustive/CP/ILP/Unison | yes after fidelity closure | exact tiny/global ceiling depending budget | generic solver reformulations |
| certified dyadic-orbit DP | yes | exact frontier plus conservative target-state reduction | candidate residual |

The [Unison paper](https://doi.org/10.1145/3332373) is the material generic-method subtractor. [LLVM compressed-ISA allocation](https://doi.org/10.1145/3578360.3580261) is a target-aware algorithm-shape neighbor. Neither is evidence that the precise RVV dyadic/mask/spill/vset certificate is absent; bounded novelty remains open.

## Devil's-advocate checks

1. **Hidden capacity escape:** any group subrange not fully live, v0 mask not live, rematerialization, or legal alternate class invalidates the forced proof.
2. **PR relabeling:** calling typed spill native/current or claiming it as N1 is fatal to the package.
3. **Sequential absorption:** if B2 can reopen the same victim/group decision at equal information and budget, the claimed non-product gap collapses.
4. **Symmetry unsoundness:** one future fixed use, VTYPE effect, slot identity, or cost mismatch kills the corresponding merge.
5. **Generic collapse:** if certified classes are singleton in canonical and natural instances, only B3/B4 remains and the Q2 N2 vanishes.
6. **Full-cost collapse:** local traffic reduction may be outweighed by vset, code, planning, frame, or fallback costs.

## Finite fidelity and replay contract

- Generate one pinned MIR witness and a hash-complete action table.
- Require MachineVerifier plus assembler/disassembler and an independent semantic/live-out check.
- Recompute labeled and quotient action-cost successor multisets and exact Pareto frontiers on tiny instances.
- Replay complete B1/B2 and the frozen current victim path; a mismatch is a preclaim failure, not ignorable noise.
- Only after fidelity closure, use public natural RVV traces and a full ledger.

## Audit conclusion

- Current LLVM catalog: `PINNED_AND_COMPLETE_AS_STATIC_SPEC`.
- Typed partial spill: `UNLANDED_DIRECT_SUBTRACTOR_AND_GUARDED_CANDIDATE_ACTION`.
- Forced-pressure witness: `STATIC_CAPACITY_CLOSED__NATIVE_REPLAY_PENDING`.
- Quotient: `STATIC_FUTURE_ACTION_AND_COST_BISIMULATION_CLOSED`.
- Direct fatal collision: `NOT_ESTABLISHED`.
- Recommendation: `RECOMMEND_STAGE0_PASS_FOR_CLOSING_REVIEW`.

