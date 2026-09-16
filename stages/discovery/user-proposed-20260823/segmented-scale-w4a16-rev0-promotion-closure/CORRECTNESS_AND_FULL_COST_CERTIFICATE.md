# Correctness and full-cost certificate
+
## Same-function invariant
+
For output n and K coordinate k, the only legal scale is S[n,floor(k/32)]. Let a segment start at k0=32g and q be 2 or 4. The candidate computes:
+
Y[n] += sum for c from 0 to q-1 of dot(A[:, k0+32c : k0+32(c+1)], decode(W[n, k0+32c : k0+32(c+1)])) times S[n,g+c].
+
It then advances by q groups. This partitions exactly the same K coordinates as the current group loop and applies the same scale to each coordinate. The candidate changes schedule/dataflow only; it does not change packed weights, zero behavior, fp32 accumulation, fp16 output, shape, or M=16 semantics.
+
## Small symbolic two-schedule witness
+
For one output n and K interval [0,64):
+
| Schedule | Actions | Legality |
|---|---|---|
| Current source shape | load S[n,0], consume K[0,32); load S[n,1], consume K[32,64) | Applies one scale row per current BLOCK_K=32 tile. |
| Candidate q=2 segment | load compact tile {S[n,0],S[n,1]}; consume first 32 values with entry 0 and next 32 values with entry 1 | Applies exactly the same scale function at every K coordinate. |
+
The witness demonstrates semantic legality only. It is not an executed kernel, compiler result or performance observation.
+
## Static cost ledger
+
| Dimension | Current M=16 route | Candidate | Consequence |
|---|---|---|---|
| K tiles | K/32 | K/(32q) logical outer tiles, each with q legal subsegments | Reduces source-level outer K control; arithmetic and group count remain. |
| Weight/activation bytes | Identical mandatory bytes | Identical mandatory bytes | No data-volume claim. |
| Scale values | q times BLOCK_N values across q one-group tiles | q times BLOCK_N values in one staged tile | No automatic scale-byte reduction. |
| Scale address/dataflow | One g_idx and one broadcast scale vector/tile | q explicitly indexed scale vectors plus segment mapping | Atomic dataflow difference. |
| Accumulator tile for M=16 | Current exact shapes use 32x32, 128x32, or 128x64 source tiles before masking. | Fixed 16x32 accumulator tile. | Static live accumulator shape is 2x, 8x or 16x smaller, respectively; actual VGPR allocation requires Stage 0 codegen evidence. |
| Scale-register pressure | One 32-wide scale vector. | Two or four 32-wide scale vectors or an equivalent staged representation. | Potential cost and no-gain region; not ignored. |
| Program grid | Shape-specific source configuration. | 16x32 may increase N programs for the current 128x64 override. | Must count launch/scheduling cost; no unilateral win assertion. |
| LDS/occupancy/spills | Current source uses its own stages/warps. | Candidate changes live state and K tile. | Mandatory full-cost denominator. |
+
## Plausible frontier, not a result
+
The only defensible performance hypothesis is a conditional tradeoff: for M=16, reducing masked accumulator/live-state width may offset q scale-vector staging and larger K subsegments. q=4 is more exposed to scale-register pressure; q=2 is the safer first comparator. This is target-specific because the existing source’s exact gfx1151 overrides deliberately widen BLOCK_M and clamp K to G. No byte, bandwidth, speedup, occupancy, code-size or energy result is claimed.
+
## Finite falsifiers
+
1. The frozen compiler/codegen lowers the candidate to the same effective one-group schedule or already performs equivalent staging.
2. Required q scale vectors plus 16x32 K tile cause no non-dominated VGPR/LDS/occupancy vector against current source configurations.
3. End-to-end vLLM full cost, including compilation and output checks, leaves no target-specific frontier.
4. A current same-target M=16 producer or direct implementation collision covers the exact action and endpoint.
+
## Stage 0 fidelity closure
+
The future Stage 0 must implement the complete action, validate the symbolic witness against frozen output semantics, freeze compiler and Triton IR evidence, use a versioned M=16 vLLM carrier, and report compile time, code size, W4/activation/scale traffic proxies, VGPR/LDS/occupancy/spills, launch count, correctness tolerance, kernel and end-to-end latency. This assignment authorizes none of those executions.
