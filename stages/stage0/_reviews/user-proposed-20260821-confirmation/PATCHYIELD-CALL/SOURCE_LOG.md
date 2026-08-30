# PATCHYIELD-CALL — decisive source log

| Source | Read scope | Independent finding | Classification |
|---|---|---|---|
| [Frozen vLLM scheduler config at `568afb3a...`](https://raw.githubusercontent.com/vllm-project/vllm/568afb3a13806beb53bb2e6bd518269357b237c0/vllm/config/scheduler.py) | policy/config/native extension fields | FCFS, priority, custom `scheduler_cls`, chunked-prefill and KV watermark are already native | exact current-union authority |
| [Current vLLM scheduler config](https://github.com/vllm-project/vllm/blob/main/vllm/config/scheduler.py) | current fields | retains FCFS/priority/custom scheduler and expanded KV/scheduling controls | current-reality authority |
| [vLLM extensible scheduler RFC #51608](https://github.com/vllm-project/vllm/issues/51608) | motivation/action surface | session affinity, prefix locality, residual SJF and QoS are explicit policy-hook targets | current engineering subtractor; RFC, not landed proof |
| [VTC, OSDI 2024](https://www.usenix.org/conference/osdi24/presentation/sheng) | fairness definition/guarantee | continuous-batching fair scheduler with tight service-difference bound | mandatory fairness baseline |
| [DLPM/D²LPM](https://arxiv.org/abs/2501.14312) | abstract/mechanism/guarantee | prefix-locality-aware fairness and distributed balance | mandatory locality/fairness baseline |
| [Justitia v2](https://arxiv.org/abs/2510.17015) | application cost prediction, fair queue, delay guarantee | predicted demand + fair completion order + worst-case delay atop vLLM | near-direct agent-application subtractor |
| [SAGA](https://arxiv.org/abs/2605.00528) | object/action/guarantee/benchmark | workflow-atomic scheduling, AEG/KV reuse, Agent Fair Share; SWE-bench on 64 GPUs | strong adjacent; different action and scale |
| [SMetric](https://arxiv.org/abs/2607.08565) | session signal and scheduling action | session-turn-aware KV locality/load balancing from online request information | strong agent-serving subtractor; different endpoint/routing action |
| [NVIDIA Dynamo ThunderAgent scheduler](https://docs.nvidia.com/dynamo/dev/agents/thunder-agent-program-scheduler) | official current action/state surface | program-level tool-boundary pause/resume, priority demotion, forced-resume cap | deployed-adjacent action; changes router/admission action |
| [OpenAI SWE-bench Verified assessment](https://openai.com/index/why-we-no-longer-evaluate-swe-bench-verified/) | current benchmark limitation | public contamination limits capability/generalization claims | claim-ceiling constraint, not scientific STOP |

Search cutoff: 2026-08-21. No source is classified `DIRECT_FATAL` under the frozen
single-H100 complete-ready-call and sealed-success contract. Current collision remains
`SEARCH_BOUNDED_OPEN`; browser/network responses were transient and not persisted.
