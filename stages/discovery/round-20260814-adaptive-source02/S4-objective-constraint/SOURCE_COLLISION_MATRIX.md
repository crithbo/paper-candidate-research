# Source / Confound / Decision Matrix

| Family | Same-object and full-cost contract | Current contrary baseline | Finite falsifier / required closure | Disposition |
|---|---|---|---|---|
| MLPerf server power–latency | fixed model, scenario, accuracy, SUT; end-to-end wall energy, latency and throughput | official LoadGen scenario/accuracy/latency/power rules | one public versioned trace; no rank change after fixed-object conditioning means no law | NOT_ADMITTED_UNFROZEN |
| Energy sampling window | fixed benchmark copies and system boundary; wall energy plus time | official SPEC-style power methodology | stable across natural benchmark cases after sensor/window confounds are controlled | NOT_ADMITTED_UNFROZEN |
| Compiler compile-cost | fixed source/output/target; compile CPU/RSS/temp plus runtime | stock compiler/pass union | source-pin union and public corpus; only a non-pipeline correction may remain | NOT_ADMITTED_UNFROZEN |
| Cross-platform tail | fixed request trace, service and queue boundary; tail, energy and resource denominator | platform-specific scheduling and service semantics | exact contract must survive platform normalization | NOT_ADMITTED_UNFROZEN |
| Certificate checking | fixed theorem/checker and full proof/check cost | existing registered certificate work | registry identity collision | EXCLUDED_REPEAT |
| Agentic per-turn representation | fixed agent task, quality and request semantics | current MLPerf scenario/metric definitions | versioned natural agent trace and a correction outside scenario selection | NOT_ADMITTED_UNFROZEN |
