# WEBGRAPH-REFERENCE-FOREST Revision1 Results

## Decision summary

- Preclaim fidelity: `PASS`
- Scientific revision consumed: `true`
- Claim-run construct validity: `PASS`
- All frozen dimensions `<=1.05`: `false`
- Recommendation: `STOP_NARROW_FROZEN_MECHANISM`
- Stop boundary: `FIXED_W4_D3_TWO_NATURAL_GRAPH_COMPLETE_ACTION_EXACT_OPTIMIZER_UNDER_NO_REGRESSION_FULL_COST_RULE`

## Preclaim exact replay

| Check | Result |
|---|---|
| Tiny exhaustive | 38,372 legal forests; 148-bit primary optimum; secondary tuple exact match |
| Structural domain | 2,048/2,048 primary pairs match parent; 531 strict; 0 exact-worse |
| First strict case | `case-0043`, 561/560 bits unchanged |
| CNR primary totals | 9,319,309 / 8,763,554 baseline/exact |
| Wiki primary totals | 876,503 / 875,555 baseline/exact |
| Native semantics | writer/additivity, offsets, EF, sequential/random equality and checksums PASS |
| Dense representation | 256 states; rolling arrays 12,288 B; full-chunk compact backpointers 131,072 B |

Natural changed-vector audit: CNR 1,891/2,544 and Wiki 45/56 chunks changed only within identical exact primary cost. Baseline output hashes reproduced the parent exactly.

## Matched-pair design

Each corpus has 11 pairs. Even pairs run baseline then candidate; odd pairs reverse the order. Pair 0 is warmup and excluded. Each of the remaining 10 samples includes input loading/materialization, native action scoring, planning, native write, EF construction, sequential equality, random equality/checksum, followed by one fixed-seed 100k-query reader run. p50 is the lower median; p90 is nearest-rank.

All 44 variant runs and 44 reader runs exited zero. Within each corpus/variant, `.graph/.offsets/.properties/.ef` hashes were identical across all 11 pairs; cross-variant semantic checksums were equal.

## Deterministic size results

| Corpus | Baseline bits | Candidate bits | Bits ratio | Baseline payload | Candidate payload | Residual | Payload ratio |
|---|---:|---:|---:|---:|---:|---:|---:|
| cnr-2000 | 9,319,309 | 8,763,554 | 0.940365 | 1,486,606 B | 1,413,845 B | 72,761 B | 0.951056 |
| Wiki-Vote | 876,503 | 875,555 | 0.998918 | 118,664 B | 118,537 B | 127 B | 0.998930 |

## Full-cost matched results

| Corpus | Dimension | Baseline p50/p90 | Candidate p50/p90 | Candidate/baseline p50/p90 | Gate |
|---|---|---:|---:|---:|---|
| CNR | end-to-end elapsed | 0.4981/0.5169 s | 3.8017/4.0447 s | 7.632/7.825 | FAIL |
| CNR | process CPU | 0.4531/0.4688 s | 3.7344/3.9063 s | 8.241/8.333 | FAIL |
| CNR | peak working set | 66,179,072/66,301,952 B | 66,228,224/66,359,296 B | 1.001/1.001 | PASS |
| CNR | sequential full decode | 21.549/22.732 ms | 21.472/22.980 ms | 0.996/1.011 | PASS |
| CNR | random 100k | 38.004/38.703 ms | 40.722/44.278 ms | 1.072/1.144 | FAIL |
| Wiki | end-to-end elapsed | 0.1113/0.1148 s | 0.2051/0.2126 s | 1.843/1.852 | FAIL |
| Wiki | process CPU | 0.0469/0.0938 s | 0.1563/0.1719 s | 3.333/1.833 | FAIL |
| Wiki | peak working set | 13,361,152/13,565,952 B | 13,516,800/13,619,200 B | 1.012/1.004 | PASS |
| Wiki | sequential full decode | 1.052/1.305 ms | 1.041/1.202 ms | 0.989/0.921 | PASS |
| Wiki | random 100k | 33.537/34.544 ms | 33.601/34.279 ms | 1.002/0.992 | PASS |

Ten preregistered ratio cells exceed 1.05. The failures occur in both construction dimensions on both graphs and in CNR random access. Because the mechanism ran legally and reproducibly, this is a scientific negative outcome rather than an invalid construction.

## Mechanism metric

| Corpus | Parent exact sum depth | Revision exact sum depth | Delta | Final BvCompZ sum depth | Revision minus baseline |
|---|---:|---:|---:|---:|---:|
| CNR | 360,649 | 350,937 | -9,712 | 298,743 | +52,194 |
| Wiki | 6,429 | 6,311 | -118 | 6,023 | +288 |

The tie-break performs its declared role but cannot fully offset the access consequence of the primary exact optimum on CNR.

## Frozen output hashes

| Corpus/variant | graph | offsets | properties | EF |
|---|---|---|---|---|
| CNR baseline | `A078715B89770338192EE7BE42BCC05D62FFFC734017457C0891DE923FB858CE` | `E777137D0127AAA40C30CB896D1B3A138E25D10AB4C8AC8F454455BC57D161A3` | `194FBE47188E4F3DB74A53E7363D7B17293D132BEE94ED8D4E974EB92BF35701` | `9E36D7E27E8D23B9BEDA231170497D41587B00A139B279A826CFA70E1AF7F1B6` |
| CNR candidate | `FCA303AE9E2D537446D907159BA4583B050422329865D6C137C5BF1E9BB30415` | `C51F0DF7CBF88FC5D5B38474440E13AB86068038CEA7E7AD99FA1DEC6D79641B` | `6BB9E893301AF8E9FE682819CB5FB2DC9E28A19C1F75D39652908076BE58A2AB` | `7F4CB983A01D37466315B20E435F2CB3D09413AB0756EB7D06B71798C83220C3` |
| Wiki baseline | `DD46557BBE1B69072CD23DC7631FFB631A2FA3C7C874649B591E7F2B6B66A327` | `4C397BF171D9D3A58CEC7F104654FA5C23E3D71B1238C2C65569CE05FE1A3267` | `6E364DAD11D1F42A3DB724F8E792AA8680BA8CAC919FF08C158B7D4BDDD658A2` | `160D56AF4DCF4ECBF02D3A7782525F280EC7AC41685ED07EECFFFB09D4DC8386` |
| Wiki candidate | `0550AFDA16D8D1724B5F527F675E579EFCD993DD164901B518CA32E10E8F234D` | `DC4FA4B150A3831677B78F000C9656E3F9FC9E972AD2BADE749DA27BBF07C40A` | `B3E57A67D465F432E3FDBEA30ADD6D30834E816B16EBB3263986A5DFC15892F3` | `17DD219B0B7116955503649259BB5BE7997B9B4E011B9C2DEE69ED403BC5E0CA` |

Raw data: `results/claim/matched/matched-pair-raw.tsv`; analyzed JSON: `results/claim/matched/matched-pair-summary.json`; ratios: `results/claim/matched/full-cost-ratios.tsv`; depth mechanism: `results/claim/matched/secondary-depth-summary.json`.

