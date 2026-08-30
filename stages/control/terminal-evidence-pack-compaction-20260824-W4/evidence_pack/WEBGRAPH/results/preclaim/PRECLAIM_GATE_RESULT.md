# PRECLAIM_NATIVE_COMPLETE_ACTION_DP_FIDELITY_GATE

Status: `PASS`

This gate result is non-claim-bearing. It establishes execution fidelity only and neither supports nor rejects the research mechanism.

## Frozen witness and native configuration

- Input: `inputs/tiny/tiny-native-9.lists`
- Input SHA-256: `2DD06C1B5118618027DDB96087FBCEF1BE3A996AA091A8D5EE568D0984BC6739`
- Nodes/arcs: `9 / 40`
- Native configuration: WebGraph `0.6.2`, `BE`, default released codes, interval threshold `4`, `W=4`, `D=3`, chunk `128`.

## Complete-action and exact-oracle check

- Independently enumerated legal forests: `38,372`.
- Exhaustive optimum: `148` graph-stream bits.
- Candidate frontier-DP optimum: `148` graph-stream bits.
- Final released BvCompZ comparator: `148` graph-stream bits.
- Exhaustive/candidate/final-BvCompZ reference vector: `0,0,0,0,1,1,0,4,0`.
- Candidate DP states/transitions/max frontier: `671 / 2,473 / 256`.
- Candidate selected-action native estimator→writer assertions: all passed.
- Sum of candidate selected action costs→written graph-stream bits: passed.

## Native output and reader check

| Artifact | Candidate SHA-256 | Baseline SHA-256 | Equal |
|---|---|---|---|
| `.graph` | `5F321499C77A52EE28825632D2A387363B6CF29204009A052177A8D3CAAD95A6` | `5F321499C77A52EE28825632D2A387363B6CF29204009A052177A8D3CAAD95A6` | yes |
| `.offsets` | `E7DB2517565494852423983117FAE3A32BEB4ED7D7346D0EAB14F37CC4F28AC8` | `E7DB2517565494852423983117FAE3A32BEB4ED7D7346D0EAB14F37CC4F28AC8` | yes |
| `.properties` | `8AB591ACE4465A6728DAFD8A9FEEBD7E6E3A89967874EECBE2BDD15AFBA20C93` | `8AB591ACE4465A6728DAFD8A9FEEBD7E6E3A89967874EECBE2BDD15AFBA20C93` | yes |

Both implementations passed native sequential equality, native offset checking, Elias-Fano construction, per-node random-access equality and the same 4,096-query checksum `16339973855432596964`.

## Timing (single untuned fidelity executions; not a performance claim)

| Track | Build | Sequential validate | EF build | Random validate + 4,096 queries |
|---|---:|---:|---:|---:|
| Candidate | 20.876 ms | 2.398 ms | 0.892 ms | 7.832 ms |
| Final BvCompZ | 16.607 ms | 3.553 ms | 0.875 ms | 1.596 ms |

## Artifact/tie exclusions

- The witness intentionally has no positive divergence; all three optimizers choose the same vector.
- Exact `u64` action costs are used by the candidate and the exhaustive checker.
- The selected baseline vector is legal under the same complete action table.
- Empty predecessor actions are represented as illegal `X`, not zero-cost actions.
- Candidate and baseline share codes, endianness, interval threshold, window, depth and chunk boundary.
- No tie, floating-point rounding, flag, empty-list or chunk artifact is treated as evidence.
