# V9-R0 shadow claim-pack output — noncanonical

Input freeze: exactly `../neutral-source-snapshot/FAMILY_SIGNATURES.md`; canonical manifest already sealed before this file was generated.

| Family | Shadow disposition | V9 facet correction relative to canonical | Stability / leakage check |
| --- | --- | --- | --- |
| Cargo index | `DROP__CURRENT_UNION_OR_CONTROLLER` | Separates action (`append/yank canonical index record`) from refresh policy; confirms no target-specific guarantee. | Same as canonical; no claim upgrade. |
| APT archive index | `DROP__CURRENT_UNION_OR_OBJECT_CHANGE` | Adds explicit reader/checksum constraint and two-action test: config-only alternate vs altered signed release. | Same as canonical; no shadow influence. |
| ThinLTO cache | `DROP__CONTROLLER` | Adds output/guarantee facet: cache pruning cannot alter fixed linked binary, only recourse policy. | Same as canonical. |
| Conda repodata | `NOT_ADMITTED_UNFROZEN` | Makes missing current-source/config and carrier facets explicit; no current-absence claim. | Same as canonical; uncertainty preserved. |

V9 has added provenance/facet accounting only. It created no canonical brief, candidate status or Stage0 routing change.
