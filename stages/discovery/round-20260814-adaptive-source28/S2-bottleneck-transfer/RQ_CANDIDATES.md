# Source28 S2 RQ candidates

All variants below were written before targeted evidence lookup and preserve their stated exact object.

| RQ ID | same-object versions considered | selected RQ | precommitted source route | status |
|---|---|---|---|---|
| RQ-01 | (A) DME segmentation+LDS permutation; (B) copy ordering only; (C) cache-placement only | For a fixed HIP CDNA kernel, can a target-specific constructor jointly select legal DME transfer segments and an LDS address permutation with a stated stall/bank-conflict bound? | ROCm HIP hardware implementation doc; ROCm LLVM current source only if absence is asserted | selected for evidence |
| RQ-02 | (A) image partition+runtime metadata; (B) split mode only; (C) cache choice only | For a fixed SYCL program and target set, can a non-generic image-partition algorithm jointly decide partition and metadata under a compile-plus-load guarantee? | DPC++ compiler/runtime design; dynamic device-link design; current sycl-post-link source locus | selected for evidence |
| RQ-03 | (A) DPU transfer batch+tasklet ownership; (B) launch overlap; (C) host scheduling | For fixed UPMEM inputs and DPU semantics, is there a native joint transfer/tasklet constructor with a makespan guarantee? | official UPMEM SDK/public example provenance; fallback official 2024 SDK material | selected for evidence |

FINER-lite is scheduling only: all three are conditionally feasible, important to backend/architecture users, and carry high novelty-threat risk. No RQ counts as raw or brief.
