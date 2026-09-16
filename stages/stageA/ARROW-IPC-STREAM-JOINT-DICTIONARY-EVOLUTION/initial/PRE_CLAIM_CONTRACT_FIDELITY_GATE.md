# Pre-claim Contract Fidelity Gate

- Status: `PASS`
- Claim-bearing natural run allowed: `true`, only under the preregistered contract
- Scientific revision consumed: `false`
- Frozen contract: `EXPERIMENT_CONTRACT.yaml`

The gate was fail-closed and ordered. Attempt 1 is retained at
`artifacts/preclaim/`; it failed only because the validation digest included
decision-variable batch grouping. The exact object compares the concatenated
ordered logical rows. That denominator bug was corrected without changing the
catalog, candidate, oracle, writer, reader, or witness, and attempt 2 was written
to a new directory.

## Frozen native implementation

- PyArrow/C++: `25.0.0 / 25.0.0`, official Windows wheel SHA-256
  `3F356AFE61186395C861D5CD63DC21FF7D5FA335012A4668D979257DF7FEA0F5`.
- The wheel git id differs from the Stage0 source pin, but all five decisive IPC
  source blobs (`writer.cc`, `writer.h`, `dictionary.cc`, `reader.cc`,
  `options.h`) are byte-identical between commits; Git blob SHA-1 matches 5/5.
- Metadata V5, 8-byte alignment, non-legacy framing, no compression, one thread,
  flat dictionary fields, and both `emit_dictionary_deltas` arms are frozen.

## Ordered subgate results

1. Raw/reduced catalog: PASS. `26` valid raw actions, `14` reduced
   representatives; duplicate/outside actions, permutations, optional values,
   capacity, null index validity, and physical-null dictionary reference covered.
2. Product oracle versus RP-FDP: PASS. Six case/arm combinations match at every
   boundary for full Pareto cost sets and deterministic backpointer plans.
3. State sufficiency: PASS. All INITIAL/NO_EVENT/DELTA/REPLACEMENT branches,
   same-Q reset, predecessor order, resource/event coordinate, and cross-field
   shared-cut adversaries pass.
4. Native crossing: PASS. Replacement-arm whole streams are
   `1576 / 1568 / 1576 B` for `b1/b2/b3`, exactly `5u / 4u / 5u` relative at
   `u=8 B`; the delta arm yields the same exact crossing. All six streams are
   accepted by the stock reader with one schema digest and one concatenated
   ordered-value/null digest.
5. Envelope accounting: PASS. Corrected run records component/transition/label/
   dominance/backpointer counts, wall/CPU, peak RSS `131,751,936 B`, temporary
   deep bytes `103,151`, and process I/O.
6. Natural threshold and product killer: frozen in `EXPERIMENT_CONTRACT.yaml`
   before any natural file is decoded.
7. Full-cost denominator and Latin arm rotation: frozen in the same contract.

Corrected result SHA-256:
`08500DF6F1B47FEECCD1C7EFB560310020B7632D63E4F31D58B12D5A38123034`.
No claim-bearing natural observation existed before this PASS.

Before natural execution, the explicit oracle gained an optional restricted-cut
argument used only by the independent-field comparator. A fresh default-argument
regression in `artifacts/preclaim_regression_attempt3/` remained PASS and its
scientific projection (catalog, every boundary/frontier/backpointer comparison,
adversaries, witness, and deterministic counts) was byte-equivalent after
excluding measured time/RSS/deep-size fields. Regression result SHA-256:
`ED4496744DA33846D45651A7B5BCC0BCD1EE0B45318FE7B389DAE056562BAD45`.
