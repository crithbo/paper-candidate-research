# RAW_SCREEN_ROW_EVENTS

| ID | Exact same-object action | Minimal legal boundary/action-divergence witness | Outcome |
|---|---|---|---|
| R01 | Compile and run one fixed OpenCL or CUDA kernel on a frozen Vortex profile, preserving its source-language observable output and the profile's Vortex ISA/runtime contract. | A branch-divergent kernel has at least two conceptual legal lowerings: unmodified control flow and a SIMT-aware divergence transformation. The latter is already the paper's and current VOLT middle-end's declared action space, not an external primitive. | `STRUCTURAL_DROP__CURRENT_UNION_ABSORPTION` |

Natural/public carriers are VOLT's documented `tests/test_opencl_w_divergence_opt`, `tests/test_cupbop`, Vortex `tests/opencl`, and `cupbop/examples`; these are carriers only, not results produced in this Discovery pass.
