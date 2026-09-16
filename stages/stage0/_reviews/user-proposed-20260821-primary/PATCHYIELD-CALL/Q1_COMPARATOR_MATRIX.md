# Q1/Q2 Comparator Matrix — PATCHYIELD-CALL

| 校准对象 | 相同/不同边界 | 覆盖内容 | 剩余命题 |
|---|---|---|---|
| VTC, OSDI 2024 | 同 LLM serving、不同 agent success target | token-cost fairness 与理论界 | progress-to-sealed-success information 及 ready-call bounded-bypass policy |
| DLPM/D²LPM, 2025 | 同 KV/prefix locality | locality-aware fair LLM scheduling | agent workflow/public progress + arrival deadline objective |
| Justitia, 2026 | task-parallel LLM-agent application、vLLM 近同对象 | application completion、fair/worst-case service | 是否在固定 OpenHands/SWE object 上已覆盖 progress predictor 与同一 action/guarantee；当前未证明 |
| vLLM FCFS/priority/custom scheduler | 同 native serving engine | complete stock action/config surface | non-generic policy/guarantee，不能只是 plugin |
| EDF/SRPT/Cascade/SAGA + outcome-agnostic learned scheduling | 同 arrival/queue information原则 | 在线优先级/公平/剩余时间强 union | 受 leakage 审计约束的 progress incremental value |

## Q1/Q2 calibration

Q2 仅在唯一 revision 给出非 generic constrained policy/保证，且 live H100 evaluation 对
full union 在 repository-held-out folds 上获得非被支配结果时成立。Q1 还需跨 repository/
负载的稳定性、强于 fairness wrapper 的理论或系统洞察，以及 Justitia 级近碰撞的明确
差异。现阶段没有任何收益结果。

## 参考

- Sheng et al. (2024), [Fairness in Serving Large Language Models](https://www.usenix.org/system/files/osdi24-sheng.pdf).
- [Locality-aware Fair Scheduling in LLM Serving](https://arxiv.org/abs/2501.14312).
- [Justitia: Fair and Efficient Scheduling of Task-parallel LLM Agents](https://chenc10.github.io/assets/pdf/2026_arxiv_justitia.pdf).
- vLLM current [scheduler configuration](https://github.com/vllm-project/vllm/blob/main/vllm/config/scheduler.py).
