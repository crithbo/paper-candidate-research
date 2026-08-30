# Source log — GPU-CONDGRAPH

| Source | Type | What it supports | Collision reading |
|---|---|---|---|
| https://docs.nvidia.com/cuda/cuda-programming-guide/04-special-topics/cuda-graphs.html | NVIDIA programming guide | IF/WHILE/SWITCH conditional nodes and their device-evaluated semantics | API and legal-subset boundary |
| https://developer.nvidia.com/blog/dynamic-control-flow-in-cuda-graphs-with-conditional-nodes/ | NVIDIA technical article | CUDA 12.4/12.8 conditional-node behavior and body composition | official contextual documentation |
| https://www.usenix.org/conference/osdi26/presentation/ghosh | GraCE primary system paper | generic CUDA-Graph compiler coverage, parameter-copy removal and deployment selection | direct subtraction; residual is narrow and unverified |

Search-bounded on 2026-08-02. This topic must not advance if a full-text GraCE audit covers conditional-body lifetime specialization.
