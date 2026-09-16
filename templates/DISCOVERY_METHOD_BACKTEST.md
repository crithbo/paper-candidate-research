# Discovery Method Backtest

## 中文摘要

- 结论：
- 主要依据：
- 仍无法判断的部分：
- 下一步：
- 是否需要用户操作：

- Source-session ID:
- Opportunity lens: `O1 / O2 / O3 / O4 / O5 / O6 / O7 / O8 / OTHER_EVIDENCE_BACKED_ORIGIN`
- Method/prompt revision:
- Claim-pack protocol revision/hash, if applicable:
- Evaluation class: `LEGACY_SMALL_CALIBRATION / CLAIMPACK_PAIRED_REGRESSION / CLAIMPACK_BLIND_HOLDOUT / CLAIMPACK_PROSPECTIVE_SHADOW`
- Date:
- Status: `CALIBRATED / REVISE_METHOD / REJECT_METHOD`
- Target-quality coverage: `TIER_A_Q1_POTENTIAL / TIER_B_Q2_VIABLE / Q1_AND_Q2`
- Packer task/session:
- Executor task/session:
- Auditor task/session:
- Standard directory:

## Evaluation protocol

- Time-cutoff rule:
- Hidden target rule:
- Sealed input manifest:
- Allowed source classes:
- Positive recovery definition:
- Abstention definition:
- Same snapshot/model/tools/budget confirmation:
- Paired order/randomization or cross-over rule:
- Neutral rendering rule:
- Contamination and model-memory audit:
- Pre-registered primary endpoints and noninferiority margins:
- Initial sample, expansion increment, maximum sample and stop rule:
- Contribution-type and negative-case coverage:
- Robustness perturbations:

## Positive anchor 1

- Hidden published paper:
- Publication date:
- Pre-publication input packet:
- Recovered trigger:
- Recovered opportunity or baseline limitation:
- Recovered decision structure:
- Recovered contribution route:
- Recovered evidence entry:
- Result: `RECOVERED / PARTIAL / MISSED`

## Positive anchor 2

- Hidden published paper:
- Publication date:
- Pre-publication input packet:
- Recovered trigger:
- Recovered opportunity or baseline limitation:
- Recovered decision structure:
- Recovered contribution route:
- Recovered evidence entry:
- Result: `RECOVERED / PARTIAL / MISSED`

## Positive anchor 3

- Hidden published paper:
- Publication date:
- Pre-publication input packet:
- Recovered trigger:
- Recovered opportunity or baseline limitation:
- Recovered decision structure:
- Recovered contribution route:
- Recovered evidence entry:
- Result: `RECOVERED / PARTIAL / MISSED`

## Negative control

- Input packet:
- Why no credible new opportunity is expected:
- Generated result:
- Result: `ABSTAINED / FALSE_OPPORTUNITY`

## Decision

- Positive recoveries:
- Negative-control abstention:
- Known bias:
- Contamination audit:
- Allowed production domains:
- Required revision:
- Quality-tier leakage audit: confirm that using Q2 anchors did not weaken abstention, provenance, natural-input, baseline, full-cost or reproducibility requirements.
- Critical-source recall with uncertainty:
- False structural DROP with uncertainty:
- Direct-coverage predicate accuracy:
- Unfinished/nonstructural retention:
- Claim-source coverage and contradiction disclosure:
- Decision-ready completeness and audit cost:
- Stability under style/evidence-order/adversarial perturbations:
- Contribution/object/mechanism diversity:
- E1/E2 and Stage0-repair metrics:
- Verdict: `CALIBRATED / NOT_CALIBRATED / PILOT_NOT_CALIBRATED / INCONCLUSIVE / CONTAMINATION_UNKNOWN`

正文使用中文解释 verdict；机器状态码保留在本字段即可。成本无法精确观测时写“运行环境没有提供精确统计，本次未作估算”，不要在用户摘要中堆叠内部占位符。

Legacy small calibration requires at least 2/3 reasonable problem-shape recoveries and no forced packaging of the negative control. Claim-pack V9 requires its preregistered paired blind protocol and two prospective shadow waves; a small fixed set cannot establish calibration. Any calibration validates the process, not the novelty or feasibility of future candidates.
