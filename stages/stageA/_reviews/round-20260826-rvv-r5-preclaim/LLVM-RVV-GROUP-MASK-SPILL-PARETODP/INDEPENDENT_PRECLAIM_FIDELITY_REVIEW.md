# LLVM-RVV-GROUP-MASK-SPILL-PARETODP — r5 Independent Preclaim Fidelity Review

## 中文摘要

- 独立结论：`REJECT_PRECLAIM_FIDELITY__BOUNDED_ENGINEERING_CORRECTION_EXISTS`。
- G0 PASS：exact commit、RVV witness、atomic action、baseline 与 gate 保持；StageA mechanism pivot 已 `1/1` 消费，未创建第二 pivot/revision。
- G1 FAIL：checker 只对硬编码 `%4/%11` 的即时 children 做单层摘要，没有实现完整 transitive ancestry 或 future-action/cost quotient；其 `successor_equal` 实际只是 serialized-state 唯一性检查。
- G2 PASS（有限范围）：五个必需 negative controls 均 fail closed，未降低 MachineVerifier；但不能补偿 G1/G4。
- G3 `PROVENANCE_FAIL`：两份 MIR byte-exact，但 canonical reproducibility report 写 fresh llc commands=`0`、唯一命令 exit=`1`，且没有 command/exit receipts，无法独立确认 owner 声称的两次 fresh llc/MachineVerifier。
- G4 FAIL：F3/F4/F5 由旧 `rvv_preclaim.py` 独立生成，不读取 `split_closure.json`；split provenance 未进入 labeled/quotient successor、backpointer、cost 或 baseline grammar。
- G5：存在一个保持同对象、同机制、同强基线且不消费第二 pivot/revision 的有限 `SOFT_ENGINEERING_BLOCKER` correction route。本 review 不授权执行或自然/claim start。

- Assignment: `STAGEA-GATE-20260826-LLVM-RVV-R5-SPLIT-CLOSURE-PRECLAIM`
- Review lane: `STAGEA_GATE`
- Context SHA-256: `6F7661F1A444DD6DADCFD2889412AAA63D2B83DDCC4940B9714BAB437BB9945B`
- START SHA-256: `CCFF45E3D0A5350843FD3155A57EECC4C1726A5D913073499F406D64AE0E770B`
- GATE_PRECOMMIT SHA-256: `EF538B588891A1705BB4D4896022409F736E580FD998D82886147E51C491DDB1`
- Evidence ceiling: `INDEPENDENT_PRECLAIM_CONTROL_FIDELITY_ONLY__NO_NATURAL_OR_SCIENTIFIC_INFERENCE`
- Quality tier: prior conditional `TIER_B_Q2_VIABLE`; not re-evaluated by this control-only gate.
- Independence: reviewer did not implement or run r5 and wrote no owner/shared file.

## G0 — identity and pivot boundary: PASS

Both replay MIR files hash to `52F7303B...` and retain the exact RVV forced-pressure object: three `VRM8NoV0` groups, live `v0`, fractional vector values, the same function/ABI and spill/reload boundary. The r5 control freezes `SPLIT_PROVENANCE_CLOSED_QUOTIENT_STATE` as the sole StageA mechanism pivot and records its consumption on first changed-checker execution. No natural or claim observation exists, and StageA scientific revision remains unconsumed.

This gate has no authority for another pivot or revision. Any legal recovery must implement the already frozen pivot, not redesign it.

## G1 — split provenance completeness: FAIL

The checker identifies the observed immediate edges `%4→{%14,%15}` and `%11→{%12,%13}` and reconstructs one spill/reload chain for each. That is useful control evidence, but it does not satisfy the frozen transitive split-closed quotient:

- the expected parent set is hardcoded as `{4,11}`;
- no recursive root-to-descendant ancestry is computed;
- LMUL is inferred from a class substring and may become `unknown` without failure;
- mask liveness is global text presence rather than interval/action-specific liveness;
- interference is represented only as assigned child physreg names;
- no future legal successor or cost tensor is constructed.

Most decisively, the emitted `quotient.successor_equal` is `len(serialized_states)==len(unique_serialized_states)`. This proves only that the two summaries differ; it does not compare successor actions, legality, costs, or backpointer replay. The split data is a report-only summary, not the mechanism pivot's quotient state.

## G2 — no split-escape lowering: PASS for registered controls

The five required mutations—missing child, unknown parent, cross class, missing spill, and missing reload/future use—all fail closed. The source also rejects missing child physregs and absent `v0`, and the precommitted llc command retains `-verify-machineinstrs`.

This supports a narrow fail-closed parser/checker property. It does not establish multi-level transitive closure, valid quotient merging, or dependency into F4/F5.

## G3 — native replay fidelity: provenance failure

`replay-R1.mir` and `replay-R2.mir` are byte-identical and match the hashes frozen in the owner gate. `COMMAND_PRECOMMIT.yaml` lists two appropriate llc greedy/MachineVerifier commands.

However, no command/exit receipt, stdout/stderr record, or per-command metrics accompany those files. The canonical `REPRODUCIBILITY_REPORT.yaml` contradicts `FRESH_REPLAY_AUDIT.yaml`: it records `command_records_started: 1`, `exit_code: 1`, and `fresh_llc_commands_started: 0`. File equality alone cannot prove that the files were freshly produced by the claimed commands. G3 therefore cannot pass independently.

## G4 — F3–F5 and quotient integration: FAIL

The command sequence runs split closure as R4, then invokes F3/F4/F5 without passing the closure artifact. `rvv_preclaim.py` confirms the separation:

- F3 is a self-contained JSON semantics model;
- F4 enumerates a four-fractional-value/two-slot grammar with state key `(index, used, typed, whole, cost)` and no split parent/child/LMUL/mask/spill-reload provenance;
- F5 calls that same old certificate and compares it with labeled/generic/current-victim frontiers.

Neither F4 nor F5 accepts a split-closure input or records its hash. Thus their PASS results merely replay the pre-pivot controls. They do not show that the consumed split pivot preserves the labeled/quotient successor relation, exact frontier, backpointers, baselines, or costs.

F5 also honestly records that the control candidate frontier equals both the labeled exact DP and generic exact subtractor. This is permissible as a parity control, but it supplies no compensating target-specific residual.

## G5 — next route under the soft-blocker rule

The defects are implementation, dependency-consumption, execution-receipt, and canonical-metadata defects inside the already frozen pivot. They do not require a new object, atomic action, mechanism, baseline, denominator, or guarantee. The correct classification is `SOFT_ENGINEERING_BLOCKER`, not another mechanism pivot.

A bounded correction may modify only `split_closure.py` and `rvv_preclaim.py` plus one assignment-local receipt wrapper/schema. It must:

1. derive every transitive split ancestry and all class/LMUL/mask/live-interval/interference/physreg/spill/reload/future-use/backpointer obligations from raw MIR without hardcoded parent IDs;
2. pass the split-closure artifact and expected hash into F4/F5, include its obligations in labeled and quotient states/successors/costs, and use the same split-closed grammar for B1–B4;
3. add missing multi-level, wrong-LMUL, mask, physreg/backpointer, stale-dependency and omitted-child-action negative controls;
4. perform two fresh fixed-witness llc/MachineVerifier replays with exact argv/cwd/input/output/exit/stdout/stderr receipts, no retry, and a final reproducibility report generated after all commands;
5. reseal the owner packet with actual resource counts and decisive source/receipt hashes.

This route consumes neither a second pivot nor StageA scientific revision. It remains preclaim-only and must receive another independent acceptance before any natural assignment.

## Resource and lifecycle audit

The current owner resource tree contains 141 files / 198,380,512 bytes, 26 directories including root, zero reparse entries, and no active related process. It matches `RESOURCE_INVENTORY.yaml` and stays under the 512 MiB cap. The owner handoff's 133 files / 198,343,802 bytes is stale by 8 files / 36,710 bytes and requires a bounded metadata corrigendum. There are no cleanup candidates; this review performed no cleanup.

## Final disposition

`REJECT_PRECLAIM_FIDELITY__BOUNDED_ENGINEERING_CORRECTION_EXISTS`.

- Natural or claim execution: not authorized.
- Second pivot/revision: not authorized or consumed.
- Scientific PASS/STOP/state transition: none.
- Stage B: not authorized.
- User action: none; MAINLINE may autonomously freeze the bounded engineering correction under the soft-blocker rule.
