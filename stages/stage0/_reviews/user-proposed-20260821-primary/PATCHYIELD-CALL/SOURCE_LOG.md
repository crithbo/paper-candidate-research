# Source log — PATCHYIELD-CALL

| Class | URL / local artifact | Result | Use |
|---|---|---|---|
| Official current source | `resources/src/vllm_scheduler_config_current.py` | FCFS, priority, custom scheduler class, KV controls | current native union |
| Official vLLM guide/config docs | `docs.vllm.ai` / source URL in comparator matrix | priority and token/KV scheduler context | comparator completeness |
| Primary paper | VTC (OSDI 2024) | serving fairness + service-difference guarantee | fairness baseline |
| Primary paper | DLPM/D²LPM (2025) | locality-aware fair scheduling | KV/prefix baseline |
| Primary paper | Justitia (2026) | fair task-parallel LLM-agent scheduling | near-direct collision |

Search results were used only as locators to primary/official material. Missing
results, current branch movement and no-execution conditions never imply absence.
