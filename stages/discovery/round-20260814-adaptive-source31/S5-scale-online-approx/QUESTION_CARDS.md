# Source31 question cards

| Card | Official current locus | Result |
|---|---|---|
| QC31-A XLS | current README states a full HLS toolchain, optimization passes, scheduling, codegen, solvers and functional-equivalence tools. | `EXCLUDED_BEFORE_RAW__PROJECT_OWNED_COMPLETE_HLS_CONSTRUCTOR_AND_GENERIC_FORMAL_ROUTE`. |
| QC31-B hls4ml | current README describes model conversion into configurable HLS projects and several HLS backends. | `EXCLUDED_BEFORE_RAW__PROJECT_OWNED_COMPLETE_CONSTRUCTOR`. |
| QC31-C Vitis AI | official release states optimizer/quantizer/compiler are used across multiple targets and enumerates configuration/quantizer options. | `EXCLUDED_BEFORE_RAW__CROSS_TARGET_GENERIC_QUANTIZATION_TOOLCHAIN`. |

Each card had exact identity, same-object endpoint, source locus and falsifier, but none passed the non-generic discriminator. No raw or closure debt exists.
