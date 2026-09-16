# PatchYield frozen-input ledger

- Archive: <LOCAL_USER_HOME>\Downloads\stage0_freeze_pack_2026-08-21.zip
- Archive SHA256: `1F1696FBBF39C4C6810386E8472692EA1E434011B15D02E10F84A3C3F61E9B67` — verified.
- Archive size: 27,634 bytes.
- Read boundary: `stage0_freeze_pack_2026-08-21/patchyield/` plus the three assignment-listed root documents only.
- This assignment treats the archive as frozen evidence/draft input, not executable authority.

## Identity retained without change

- Harness: `OpenHands/benchmarks@f60e4ed11262b667896ce9f554dd487057fd1ef2`, SDK submodule `43376f1868ffd702746080714a59c16d3f69ec12`.
- Model: `Qwen/Qwen3-Coder-30B-A3B-Instruct-FP8@dcaee4d4dfc5ee71ad501f01f530e5652438fde0` with the supplied five-file manifest.
- Runtime: `vllm-project/vllm@568afb3a13806beb53bb2e6bd518269357b237c0`, one H100 SXM 80GB, TP=1, DP=1, fixed serve options from `freeze.yaml`.
- Dataset/evaluator: `SWE-bench_Verified@c104f840cc67f8b6eec6f759ebc8b2693d585d4a`, fixed 500-row test split and `SWE-bench@7a21e05772954cc81471ae19d56f436cecf43c54`.
- Action: choose the next complete non-preemptive LLM call only among simultaneously ready sessions. No admission/rejection, early termination, routing, precision change, explicit KV action, token preemption, or tool reordering.

No model, dataset, parser, agent program, endpoint, held-out split, container, or H100 job was downloaded or run.
