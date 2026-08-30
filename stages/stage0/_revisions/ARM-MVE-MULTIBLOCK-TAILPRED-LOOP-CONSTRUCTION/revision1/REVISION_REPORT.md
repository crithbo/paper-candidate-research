# ARM-MVE-MULTIBLOCK-TAILPRED-LOOP-CONSTRUCTION — Stage 0 revision1

## 结论

- Assignment: `STAGE0-P1-20260814-ARM-MVE-MULTIBLOCK-TAILPRED-LOOP-CONSTRUCTION-REVISION1-V8.7`
- Sole gate: `NATIVE_TWO_BLOCK_MVE_PLAN_DIVERGENCE__FUTURE_PRESERVING_VPT_VCTP_FRONTIER_CERTIFICATE`
- Decision: `RECOMMEND_BELOW_Q2_STOP`
- Sentinel: `BELOW_Q2_STOP__SINGLE_BLOCK_BOUNDARY_WITHOUT_NATIVE_TWO_PLAN_OR_TARGET_SPECIFIC_FRONTIER`
- Quality tier: `BELOW_Q2_STOP`
- Confidence: `0.91`
- Scientific revision: `CONSUMED (1/1)` — this report performs the authorized gate-bearing static reconstruction.
- Stage A/B: `NOT_AUTHORIZED`
- Closing review: `NOT_REQUESTED` (the gate did not close).
- Evidence ceiling: `E1_STATIC_SOURCE_AND_SEMANTIC_AUDIT_ONLY`; no implementation, build, or benchmark was run.

该 revision 不能提供所要求的同函数、两基本块、两个完整 stock-native-legal MVE plans，更不能在其上建立保留未来 native actions、合法性和 full cost 的 MVE-specific frontier。剩下的说法只能是删去单块检查、调 tail-predication mode、复用 VCTP/VPT repair，或以通用 CFG/ILP 包装；这些均由冻结合同排除，并已被 current union 吸收。因此这是原子门的结构性失败，而非“尚未有实验结果”的失败。

## Static proposition and falsification

**Required proposition.** On LLVM `81ac5c7c26efb70ffaffb91b26053437093ee085`, one public two-basic-block MVE+LOB MachineFunction admits two complete native-legal plans with identical vector result, active lanes, branches, observable exceptions, ABI, VPT/VCTP semantics, loop range and live-outs; one plan is outside the complete current composition and is selected by a finite, future-native-action/full-cost-preserving MVE-specific recurrence.

**Falsification obtained.** The frozen current action grammar supplies neither a complete two-block tail-predicated plan nor a cross-block semantic state/transition from which such a plan can be derived without adding an action. Current LLVM makes tail predication legal only when `ML.getNumBlocks()==1`; its conversion and live-out proof also assume that shape. The proposed substitution does not name the additional action, its VPR/VPT edge semantics, its exception/branch preservation rule, or a recurrence. Hence the required proposition is not defined on the frozen native action universe.

This is deliberately narrower than an ISA-absence claim: the source condition is an LLVM current-pipeline eligibility condition, **not** proof that Arm MVE hardware can never execute a multi-block loop.

## Frozen object and current-union reconstruction

Object: one pinned Armv8.1-M MVE+LOB MachineFunction with exactly two loop blocks, preserving the contract listed in the assignment. The relevant current paths and archived blob hashes are:

| Source path | SHA-256 | role |
|---|---|---|
| `llvm/lib/Target/ARM/ARMLowOverheadLoops.cpp` | `0F9E7E386C6ED7922052B37DE124F4C0FD6B53142227BF38D2AB2C9144242265` | LOB selection, validation, fallback |
| `llvm/lib/Target/ARM/MVETailPredication.cpp` | `89D7BAAD70E1EC9AF175C271391632B6E4923E279693D69A6BE22CDE88BCFF79` | active-lane-mask to VCTP conversion |
| `llvm/lib/Target/ARM/MVETailPredUtils.h` | `D4CE910F6194FFA557F9DB17F4882961C44529BEC8C2FD8D4C3F402164301814` | VCTP-to-DLSTP/WLSTP mapping |
| `llvm/lib/Target/ARM/ARMTargetMachine.cpp` | `083C3CA18B05582E61D5D31058E79455BC68602EC67A0F66B8B2FA3C0AE764E5` | relevant pass ordering |

The fair current union is the same-information composition of vectorization, `MVETailPredication`, `ARMLowOverheadLoops`, all five tail-predication modes, VCTP reaching-definition checking, VPT/VPST conversion/recomputation, DLSTP/WLSTP/LETP selection, and ordinary/revert fallback. It already owns all component-level actions.

The decisive facts are mechanical:

1. `LowOverheadLoop::IsTailPredicationLegal()` requires `ML.getNumBlocks()==1` in addition to its other legality predicates.
2. `ValidateLiveOuts()` iterates the header and asserts `ML.getNumBlocks() == 1` and one exit before it validates live-ins/live-outs.
3. `AddVCTP()` accepts multiple VCTPs only when their operands are identical and have the same reaching definition.
4. `Expand()` emits `MVE_LETP` and invokes `ConvertVPTBlocks()` only after the preceding tail-predication legality test; otherwise it emits the ordinary loop-end update/revert route.

These facts do not merely reveal an unimplemented switch: they delimit the proof obligations a new full native plan must meet. The revision did not supply a branch-edge VPR/VPT contract, a two-block live-out proof, an exception-preserving VCTP placement rule, or a complete second plan. Deleting the block count test would leave each of those obligations unresolved and is an explicitly rejected substitute.

## Two-plan and frontier audit

| Required item | Independent result | consequence |
|---|---|---|
| Public pinned two-block same-function witness | No such witness is named with a complete producer-to-MIR/native action trace. A synthetic block split, a changed branch, or a hand-added action would change the frozen action universe. | `FAIL` |
| Stock-native plan A | Ordinary/revert fallback is a current-union plan, but it is only one plan and supplies no candidate residual. | `PASS_AS_BASELINE_ONLY` |
| Stock-native plan B | No legal cross-block tail-predicated plan is specified through VCTP identity, VPT/VPST masks, VPR edge state, LOB end, exits and live-outs. | `FAIL` |
| Union-external Pareto point | Cannot be enumerated without plan B; flag/force-mode and repair paths are union members. | `FAIL` |
| MVE-specific sufficient state | A state over block-local masks alone loses branch/exception/VPR-edge obligations; adding generic CFG state still does not name a native action. | `FAIL` |
| Exact/FPT/certified recurrence | No recurrence can be stated without a defined action B and sufficient state. Generic CFG scheduling/ILP is prohibited. | `FAIL` |

The action-divergence requirement is therefore not merely unmeasured; it is absent at the static definition level. A finite Stage A killer cannot repair an undefined competing plan without first changing the object or action grammar.

## Paper-potential and readiness separation

Current MVE tail-predication is an important compiler boundary and a multi-block result could have been an N2 paper shape **if** the required native plan and MVE-specific finite frontier existed. That conditional observation does not survive this revision: the only articulated delta is the current single-block eligibility boundary, while all existing component mechanisms are already in the union. The residual has no non-generic target-specific algorithm or guarantee.

No missing implementation, hardware, performance result, source download, or natural workload result caused this decision. The source is pinned and readable; the failure is the inability to define the gate's required same-object plan/action/guarantee without taking one of the contract-forbidden pivots.

## Collision and claim ceiling

Current-source collision is direct for VCTP conversion, VCTP reaching-definition equivalence, VPT/VPST repair, LOB selection and fallback. It is not claimed that LLVM already implements a multi-block MVE tail-predication frontier, and external paper collision remains `SEARCH_BOUNDED_OPEN`. The STOP follows instead from the lack of a contract-compliant, union-external native action and target-specific algorithmic kernel.

Claim ceiling: this review establishes only static source/action-boundary facts and the gate disposition. It establishes no compiler correctness, code-size, pressure, compile-time, runtime, or energy result.

## Fidelity route disposition

The pre-registered Stage A plan would have required a tiny same-MIR native oracle, verifier/assembler/object checks, all mode-envelope baselines, and a complete code-size/pressure/LOB/fallback/full-cost ledger. It is not authorized because its precondition — two complete static plans — is false. Running it would test a different or partially specified object.

## Provenance and isolation

- Frozen primary/confirmation manifests: `D0EA3979033115B1383138D38E634FB58BD0EB934F8D2A11ABB6F57F4D1444DE` / `6C44EA460872552B2003D5437CE89E0F502335F004A4EE3B274015F94F412C75`.
- This review used only the MVE frozen assignment and its MVE primary/confirmation materials. No PPC-MMA evidence or conclusion was consulted or imported.
- Repair vector: `ATOMIC_ACTION_UNCLEAR`, `CLAIM_MECHANISM_UNCLEAR`, `Q2_SHAPE_GAP`.
