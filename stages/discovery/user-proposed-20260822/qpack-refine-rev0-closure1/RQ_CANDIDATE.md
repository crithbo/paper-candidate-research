# Research-question candidate

## Primary RQ

For the one pinned vLLM v0.26.0 compressed-tensors W4A16 checkpoint path to
`TritonW4A16LinearKernel`, is there a non-generic, same-object N2 residual for
checking that the loader's packed representation, group scale, and zero-point
indexing refine the logical quantized tensor consumed by the kernel?

## Frozen scope

- Repository/release: `vllm-project/vllm@v0.26.0`, official release commit
  prefix `568afb3` (release page and tag path); the source page is explicitly
  at that tag.
- Object/function: one compressed-tensors W4A16 linear layer, its logical
  quantized matrix and group parameters, and the stock W4A16 Triton GEMM output.
- Excluded: alternate formats/readers, a new model checkpoint, generic
  provenance/schema tracking, policy selection, or a post-hoc wrapper.

## Decision

`DROP`. The frozen native path already implements the complete object-specific
repacking action that the proposed checker would validate: unpack packed-K
weights, transpose the logical matrix, repack packed-N, transform scales, map or
transpose zero-points, and dispatch the kernel with shape/group checks. The
remaining proposed artifact is a checker over that extant action, not a new
same-object construction or target-specific algorithm/guarantee.

