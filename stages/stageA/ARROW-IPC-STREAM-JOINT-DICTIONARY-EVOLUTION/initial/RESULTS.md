# ARROW IPC RP-FDP Stage A Results

## Decision ledger

| Item | Result |
|---|---|
| Preclaim launch gate | PASS after retained correction and deterministic regression |
| First claim-bearing run | `natural_primary` |
| Completed frozen windows | 11/40, January NYC windows 0--10 |
| Failure point | January NYC window 11, offset 2,548,487, delta=false planning |
| Final disposition | `REVISE_ONCE` |
| Evidence ceiling | `IMPLEMENTATION_FIDELITY_FAILURE__NO_NATURAL_SUPPORT_OR_STOP_INFERENCE` |
| Stage A scientific revision consumed | false |
| Replay2 | not run |
| Stage B | false; approval null |

## Preclaim exact results

| Check | Result |
|---|---|
| Raw/reduced actions | 26 / 14 |
| Tiny case/arm pairs | 6/6 all-boundary frontier and backpointer equality |
| Event branches | INITIAL, NO_EVENT, DELTA, REPLACEMENT covered |
| Null realizations | validity null and physical null dictionary reference accepted |
| Native crossing | 1576 / 1568 / 1576 B = 5u / 4u / 5u, u=8 B, both arms |
| Stock reader | 6/6 accepts; schema and concatenated ordered values/nulls equal |
| Latest regression result | `ED4496744DA33846D45651A7B5BCC0BCD1EE0B45318FE7B389DAE056562BAD45` |
| Regression measured cost | 16.640625 s CPU; 16.6177837 s wall; 131,596,288 B peak RSS; 103,151 B max deep temporary |

## Completed-window integrity

All 11 completed windows satisfy:

- eight arms (four algorithms times two delta settings) emitted a stock-reader
  accepted stream with exact logical/schema equality;
- five repetitions per arm produced one deterministic stream SHA-256;
- the runner's RP-FDP/product all-boundary and selected-backpointer check passed;
- exact product remained below the frozen feasibility cap.

Partial counts are descriptive and cannot be extrapolated:

| Metric | Completed count |
|---|---:|
| strict rank compression | 0/11 |
| useful rank compression | 0/11 |
| provisional full-cost residual | 1/11 |
| complete 40-window threshold decision | not available |
| independent-carrier evidence | 0 windows executed |

`Infinity` rank ratios in ten completed windows mean no eligible nontrivial
product boundary existed under the preregistered denominator; the remaining
window ratio was 2.0. Neither observation can trigger the 40-window product
killer because execution is incomplete and then invalidated by fidelity.

## Completed-window full-cost sums

Values below sum each window's reported p50 or p90 over four measured
repetitions after one warmup. They are not a corpus statistic.

| Arm | Stream bytes | Planning wall p50 / p90 (ms) | Full end-to-end wall p50 / p90 (s) | Temporary p50 sum (B) | First/total decode p50 sum (ms) |
|---|---:|---:|---:|---:|---:|
| current grid, delta=false | 10,376 | 140.979 / 151.289 | 2.840 / 2.850 | 456,836 | 0.251 / 0.283 |
| current grid, delta=true | 10,376 | 141.783 / 151.018 | 2.841 / 2.850 | 456,836 | 0.281 / 0.316 |
| independent merge, false | 10,376 | 307.406 / 315.486 | 3.006 / 3.015 | 595,229 | 0.263 / 0.297 |
| independent merge, true | 10,376 | 308.183 / 314.449 | 3.007 / 3.014 | 595,229 | 0.267 / 0.300 |
| exact product, false | 10,376 | 661.718 / 672.848 | 3.361 / 3.372 | 526,996 | 0.286 / 0.324 |
| exact product, true | 10,376 | 666.661 / 677.641 | 3.366 / 3.377 | 527,434 | 0.271 / 0.305 |
| RP-FDP, false | 10,376 | 1,001.326 / 1,017.225 | 3.701 / 3.716 | 759,827 | 0.268 / 0.303 |
| RP-FDP, true | 10,376 | 1,006.793 / 1,016.975 | 3.706 / 3.716 | 760,353 | 0.271 / 0.305 |

Carrier preparation was charged equally to every arm and dominates these tiny
16-row end-to-end values. Peak RSS sums are retained in the JSON rather than
treated as additive physical memory. No optimizer-speed or byte claim follows.

## Fidelity failure

The original run raised:

```text
RuntimeError: natural RP/product mismatch: NYC_TLC_YELLOW_2025_01/11/deltas=False
```

The targeted diagnostic found:

| Property | Result |
|---|---|
| first mismatch boundary | 10 |
| all mismatch boundaries | 10, 13, 14, 15, 16 |
| cost frontier equality at all mismatches | true |
| final selected static cost equality | true |
| final selected signature equality | true |
| first differing equal-cost signature | product cuts `[0,4,10]`; RP-FDP `[0,9,10]` |
| common cost for first example | `(123,41,3)` |
| diagnostic SHA-256 | `88FF37EF0BCF32CCFBD0666D77F9361D6B33C95A567D721579BAF24B1E9556C6` |

Cause: component dominance treated equal cost as sufficient without requiring
the retained label to have the no-larger deterministic signature for each
state. Cost-only component fingerprinting has the same omission. This is a
contract error in backpointer fidelity, even though the observed final optimum
is unchanged.

## Required revision and stop boundary

A new revision directory must make component pruning signature-aware, preserve
statewise signature tradeoffs, add this adversary to preclaim, and rerun the
unchanged corpus/contract from scratch. If corrected exact pruning becomes
product-sized, mismatches again, or the complete 40-window strongest union
absorbs all useful residual, the frozen scientific killer can support a narrow
STOP. The current incomplete construct cannot.

