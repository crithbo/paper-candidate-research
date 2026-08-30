# Independent Recomputation Audit

## Scope

This audit performed only hash verification, static source inspection, and read-only recomputation of the already-frozen mismatch. It did not modify owner artifacts, generate a new corpus, change a parameter, continue the natural run, or create new scientific evidence.

## Manifest verification

- Owner manifest: `HASH_MANIFEST.sha256`
- Manifest self SHA-256: `0AFDCDC2CFC956D374E696575AE301050A01DB2DB54645C6051FF360308709A3`
- Parsed entries: `1090`
- Matched entries: `1090`
- Mismatches/missing files: `0`
- Covered bytes: `242,039,248`

## Frozen diagnostic

- File: `artifacts/natural_primary/DIAGNOSTIC_WINDOW_11.json`
- SHA-256: `88FF37EF0BCF32CCFBD0666D77F9361D6B33C95A567D721579BAF24B1E9556C6`
- Carrier: `NYC_TLC_YELLOW_2025_01`
- Offset: `2,548,487`
- Window index: `11`
- Delta arm: disabled
- Rows: 16 rows, two dictionary fields

The independent recomputation used the frozen owner implementation and the frozen diagnostic rows to evaluate explicit-product and RP-FDP boundary frontiers. It reproduced the owner diagnostic exactly on every decision-bearing item.

## Recomputed comparison

| Item | Product oracle | RP-FDP | Disposition |
|---|---:|---:|---|
| First difference boundary | 10 | 10 | reproduced |
| Representative cuts at boundary 10 | `[0,4,10]` | `[0,9,10]` | mismatch |
| Representative cost | `(123,41,3)` | `(123,41,3)` | equal |
| All difference boundaries | `[10,13,14,15,16]` | `[10,13,14,15,16]` | reproduced |
| All difference-point cost frontiers | equal | equal | cost exactness retained |
| Final cuts | `[0,16]` | `[0,16]` | equal |
| Final cost | `(96,53,2)` | `(96,53,2)` | equal |
| Final full signature | equal | equal | equal |

Counts reproduced from the same frozen execution functions:

| Counter | Value |
|---|---:|
| Explicit-product labels created | 10,562 |
| Explicit-product transitions | 10,562 |
| RP-FDP labels created | 19,871 |
| RP-FDP local transition evaluations | 16,211 |
| RP-FDP dominance checks | 559 |
| RP-FDP maximum surviving rank `R` | 3 |
| RP-FDP estimated backpointer bytes | 37,553 |

## Static source attack

The frozen solver source is `scripts/preclaim.py`, SHA-256 `F1424E9311241CEB07B227A4ABC67B350B21FDFE514DCD13F1390916A16F2636`.

- Lines 253–262: `component_dominates()` compares materialized label costs but does not compare deterministic label signatures.
- Lines 265–273: `prune_components()` builds a per-state fingerprint from sorted costs only; equal fingerprints are resolved by component-level signature.
- Lines 275–285: cost-only component dominance then removes components.

This is insufficient for the frozen guarantee. A component may have a lexicographically smaller structural signature while materializing a lexicographically larger full plan signature for a particular current state. Cost-only dominance can also erase an equal-cost signature needed for exact deterministic backpointer equality.

## Partial natural evidence

`artifacts/natural_primary/PARTIAL_SUMMARY.json` SHA-256 is `C32A7AA590EFA4561ECE35ADE4F7BC06CD2A6EF90E62C26897376BFB934053BC`.

- Completed claim-bearing windows before failure: `11/40`
- Native equivalence/determinism among completed windows: `11/11`
- Strict rank compression: `0/11`
- Useful rank compression: `0/11`
- Provisional full-cost residual: `1/11`
- Independent carrier requirement: incomplete
- Replay2: not run

The preregistered success rule requires useful compression on at least 10/40, strict compression on at least 20/40, and full-cost residual on at least 10/40 including at least 2/8 independent-carrier windows. No threshold inference is valid from the partial set. The exactness failure prevents either positive use or STOP use of these observations.

## Audit conclusion

The mismatch is real, deterministic, and reproducible. It invalidates complete backpointer exactness but does not contradict the cost factorization or establish strongest-union absorption. This audit therefore supports `REVISE_ONCE`, not PASS and not STOP.
