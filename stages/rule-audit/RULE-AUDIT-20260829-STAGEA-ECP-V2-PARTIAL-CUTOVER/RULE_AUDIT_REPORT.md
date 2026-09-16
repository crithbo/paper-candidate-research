# Stage A ECP V2 partial cutover audit

## 中文摘要

- V1 结果：共享资产、轻量完整性和结果隔离有效；0/3 题达到 control row 或自然观察，因此完整 ECP 未校准。
- 用户决定：立即写入有效基础设施部分，并继续 APX/PPC/RVV V2 pilot。
- V2 改动：增加 `E0.5 binding closure`，把完整 control row、consumer dependency closure、自然输入、baseline、argv、output schema 和 full-cost consumer 作为 E1 hard predicates。
- Skill：本轮不创建；仅当 V2 至少 2/3 题产生有效正或负自然观察后创建 Stage A 专用 skill。
- Shared files modified by Rule Audit: `false`。

## Evidence

- APX：V1 E1 false-pass，E2 才发现 control row specification 缺失。
- PPC：shared asset consumer closure 缺 exact input manifest 和三个工具 binary。
- RVV：缺 natural corpus、baseline、argv、schema、full-cost binding。
- 全部题 result-aware changes=0、claim runs=0、StageB=0。

## Recommendation

- Decision: `PATCH_RECOMMENDED__PARTIAL_CUTOVER_AND_V2_PILOT`
- Install now: shared asset reuse, lightweight integrity, engineering result firewall, milestone dashboard.
- Keep pilot-only: complete executable-claim-packet state machine.
- Acceptance: at least 2/3 valid decisive Stage A observations; positive results not required.
- Rollback: preserve partial infrastructure rules but do not create/install Stage A ECP skill if V2 fails.
