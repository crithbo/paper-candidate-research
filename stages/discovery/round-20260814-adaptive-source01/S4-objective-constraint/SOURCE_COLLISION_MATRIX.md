# Measurement / Full-Cost Collision Matrix

| Family | Same-object / fair denominator | Current rule or comparator | Confounds and falsifier | Disposition |
|---|---|---|---|---|
| MLPerf server power–latency | same model, accuracy, scenario, system-level AC energy and latency | official LoadGen/rule set; wall-power condition | fix model, scenario, SUT and quality; falsify if ranking does not change after all required dimensions are charged | NOT_ADMITTED_UNFROZEN |
| MLPerf LLM mix | same model, quality and server semantics | official Poisson traffic and TTFT/TPOT constraints | pin public query-length trace and hold model/hardware/quality fixed; falsify if length mix does not reverse or separate ranking | NOT_ADMITTED_UNFROZEN |
| SPEC CPU energy | validated benchmark copies; energy and runtime denominator | official optional energy metrics and geometric aggregation | metric-only deletion test leaves no mechanism | STRUCTURAL_DROP__METRIC_RESTATEMENT |
| SERT | same server and regulated energy-performance report | current SERT suite | need a stable within-object bias and correction; absent in bounded source review | NOT_ADMITTED_UNFROZEN |
| LLVM compile/runtime | fixed program, output and target | stock compiler/pass pipeline | need source-closed action union and public compilation corpus; reject mere pass selection | NOT_ADMITTED_UNFROZEN |
| JMH warm-up | fixed runtime and observable program result | existing JSC/runtime evaluation records | object overlap is decisive | EXCLUDED_REPEAT |
