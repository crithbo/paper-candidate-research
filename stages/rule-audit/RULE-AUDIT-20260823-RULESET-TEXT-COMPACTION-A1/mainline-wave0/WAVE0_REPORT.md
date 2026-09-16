# Ruleset compaction Wave 0

## Result

`PASS__REFERENCE_FREEZE_COMPLETE__NO_SCIENTIFIC_OR_AUTHORITY_CHANGE`

The authoritative shared controls, active roles, templates, preview bundle and registry were frozen by path, byte size and SHA-256. A bounded reverse-reference scan found no direct reference from a current nonterminal assignment to `rules/_shadow_v9/`, `templates/_shadow_v9/` or the preview `rules/CORE_POLICY.md`.

The only live control reference is the historical R3 P1 shadow-validation node in `registry.yaml`; `ROLE_PAPER_PROJECT.md` contains a conditional future-production pointer. Historical rule-audit reports also mention the old paths. Therefore the preview bytes may be moved only after an exact archive copy and path map are installed. They must not be deleted.

## Material finding

All archived shadow roles expect common-policy SHA-256 `30B24D069673DAD4EB555C5FC4DE4CCA6EB9D2108697BE7031FAEF75F9B42803`, while the only surviving `rules/CORE_POLICY.md` is `C3E764C4CA88BFF4793E1FED111FDE10B6494074BA584CBD5D4647422D6CFEB6`. The missing old bytes cannot be reconstructed. Wave 1 must preserve this mismatch as historical telemetry and must not present the bundle as self-consistent production policy.

## Gate for Wave 1

Only the preview archive/index operation is cleared. Active role and template prose compaction remains blocked on actionability-equivalence replay. Registry slicing remains blocked on the separate Wave 2 dual-read backtest.

