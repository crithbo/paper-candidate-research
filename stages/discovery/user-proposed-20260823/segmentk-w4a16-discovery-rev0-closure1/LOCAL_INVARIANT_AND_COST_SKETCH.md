# Local invariant and static-cost sketch
+
## Same-function legality invariant
+
For every output coordinate `n` and quantization group `g`, let immutable scale `s[g,n]` cover `K_g=[32g,32(g+1))`. A legal candidate segment with `q` groups computes:
+
`y[n] = sum_(c=0..q-1) dot(a[K_(g+c)], decode_u4(W[K_(g+c),n])) * s[g+c,n]`,
+
then continues over all segments. It may not reuse `s[g,n]` for `K_(g+1)`; no zero-point, packing, output precision, or accumulation contract changes are permitted. Sequentially loading each group’s scale once per output tile and broadcasting it across its own 32 values preserves this invariant.
+
## Minimal two-schedule witness
+
For `G=32`, `q=2`, one output tile and K interval `[0,64)`:
+
| Schedule | Legal actions | Same output? |
|---|---|---|
| Current-shaped group schedule | load `s[0,n]`, consume K `[0,32)`; load `s[1,n]`, consume K `[32,64)` | Yes |
| Proposed segment schedule | prefetch/stage `s[0,n]` and `s[1,n]`; consume the two 32-wide subsegments in order, applying the matching staged scale to each | Yes |
+
The witness is a semantic possibility, not evidence that the second schedule is outside the uninspected HIP current union.
+
## Static cost accounting
+
For a K segment with `q` groups and an output tile of width `B_N`:
+
| Quantity | Per-group schedule | q-group segment schedule | Direct reduction proven? |
|---|---:|---:|---|
| Required fp16 scale values | `q * B_N` | `q * B_N` | No |
| Required packed W4 values | unchanged | unchanged | No |
| Activation values | unchanged under the frozen operator | unchanged | No |
| Persistent output accumulation | one result accumulator/tile | at least the same accumulator; extra metadata/pipeline state is possible | No |
| Metadata request order/reuse | group-at-a-time | may coalesce/prefetch q group rows and broadcast per subsegment | Conditional only |
+
The candidate has **no automatic scale-byte reduction**. Its only plausible static frontier is a target-specific change in request coalescing, latency hiding, or staged metadata reuse without excess occupancy/pressure. That is not a result; it must be compared with the actual `wvSplitK_int4_g` load/staging/reduction schedule.
+
## Conditional finite closure plan
+
1. Read the official pinned HIP entry and identify scale-addressing, group loop, LDS/register staging and reduction.
2. If it already has an equivalent q-group segment/prefetch action, classify direct absorption and do not create a topic.
3. If it has only one-group progression, freeze one assignment shape and a static resource vector: weight bytes, scale bytes, activation traffic, VGPR/LDS/occupancy proxy and launch count.
4. Only then assess whether a target-specific non-generic schedule guarantee exists. Execution, local IR and speed measurements are out of scope here.
