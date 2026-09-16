## Material Passport

- Assignment: `STAGEA-L1-20260830-MLPERF-RANK-VALIDITY-METHOD-REDESIGN1`
- Topic: `MLPERF-INFERRED-RANK-VALIDITY`
- Evidence class: Stage A decisive same-object method redesign 1/1
- Verification status: `EXECUTED_ONCE__VALID_CONSTRUCTION__PENDING_INDEPENDENT_GATE`
- Claim ceiling: `CANONICAL_MLPERF_BENCHMARK_VALIDITY_ONLY`

# MLPERF inferred-rank validity — Stage A method redesign1 report

## 得到什么

本次 result-independent redesign 在 claim 前冻结了官方 literal unit alias map，并由 Windows child wrapper 实测 peak working set。9 个 A0 pinned inputs 一次复制并通过 hash 校验；两份 instrumented source 在一个 no-bytecode process 中 static compile 1/1 PASS；随后一个 wrapper 只启动一个 claim child，retry=0、network=0、v6.0 不 refit。

unit observability 已完全闭合：v5.1 的 862 个 Edge rows 与 v6.0 的 55 个 Edge rows，共 917/917 rows 全部匹配冻结 alias map，unit mismatch=0、rejected unit rows=0。raw ledger 保存每个 literal token、normalized token、rule ID、canonical class 和 row count。

## 决定性结果

在冻结 exact pairing key 下，两版仍均为 0 个 eligible measured–inferred pairs：

- v5.1：536 个 inferred-without-measured groups，326 个 measured-without-inferred groups；合计覆盖全部 862 个 Edge rows。
- v6.0 held-out：35 个 inferred-without-measured groups，20 个 measured-without-inferred groups；合计覆盖全部 55 个 Edge rows。

因此没有任何合法 formula-error pair 或 rank stratum，不能计算 bias direction、rank correlation 或 reversal rate。这不是“效果为零”，而是冻结公开 summary carriers 无法支持预登记 estimand。若放宽 pairing key、跨 release 配对或改用不同底层对象，将改变 object/denominator，不能作为本题 continuation。

## Full cost

- Child CPU: 0.046875 s
- Child wall: 0.053943899998557754 s
- Wrapper wall: 0.3611839999939548 s
- Child peak working set: 30,593,024 bytes（64 samples）
- Input: 3,032,470 bytes
- Output: 14,771 bytes
- A1 network: 0 bytes

全部冻结成本维度仍在 receipt 中；stdout/stderr 为空，timeout=false。

## Owner recommendation

- Scientific verdict: `BELOW_Q2_STOP__STRUCTURAL_PAIR_FEASIBILITY_FALSE`
- 理由：在两个 pinned official releases 上，经过完整有效的单位归一化后，exact measured–inferred pair denominator 仍为空，Stage 0 预登记的 structural killer 被触发。
- Formula/rank 方向与自然部署效果均不受支持；Stage B 未授权。
- 正式 STOP 仅由 MAINLINE 在独立 Stage A gate 后登记。本 owner 不修改 object、pair key、denominator 或 claim ceiling，不执行第二 redesign、retry、cleanup 或 successor。
