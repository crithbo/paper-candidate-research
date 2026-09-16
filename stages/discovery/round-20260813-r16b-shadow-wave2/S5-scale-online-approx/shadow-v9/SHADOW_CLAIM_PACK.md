# Isolated V9 shadow — R16B S5

This noncanonical document was generated after the canonical manifest was
sealed. It may not alter any canonical disposition, registry state, or Stage 0
decision.

| Family | copied canonical result | V9 shadow result | source/action correction; full-cost; stability |
|---|---|---|---|
| S5-R16B-F01 | `DROP__CURRENT_UNION_DIRECTLY_EXPRESSES_ATOMIC_ACTION` | `A0/C0/D2/E1; structural drop` | Makes stock-reader mmap semantics and every documented flag explicit. Tree walk, image read, cache bytes/write, mmap/read remain. Stable; no shadow-only source entered canonical. |
| S5-R16B-F02 | `DROP__CURRENT_UNION_DIRECTLY_EXPRESSES_ATOMIC_ACTION` | `A0/C0/D2/E1; structural drop` | Separates module-dir and cache-file overrides from default path. Probe/extract/write/runtime dimensions retained. Stable/no leakage. |
| S5-R16B-F03 | `DROP__CURRENT_UNION_DIRECTLY_EXPRESSES_ATOMIC_ACTION` | `A0/C0/D2/E1; structural drop` | Makes query-symbol information and lazy-load legality explicit. Probe/discovery/write/startup dimension retained. Stable/no leakage. |
| S5-R16B-F04 | `DROP__CURRENT_UNION_DIRECTLY_EXPRESSES_ATOMIC_ACTION` | `A0/C0/D2/E1; structural drop` | Retains the specification's no-priority boundary rather than inventing a ranking target. Parse/mapping/write/read dimensions retained. Stable/no leakage. |

All `C0` labels apply only to the frozen native construction action and not to
unrelated future algorithms. Cross-lane dedup is pending mainline.
