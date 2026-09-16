# Source log — UPMEM-RANKBATCH

- [PrIM / UPMEM characterization paper](https://arxiv.org/abs/2105.03814) — 论文摘要确认 PrIM 有 16 个跨域 workloads，且对象是公开可得 UPMEM PIM。
- [Memory-centric computing systems analysis](https://arxiv.org/abs/2110.01709) — 一手公开论文：UPMEM DPU 位于 DRAM，支撑 host/PIM 成本边界而非虚构硬件动作。
- [Full-system UPMEM perspective](https://ess.cs.uos.de/static/papers/Friesel-2023-DIMES.pdf) — 相邻全系统分析，提醒需把系统开销而非裸 kernel time 计入。

检索范围：UPMEM、PrIM、multi-programming/co-scheduling/rank scheduling。未完成论文级 collision closure；SDK/硬件可用性为显式风险，`SEARCH_BOUNDED_OPEN`。
