# QPACK-REFINE-REV0 — bounded seed pool

Assignment: `DISCOVERY-S2-20260822-QPACK-REFINE-CLOSURE1`  
Status: non-evidence locator material; it is not a novelty, quality, or admission denominator.

| ID | Candidate divergence to inspect | Fixed same-object condition | Locator outcome |
|---|---|---|---|
| S1 | Packed axis changes from checkpoint-K to kernel-N | Same W4A16 logical matrix and same Triton GEMM | Selected. Native source explicitly performs this repack. |
| S2 | Nibble ordering is preserved incorrectly after repack | Same `uint4` values and dequant equation | Selected as falsifier dimension; current kernel specifies shifts `[0,4,...,28]`. |
| S3 | Group-scale row maps to a wrong packed tile | Same group size and scale tensor | Selected as falsifier dimension; kernel computes `g_idx` and clamps `BLOCK_K`. |
| S4 | Packed zero-point axis is transposed incorrectly | Same asymmetric W4A16 object | Selected as falsifier dimension; loader accepts/checks the two native layouts. |

No additional opportunity family was created. These seeds are only dimensions of the one frozen QPACK object.

