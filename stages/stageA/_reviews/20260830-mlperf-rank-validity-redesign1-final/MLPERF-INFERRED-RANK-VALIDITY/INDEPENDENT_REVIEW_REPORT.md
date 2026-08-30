# MLPERF-INFERRED-RANK-VALIDITY — Redesign1 Final Independent Stage A Gate

## 中文摘要

- Scientific verdict: `STOP / BELOW_Q2_STOP__STRUCTURAL_PAIR_FEASIBILITY_FALSE`。
- Operational disposition: `STOP_RECOMMENDED__MAINLINE_ONLY_STATE_WRITE__NO_RETRY_OR_SECOND_REDESIGN__NO_STAGEB`。
- redesign 后构造有效：unit alias map 在 claim 前冻结、结果无关；917/917 Edge rows 均被接受，raw normalization ledger 完整；peak RSS 由 child wrapper 实测且非空；冻结公式、pair key、missingness、阈值、两版 carrier、成本维度与 claim ceiling 均未改变。
- v5.1 与 held-out v6.0 在 exact measured–inferred pairing key 下均为 0 eligible pairs。这是有效 source-level structural falsifier，不是 parser 或 full-cost 缺口。
- 不改变 pair key 或 carrier，无法形成 formula-error pair、rank stratum、correlation 或 reversal estimand；同题没有 Q2 residual。
- Method redesign 已消费 1/1，retry=0，第二 redesign 与 scientific revision 均禁止。无需用户动作。

## Frozen construction validity

The redesign is valid and result-independent:

- The literal unit alias map was hash-frozen before the claim process and was not fitted to pair yield.
- All 917 Edge rows across v5.1 and v6.0 were normalized and accepted; zero unit mismatches or rejected tokens remain.
- The raw ledger records literal token, normalized token, rule identity, canonical class, and row count.
- Child peak working set is measured from 64 samples and is non-null.
- Inputs match frozen hashes; one compile and one claim process completed with retry=0, network=0, timeout=false, and exit=0.
- Formulas, pairing key, missingness policy, relative-error threshold, denominator, releases, cost dimensions, and claim ceiling are unchanged.

Therefore the previous invalid-construction explanation is eliminated.

## Exact-pair feasibility

Under the frozen exact pair key:

- v5.1: all 862 Edge rows fall into measured-only or inferred-only groups; exact eligible pairs = 0.
- v6.0 held-out: all 55 Edge rows likewise lack exact counterparts; exact eligible pairs = 0.

The absence reproduces across both frozen releases after complete unit normalization. Consequently there are no legal formula-error pairs or rank strata from which bias direction, rank correlation, reversal rate, or release stability can be estimated.

## Scientific falsifier and Q2 residual

The zero denominator directly falsifies the frozen estimand's feasibility on the exact official summary carriers. It is not evidence that an effect size equals zero; it is evidence that the pre-registered measured-versus-inferred rank-validity estimand is unobservable under the frozen same-object contract.

No Q2-viable residual remains without changing identity:

- relaxing the pair key changes the estimand and denominator;
- cross-release pairing changes the comparison object;
- acquiring lower-level or different carriers changes the frozen carrier;
- reframing the result as a general MLPerf data-availability characterization would be a new research question and requires a new ID/Stage 0 route.

The current topic therefore cannot proceed as the same candidate.

## Full cost and evidence ceiling

Full-cost observability is complete for this Stage A run: child CPU/wall, wrapper wall, child peak working set, input/output bytes, and network bytes are recorded. The scientific inference is limited to exact-pair feasibility on the two pinned official releases. Unsupported claims—including bias direction, rank metrics, natural deployment effects, and Stage B readiness—remain unsupported.

## Final decision

- Decision: `STOP`
- Quality tier: `BELOW_Q2_STOP`
- Direct kernel: `VALID_CONSTRUCTION__BOTH_PINNED_RELEASES_ZERO_EXACT_PAIRS__FROZEN_ESTIMAND_UNOBSERVABLE`
- Hold: inappropriate because construction is valid and the structural killer is observed.
- Reserve: inappropriate because the issue is scientific feasibility, not human-core execution.
- Further same-object recovery: none under the frozen pair key/carrier and cumulative budget.
- User action: none.
- Stage B: not authorized.
- Current reset cycle: false.

MAINLINE remains the sole formal state writer. It should record the terminal STOP identity, preserve the decisive evidence capsule, release the lane, and dispatch no same-ID successor.

