# DMR-V1-PSHADOW-CYCLE-01-S1 canonical seed pool

- Assignment / lane: `DMR-V1-PSHADOW-CYCLE-01-S1` / `DISCOVERY_S1_BOUNDARY_CONTRADICTION`
- Generation completed before evidence lookup: `YES`
- Network-security exclusion check: `PASS`

### S1-SEED-01

- Engine: `BOUNDARY_OR_FAILURE`
- Perspective role: `COMPILER_OR_BACKEND_ENGINEER`
- Exact public anchor candidate: `microsoft/T-MAC` `main`, README and `python/t_mac/ops/qgemm.py`.
- Idea sketch: T-MAC uses a LUT for mixed-precision GEMM instead of dequantization. A possible residual would require a same-quantization execution action whose LUT decomposition or tiling cannot be expressed by the current kernel contract.
- Conclusion-first test: Only a distinct, non-tuning action with a fixed same-quantization guarantee could be worth a later paper claim.
- Generic/current-union risk: `HIGH`.
- Preliminary disposition: `KEEP_FOR_CONVERGENCE`.

## Evidence budget record

Six official-source search/open calls were consumed: repository search; repository root; GitHub API tree attempt (no usable response); `python/t_mac`; `python/t_mac/ops`; and `qgemm.py`. No further source call is authorized in this assignment.
