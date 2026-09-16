# MoE/direct-adaptation audit
+
## Question
+
Can an already deployed vLLM dense or MoE production action be mechanically adapted to the proposed dense-M1 `q`-group metadata segment without changing the frozen W4A16/GPTQ semantics?
+
## Evidence-led answer
+
| Audit item | Bounded result | Consequence |
|---|---|---|
| Dense Triton implementation | Its group-indexed dequantization prevents a K tile from crossing a smaller quantization group. | It does not itself witness a multigroup tile action. |
| RDNA hybrid wrapper | The wrapper has a native M1 route and calls `wvSplitK_int4_g`, rather than relying only on the clamped Triton route. | A dense/M1 native action already exists and is a mandatory subtractor. |
| Exact HIP entry body | Unread from the official frozen source route. | It is unknown whether the entry already stages several scale groups, pipelines their metadata, or exposes a direct parameterized form of the candidate. |
| MoE subtraction | No evidence in the inspected dense wrapper establishes that a MoE kernel is or is not a direct same-object adaptation. | `UNRESOLVED`; no inference from missing MoE-source inspection. |
+
## Fairness boundary
+
The candidate cannot subtract an MoE-only implementation unless it preserves the frozen **dense linear**, M1, GPTQ-sequential, `G=32`, `gfx1151` object. Conversely, a MoE implementation is not automatically irrelevant merely because its caller differs: if its atomic metadata/weight/activation schedule is callable without changing the frozen object, it is a direct current-union subtractor. That callability is not established here.
+
## Disposition
+
`MOE_DIRECT_ADAPTATION_STATUS = UNRESOLVED_BACKLOG__OFFICIAL_M1_HIP_BODY_REQUIRED`.
+
This is not a claim that no direct adaptation exists, and it is not a scientific DROP. It blocks creation of a new Topic ID under this assignment’s current-union hard gate.
