# Wave90 raw screen-row events

Frozen assignment: `DISCOVERY-S3-20260811-V8.7-WAVE90-NATURAL-VERSION-SKEW-COHORT-STRUCTURE`  
Frozen cutoff: 2026-08-11. Rule revision: `v8.7+R5-P0`; `QUALITY_MODE=OFF`.

| Event | Family / public natural artifact | Stable version-skew or cohort hypothesis | Same-object action considered | Funnel disposition |
|---|---|---|---|---|
| RAW-90-01 | Nix store closures | Long-lived stores contain repeated files across derivation/version cohorts. | Construct sharing across a fixed store closure. | `DEEP_DIVE_REQUIRED` |
| RAW-90-02 | Cargo package graphs / lockfiles | Real Rust workspaces can carry multiple compatible versions and shared feature cohorts. | Construct a dependency/version/feature resolution for the same manifest constraints. | `DEEP_DIVE_REQUIRED` |
| RAW-90-03 | Debian Packages index history | Public repository indices retain older package versions and signed index histories. | Construct an index-delta publication/selection path for the same signed target index. | `DEEP_DIVE_REQUIRED` |
| RAW-90-04 | OCI image repositories | Image tags share base versions/layers over release cohorts. | Construct sharing or layer layout for the same OCI image root filesystem. | `DEEP_DIVE_REQUIRED` |
| RAW-90-05 | Maven dependency graphs | Version skew occurs in published Java dependency graphs. | Resolve/mediate versions. | `EXCLUDED`: compatibility/resolution line; no independent constructor frozen. |
| RAW-90-06 | Python wheel environments | Project environments repeat wheel/version cohorts. | Choose wheel/cache layout. | `EXCLUDED`: installer/cache policy, not a frozen same-object N2/N3 action. |
| RAW-90-07 | Kubernetes API object versions | Cluster objects span API versions. | Convert/version-adapt objects. | `EXCLUDED`: compatibility-layer object change. |
| RAW-90-08 | Helm chart releases | Chart repositories exhibit versioned dependency cohorts. | Resolve/update chart dependency set. | `EXCLUDED`: online deployment/compatibility policy. |
| RAW-90-09 | Android application package splits | Application releases contain ABI/version cohorts. | Select delivery split/version. | `EXCLUDED`: online selector/controller and different delivery object. |

The raw rows deliberately do not count ordinary clustering or synthetic skew as evidence. RAW-90-01 through RAW-90-04 alone met the entry condition for candidate-grade audit.
