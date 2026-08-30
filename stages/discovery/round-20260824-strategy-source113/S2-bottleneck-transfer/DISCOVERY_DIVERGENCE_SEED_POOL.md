# Source113 S2 seed pool

`S2-113-01`: Mooncake FAST'25 tool/agent trace could reveal a queue/CPU/network bottleneck after a GPU/KV optimization. Carrier schema precheck: `timestamp`, `input_length`, `output_length`, `hash_ids`; event/session/prefix block size=512; real traces use relative arrival timestamps. Selected RQ requires a decision endpoint for concurrent KV-load coalescing, not raw prefix-hit rate.
