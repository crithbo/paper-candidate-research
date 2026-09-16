# ROCKSDB-DICT-COVER r7 User Blocker Packet

## 中文摘要

- 卡在哪里：自然矩阵的 `pypi-django / B1 / G2` 两个冻结 replay 均未达到每 SST 至少 16 个 data blocks。
- 已完成什么：A1 build/smoke/quiescence PASS；344/560 进程完成，其中 342 PASS、2 deterministic fail。
- 需要的最小动作：MAINLINE 与独立 gate 对 future revision 作单独冻结处置；当前 owner 无权降低门、排除输入或重跑。
- 科学负结论：无。

- Status: `BLOCKED_USER_ACTION_REQUIRED`
- Blocker kind: `INVALID_CLAIM_CONSTRUCTION`
- Exact failure: `SST has fewer than 16 data blocks`
- Failed identities: `pypi-django-B1-G2-R1`, `pypi-django-B1-G2-R2`
- Claim processes completed before failure: `344`
- Raw pass results retained: `342`
- Raw failure results retained: `2`
- Evidence ceiling: `INVALID_CLAIM_CONSTRUCTION__NO_SCIENTIFIC_INFERENCE`
- Scientific revision consumed: `no`
- Retries, exclusions, second build, cleanup: none

## Resume contract

- Current frozen assignment cannot continue the remaining 216 processes.
- Forbidden recovery: lower 16-block gate, exclude django/G2, rerun failed identities, second build, revise baselines/metrics/contract.
- Future revision requires a separate MAINLINE and independent-gate disposition with a new exact write/run boundary.
