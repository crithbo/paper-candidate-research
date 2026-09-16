# Source112 S5 Static Closure

| RQ | exact public source / carrier | action, endpoint, full-cost | contrary / stop | disposition |
|---|---|---|---|---|
| RQ01 | Adaptive Action Chunking, CVPR 2026, LIBERO/RoboCasa canonical simulation | adaptive chunk size, success-rate/static simulation endpoint; cost includes observation/replanning, action horizon and inference work | AAC already adaptively selects chunk size at inference, compares fixed chunks and uses LIBERO; no different action frozen | EXCLUDED_BEFORE_RAW |
| RQ02 | VLA-Cache/OpenVLA and Spec-VLA public artifacts | uncertainty/recompute versus visual-token reuse/speculation; endpoint action quality/static LIBERO | VLA-Cache reuses temporal visual token KV; Spec-VLA relaxes acceptance with threshold/verification. No separate uncertainty action/oracle frozen | EXCLUDED_BEFORE_RAW |
| RQ03 | Spec-VLA arXiv 2507.22424 + public LIBERO code | relaxed acceptance threshold, acceptance length/success/static simulation; cost includes draft, verification, threshold and inference latency | current Spec-VLA directly provides relaxed acceptance, quality control and LIBERO evaluation; no distinct estimand | EXCLUDED_BEFORE_RAW |

Search boundary: official paper/code or canonical CVPR artifact per RQ; stopped at direct carrier/action coverage. Evidence ceiling remains `PUBLIC_STATIC_TRACE_CANONICAL_BENCHMARK_ONLY__NO_ROBOT_DEPLOYMENT_CLAIM`. Raw/deep/brief=0; no absence or STOP inference.
