# Comparator and Full-Cost Audit

## Comparator object and execution path

The candidate and seven comparator arms consume the same official TFLite model object, use the same pinned FlatBuffers/TFLite schema path, produce self-contained buffers, and pass the same native reader/verifier/equality checks. Across 192 arm rows, object identity and legality hold in every row.

The comparator is an executable per-model union, not an unattainable synthetic combination of individual metric minima inside one arm. Metric-specific best-arm residuals are used only for the corresponding frozen primary metric; the full-vector Pareto calculation retains whole arm vectors.

## Frozen eight-arm union

The audited union consists of the candidate plus the frozen current/independent alternatives represented in the revision contract and result table. Each model has exactly the expected eight arms, and eligibility is checked before an arm can enter the union. No post-result corpus arm, configuration sweep, or reader-timing oracle was added.

The union expresses materially distinct executable alternatives: generated default packing, stable legal/topological variants, local or hot-first ordering, a bounded generic search, and the FB-RCFDP candidate. The exact labels and per-model rows are preserved in the owner result artifacts.

## Useful-action fairness

A candidate action is useful only if:

1. it occurs at a strict signature-aware merged state;
2. the compared baseline state has the same completion set/information boundary;
3. the selected candidate next action is absent from the union of comparator next actions;
4. the step is not fallback.

This is a conservative, candidate-favorable test of non-vacuity. The denominator includes the frozen candidate plan steps and is not reduced after observing failures. Independent counts are `0/383`, `0/763`, and `0/1146` for train, held-out, and all models. There is no baseline-information asymmetry capable of turning this zero into a positive residual.

## Full-cost dimensions

The ledger includes:

- serialized bytes;
- warm and cold trace wall time;
- warm and cold trace CPU time;
- end-to-end construction wall and CPU time;
- peak resident memory;
- temporary storage;
- fallback behavior.

The trace-collection cost is a common one-time cost of profile-aware choices. It is disclosed but not charged solely to the candidate in the per-arm frontier. That omission favors the candidate, so it cannot create the observed negative primary residuals.

Some CPU deltas quantize to zero under the Windows timer. Those measurements should not support a fine-grained CPU claim. They are not decision-critical: exact useful-action coverage is zero, while raw bytes and warm/cold wall-time residuals are adverse at both held-out percentiles.

## Pareto escape analysis

FB-RCFDP appears on some whole-vector Pareto frontiers. This does not satisfy the frozen success rule because:

- primary bytes/access are required claim dimensions, not optional axes;
- at least one such primary dimension must improve at both p50 and p90;
- useful-action residual must reach 10%; and
- all conditions are conjunctive with exactness and frontier membership.

Thus higher costs or a trade-off on another ledger dimension cannot be used to manufacture a positive claim by nondominance. The owner did not use that escape, and the independent audit rejects it explicitly.

## Held-out and provenance boundary

The 13 held-out models were not used to derive the 704-request trace. Trace inputs are limited to the 11 training families, and the revision result directory had to be absent at trace freeze. The trace is uniform across 34 endpoints; this supports only the frozen trace-defined object, not arbitrary natural access distributions.

## Comparator conclusion

The comparator union is current, executable, same-object, and fair for this frozen Stage A question. The candidate's zero useful-action residual and adverse held-out primary residuals are not artifacts of a subtract-only oracle, incomplete cost ledger, direction inversion, or object drift. Comparator/full-cost status: `PASS_FOR_NARROW_STOP`.
