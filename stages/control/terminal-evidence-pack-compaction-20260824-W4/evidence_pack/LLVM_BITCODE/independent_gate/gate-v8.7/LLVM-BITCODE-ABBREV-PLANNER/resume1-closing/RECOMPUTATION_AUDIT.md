# Read-only Recomputation Audit

## Boundary

All checks were read-only over the frozen owner package. No candidate command, compiler run, download, new experiment, or Stage B activity was performed.

## Package integrity

- Manifest entries parsed: `5292`
- Entries independently rehashed and matched: `5292`
- Missing/mismatched entries: `0`
- Total bytes covered by entries: `408075895`
- Manifest self hash: `A2A75508E6C63E771F769A09D631B2D82166FF16C6C93EE4FBD07EC68CDF58BF`

## Aggregation recomputation

The 100 frozen natural-result rows contain 100 unique module hashes. Independent sums are B0 `484840 B`, B1 `484604 B`, B2 `484520 B`, and WL `484520 B`. WL is smaller than B0 on 63 modules for `320 B` aggregate saving. Recomputed per-module savings have distribution `0:37`, `4:48`, `8:13`, `12:2` bytes.

For every one of the 63 positive B0-to-WL modules, B2 equals WL. Thus `WL - B2 = 0 B` on all 63, and the recomputed p50 and p90 residuals are both `0 B`.

## Materialized-output audit

- recorded sizes versus actual `.bc` sizes: `0` mismatches
- recorded plan hashes versus actual outputs: `0` mismatches
- B2 versus WL output hash differences: `0/100`
- B2 versus WL CSV differences: `0/100`
- B2 versus WL local-plan-size differences: `0/100`
- B2 versus WL scope-choice differences: `0/100`
- B2 versus WL selected-plan-shape differences: `0/100`

## Legality/equivalence audit

All 400 arms are recorded as passing expanded trace equality, canonical IR equality, `llvm-bcanalyzer`, `llvm-dis`, and `opt -passes=verify`. Five frozen reader trials per arm contain no failure. All plans satisfy the frozen 10-universe/6-per-leaf/12-global bounds.

These are verification records and frozen artifacts, not newly generated observations. Their consistency is sufficient to validate the owner's reported same-object result.

## Reproducibility conclusion

The evidence is internally reproducible from the frozen artifacts and stable hashes. No detected nondeterminism affects the STOP kernel: the decisive comparison is exact B2/WL byte identity on all 100 modules, independently cross-checked against both metadata and materialized files.
