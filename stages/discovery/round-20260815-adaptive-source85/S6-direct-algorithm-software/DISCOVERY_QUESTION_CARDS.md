# Evidence-qualified question-card audit — Source85 S6

## QC-S85-01 — GNU make implicit-rule chain selection

**Identity and same-object contract.** The object is a fixed GNU make version, makefile/rule database and order, filesystem snapshot, requested targets, command and environment values. The endpoint is not merely final target bytes: it includes the selected recipes, intermediate-file creation/deletion behavior, command side effects and stock success/failure behavior. The official GNU Make manual is the public anchor; it states that implicit rules supply both recipes and prerequisites, that one applicable rule is selected according to rule order, and that intermediate chains execute their rules. Network-security scope: PASS.

**Proposed N2 shape.** A whole-chain construction would choose among legal pattern-rule chains and intermediate materialization choices, aiming to reduce search/build CPU, RSS, temporary intermediates and wall time while preserving the fixed endpoint.

**Current native union and contrary check.** GNU make already searches applicable rules using existing-or-makeable prerequisites; chains introduce intermediate files; no rule may repeat in a chain; terminal and match-anything restrictions prune paths; rule order and special optimized rules determine priority. Current manual controls include user-defined pattern rules, rule order, terminal rules, empty recipes, `.SECONDARY`, and variable-controlled built-in recipes. These are not a missing “local heuristic” interface: they define the build behavior for the fixed object.

**Minimal action-divergence test.** Let two applicable chains for target `x` invoke different recipes or produce different intermediate lifecycle/side effects. They are different observable build outcomes, hence cannot both satisfy the frozen stock endpoint. If both chains are forced to have identical observable effects, selecting the cheaper chain is ordinary shortest-path/AND-OR derivation over a rule graph; no GNU-make-specific mechanism or guarantee survives. Changing the endpoint to final bytes only suppresses the recipes/intermediates that GNU make's contract exposes and is a changed object.

**Cheapest falsifier.** A two-rule pattern database where two chains have different recipe commands shows that chain substitution changes the endpoint. If commands are made observationally identical, the remaining optimization is generic graph search. This static witness is sufficient; no build was run.

**Natural carrier/oracle and full cost.** A versioned public GNU make test-suite makefile plus a stock GNU make dry-run/build trace would be the natural route. Oracle: stock selected command trace, exit status, target/intermediate filesystem state. Full cost would include implicit-search CPU/RSS, recipe execution CPU/wall/I/O, intermediate bytes/lifecycle, failure/rebuild behavior, and command/output overhead. A 72-hour StageA route would pin GNU make release and test-suite case, enumerate competing chains, compare traces, and reject any candidate whose alternative changes a command trace or reduces to generic AND-OR search.

**Raw gate.** Exact anchor, same-object RQ, current source locus, falsifier and cost boundary are closed. The non-generic discriminator is not: the only same-object action divergence changes endpoint, and the same-endpoint remainder is generic. Therefore this does **not** enter evidence-qualified raw.

**Disposition.** `EXCLUDED_BEFORE_RAW__SAME_OBJECT_ACTION_DIVERGENCE_CHANGES_RECIPE_SIDE_EFFECT_ENDPOINT_OR_REDUCES_TO_GENERIC_AND_OR_RULE_GRAPH_SEARCH`. This is structural; it is not an inference from missing implementation, result, resource, or AI readiness.
