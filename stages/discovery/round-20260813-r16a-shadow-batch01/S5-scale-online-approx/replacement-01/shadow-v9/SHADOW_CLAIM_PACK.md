# Isolated V9 shadow — replacement-01

Noncanonical protocol: `DISCOVERY-CLAIM-PACK-V9-R0` in SHADOW mode.  Input is
only the already sealed `../neutral-source-snapshot/` and
`../canonical-v8.7/` material.  This file neither changes nor explains away a
canonical v8.7 disposition; it is a method-comparison record only.

| Family | Canonical disposition (copied, not recomputed) | Shadow disposition | Source/action correction relative to canonical | Cost and leakage check | Stability |
|---|---|---|---|---|---|
| R16A-S5-R01 | `DROP__CURRENT_UNION_DIRECTLY_EXPRESSES_ATOMIC_ACTION` | `C0_DIRECT_COVERED / structural drop` | V9 makes the eight-predicate comparison explicit: same store object, full snapshot information, identical hard-link action, same readable path behavior, and scan/link/I-O/disk ledger. | No shadow-only source; no cost is deleted.  No V9 result entered canonical. | STABLE: same disposition. |
| R16A-S5-R02 | `DROP__CURRENT_UNION_DIRECTLY_EXPRESSES_ATOMIC_ACTION` | `C0_DIRECT_COVERED / structural drop` | V9 separates `--merge` and `--url` as union members rather than treating the default invocation as the whole baseline. | Archive read/parse/index read/write/bytes retained.  No shadow-only claim supplied a canonical premise. | STABLE: same disposition. |
| R16A-S5-R03 | `DROP__CURRENT_UNION_DIRECTLY_EXPRESSES_ATOMIC_ACTION` | `C0_DIRECT_COVERED / structural drop` | V9 foregrounds read-only/stopped availability as an information/legality predicate and retains `--delete-untagged` in the native union. | Scan, mark-set memory, sweep/delete, and availability interruption remain in the denominator.  No leakage. | STABLE: same disposition. |
| R16A-S5-R04 | `NOT_ADMITTED_UNFROZEN__CURRENT_CONSTRUCTOR_UNION_AND_WITNESS_UNCLOSED` | `CU_UNKNOWN / non-admission` | V9 makes the missing current server-source/config union and minimal two-action witness separately visible; it does not treat the API spec's two serializations as proof of a gap. | Metadata, serialization, served bytes, client parse are frozen but no finite constructor comparator is established.  No V9-induced canonical change. | STABLE: same non-admission. |

## Shadow-only audit notes

- `A/C/D/E` coordinates are diagnostic only and have no lifecycle authority.
- R01--R03: `A0_STRUCTURAL_NO`, `C0_DIRECT_COVERED`, `D2_DECISION_READY_FACETS`, `E1_STATIC_PREFLIGHT`.
- R04: `A1_OPEN_WITHIN_EVIDENCE`, `CU_UNKNOWN`, `D1_BASIC_MATERIALS`, `E1_STATIC_PREFLIGHT`; it is deliberately not promoted.
- Leakage test: canonical log and canonical manifest were present and sealed before
  this shadow file was authored; the shadow cites no post-canonical source.
- Duplicate test: lexical signatures were absent from plan/registry/history at
  pre-depth screening, but authoritative cross-lane duplicate adjudication
  remains mainline-owned.
