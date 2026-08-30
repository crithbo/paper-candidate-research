# Source / collision audit — COH-REGION-LIFECYCLE

| Source | Status | What was independently retained |
|---|---|---|
| [Schieffer et al.](https://arxiv.org/abs/2407.07850) / ICPP record | proceedings/preprint metadata verified | GH200 system page table, C2C, first-touch/PTE/migration sensitivity |
| [CUDA heterogeneous memory guide](https://docs.nvidia.com/cuda/cuda-c-programming-guide/index.html#heterogeneous-memory-management) | official current documentation | management mode is a semantic boundary, not a nuisance parameter |
| [TPP](https://arxiv.org/abs/2206.02878) | ASPLOS source | placement policy subtractor |
| [SCILIB-Accel](https://arxiv.org/abs/2501.00279) | preprint/adjacent | device-first-use specialization |

**Finding:** `SEARCH_BOUNDED_OPEN`; no same-object current solver located. The current vendor documentation requires the revision to freeze the mode; hardware availability was not used as a negative novelty or stop criterion.
