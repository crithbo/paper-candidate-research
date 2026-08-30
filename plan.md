# 当前状态与短期计划

更新时间：2026-08-29 18:56（Asia/Shanghai）

## 当前目标与停止条件

- `RULE-CONSOLIDATION-20260830-R1` 已完成第一轮语义保持压缩：建立 canonical-owner/replace-merge-retire 纪律，移除 live dormant R7、平行 Discovery repair 文件、CORE_POLICY archive index、重复 StageA engineering/lightweight 模板；压缩 Mainline/Discovery/Candidate/Stage0/A/B 角色 blocker/runbook 副本，并把 HANDOFF 缩为 transport envelope。旧 assignment 继续使用冻结 hash；下一新 assignment 执行 cold-start/reference/state/blocker/lifecycle 回归。

- 用户已授权把持续目标冻结为：按 `PUBLIC_SINGLE_GPU_CPU_FIRST` 与长期 LLM/VLA 推理系统方向，复用现有长期 lane 持续推进 `Discovery → Stage 0 → Stage A → 独立 Stage A gate`。
- 用户于 23:52 进一步签发 `USER-CONTINUOUS-AUTONOMOUS-CONTINUE-WHEN-NO-USER-BLOCKER-20260825`：在无需补充输入且没有真实 blocker 时，MAINLINE 可在冻结题目级权限、预算、revision 与生命周期边界内自主派发、START、机械验收、独立 gate 和 GC，不再逐项重复请求 generic 授权。Stage B、正式项目、系统级变更、外部通信及确需用户提供的资源仍保留明确用户门。
- 用户现进一步签发 `USER-AUTONOMOUS-SOFT-BLOCKER-REDESIGN-20260826`：工程和方法软卡点不再逐项上报等待，主线自主执行合同内 correction、一次合法同对象 pivot/revision，或以新 ID 返回 Discovery/Stage 0；只有系统/设备/许可/私有输入/预算扩张、Stage B/正式项目门及 exceptional revision 即时请求用户。新规则 `rules/AUTONOMOUS_SOFT_BLOCKER_RECOVERY.md` 已安装，不降低科学门、不增加 revision 次数、不复活 STOP。
- 当前累计独立 Stage A gate PASS 为 `1/5`；Stage 0 PASS、owner 自评和未经过独立 gate 的结果不计入。
- 临时用量监控任务 `01a02f94-8e7d-79f1-8753-b0dc3bcb7e32` 已完成确认并回到 idle；对应 automation 更新时已显示不存在或已移除，不再执行后续检查或重复通知。
- 历史记录：2026-08-24 09:05 的旧监控周期曾收到并接受 `USAGE_RESET_CONFIRMED__STOP_AFTER_CURRENT_DISCOVERY_WAVE__NO_SUCCESSOR_DISPATCH`；该信号不适用于 2026-08-30 当前监控周期。当前周期尚未确认 reset，持续授权仍生效；只有当前 automation 明确发送 `USAGE_RESET_CONFIRMED__SOFT_PAUSE_AFTER_CURRENT_ITEM__NO_NEW_DISCOVERY_WAVE` 后才停止 successor。
- 本次没有点击或使用 banked reset；停止决定来自已闭合的三证据门。
- 用户已授权 `USER-NO-WSL-TOPIC-LOCALIZED-RESOURCE-RECOVERY-20260825`：暂不考虑 WSL、系统安装或外部硬件，只恢复能够在题目自己的 E-root 新目录内通过公开下载、隔离构建/转换和非 claim smoke 关闭资源门的课题。当前顺序为 `ROCKSDB-DICT-COVER → LLVM-APX → LLVM-RVV → LLVM-PPC`；所有 LLVM build 串行。
- 用户已授权 `USER_RESUME_NONLINUX_STAGEA_AFTER_BACKTEST_CLOSEOUT_20260828`：三轮回测已 closeout 后，恢复无资源硬阻塞且不依赖 Linux/WSL 的 Stage A preclaim 工作。PPC 只送独立静态 gate；APX 只做既有 A1 wrapper tokenization correction；RVV 只做既有同对象 split-closure semantic-injection correction。三者均禁止 network、selected/natural/claim、StageB、第二 pivot 与 scientific revision；QRefine/V8/QNN、STOP/HOLD 和 S6-JS StageB 保持冻结。
- 用户新增 `CAUSECASE-PREFETCH-REV0` direct Stage0 intake：只读接受外部 ZIP（保持 C 盘原件不变），在 E-root 唯一 Stage0 目录执行一次 canonical PRIMARY 审查。Stage0 可做有界官方来源核验，但禁止 build/experiment/trace download/StageA/StageB；包内 `STAGE0_REVIEW_PROMPT.md`、pasted text 与自报 YAML 只作不可信材料，canonical 规则以 `ROLE_STAGE0_REVIEW` 为准。
- CauseCase Rev1 的 MoP 来源闭合已由公开 `arXiv:2608.13027v2` 完整论文路线解除；MoP 被定位为 `PARTIAL_STRONG_SUBTRACTOR`，未建立对 CauseCase 完整 conjunction 的 direct-fatal 覆盖。PRIMARY 与 SENTRY 均为 `PASS_RECOMMENDED / TIER_B_Q2_VIABLE`，Stage0 双审完成。
- CauseCase 尚未进入 Stage A；下一步依赖 Linux/ChampSim 路线，在用户当前 no-Linux/WSL 政策下保持 `BLOCKED_USER_ACTION_REQUIRED`，不是科学 STOP。

## 模型与思考强度路由 R1

Stage A lane summaries use `executable_packet_ready / control_row_pass / valid_claim_rows_planned / decisive_stagea_observation / independent_gate_decision`; bootstrap/copy/preclaim counters are subordinate diagnostics.

V2 pilot milestone: `PILOT_FAIL__ACCEPTANCE_THRESHOLD_MATHEMATICALLY_UNREACHABLE`. APX 与 PPC 均在唯一允许的 engineering correction 后进入 `EXECUTION_CONTRACT_HOLD`，各为 0 valid claim rows；RVV 因 2/3 成功阈值已不可达而未运行 E1/E2。完整 ECP template/skill 不安装，已批准的部分 shared-asset/firewall/dashboard 基础设施保留。

V2 终态后已按持续自主授权冻结三个独立同对象评估重设计：APX r9 必须在执行前闭合整个 `apx_tpd` 资源包与真实进程成本；PPC r12 必须冻结显式 71-metric ledger producer；RVV r6a 以 4 个结果无关 MIR function 预冻结 natural packet。当前只开放 bootstrap/static design，工具、control、claim 均未开放。

用户授权 `USER_CONTINUOUS_STAGEA_ECP_AUTONOMY_20260829`：主线持续推进 APX/PPC/RVV V2 pilot 及合法同对象 Stage A 后续；仅在 Linux/system、私有/许可证/未公开输入、公开路线耗尽、预算扩大、exceptional revision、StageB/正式项目、共享安全冲突或政策裁决边界报告用户。

用户随后授权 `USER_PAUSE_STAGEA_FOR_CACHE_RULE_REVIEW_20260829`：APX r11 与 PPC r13 在 bootstrap 投递前暂停，现有 context/合同保留但不得 dispatch；RVV r6a 与 CauseCase 原 HOLD 不变。暂停期间只做 cache/prefetch 题目的只读状态审计、规则修改提案和重选题建议，不运行任何 Stage A/Stage B 动作。

用户于 2026-08-30 授权 RULE_AUDIT 任务作为有界临时 MAINLINE 完成 `STAGEA_SCOPE_AND_TOPIC_CUMULATIVE_BUDGET_R1`。历史回放 4/4 保持科学结论；两项 prospective shadow 均在结果防火墙下诚实收口：APX 缺 literal control argv，0 attempts；PPC 唯一 control attempt 在 N01 因 fresh output-root 已存在而 fail closed。两者均为 0 科学推断、无自动 correction/successor。`MAINLINE-STAGEA-SCOPE-BUDGET-R1-PRODUCTION-20260830` 已对下一安全边界后的新 Stage A assignment 生效；A0 最多初始轮 + 两批题目累计工程 correction，新 assignment 不重置，READY 后只允许 A1 或 blocker。旧 APX/PPC/RVV 状态和 pause 不追溯改变，Stage B 仍未授权。

- 用户已批准 `USER_REPLAN_ALL_PAPER_PROJECT_SESSIONS_COST_20260826`，并进一步授权 `USER_LUNA_XHIGH_AND_BLIND_FALLBACK_20260826`。默认仍为 Terra/medium；哈希、bootstrap、监控、状态 relay、纯机械检查及 Stage A 的 build/log/format 统一为 Luna/xhigh。
- ROUTING R1 审计提案已通过 4/4 manifest 验收并由 MAINLINE 接受；正在运行的任务保持原冻结路由，后续真实 assignment/follow-up 才显式采用新路由。
- Luna/xhigh 与双盲 fallback 提案已通过 3/3 manifest 验收并由 MAINLINE 接受；Luna 的新路由只在下一安全 follow-up/assignment 边界生效，max 仍全局禁用。双盲 arm 已在两次身份污染后关闭；独立的非盲 NB1→NB2 审计已接受，随即启动仅限 8 个预登记本地案例的 Stage A 兼容性波次。
- R1 兼容修正已将六路 selective-depth Sol/high 上限统一为最多一个，并补齐 Backtest 与正式项目的分角色路由；科学门、双盲输入边界和当前 assignment 不变。
- Stage 0、Stage A claim/fidelity、Stage A gate 与 backtest auditor 使用 Terra/high；Stage B 独立终审和最终稿完整性审查才默认 Sol/high。Luna 路由统一使用 xhigh；Terra/Sol 的 xhigh 仍默认禁止，max 全局禁止。
- 每个新 assignment 与启动工作的 follow-up 必须显式写 model/thinking，不得继承桌面默认；运行中的 assignment 不打断，idle/not-loaded lane 不为路由更新唤醒。Sol/high 的其他使用必须在单一 assignment 内留下升级证据；Luna/xhigh 只在下一安全 follow-up 或 assignment 边界生效。

## E 盘工作根切换与 artifact lifecycle rollout

- 用户已把权威项目工作根切换为 `E:\project\writing\reserch`。D 盘副本只作为迁移前备份，不再作为新 assignment 的 canonical path；当前共享规则/registry 的 live containment 与 shared-asset root 正在一次安全边界内切换到 E。
- 用户已批准 `PHASE_CLOSEOUT_STORAGE_LIFECYCLE_V1`、默认 budgets、one-control-cycle GC SLA、future terminal capsule 语义与有条件 production cutover。非破坏 schema/rule/template 已安装并完成独立 dry-run。
- Dry-run 覆盖 7/7 历史 cases 与 7/7 negative controls；claim-critical drift、missing downstream input、resume break、wrong-root/reparse 与 unclassified entry 均为 0，receipt 通过，pinned-twin recovery replay 与 StageA→StageB downstream-read replay 均 PASS。
- MAINLINE 已显式切换 `PRODUCTION_NEW_ASSIGNMENTS_ONLY`。它只作用于 cutover 后新冻结的 resource-producing assignment；legacy 仍需 separate inventory 与 exact approval，当前 assignment/context 不追溯换规则、不触发重新 ACK。
- E audit 的 5 个 unpinned transport JSON 已走独立 legacy 门：pinned twin 5/5 同哈希、0 reparse、Win32_Process 排除检查进程后命中 0、handoff sealed/lane idle；已删除 5 files / 8,125,013 bytes，pinned twins、freeze/provenance/scripts/inventory 保留并生成 receipt。

## E-root 全会话重开 20260825

- 用户明确要求把全部 19 个长期角色从旧 D-root 任务重开到 E。19 个新任务已由 Codex E 项目创建，并逐项验证 `cwd=E:\project\writing\reserch`；当前均为 bootstrap-only idle，未执行科学、检索、queue、下载、构建、实验、自动化或状态转换。
- 本轮控制目录为 `stages/control/session-restart-20260825-E1/`。19/19 第二轮 ACK 已通过；首轮 ACK 与两项 REFUSE 均作为 superseded evidence 保留。MAINLINE 的 automation count 漂移已修正，V8 的旧 D 路径已由 E compatibility addendum 闭合。
- 迁移保持科学 assignment=0。QRefine 与 V8 的 blocker、QNN resource blocker、StageB 未授权、Backtest dormant、所有 terminal identity 与独立 StageA PASS `1/5` 均保持不变。
- 18 个已被 E-root lane 接替的旧 D-root 长期任务已归档并从 active 列表消失；当前旧 MAINLINE `01a02e08-06de-7281-89ab-eb4965cccc92` 仅保留到最终报告后，由用户归档。新 MAINLINE `01a034d0-af48-72a1-a311-7495db80d90f` 已接受为 E-root shared single-writer。迁移全程未派发 successor、未恢复 blocker、未运行科研或资源动作。

## 无 WSL 的题目内资源恢复 20260825

- 仅允许官方/可核验公开资源；下载、解压、源码、build、env、cache、tmp 与 logs 必须全部位于该题新 assignment 的 `resources/` 八个标准子目录。禁止 D-root、用户目录缓存、系统安装、全局 PATH/注册表修改、跨题未登记复用和非官方镜像。
- `ROCKSDB-DICT-COVER` 已解除资源阻塞并完成 preclaim：resume5 的 20/20 官方资源与 manifests 已接受；resume6 的 F0–F5 全部 PASS、28/28 control runs、14/14 replay pairs 与原生 small witness 均通过，且未运行自然 20-manifest claim probe。MAINLINE 已接受 handoff并完成两阶段 GC：resume5 删除 31 files / 83,835,585 bytes，保留 25 files / 130,005,132 bytes；resume6 删除 18,835 files / 970,511,118 bytes，保留 3,383 files / 440,506,059 bytes。当前停在 `READY_FOR_SEPARATE_CLAIM_ASSIGNMENT`。
- `LLVM-APX-PREFIX-PRESSURE-PARETODP` 的资源 blocker 已解除：r3 短路径 gate 为 224<240，exact commit clean build 3156/3156 PASS，7 个工具、2 个 DLL、87 个 notices 及三组非 claim smoke 全部通过。MAINLINE 已接受精确工具包并完成 r3 与 resume2 GC，共删除 381,844 files / 9,034,881,090 bytes；r3 保留 135 files / 322,165,728 bytes 的下游工具包与复现材料，resume2 保留 13,721 files / 1,368,471,202 bytes 的下载、环境与失败证据。未启动 APX preclaim/自然/claim run。
- RVV resource blocker 已完全解除：r3 long-path preflight 474 chars PASS，181,551-file source extraction、一次 configure、1905/1905 clean build、6 tools + 2 DLL + 93 notices 及两组 nonclaim smoke 全部 PASS。MAINLINE 已接受 exact tool bundle 并 GC 197,606 files / 4,636,232,803 bytes，保留 137 files / 196,155,536 bytes；无 RVV F1–F5/自然/claim/scientific effect。RVV 等 separate preclaim assignment；PPC 成为下一 LLVM resource bootstrap。
- 用户已签发 `USER-PARALLEL-STAGEA-READY-CANDIDATES-20260825`。APX F0–F4 preclaim 继续登记；RocksDB r7 已完成 A1 build/4 smokes/quiescence，但 560 matrix 在 344 completed 后因 `pypi-django/B1/G2/R1,R2` 均少于 16 data blocks fail closed：342 pass raw + 2 fail raw 全保留，216 未启动，无 retry/exclusion，科学 revision 未消耗。MAINLINE 已机械接受 handoff 的 `NO_SCIENTIFIC_INFERENCE` ceiling，并投递独立 Stage A gate 审查唯一 REVISE_ONCE 合法性；15 个 cleanup leaves 在 gate 接受前不删除。V8 blocker 与恢复点原样保留。
- RocksDB r7 的 PASS2 re-ACK 已验收并获得独立 gate START；审查只判断 invalid construction、唯一全局原子 revision eligibility 与 lifecycle，不得继续 216、重跑失败对、排除 django/G2、降低 16-block 门或执行 cleanup。
- APX r4 已按 `PRECLAIM_CONTROL_ONLY` ceiling 机械接受：F0/F1 PASS，F2 因 llc 在后续 X86 AsmPrinter 处断言 fail closed，F3/F4 未运行，0 claim observation、0 scientific revision。MAINLINE 已删除 439 个可重建选择性源码文件 / 13,159,683 bytes，保留 exact archive、工具包、witness 与原始失败日志 104 files / 600,391,347 bytes。新的 r5 只允许固定 `-stop-after=x86-compress-evex` 命令纠正，不改 witness/contract/tool。
- 该 autonomous wave 当时以同一 snapshot 冻结三项 bootstrap-only assignment：Lane1 PPC r1 exact toolchain resource gate、Lane2 RVV r4 F1–F5 preclaim、Lane3 APX r5 F2 correction；该 bootstrap wave 现已结束，后续状态以下方当前看板与各题最新条目为准。
- 三项 bootstrap ACK 已全部 READY 且无差异，MAINLINE 已同时 START：当前 `1` 个 resource assignment（PPC）+ `2` 个 preclaim assignment（RVV/APX），均为 0 claim-bearing action；PPC 是唯一 LLVM build。
- PPC r1 已按冻结的 one-attempt/zero-redirect 合同 fail closed：commit metadata 与 exact source archive PASS，LLVM-MinGW 官方 GitHub URL 返回 302，未跟随、未重试，CMake/Ninja 未启动，extraction/configure/build/smoke/PPC F1–F5/claim 均为 0。MAINLINE 已接受 resource-only blocker并清理 cache；其 r2 redirect-compatible successor 后续已完成 resource PASS 与 GC，本条只保留 r1 历史事实。
- APX r5 已机械接受：stop-after llc 双 replay PASS，checker 因 PowerShell signed-hex→UInt32 portability 失败；wrapper 未及时识别首个失败而启动第二个已计划 replay 的程序性偏差已单列，未认作 retry。GC 删除重复 archives 2 files / 278,682,926 bytes，保留 106 files / 321,710,432 bytes。r6 仅允许一次 assignment-local UInt32/overflow 表达与 wrapper exit detection 修复，不得重跑 llc、改 witness/grammar/cost/sample 或进入 claim。
- RVV r4 已机械接受：F1 PASS，F2 llc 双 replay 可复现，但 greedy 输出保留 vregs 且出现 `%4/%11` 的 split-from children。新软卡点规则下已冻结 r5 单次 Stage A mechanism pivot：不忽略 split，而把 parent/child transitive provenance、LMUL/mask/interference/physreg/spill/reload/future-use obligations 纳入 quotient state；任何缺失或跨类 child 仍 fail closed。r5 为 bootstrap pending，先做同一 witness 的 split-closure preclaim，0 natural/claim。
- PPC r2 resource gate 已完整 PASS：5/5 exact inputs、唯一官方 redirect、long-path、source/tool extraction、configure、2826/2826 clean build -j2、7 tools+2 DLL+90 notices 与 nonclaim smokes全部闭合；MAINLINE 复核并 GC 6,008,083,993 bytes，保留 `ppc-toolchain`+logs。其 r3/r4 preclaim successors 后续均在 preclaim IR syntax 处 fail closed；本条只保留 r2 resource 终态事实。
- APX r6 已完整通过 witness/grammar F0–F4 control fidelity 并完成 GC，但它还不是自然 claim-ready：Stage 0 冻结机制要求 actual per-action trace DP、complete-enough native action catalog、labeled/generic/current-LLVM strong baselines 和 result-independent public corpus。新的 r7 已冻结为 bootstrap pending：复用 exact source archive、r3 toolchain 与 r6 witness，只做 actual DP 实现、tiny oracle/strong-baseline preclaim、16 selected + 4 reserve corpus freeze 和未执行 r8 plan；selected tool/claim 仍为0。
- PPC r3 在首个 replay 的 llc IR parse 处 fail closed：assignment-local `ppc_union_input.ll` 两个 global 使用非法 modifier order `hidden dso_local`，应为 `dso_local hidden`；replay2/MachineVerifier/F3–F5 未启动，F1 partial 不计 PASS，0 science/revision。MAINLINE 已复核 36/36 manifest 并接受 blocker；r3 资源 575,051,772 bytes 低于预算且作为 r4 downstream input 暂不清理。r4 只允许对 `target_value_ir` 与 `target_array_ir` 做两次 exact token-order substitution（同一文件一次 edit，预期 SHA `77A926...`），然后 fresh 重跑 F1–F5。
- PPC r9d 已完整闭合两次 replay 各 56/56 command metrics、shared compile 单计、0 unknown/orphan、3/3 cost-edge negatives 与未来每 process 896 项 full-cost dependency；native tool 重跑为 0。MAINLINE 已验收 owner preclaim PASS，并将其排在当前 RVV gate 之后进入同一独立 gate，尚不计正式 Stage A PASS。
- RVV r5c A3 已完整 PASS owner-side preclaim fidelity：no-bytecode static compile、两次 llc/MachineVerifier exact replay、transitive split closure、F3–F5、4 个 dependency negatives 与 exact 12-case set 全部通过；0 natural/selected/claim/science。MAINLINE 已验收并排入同一独立 preclaim gate，尚不计正式 Stage A PASS。
- APX r7c 已通过 C0–C2（6/6 inputs、14/14 action handlers、4/4 mutations），但 C3 child 前的 PowerShell wrapper 将 `Set-Content -LiteralPath` 错拼成不存在的单一 cmdlet，C3–C6 未启动。该纯 wrapper blocker 已接受，A1 只允许修正 tokenization 并从 C3 续跑；0 selected/claim/science。
- 规则门槛诊断的 N7 与 N8 两名独立中性 reviewer 均在 bootstrap 读取第 1/16 个输入时识别身份，均按 `BLINDING_CONTAMINATION` 立即停止，科学判断为 0；blind arm 已停止，不再寻找第三名。当前 NB1 规则-only 逐案冻结，随后 NB2 才揭盲对照；blind/nonblind 指标严格分离，非盲结果不得声称无偏召回或达到 75%。
- RocksDB 新 ID `ROCKSDB-MULTISST-DICT-TRACE-COVERAGE` 已完成独立 Stage 0 PRIMARY 并由 MAINLINE 接受为 `BELOW_Q2_STOP`：虽非严格 direct fatal，但扣除 generic multi-dictionary compression segmentation / facility-location / k-medoids 后，没有留下非平凡的 METHOD_ALGORITHM N2 residual。旧 `ROCKSDB-DICT-COVER` 未复活，未进入 Stage A，无用户动作。
- RocksDB 独立 gate 已接受：r7 构造无效不是科学负结果，342 个前缀结果不可用于科学推断；没有能同时保持 exact object、20-manifest 分母、4096-byte block、native baseline 与 16-block 门的单一原子 revision，且机制 trace 另有独立 observability 缺口。科学 revision 仍未消耗，但 gate 不建议执行；不登记 PASS/STOP/blocker/reserve/StageB。MAINLINE 已完成 fresh safety recheck 与 GC：删除 18,382 files / 1,129,045,478 bytes，保留 8,490 files / 515,241,582 bytes 的全部 344 raw、frozen binary/source/runtime、失败对与复现控制包。
- lifecycle 统一为 `PRODUCTION_NEW_ASSIGNMENTS_ONLY`。owner 在 handoff 前 finalize inventory、提取 claim/repro/resume-critical 小文件并写 `PHASE_CLOSEOUT_RETENTION.yaml`；MAINLINE 只在 downstream 接受、reparse/active-process/containment 全通过后删除 exact inventoried leaf。优先删除展开 JSON、build、cache、tmp、重复 source copy；题目根、assignment 根、resource 根、控制文件和未分类内容永不自动删除。

## 本轮持续流水线记录与收口

- Source106 已 `6/6 COMPLETE_ACCEPTED`，本轮 `0 clean brief / 0 Stage 0 dispatch`。因 Source105 有一个 clean brief，当前连续零产出 streak 仅为 `1`，不触发 Rule Audit。
- Source107 六路 context/ACK 已 `6/6 ACCEPTED`，且均确认 `scientific_or_resource_action_started=false`、无差异；现已按同一冻结合同启动。它回到最贴近就业与本机资源的单 GPU LLM software surface：TorchInductor/Triton、CUDA graph/compile cache、MoE routing、cold-start/SLO、KV/session memory 和 IREE/MLIR/TVM；canonical 方法和科学门均不变。
- Source107 已 `6/6 COMPLETE_ACCEPTED`，本轮 `0 clean brief / 0 Stage 0 dispatch`。S5 的四个 RQ 被当前 vLLM/SGLang/PyTorch/MoE union 闭合，一个只停在 locator-only；不形成候选 STOP 或类别排除。
- Source106+Source107 构成连续两个完整六路零 brief 周期，已满足 `RULE-AUDIT-SENTRY` 触发条件；主线下一步并行冻结一次 proposal-only first-failed-conversion 审计与不等待审计的 Source108 canonical Discovery。
- Source108 六路与 A4 proposal-only audit 的 context/ACK 已 `7/7 ACCEPTED`，均确认未提前启动且无差异，现已分别获得冻结范围内的 START。Source108 只做 exact public artifact + replication-negative/measurement/benchmark contribution-type allocation rotation，不改变 canonical 方法、科学门或候选状态，且禁止读取并行 A4 输出。
- A4 已 `COMPLETE_ACCEPTED__NO_CHANGE`：Source106/107 的第一失败转换仍是 selected RQ/source closure → evidence-qualified raw，主因 current union/具名来源族饱和，次因 exact public carrier + non-generic action gap；未发现规则、模板决策、执行或资源聚合缺陷。无 shared patch，不回写 Source108。
- Source108 已 `6/6 COMPLETE_ACCEPTED`，本轮 `0 raw / 0 clean brief / 0 Stage 0 dispatch`。S1 有完整不重复 exact-artifact bounded closure；S3 有 1 个有效 locator；S2/S4/S5/S6 的 predecessor exact-repeat 或 pre-RQ nonadmission 均已从 valid 分母剔除，不作科学负推断。
- 下一轮 Source109 将只在 assignment 边界使用 A4 已允许的具名来源族临时降权，并把 Source106–108 已闭合 identity 直接展开为显式 denylist，避免隐藏 predecessor hold 再次造成执行性重复；canonical 方法与全部科学门不变，不再立即叠加新 Rule Audit。
- Source109 六路 context/ACK 已 `6/6 ACCEPTED`，均无差异且未提前启动，现已获得 START：来源轮换到 TensorRT-LLM、ONNX Runtime/GenAI、llama.cpp heterogeneous offload、TGI 与 LLVM/MLIR/NVVM/Triton backend；每个 seed/RQ 在检索前必须逐项记录显式 denylist 判定。
- Source109 已 `6/6 COMPLETE_ACCEPTED`，共约 10 个 valid selected locator，但仍为 `0 evidence-qualified raw / 0 clean brief / 0 Stage 0 dispatch`。显式 denylist 消除了 Source108 的主要执行性重复；剩余失败回到 current union、exact carrier/action 不足和 pre-RQ nonadmission。
- Source110 六路与 A5 proposal-only audit 已 `7/7 ACK ACCEPTED`，均无差异、未提前启动，现已分别获得冻结范围内 START。Source110 轮换到 OpenVINO GenAI、ExecuTorch/XNNPACK、llama.cpp CPU kernels、MNN-LLM 与 OpenXLA/MLIR；A5 与 Source110 双向隔离。
- A5 已 `COMPLETE_ACCEPTED__PATCH_RECOMMENDED__BACKTEST_REQUIRED`：显式 denylist 有效消除执行性重复并提高 honest valid-locator 分母，但没有改善 raw/brief yield。`EXPLICIT_PREDECESSOR_IDENTITY_DENYLIST_V1` 只登记为待独立 backtest/prospective shadow 的 proposal；当前不安装 mandatory shared 行为、不启动回测、不修改 Source110。
- Source110 已 `6/6 COMPLETE_ACCEPTED`，本轮 `0 evidence-qualified raw / 0 clean brief / 0 Stage 0 dispatch`。OpenVINO/ExecuTorch/llama.cpp CPU/MNN/OpenXLA 路线均在 current union、exact artifact/action 不足或 pre-RQ nonadmission 处收口；不作类别排除或 STOP 推断。
- 06:05 重置核验仍为 `NOT_RESET`；下一轮 Source111 将优先转向 KernelBench/TritonBench/TileLang/ThunderKittens 等公开 kernel corpus、compiler measurement 与 benchmark-validity 来源，继续使用显式 assignment-local denylist，mandatory shared proposal 仍不安装。
- Source111 六路 context/ACK 已 `6/6 ACCEPTED`，均无差异且未提前启动，现已获得 START；来源包括 KernelBench、TritonBench、TileLang、ThunderKittens、Helion 与 Liger Kernel，仍只允许公开静态 closure 和非 claim preflight，不授权构建或实验。
- Source111 已 `6/6 COMPLETE_ACCEPTED`，本轮 `0 raw / 0 clean brief / 0 Stage 0 dispatch`。KernelBench/TritonBench、TileLang、kernel corpus shape、Liger/Helion 与 target-native DSL 路线均在 current union、缺 exact artifact/action 或 pre-RQ nonadmission 处闭合；Source110+111 连续零 brief，下一步触发隔离 A6 并继续 Source112 VLA/multimodal rotation。
- Source112 六路与 A6 proposal-only audit 已 `7/7 ACK ACCEPTED` 并获得 START。A6 初始因简化 context 缺 claim/evidence ceiling、forbidden inputs 与 `resource_root:null` 而 REFUSE；主线机械修复后重 ACK 为 READY，旧拒绝 ACK 保留。Source112 没有机器人硬件时只允许静态 source/trace/canonical benchmark 证据，不作部署 claim。
- A6 已 `COMPLETE_ACCEPTED__NO_CHANGE`：Source110/111 都在 valid locator/RQ→raw 首次失败，主因 current union/具名来源饱和，次因 exact artifact/action/endpoint gap；explicit denylist 保持 assignment-local，mandatory shared 版本仍不安装且 A5 backtest 未启动。A6 未读或影响 Source112。
- Source112 已 `6/6 COMPLETE_ACCEPTED`，本轮 `0 raw / 0 clean brief / 0 Stage 0 dispatch`。公开 VLA 路线已覆盖 action acceleration、adaptive chunk、visual-token reuse 与 relaxed acceptance；其他 RQ 缺 same-object canonical trace、exact artifact/action 或 decision endpoint。没有机器人部署证据，不形成部署 claim、STOP 或 broad exclusion。
- Source113 六路 context/ACK 已 `6/6 ACCEPTED`，均无差异且未提前启动，现已获得 START；转向 BurstGPT、LMSYS/ShareGPT、Vidur、Mooncake trace 与 public agent trajectories。任何 trace 题必须冻结事件/session/prefix schema、反事实决策端点和 full-cost，泛化 realism 批评不准入。
- Source113 已 `6/6 COMPLETE_ACCEPTED`，本轮 `0 raw / 0 clean brief / 0 Stage 0 dispatch`。现有公开 trace 普遍不能同时冻结 arrival time、session/prefix/cache event 与固定 decision endpoint；这只证明当前 trace 对冻结 RQ 不足，不构成 serving/agent 方向或 trace family 的科学 STOP。Source112+113 连续零 brief，下一步并行触发 A7 与 Source114 performance-model/theory rotation。
- Source114 六路与 A7 proposal-only audit 已 `7/7 ACK ACCEPTED` 并获得 START。Source114 转向 Vidur、LLMCompass、GenZ、serving simulator、roofline 与 queueing/formal control；模型误差只有在改变固定系统决策且 full-cost 可闭合时才准入。
- A7 已 `COMPLETE_ACCEPTED__NO_CHANGE`：Source112 首失败为 valid locator→raw，Source113 多数更早停在 RQ/pre-RQ→valid locator；VLA/trace evidence ceiling 保持，当前具名家族及不完整 trace carrier 近期降权。A5 mandatory denylist 仍未安装、未回测，A7 未读或影响 Source114。
- Source114 已 `6/6 COMPLETE_ACCEPTED`，本轮 `0 raw / 0 clean brief / 0 Stage 0 dispatch`。当前模型/理论载体要么已由 Vidur 等 simulator 覆盖同一 estimand/decision endpoint，要么未冻结可改变决策的 exact object、units 与 guarantee；不形成 theory/model 方向 STOP。
- Source115 六路 context/ACK 已 `6/6 ACCEPTED`，均无差异且未提前启动，现已获得 START；转向 exact upstream issue/test/commit、miscompilation、regression 与 negative replication。旧 issue 或 release note 不足以证明当前缺口；必须同时核对当前文档、当前源码及默认/非默认 flags。
- Source115 已 `6/6 COMPLETE_ACCEPTED`，本轮 `0 raw / 0 clean brief / 0 Stage 0 dispatch`。所有 lane 都在 raw 前停下：当前文档、当前源码/flags、exact test/commit 与同对象 fault/negative-replication endpoint 无法同时闭合；不形成科学 STOP 或资源推断。
- Source114+115 连续两个完整六路周期均为零 brief，已按规则冻结 A8 proposal-only first-failed-conversion 审计；A8 只读 Source114/115/A7，禁止读取 Source116、联网或修改共享文件。
- Source116 已冻结为 merged patch + regression test lineage 来源轮换：从确切已合并 patch、parent/current source、changed test/benchmark 出发，再寻找当前同对象 residual。它不采用 A8 的未来输出，不改变 canonical 方法或硬门。
- A8 与 Source116 的 bootstrap-only context 修复后，7/7 新 ACK 均为 `READY`、无差异且未提前启动；主线已接受并分别放行。旧 REFUSE/失效 ACK 尽可能保留为 lane-local evidence；该修复只消除 plan/registry 整文件 hash 的自循环，不改变科学状态或权限。
- Source116 已 `6/6 COMPLETE_ACCEPTED`，本轮仍为 `0 raw / 0 clean brief / 0 Stage 0 dispatch`。merged patch/test lineage 提高了 exact locator 质量，但没有闭合 parent/current source/test/flags 与同对象 current residual；不能把已有 patch 当 novelty 或 fault 证据。
- A8 已 `COMPLETE_ACCEPTED__NO_CHANGE`：merged patch/test lineage 只保留为有界来源排序试点，不升级 admission/yield/novelty/fault 规则；A5 mandatory denylist 仍未安装、未回测。
- Source117 已冻结为公开低比特格式、量化语义与跨后端 conformance/interoperability 来源轮换，覆盖 ONNX QDQ、GGUF k-quants、torchao、ExecuTorch、OpenVINO、StableHLO/MLIR；六路 ACK 已 `6/6 READY`、无差异且无提前动作，主线已接受并放行。
- Source117 已 `6/6 COMPLETE_ACCEPTED`，本轮 `0 raw / 0 clean brief / 0 Stage 0 dispatch`。规范与实现已经暴露 per-channel/opset/contrib selector、GGUF layout、StableHLO quantize/dequantize 等边界，但没有同一自然模型/fixture、current backend pair、固定 decision endpoint 与非通用 residual 的联合闭合。
- Source116+117 连续两轮零 brief，A9 proposal-only 诊断与 Source118 已隔离冻结。Source118 转向 PyTorch Profiler/Kineto、Perfetto、公开 Nsight schema、vLLM metrics、OpenTelemetry GenAI 与 rocprofiler 的细粒度事件归因；只有能改变固定优化决策并计入 observer effect/full-cost 的题才准入。六路 Discovery ACK 已接受并启动；A9 初始 REFUSE 精确指出 Source116/117 旧 inline state 漂移，主线已机械标记 superseded，现等重 ACK。
- Source118 已 `6/6 COMPLETE_ACCEPTED`，本轮 `0 raw / 0 clean brief / 0 Stage 0 dispatch`；profiler/schema、插桩路径和部分 observer-effect 合同可定位，但没有 canonical workload/public trace、固定 optimization decision endpoint、fair current attribution comparator 与 full-cost 的联合 packet。
- A9 重 ACK 已接受并在 proposal-only 隔离边界内收尾；停止信号不粗暴中断其 handoff。A9 完成后只做机械验收与 lane 回 `IDLE_REUSABLE`，不再派 successor。
- A9 已 `COMPLETE_ACCEPTED__NO_CHANGE`：exact-carrier tuple 保留为 identity/closure-quality 工具，但降级为 raw/brief yield 干预；merged-patch ordering 与 low-bit conformance 仅保留战略/排序价值，当前具名 carrier 近期降权。无 shared patch，A5 backtest 仍未启动。
- DMR prospective Cycle01 已 `6/6 COMPLETE_ACCEPTED`：六路 shadow nomination 均为 `NONE`，没有把 locator-only、current-union 已吸收或流程次序无效的材料抬升；按预冻结规则不执行 repair、不 backfill，现进入独立预冻结的 Cycle02。
- DMR prospective Cycle02 也已 `6/6 COMPLETE_ACCEPTED`：两轮合计 `12/12` 完成、`0/12` 合格 repair nomination、`0/12` clean brief、`0` 错误抬升或正式状态变化。当前只说明方法安全但没有 prospective yield 证据，已冻结独立 Backtest AUDITOR 终裁。
- DMR 独立 AUDITOR 已 `COMPLETE_ACCEPTED__NOT_CALIBRATED`：历史小样本非盲回放为 2/2 正控成熟、4/4 负控不误放；prospective 真实两轮却为 0/12 提名、0 修复、0 brief。方法不进入 production，也不新建平行 live rule；只保留更窄 shadow——必须先有 canonical same-object RQ，且恰好只剩一个预登记、有限、公开 closure debt。
- 用户以 `USER_CONTINUOUS_DISCOVERY_STAGEA_SOLHIGH_UNTIL_USAGE_RESET_20260830` 恢复 Discovery 与 APX/PPC/RVV Stage A；本命令派发统一 `gpt-5.6-sol/high`，下一条用户命令恢复规则默认路由。Source119 六路 canonical Discovery 与三个新规则 Stage A 安全边界进入 bootstrap。
- 用量重置 heartbeat 已修正到当前 MAINLINE；收到 `USAGE_RESET_CONFIRMED__SOFT_PAUSE_AFTER_CURRENT_ITEM__NO_NEW_DISCOVERY_WAVE` 后，不启动新 Discovery wave，Stage0/StageA 完成当前原子项和安全 handoff 后暂停，不粗暴中断进程。
- Source119 已 `6/6 COMPLETE_ACCEPTED`，仍为 `0 clean brief / 0 Stage0 dispatch`。Source118+119 连续零产出诊断已投递 RULE_AUDIT；不中断 canonical 流水线，Source120 只做一个结果无关题源再平衡：exact public carrier first，并增加 measurement/benchmark/formal/replication 比重。
- Source120 已 `6/6 COMPLETE_ACCEPTED`，exact-carrier-first 形成 3 clean briefs 并进入 Stage0 流水；Source118/119 audit 为 `NO_CHANGE`。用量重置未确认，Source121 保留该题源方法并排除三条已入 Stage0 family 后继续。
- Source121 已 `6/6 COMPLETE_ACCEPTED`，形成 ExecuTorch fallback-ranking validity 与 LeRobot AoI runtime 两个 clean brief，均进入 Stage0 队列；其余四路诚实 abstain。
- `CRFEPOCH-HBMPIM-LLM-GEMV-REV0` 保持 Stage 0 `BELOW_Q2_STOP` 终态，Source107 只读 registry identity hold，不读其 Stage 0 输出或聊天。

## 当前 lane 看板

| lane | thread | 状态 | assignment / context | 下一动作或门 |
|---|---|---|---|---|
| `MAINLINE` | `01a034d0-af48-72a1-a311-7495db80d90f` | `ACTIVE__CONTINUOUS_AUTONOMY__SHARED_SINGLE_WRITER` | `SESSION-RESTART-20260825-E1`; autonomy record `D0C1420A...` | 自主推进安全 Stage0/A、gate 与 lifecycle；只在真实用户门中断 |
| `RULE_AUDIT` | `01a034d0-b495-7d02-9b36-d43b6f33de96` | `COMPLETE_ACCEPTED__NO_CHANGE__IDLE_REUSABLE` | `stages/rule-audit/RULE-AUDIT-20260830-SOURCE118-119-ZERO-YIELD` | first failure=locator→evidence-qualified raw；无 production patch |
| `DISCOVERY-S1` | `01a034d0-b721-76d2-ace4-9665a8fffa3c` | `SOURCE123_COMPLETE_ACCEPTED__IDLE_REUSABLE` | `stages/discovery/round-20260830-strategy-source123/S1-boundary-contradiction` | honest abstention |
| `DISCOVERY-S2` | `01a034d0-b9cf-71b1-8d6e-cf7d4163ae23` | `SOURCE123_COMPLETE_ACCEPTED__IDLE_REUSABLE` | `stages/discovery/round-20260830-strategy-source123/S2-bottleneck-transfer` | honest abstention |
| `DISCOVERY-S3` | `01a034d0-bc6a-71c1-8a47-9440f4ccebc0` | `SOURCE123_COMPLETE_ACCEPTED__IDLE_REUSABLE` | `stages/discovery/round-20260830-strategy-source123/S3-natural-structure` | honest abstention |
| `DISCOVERY-S4` | `01a034d0-bf13-7512-8e42-b9cd6a5df0fa` | `SOURCE123_COMPLETE_ACCEPTED__IDLE_REUSABLE` | `stages/discovery/round-20260830-strategy-source123/S4-objective-constraint` | clean brief=vLLM CUDA-Graph capture-set；已入 Stage0 队列 |
| `DISCOVERY-S5` | `01a034d0-c201-7c03-ab03-4c6a2b886820` | `SOURCE123_COMPLETE_ACCEPTED__IDLE_REUSABLE` | `stages/discovery/round-20260830-strategy-source123/S5-scale-online-approx` | clean brief=prefix-aware future-KV reservation；Stage0 第二顺位 |
| `DISCOVERY-S6` | `01a034d0-c500-7fa2-8ad7-242482746dc3` | `SOURCE123_COMPLETE_ACCEPTED__IDLE_REUSABLE` | `stages/discovery/round-20260830-strategy-source123/S6-direct-algorithm-software` | honest abstention |
| `MEASUREMENT-M1` | `01a034d0-c7cc-71c0-bc74-ce69dfa6b4a5` | `ACCEPTED__IDLE_REUSABLE` | `stages/control/session-restart-20260825-E1/contexts/MEASUREMENT_M1/ASSIGNMENT_CONTEXT.yaml` | 等明确测量触发 |
| `STAGE0-PRIMARY` | `01a034d0-cab5-7de1-8f42-4805bc71b74c` | `VLLM_PREFIX_KV_RESERVATION_STOP_ACCEPTED__IDLE_REUSABLE` | report `439CD259...`; handoff `46E85523...` | BELOW_Q2_STOP：SGLang direct subtract + generic cap-sum collapse + natural declared-cap/provenance gap；不得续作同 ID |
| `STAGE0-SENTRY` | `01a034d0-cda0-74b3-a099-b4b711d9d8a8` | `VLLM_CUDAGRAPH_SENTRY_COMPLETE__IDLE_REUSABLE__EXCLUDED_FROM_KV_RESERVATION` | report `EA27B18E...`; handoff `F241136D...` | CONFIRM PASS/TIER_B；capture-set 等 Linux/CUDA；该 reviewer 不再审 KV reservation |
| `CANDIDATE-L1` | `01a034d0-d0a8-72c2-bb87-3ed590d87620` | `LEROBOT_BLOCKED_USER_ACTION_REQUIRED__RELEASED` | gate `ADEFB816...`; blocker record | 形式行闭合；自然PushT carrier单模型约1.05GB，需批准2GiB下载/4GiB存储+1 correction batch |
| `CANDIDATE-L2` | `01a034d0-d37f-7ae1-9ccd-635f285d8279` | `TORCHDYNAMO_EXECUTION_CONTRACT_HOLD__RELEASED` | handoff `BC9D3A88...`; solver receipt `3057B93A...` | solver route PASS；native callable backend 仍缺 filelock；corrections 2/2 + redesign 1/1耗尽，需 exceptional A0 dependency+1 replay 批准 |
| `CANDIDATE-L3` | `01a034d0-d67f-7f32-ab5f-54454407cb22` | `EXECUTORCH_FORMAL_EXECUTION_HOLD__RELEASED` | handoff `224D8450...`; manifest `ACF899CF...` | deep TEMP extraction 在任何 artifact/claim 前失败；2/2 correction+1/1 redesign+network耗尽，需 exceptional short-path budget |
| `STAGEA-GATE` | `01a034d0-d990-7d50-9d9f-a6d05a81bf11` | `TORCHDYNAMO_PRECLAIM_HOLD__IDLE_REUSABLE` | gate `B4D9EFF8...`; redesign handoff `BC9D3A88...` | A1 未授权；等待用户是否批准 exceptional filelock + one control replay；否则保留 hold |
| `NONBLIND-STAGEA-COMPATIBILITY` | `CANDIDATE-L1/L2/L3` | `USER_TERMINATED_CLOSEOUT__NO_FURTHER_QUEUE` | cleanup capsule `EBABA239...` | active/pending assignments 全部取消；只保留最小 evidence capsule |
| `STAGEB-REVIEW` | `01a034d0-de7a-7323-b54b-68e0a8356d7a` | `ACCEPTED__DORMANT__NOT_AUTHORIZED` | `stages/control/session-restart-20260825-E1/contexts/STAGEB_REVIEW/ASSIGNMENT_CONTEXT.yaml` | 保持 dormant |
| `BACKTEST-PACKER` | `01a034d0-e1e2-7921-bb72-a675ff98d5b0` | `RELEASED__R3_INCOMPLETE_AFTER_FULL_AUTHORIZATION` | receipt `MAINLINE_LANE_RELEASE_RECEIPT.yaml`; R3A01 only | 保留1条预检成功与全部 blocker；不再执行 R3 |
| `STAGEA-PAPER-EVIDENCE-GATE` | `01a034d0-d990-7d50-9d9f-a6d05a81bf11` | `R2_GATE_COMPLETE_ACCEPTED` | handoff `6A8E2628...`; report `089C34B3...` | 9/12 captured-locator positives pass；3 source-evidence-missing；4/4 negatives nonpass；gold 未读 |
| `BACKTEST-PACKER-L2` | `01a034d0-e533-7d21-aeeb-ac8465688a7e` | `USER_TERMINATED_CLOSEOUT` | R3 evidence capsule retained | 不再执行 R3 successor |
| `BACKTEST-AUDITOR` | `01a034d0-e86d-7ba0-ac31-1ca60477b3ce` | `COMPLETE_ACCEPTED__DMR_NOT_CALIBRATED__IDLE_REUSABLE` | auditor handoff `ECAC843D...` | 不做 production cutover；等待未来恰好一个 closure debt 的窄 shadow |
| `STAGEA-BLIND-CALIBRATION-P1` | `UNASSIGNED__NO_CLEAN_ROLE_MATCHED_REVIEWER` | `USER_TERMINATED_CLOSEOUT__BLIND_UNAVAILABLE` | eligibility record retained | 用户终止本批次，不再分发 |
| `STAGEA-BLIND-CALIBRATION-TEMP` | `01a042b3-ebcd-7e80-a7ea-1ca440dc0552` | `USER_TERMINATED_CLOSEOUT` | supplement blind decision retained | 临时会话结束 |

## 下游连续路由

1. 每个 Discovery handoff 到达后，主线做一次风险相称的机械验收；clean brief 立即进入 Stage 0 PRIMARY，不等待六路全部结束。
2. Stage 0 PRIMARY 的 PASS/REVISE 必须交给 SENTRY 独立确认；direct fatal 与科学 STOP 仍按原规则登记，不用一次修补规则挽救。
3. 独立 Stage 0 PASS 且资源 ready 后，投递空闲 candidate lane；首次 claim-bearing observation 前必须过 `PRE_CLAIM_CONTRACT_FIDELITY_GATE`。
4. Candidate owner 结果必须交给未参与实现的 Stage A gate；只有独立 gate PASS 才累计为 `1/5` 目标进度并停在 `PENDING_USER_STAGEB_REVIEW`。
5. 本持续授权不包含 Stage B、正式项目、大规模资源、系统安装、课题组仓库修改或外部通信。

## 保留 blocker 与不变量

- 09:05 用量监控已确认 full reset：Tibo 落地公告、global-reset tracker 完成、账户周额度 99%；未使用 banked reset。successor Discovery 已停止，当前 A9 仅做已启动 handoff 收口。
- QNN 题保持 `BLOCKED_USER_ACTION_REQUIRED`：缺设备、运行时、成对 512/4096 产物及只读接口材料；释放 S1 做 Source103 不改变该题状态或恢复点。
- QRefine 与 V8 保持原 Stage A blocker；没有新的 claim-bearing observation，scientific revision 不因等待而消耗。
- RVV r5c A3 独立 gate 已完成并接受有界修正路线；PPC r9d 独立静态 preclaim gate 已完成 ACCEPT，未执行原生或 claim 运行。RVV r5d correction 与独立静态 gate 均已 PASS。APX r7c A1 的 C3 parser/C4 formal control 通过，但独立 oracle 因缺少 `re` 导入首败；新的 A2 只补该导入并从 C4 tiny 续跑。三者继续处于 preclaim/fidelity 层，尚未进入 selected/natural/claim。
- P0 `ATOMIC_REPAIR_TRACE_V1` 仍只是 optional、non-decisional `SHADOW`；P1 mandatory 行为未安装、未回测。
- 既有 STOP、DROP、terminal identity 不复活；新对象或新研究问题使用新 ID。
- 会话迁移保持 `OPERATIONALLY_COMPLETE`；只给 Source107 六路生成新 context/ACK，不触发其余长期 lane 重新 ACK。

## 存储清理清单与执行状态

- RULE_AUDIT 已完成 `RULE-AUDIT-20260824-STORAGE-CLEANUP-INVENTORY-D1`，MAINLINE 机械验收 3/3 manifest 通过；没有删除、移动、压缩或修改候选/科学状态。
- 清理前初始项目约 `41.17 GB`、`stages/` 1,019,083 files；四轮精确删除、最小 evidence pack 与根路径异常隔离后 `stages/` 为 `77,102 files / 5,233,771,245 bytes`，D 盘空闲约 `318.079 GiB`，已进入数万文件级。
- RULE_AUDIT 原始 pre-delete review pool 为 `13,747,115,994 bytes`，只作审计基线；实际三轮均由 MAINLINE 在独立执行 assignment 中重新量化、冻结保留包并机械校验。
- blocked、reserve、pending gate 默认仍为 `DO_NOT_TOUCH_NONTERMINAL`。Wave 3 是用户对 CVC5/Occupancy 两题精确叶目录的题目级例外授权，只允许存储压缩，不允许解除 blocker、运行科研或改变状态。
- canonical report/results/handoff/manifest、关键日志、witness、inventory/provenance 与最新 exact recovery entry 保持默认保留；后续任何进一步清理仍需新的精确 leaf target 与证据依赖检查。

### D1 Wave 1 已批准并执行

- 用户已批准精确 leaf target、预计回收量、恢复方式及证据保留包；MAINLINE 将批准有界解释为四个无歧义 `DELETE_CANDIDATE_REBUILDABLE` build leaf，不包含 downloads/source/toolchain/assets/dedup/archive 或任何非终态题目。
- 已删除 RISCV ZCMP `resume1/b`、LLVM DWARF `resume1/build`、WebGraph initial `build` 与 revision1 `build`，合计逻辑回收 `7,084,221,562 bytes`（约 6.60 GiB，13,102 files）。
- 删除前四个路径均通过 literal absolute path、workspace boundary、fresh bytes/files、zero reparse、zero active heavy process 与 evidence-package hash 检查；删除后目标 4/4 absent，topic roots 4/4 present。
- canonical reports/results/handoff/historical manifests/provenance/reproduce/minimum witness 全部保留，抽查关键 SHA-256 无漂移。历史 manifests 中原 build entries 作为 pre-delete identity/rebuild record 保留，授权缺失由 cleanup execution ledger 解释。
- D 盘 post-delete 空闲约 `290.282 GiB`。其余 pre-delete review pool 尚未获本 wave 删除授权，继续保持不动。

### D1 Wave 2 STOP-only 清理已执行

- 用户要求删除 STOP 题目的非报告内容并去重；MAINLINE 依照科学证据硬门，保留 report/results/handoff/historical manifest、关键日志、reproduce、最小 witness、runs/corpus/inputs、inventory/provenance，只删除 16 个可重建 expanded source/toolchain/download/bin/work leaf。
- Wave 2 删除 `548,008 files`、逻辑回收 `14,094,392,859 bytes`（约 13.13 GiB）；16/16 target absent、8/8 topic roots present、关键证据哈希抽查 7/7 无漂移。
- Wave 1+2 累计删除 `561,110 files`、逻辑回收 `21,178,614,421 bytes`（约 19.72 GiB）。`stages/` 从 1,019,083 降至 457,986 files；D 盘空闲约 `304.358 GiB`。
- 不能仅靠 STOP 清理降至数万：CVC5 与 S5 Occupancy 两个 blocked topic 合计 368,125 files，占当前 Stage A 的 82.9%，按规则不得删除。所有 blocked/reserve/pending/state-ambiguity topic 均未触碰。
- LLVM DWARF musl/blink resources、FlatBuffers sources、Arrow assets 因证据/依赖边界未完全闭合而继续保留；历史 manifests 中被授权删除的 rebuildable entries 作为 pre-delete identity/rebuild record 保留。

### D1 Wave 3 两个非终态题目压缩已执行

- 用户明确批准按已说明方案先清理、暂不解除阻塞。MAINLINE 冻结 39 个 CVC5/Occupancy superseded 或 rebuildable 资源叶目录；39/39 literal path 位于两个题目根下、0 root/descendant reparse、0 相关活跃进程。
- 删除前复核发现 CVC5 最新 `resources/build` 含需保留的 smoke executable，目标已安全收窄为 inventory 明确标记可删的 `build/carcara-target`；`resources/src`、pinned Cargo cache、relay/env/logs 与 smoke executable 原位保留。
- Wave 3 删除 `356,723 files / 13,754,691,459 bytes`。CVC5 从 160,844 降至 9,144 files；Occupancy 从 207,281 降至 2,258 files。39/39 targets absent，13/13 关键文件哈希不变，6/6 recovery directories 与 2/2 topic roots 保留。
- Occupancy `resume3-r3d/verified` exact tools 和整个 `resume4-safe-recovery/resources`（8 MIR/sysroot/preclaim evidence）保留；两个题目的科学/候选状态与 blocker 均未改变，也未运行下载、构建、实验或 queue。
- Wave 1–3 累计删除 `917,833 files / 34,933,305,880 bytes`。删除内容不能项目内直接 undelete，需要时按保留 identity、inventory、日志和恢复合同重新获取或构建。

### 项目根压扁路径异常已隔离

- 用户点名的 `projectwritingeserchstagesdiscovery...RQ_CANDIDATE_S4-112-RQ05.md` 属于 Windows 路径转义/拼接失败后落在项目根的压扁文件，不是合法目录，也不是 rule。项目根共发现 24 个同类文件、13,173 bytes；24/24 均有正确 canonical counterpart，且没有 shared/canonical 文本引用。
- 3 个与 canonical 完全相同，21 个是更早的短版/部分版本。为保留失败写入证据而不污染项目根，24 个全部移动到 `stages/control/root-path-anomaly-quarantine-20260824-P1/quarantine/`；原路径 24/24 absent、归档哈希 24/24 一致、canonical 哈希 24/24 不变。
- 项目根现在只保留 `AGENTS.md / plan.md / registry.yaml / history.md` 四个共享文件及规范目录。Discovery 的 canonical Markdown 继续留在 `stages/discovery/`，不迁入 `rules/`；5,829 个 Markdown 合计仅约 9.84 MiB，不是当前空间主因。
- 大于等于 1 MiB 文件只读去重扫描发现 306 个 exact-duplicate groups，逻辑重复上限约 `1,536,805,890 bytes`。主要来自 PARQUET pending-gate replay、reserve toolchain、STOP 结果证据和 sealed backtest；当前未删除、硬链接或改路径。后续若继续，优先另冻 terminal evidence-pack compaction，不触碰 pending/reserve/blocked。

### D1 Wave 4 终态 evidence-pack 压缩已执行

- 用户批准 Arrow、LLVM、WebGraph 等终态 STOP 题先制作最小不可变 evidence pack，再删除重复输入和 expanded result copies。范围冻结为 Arrow IPC、LLVM Bitcode、LLVM DWARF、WebGraph 四题；39 个精确目标、24,426 files、1,025,354,509 bytes，0 reparse、0 相关活跃进程。
- 删除前物理生成 `evidence_pack/`：212 files、21,173,118 bytes；四题 tree digest 4/4 复算一致。pack 覆盖最终 owner/gate 结论、Bitcode 自然汇总与 witness、DWARF natural/full-cost/provenance、WebGraph pair-00/case-0043/matched aggregates、Arrow 两阶段终态记录。
- 已删除 Arrow 展开依赖与 revision 重复自然输入、Bitcode 380 MB 派生 corpus、DWARF 下载归档与终态 build/cache/tmp、WebGraph 结构域展开输出/preclaim 副本及两 corpus 的 pair-01..10。39/39 targets absent，16/16 关键原位证据哈希不变，pack 4/4 digest 不变，4/4 题目根保留。
- Wave 4 回收 `1,025,354,509 bytes / 24,426 files`。四轮累计删除 `35,958,660,389 bytes / 942,259 files`；科学终态、rules/templates/contexts 与所有非终态题均未改变。
