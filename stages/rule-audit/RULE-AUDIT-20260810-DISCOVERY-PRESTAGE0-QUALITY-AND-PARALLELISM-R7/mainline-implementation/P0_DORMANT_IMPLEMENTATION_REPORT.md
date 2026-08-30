# R7 P0 / dormant implementation report

## 身份与授权

- Audit: `RULE-AUDIT-20260810-DISCOVERY-PRESTAGE0-QUALITY-AND-PARALLELISM-R7`
- Proposal: `COLLISION-FIRST-DEPTH-RESERVATION-R7`
- User approval SHA-256: `493E70EFC25141013C0BCF42F43976FEAEF01361408633777441E30887DF191A`
- R7 source manifest SHA-256: `A0D6D1E61F337C7C34FE901CBC8F57DF0EFAA3F16FD0B73DD4C0734D9CF194CE`；`5/5 PASS`
- Shared writer: `MAINLINE_ONLY`
- Implemented scope: P0 `STAGE0_REPAIR_VECTOR`、兼容遥测、可选 topic-brief 字段，以及默认 `OFF` 的 dormant R7 quality-mode 模块
- Not started: R7 blind backtest、PACKER/EXECUTOR/AUDITOR、两波 shadow、production cutover、R5 P1/P2

## 安全 assignment 边界

- 当前没有 Stage0 assignment，因此增加非裁决 repair vector 不改变在制裁决。
- S1/S3 Wave48 已在本次规则修改前启动；两条 assignment 均登记其旧 rule revision 并冻结 `DISCOVERY_QUALITY_MODE=OFF`。
- `OFF` 明确沿用当前 v8.7+R5-P0 canonical 决策；R7 collision-first、failure-kernel、prebrief 与 breadth/depth 映射均不进入本波 canonical 输出。
- Active assignment semantic changes: `0`；candidate state changes: `0`。

## 精确 old → new hashes

| File | Old SHA-256 | New SHA-256 | P0/dormant delta |
|---|---|---|---|
| `rules/ROLE_MAINLINE.md` | `538C9121A0F91C9AD62261692CCB9CD19C9A1CC35AACDD23808616914496BDE5` | `F27AFAEE4E960158077B24DEFA4E13DE94CE8E152605BA3C5DACCF8A7A71415E` | Assignment-frozen `OFF/SHADOW/PRODUCTION`、fail-closed gates、dormant target mapping、repair-vector/quality telemetry。 |
| `rules/ROLE_DISCOVERY.md` | `D2F04CDD642DB8E1FF5E632E9B08555D45742DEB0ED884CDD578B7F2AC0EFFCA` | `585C35D2D7E46D30204F5F09B09040D562795E7CC005FF858B20CBCFBD9727A8` | 可读的 assignment-gated R7 module；`OFF` 不执行，`SHADOW` 非 canonical，`PRODUCTION` 需门控。 |
| `rules/ROLE_STAGE0_REVIEW.md` | `AD00B257F80FB1AF3B842E652E395A0B964291E43B0BA2FD7526CA098D2546B9` | `741EC3544797FF8A5BF337E1E3448B5F683823E5229F818F162834400581626E` | 非裁决 `STAGE0_REPAIR_VECTOR`，允许多选，`NO_MATERIAL_REPAIR` 对科学 STOP 也合法。 |
| `templates/TOPIC_BRIEF.md` | `A68707AEBF84F67212B9705B5B7EDE86B8241CCA46C58ADB9C7AD0D9E6FEC08E` | `41D7B1977C6C467E31762B097C3F53C4314900E5C69AD8351EBB709F3963A130` | 仅冻结 assignment 启用 R7 时填写的可选 collision-first/facet/prebrief 块；文件名兼容。 |

以下控制文件 new hash 是 P0 语义落盘、但在把本报告 SHA 回填 registry 之前的 completion boundary；后续只允许机械登记本报告/manifest，不改变上述语义：

| File | Old SHA-256 | P0 completion-boundary SHA-256 |
|---|---|---|
| `registry.yaml` | `57DE311792BFCE3B5DA6F5ACBAB7D5ED9A397A9DBE779D430C8094D81D845934` | `6EE66ABF445B05DC8EA10BC9F150DC79613203124AD95BE9CD78B8C83BE129AB` |
| `plan.md` | `8EF7037594D42EB80D27F912FEAA2BA261D3474CDC040292DC86D6016E75C767` | `DC49F123EE3C0DD4CA732C3854A907A0DBE7C01540AD37E5701AAD5ECEB026BC` |
| `history.md` | `09B06315C391C4A46A997F87427ECFEAD7DC0EC2F8C74CC05A098CDB1538B560` | `7E14EBCAE890AF4846E03F01A7FD8FB3CF7AF768CE777F2CC1B70B5E1712C1A1` |

## 机械与语义一致性

- R7 source package: canonical relative-path manifest `5/5 PASS`，文件集合无缺漏。
- Registry duplicate-key indentation scan: `PASS`；此前 patch 中发现的一组重复 `last_assignment_id/last_decision` 已保留语义地改为 `prior_r2_*`，没有值丢失。
- `DISCOVERY_QUALITY_MODE` current/default: `OFF/OFF`；缺字段亦 fail closed 为 `OFF`。
- Wave48 frozen OFF assignments: `2/2`；mid-assignment semantic drift: `0`。
- P1/P2 execution: `FAIL_CLOSED_NOT_STARTED`；R6/v8.8 calibrated dependency: present。
- Base seats/hot Discovery/burst: `4 / 2 / 1`，无 permanent lane 增加。
- Q2、same-object、latest collision、fair current strong baseline、natural evidence、full-cost、reproducibility、claim ceiling、STOP non-revival、StageB user gate：全部未放松。
- Candidate/Stage0/A/B dispatch、实验、下载、自动化、production cutover：`0`。

## 后续门与回滚

R6/v8.8 resolution 未达到 calibrated gate 前不得启动 R7 backtest。其后仍须独立 blind PACKER→EXECUTOR→AUDITOR PASS，再运行两波 noncanonical shadow；任一 `NOT_CALIBRATED / CONTAMINATION_UNKNOWN / threshold fail` 进入 `USER_POLICY_DECISION_REQUIRED`，不得自动第二次 revision/repack。回滚为 `DISCOVERY_QUALITY_MODE=OFF`、`DISCOVERY_DEPTH_RESERVATION=0`；无需回滚候选状态。
