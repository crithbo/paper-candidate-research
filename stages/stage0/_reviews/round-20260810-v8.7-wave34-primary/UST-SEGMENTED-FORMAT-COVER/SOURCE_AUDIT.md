# UST-SEGMENTED-FORMAT-COVER — Source and Collision Audit

- Cutoff: `2026-08-10`
- Evidence policy: official upstream source/docs and paper originals only for decisive claims
- Search status: `SEARCH_BOUNDED_OPEN`
- Direct-fatal collision: none verified as one exact complete match
- Mechanism status: strong finite-family absorption risk; one atomic revision required

## Frozen input integrity

| File | SHA-256 | Result |
|---|---|---|
| `DISCOVERY_LOG.md` | `560dd103f0de4cd677a00c8875899f287dada07ac34992c506862120da523d89` | match |
| `SOURCE_COLLISION_MATRIX.md` | `3a1cc4bfc9dc4e5c48c45ecdf39b4fe6b231e682193549c572a821d56ab70b5b` | match |
| `UST-SEGMENTED-FORMAT-COVER_TOPIC_BRIEF.md` | `32d09e23fe190e3d4b3edfc022d4d05db65090666956e3435444e37b30ac07e0` | match |
| `handoff.yaml` | `00704c3760dbfb3f9c603f74966244d0890aae8329d4a8c3fb52caa264bfa182` | match |
| source `HASH_MANIFEST.sha256` self | `3d51bad84512c9b6ec05c8b1882d990a30f0fddde21b2f0901ca4683641be946` | match; 4/4 entries verified by mainline and independently rehashed |

## Current NVIDIA UST reality check

Repository: [NVIDIA/nvmath-python](https://github.com/NVIDIA/nvmath-python), tag `v1.0.0`, commit `bb27be436099b36559bae15a307c94d76b12e902`. `git ls-remote` showed `main` and `v1.0.0` at the same commit. A shallow source checkout was used only for static inspection; no package installation, import, compilation, GPU use or experiment occurred.

| Source/API | Observation | Candidate impact |
|---|---|---|
| [`Tensor`](https://docs.nvidia.com/cuda/nvmath-python/1.0.0/host-apis/sparse/generated/nvmath.sparse.ust.Tensor.html) and `nvmath/sparse/ust/tensor.py` | One `tensor_format` is bound to each tensor; `convert()` creates one target tensor. Public methods do not include sparse slicing, a segment collection or heterogeneous cover constructor. | Discovery's narrow absence claim survives. It does not prove novelty because user code can compose multiple tensors. |
| [`Sparse Linear Algebra / UST`](https://docs.nvidia.com/cuda/nvmath-python/1.0.0/host-apis/sparse/index.html) and `tensor_format.py` | Runtime DSL; named and constructed CSR/CSC/DCSR/DCSC/CROW/CCOL/DIA/skew-DIA/batched/BSR/BSC/delta/structured formats; zero-copy package views where supported. | Complete global format/action family is the deployment baseline. A CSR-only comparison is invalid. |
| [`Matmul`](https://docs.nvidia.com/cuda/nvmath-python/1.0.0/host-apis/sparse/generated/nvmath.sparse.Matmul-class.html) and `matmulmod.py` | Stateful `plan/execute`, in-place `C`, `reset_operands[_unchecked]`, library dispatch or code generation, workspace retention and repeated execution. | Plan amortization and repeated-`B` execution are native, not candidate novelty. Each fragment would require a separate native plan. |
| `generic/_configuration.py` | `codegen=False` by default; `codegen=True` forces JIT path. Memory limit defaults to 80% and is configurable. | Baseline grid must include documented non-default codegen and equal memory limits. |
| `ust/interfaces/torch_interface.py` | Current integration caches a `Matmul` by dtype/index/format/shape and reuses it after operand reset. | A plan cache or reuse wrapper is directly absorbed. |
| `matmulmod.py` source-facing environment selectors | `NVMATH_CUSPARSE_ALGORITHM` and `UST_CODEGEN_KERNEL` affect planning in current source. | Pin or finitely enumerate them; hidden defaults cannot advantage the candidate. |

Inspected source hashes:

| Path at commit | SHA-256 |
|---|---|
| `nvmath/sparse/ust/tensor.py` | `c4a153e9b77670ccc15a53abd7852641523492b6e216199a9eefd66b0360b657` |
| `nvmath/sparse/ust/tensor_format.py` | `ebef0a9af00acdc7c3cec422322544f3e79ecd94715fd7e3cc65c38f5466a1b2` |
| `nvmath/sparse/generic/matmulmod.py` | `87535e6c29e229ec2f2ca68ccdebb0f883a7d66dfc4bb011db6ede8ec3bdc615` |
| `nvmath/sparse/generic/_configuration.py` | `dfeac70c60d776898ff9b83c94afa56f819b0f2730e9e34d2f8d73c6418f85c8` |
| `nvmath/sparse/ust/interfaces/torch_interface.py` | `e4f588669279597e40de1c0f3c3357be13c49590815afd90b8800104075ebcc1` |

The repository scan included public source, tests and examples for `segment`, `slice`, `subtensor`, `partition`, `TensorFormat`, `Matmul`, `plan`, `execute` and `reset_operands`. Internal converter uses of “segment” describe coordinate-run construction inside one format; they are not a public heterogeneous row-cover action.

## Primary literature audit

| Source | Verified claim | Collision class |
|---|---|---|
| [GeneralSparse, USENIX ATC 2025](https://www.usenix.org/conference/atc25/presentation/wang-yaoyu) | Same SpMM operation; memory-access and reduction spaces; sparse-matrix row/split divisions, format adjustment, cost-model selection, code generation; pruned LLM and SuiteSparse evaluation. | `STRONG_METHOD_SUBTRACTOR`; not exact UST cover, but absorbs generic “input-aware divide + adjust format + choose plan” claims. |
| [HR-SpMM, ICS 2025](https://doi.org/10.1145/3721145.3725770) / [official proceedings PDF](https://hpcrl.github.io/ICS2025-webpage/program/Proceedings_ICS25/ics25-31.pdf) | Partitions SpMM rows into long/short regimes, further splits long rows, uses Tensor/CUDA cores and an auxiliary row map; evaluates DLMC/SuiteSparse. Principal reported speedup excludes preprocessing and PCIe transfer. | `SAME_OPERATION_HYBRID_PARTITION_SUBTRACTOR`; full-cost weakness prevents treating its performance numbers as equal-ledger proof. |
| [Ahrens & Boman, arXiv 2005.12414](https://arxiv.org/abs/2005.12414) / [author PDF](https://willowahrens.net/assets/documents/ahrens_optimal_2021.pdf) | Contiguous row/column grouping, detailed runtime/memory models, repeated sparse multiplication amortization, linear-time DP for optimal contiguous 1D-VBR row grouping, natural SuiteSparse evaluation. | `ALGORITHM_KERNEL_COLLISION`; operation is SpMV and representation is VBR, but generic additive contiguous-row DP and amortization are not novel. |
| [EVC-HYB, IJHPCA 2016 author PDF](https://lukeo.cs.illinois.edu/files/2015_GuGrOl_gpu.pdf) | Sorts rows, partitions into short/long ranges and stores them in ELL/vector CSR with adaptive kernels and row markers. | `HYBRID_FORMAT_SUBTRACTOR`; changed row order and SpMV prevent exact direct fatal. |
| [ParamSpMM author paper, arXiv 2605.15695](https://arxiv.org/pdf/2605.15695) | Same SpMM; global parameterized CSR representation integrating blocking, workload balancing and coarsening; input-feature-based configuration selection. | `CURRENT_ADAPTIVE_REPRESENTATION_SUBTRACTOR`; global configuration differs from per-segment format cover. |
| [TACO, OOPSLA 2017](https://doi.org/10.1145/3133901) | Tensor-format abstraction and generated sparse kernels. | `GENEALOGY_AND_PAPER_SHAPE`; not the candidate's joint optimization. |
| [SuiteSparse Matrix Collection](https://sparse.tamu.edu/) | Public natural matrices with stable collection metadata; suitable for frozen IDs/checksums. | `NATURAL_RESOURCE`; selection must be preregistered and include no-gain controls. |

## Direct-collision test

No reviewed source simultaneously covers all of:

1. the current UST v1.0.0 tensor/Matmul contract;
2. unchanged row order and exact same `A`, `B_r`, `C_r`;
3. bounded contiguous intervals with a distinct UST format per interval;
4. a joint full-cost/reuse budget;
5. the same algorithmic guarantee.

Therefore `DIRECT_FATAL` is not registered. Absence remains bounded by the sources and current repository paths inspected; it is not a global novelty claim.

## Structural absorption test

The present candidate can be written as a labelled segmentation recurrence

`DP[t,j,k] = min_{i<j,f} DP[t-1,i,k-cost(i,j,f)] + cost(i,j,f)`

with additive conversion, metadata, plan, launch and repeated-execution costs. Ahrens & Boman already establish the contiguous DP kernel and amortization; UST supplies the label/action catalog; hybrid SpMM papers supply the representation/execution rationale. Simply inserting more labels or measured segment costs does not create a new N2.

The only admissible residual is a non-product action or guarantee that this additive formulation and the named hybrid SpMM action spaces cannot express. This is why the outcome is one revision rather than PASS. If the revision cannot exhibit such a residual, the scientific stop is structural and does not depend on missing performance results.

## Same-output and full-cost fidelity risks

- UST `Matmul` is in-place; every segment must write one disjoint original-row interval of `C`, or pay for a temporary and copy. Output assembly cannot be omitted.
- A dense package row view may be accepted only under pinned layout/alignment rules; the small witness must establish this rather than assume it.
- Floating formats/codegen/library paths may change accumulation order. Report the exact native comparator contract and tolerance; do not claim bitwise equality unless the datatype/order supports it.
- Repeated `B` plan reuse is native. Charge per-segment plan/JIT once and every segment launch for each `r`.
- Conversion currently includes a proof-of-concept general converter that official docs say is not optimized. This makes cold/warm separation essential and forbids hiding conversion behind reuse.
- Equal memory limits must include every segment tensor, directory, cached plan, workspace, output and temporary simultaneously live.

## Source-level conclusion

`SEARCH_BOUNDED_OPEN / REVISE_ONCE`.

The UST complete-cover action is not currently native, but the candidate's stated additive DP is too close to a finite strong prior family. The single revision must close `NONPRODUCT_UST_COVER_RESIDUAL_BEYOND_CONTIGUOUS_PARTITION_AND_HYBRID_SPMM`; otherwise recommend `BELOW_Q2_STOP__HYBRID_ROW_PARTITION_PLUS_UST_WRAPPER_ABSORPTION`.
