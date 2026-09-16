# Deep review — Mooncake trace admission/ranking family

Exact carrier is strong: three versioned JSONL workloads include natural timestamps, input/output lengths and ordered reusable-prefix block hashes. This supports deterministic replay without reconstructing private text.

The primary RQ asked whether lossless prefix reuse transfers the bottleneck to decode KV residency/queueing and reverses fixed admission-policy ranking on one GPU.

Direct/current collision:

- Mooncake already selects prefill instances using prefix hit length plus predicted prefill and local queue time, with TTFT/SLO as the endpoint.
- TOPAS jointly schedules prefix residency and ready-request admission under a shared GPU KV budget while accounting for movement/preemption.
- MISA-T and AlignedServe cover KV-residency-aware admission and prefix-aware batching under related workload envelopes.
- KVCache Cache in the Wild characterizes workload-dependent reuse and proposes a workload-aware eviction policy.

After subtraction, a Mooncake-trace ranking plot over FIFO/shortest/prefix-first is a replication/measurement exercise without a new stable law, benchmark-validity correction or target-specific action. It does not meet the Q2 floor.

