# SegmentK W4A16 pre-topic current-union closure
+
## 中文摘要
+
本次没有创建正式 Topic、没有进入 raw，也没有提出 Stage 0。固定对象的 gfx1151 M1 路径并不只由被 clamp 的 Triton 实现构成：官方 RDNA wrapper 会调用 HIP `wvSplitK_int4_g`。该入口的冻结源码体未能通过两条官方、非落盘的小体量路线取得，因此不能诚实判断所提多组 scale 元数据流水已经被当前 union 吸收，还是仍留有 target-specific residual。缺本地 IR、内核实现和性能结果均未被当作负证据。
+
唯一处置为 `UNRESOLVED_BACKLOG__NO_SCIENTIFIC_INFERENCE`。若主线决定继续，只能用新的、单独冻结的 source-closure assignment 读取 `v0.26.0:csrc/rocm/skinny_gemms_int4.cu` 中 `wvSplitK_int4_g`，然后在不改对象的前提下重做 union 减法；不能直接创建 Topic 或启动 Stage 0。
+
## Frozen inquiry
+
The inquiry is `RQ-S6-SEGMENTK-01`: on the frozen dense W4A16/GPTQ-sequential/G=32/gfx1151 M1 object, does a legal `q=2/4` multigroup metadata schedule remain after current vLLM dense, RDNA, MoE/adaptation and relevant kernel-family subtraction?
+
This packet is pre-topic only. It contains neither an admitted opportunity family nor a novelty, Q2, performance or speedup claim.
+
## Current-upstream result
+
1. The official vLLM tagged dense implementation establishes a per-group scale/dequantization contract and a clamp that prevents its Triton tile from spanning a smaller group.
2. The official tagged RDNA wrapper establishes that M1/skinny execution on the target can dispatch to `ops.wvSplitK_int4_g`.
3. The implementation body of that selected HIP entry is decisive for current full tuple, direct adaptation and schedule freedom. It remains uninspected because both bounded official content routes failed before transfer.
4. The static sketch establishes a legal two-schedule semantic witness, but also shows that batching q group scales does not reduce compulsory scale bytes. Any residual must be a target-specific staging/latency/occupancy frontier, not generic scale blocking.
+
## Gate table
+
| Gate | Result | Reason |
|---|---|---|
| Exact object frozen | PASS | Assignment fixes runtime, commit, source loci, target, representation and shapes. |
| Same-function action witness | PASS, semantic only | The two schedules apply the matching group scale to every 32-wide subsegment. |
| Current producer union | NOT CLOSED | M1 HIP entry is a mandatory part of the selected production union and was unread. |
| Direct MoE/current adaptation subtraction | NOT CLOSED | No absence claim is permitted while the HIP entry/action shape is unknown. |
| Local static cost direction | CONDITIONAL | No byte reduction; only target-specific metadata staging could supply a frontier. |
| Natural/canonical carrier | RESERVED | Assignment shapes and vLLM frozen operator define a future canonical carrier; no workload claim made. |
| Full-cost | RESERVED | Future denominator must include dequant/metadata traffic, VGPR/LDS/occupancy, launch and output costs. |
| Topic/raw/Stage0 authority | NOT AUTHORIZED | Explicit assignment prohibition. |
+
## Bounded source telemetry
+
- Official tagged wrapper sources were inspected through public vLLM GitHub pages.
- Official GitHub contents API attempt: authentication failure before content transfer.
- Official raw GitHub attempt: Schannel `SEC_E_NO_CREDENTIALS` before content transfer.
- No source file, model, kernel, build artifact, cache, temporary output or performance observation was persisted.
+
These events support only a bounded source-closure backlog. They do not establish nonexistence, novelty, speed, correctness failure or a scientific negative conclusion.
+
## Exact next bounded route
+
`official vLLM v0.26.0 / csrc/rocm/skinny_gemms_int4.cu / wvSplitK_int4_g`.
+
Required questions: does it cross `G=32` in one logical tile; when/how does it load `s[g,n]`; are several group scales staged/prefetched; is there an existing parameterized action equivalent to q-group segmentation; and what local resource vector is traded. Any later effort remains source-only until separately authorized.
+
## Final disposition
+
`UNRESOLVED_BACKLOG__NO_SCIENTIFIC_INFERENCE`
+
No QGroup state was read or changed. No QRefine/shared control file was changed. No Topic ID, raw, brief, Stage 0, kernel/model/build/compile pipeline or performance experiment was created or run.
