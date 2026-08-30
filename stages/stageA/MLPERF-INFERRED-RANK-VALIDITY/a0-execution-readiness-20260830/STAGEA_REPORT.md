## Material Passport

- Assignment: `STAGEA-L1-20260830-MLPERF-RANK-VALIDITY-A0`
- Topic: `MLPERF-INFERRED-RANK-VALIDITY`
- Evidence class: Stage A A1 decisive pilot attempt
- Verification status: `EXECUTED_ONCE__FAIL_CLOSED_INVALID_CONSTRUCTION__PENDING_INDEPENDENT_GATE`
- Claim ceiling: `CANONICAL_MLPERF_BENCHMARK_VALIDITY_ONLY`

# MLPERF inferred-rank validity Stage A report

## 执行事实

claim runner 经过唯一一次 no-bytecode static compile 后，在一个进程内按冻结合同完整读取 v5.1 development 与 v6.0 held-out summaries；两版均未排除、未 refit。执行次数为 1，retry=0，network=0，输入哈希全部一致。

原始 runner 输出：v5.1 共 1,448 rows，其中 862 Edge rows 进入配对前检查；v6.0 共 520 rows，其中 55 Edge rows 进入配对前检查。两版均得到 0 个 exact eligible pairs，raw runner 因而写出 `FALSIFIER_TRIGGERED__NO_EXACT_ELIGIBLE_PAIRS`。没有合法的 formula-error、rank-correlation、rank-reversal 或 held-out stability 数值可计算。

## 为什么不能把 raw decision 当作科学结论

closeout fidelity audit 发现两个合同缺口：

1. frozen unit classifier 将 v5.1 的 571/862、v6.0 的 34/55 Edge rows 记为 `unit_mismatch`，但 runner 没有输出被拒绝的原始 unit tokens。因此目前无法区分“官方源确实不满足单位合同”和“parser 未覆盖官方单位别名”。在这个歧义关闭前，0-pair 不能作为 source-level falsifier。
2. process receipt 的 CPU、wall、input/output bytes 已记录，但 required `peak_rss_bytes` 为 `null`，未满足 MAINLINE_A1_START 的完整 full-cost receipt。

retry=0，且公式、pair key、missingness、0.02 threshold、分母和成本维度禁止修改，所以本 owner 不补跑、不补测、不改 parser，也不从无效构造作 PASS 或 STOP 推断。

## Full-cost receipt

- CPU: 0.015625 s
- Wall: 0.02999880000425037 s
- Input: 3,027,888 bytes
- Output（不含 receipt）: 7,648 bytes
- Peak RSS: unavailable (`null`)，未估算
- A1 network: 0 bytes

## Owner recommendation

- Scientific verdict: `INCONCLUSIVE__INVALID_CONSTRUCTION__NO_SCIENTIFIC_INFERENCE`
- Operational disposition: `EXECUTION_CONTRACT_HOLD__UNIT_NORMALIZATION_AND_PEAK_RSS_GAPS__RETRY_FORBIDDEN`
- 下一步：独立 Stage A gate 审查 raw outputs 与 invalidation；正式状态仅由 MAINLINE 决定。
- Stage B 未授权；本 owner 不启动 successor、cleanup 或第二次执行。
