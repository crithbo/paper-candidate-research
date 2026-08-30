# CVC5 非盲兼容性最小 probe 独立审查

## 限定结论

`REJECT_PRECLAIM_FIDELITY__FULL_COST_AND_VERSION_PROVENANCE_INCOMPLETE__NO_GOLD_FINAL_DISPOSITION`。

fixture、UNSAT oracle 与一次固定运行是可核验的，但不能支持完整的 nonblind compatibility fidelity acceptance：F0 要求 parse/solve wall 分项、峰值内存和冻结 solver version/options；P1 receipt 只提供合并 wall/RSS，并未把实际 binary version/hash 作为本次 receipt 的受检字段。

## 静态核验

| 项目 | 结论 | 依据 |
|---|---|---|
| QF_LIA fixture | PASS | 固定 SMT-LIB 2.6 fixture 声明 Int `x`，同时 assert `x>0` 与 `x<0`，语义为 UNSAT；fixture hash 与 receipt 一致。 |
| Oracle | PASS | 同一 QF_LIA 整数序矛盾 oracle；result denominator 是一个 fixture/一个 expected status。 |
| cvc5 options | PASS | receipt command 使用 assignment-local `cvc5.exe --lang=smt2`，options 为唯一冻结 vector。 |
| UNSAT receipt | PASS | exit 0、stdout `unsat`、run attempts 1、retry 0。 |
| wall/RSS | PARTIAL | receipt 提供 wall 0.2495063 s 与 peak RSS 10,616,832 bytes，均在冻结 30 s/512 MiB 范围内。 |
| full cost | FAIL | F0 明确包含 fixture materialization、parse wall、solve wall、peak memory 和 option-search；P1 只给单一 wall，无 parse/solve 分项或 fixture-materialization 计价。 |
| solver version provenance | FAIL | F0 声明 cvc5 1.3.4，但 P1 receipt 没有实际 `--version`/binary hash receipt，不能独立把该运行绑定到声明版本。 |

## Evidence ceiling

保持 `MINIMAL_CANONICAL_PROBE__NONBLIND_COMPATIBILITY_ONLY__NO_PRODUCTION_CANDIDATE_OR_STAGEB`。本报告不登记生产候选、正式 Stage A PASS/STOP、Stage B 或 gold final disposition；reviewer 未启动 solver/probe、网络或新资源。

## 下一步

若 MAINLINE 继续，需在新的冻结 assignment 中补充现有运行的可审计 version/hash、fixture bytes、parse wall、solve wall、peak RSS 与 option-search=0 receipts；不得由 reviewer 重跑或修改 fixture。
