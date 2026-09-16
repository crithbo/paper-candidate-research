# RAW_SCREEN_ROW_EVENTS

| ID | Author paper/artifact/source reality | Exact object and minimum witness | Decision |
|---|---|---|---|
| R01 COGENT | Only official ASPLOS program and bibliographic record found; no author source/artifact or current compiler/runtime config was frozen. | Tagged RISC-V binary and compatible consumer; any tag-layout witness remains unspecified. | `NOT_ADMITTED_UNFROZEN` |
| R02 CHERI-SIMT | [author ASPLOS paper](https://www.cl.cam.ac.uk/~tmj32/papers/docs/naylor26-asplos.pdf) and [current SIMTight upstream](https://github.com/CTSRD-CHERI/SIMTight); paper states CHERI support is merged. | Fixed CUDA-like kernel and CHERI-SIMT memory-safety result; capability compression/lowering versus naïve capability representation. | `STRUCTURAL_DROP__DIRECT_CURRENT_UNION` |
| R03 JOSer | Official ASPLOS record found but no author paper/artifact/current JIT serializer/reader source was frozen. | Fixed Java graph and serialization/deserialization contract; action witness unavailable. | `NOT_ADMITTED_UNFROZEN` |
| R04 FuseFlow | [author paper](https://arxiv.org/abs/2511.04768) and [archived artifact](https://doi.org/10.6084/m9.figshare.30890834.v1) found. | Fixed sparse PyTorch model/output with fused RDA dataflow graph; fusion-granularity choice. | `STRUCTURAL_DROP__DIRECT_CURRENT_UNION` |
