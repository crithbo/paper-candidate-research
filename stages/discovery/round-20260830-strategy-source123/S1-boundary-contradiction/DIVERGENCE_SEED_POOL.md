# Source123 S1 Exact-Carrier Seed Pool

## Metadata

- Assignment/lane: `DISCOVERY-S1-20260830-SOURCE123 / DISCOVERY_S1`
- Profile: `EXACT_PUBLIC_CARRIER_FIRST / BOUNDARY_CONTRADICTION`
- Frozen before first source call: `YES`
- Seeds: `10 <= 12`; RQs: `8 <= 8`
- Excluded families: ORT optimizer-level assignment stability; StableHLO/VHLO semantic compatibility.
- Network-security check: `PASS`
- Seeds are non-evidence sketches with no novelty, current-absence, fault or Q2 claim.

| Seed | Exact official carrier candidate | Boundary hypothesis | Disposition |
|---|---|---|---|
| S123-S1-01 | ggml `ggml_backend_sched` graph split/copy scheduler source | Backend support is decided per node but copy/split boundaries are global; locally supported placement may be globally full-cost unstable. | KEEP |
| S123-S1-02 | `ggml_backend_supports_op` / backend device-buffer support APIs | Equivalent op/view/layout forms may produce different support decisions without changing tensor semantics. | KEEP |
| S123-S1-03 | llama.cpp model tensor loading/offload source and `--n-gpu-layers` | Layer-count offload may not reflect tensors, recurrent/state components or output-layer placement under the same model. | KEEP |
| S123-S1-04 | `--split-mode`, `--tensor-split`, `--main-gpu` and multi-GPU scheduler paths | User-visible tensor ratios may translate into boundary/copy patterns that violate simple memory-share expectations. | KEEP |
| S123-S1-05 | MoE CPU-offload options/source such as CPU expert placement | Expert offload can save VRAM while creating repeated host-device boundary costs not captured by layer-offload metrics. | KEEP |
| S123-S1-06 | ggml backend buffer-type selection and allocation planner | A buffer type may be allocatable yet make downstream ops unsupported or force copies, creating a placement-feasibility contradiction. | KEEP |
| S123-S1-07 | llama.cpp/ggml `test-backend-ops` fixtures | Official op fixtures may support a backend conformance/mutation oracle, but could collapse to ordinary coverage testing. | KEEP |
| S123-S1-08 | RPC backend and scheduler copy paths | Remote backend support and buffer copies may form a canonical negative/full-cost carrier, but network setup risks dominating the science. | KEEP |
| S123-S1-09 | `llama-bench` output/schema and backend/offload parameters | Benchmark summaries may omit split/copy attribution needed to explain ranking stability. | KEEP |
| S123-S1-10 | GGUF tensor type/alignment/metadata loader | Tensor packing and alignment can affect buffer placement, but a pure format checker is not a paper contribution. | BACKLOG |

## Frozen convergence

| Seed | Primary RQ |
|---|---|
| S123-S1-01 | RQ01 |
| S123-S1-02 | RQ02 |
| S123-S1-03 | RQ03 |
| S123-S1-04 | RQ04 |
| S123-S1-05 | RQ05 |
| S123-S1-06 | RQ06 |
| S123-S1-07 | RQ07 |
| S123-S1-09 | RQ08 |

S123-S1-08 and S123-S1-10 remain non-evidence backlog. No source result may replace or promote them.

## Advisory

- Engines: `BOUNDARY_OR_FAILURE`, `JANUSIAN_TENSION`, `CONSTRAINT_MANIPULATION`, `COMPOSE_DECOMPOSE_SIMPLIFY`
- Perspectives: backend engineer, runtime maintainer, model deployer, measurement reviewer
- Largest surface: ggml backend scheduler/offload
- Coverage advisory: `PASS`
