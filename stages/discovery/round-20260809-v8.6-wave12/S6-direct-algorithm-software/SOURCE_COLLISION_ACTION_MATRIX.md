# S6 Wave 12 — collision/action and fidelity-closure matrix

Frozen source cutoff: 2026-08-09. Sources are paper originals or official/upstream specifications, code and documentation. No experiment was run.

| ID | Exact object | Strongest union / direct subtractor | Atomic residual hypothesis | Fidelity status | Outcome |
|---|---|---|---|---|---|
| `CVC5-ALETHE-SHAREMAP` | Fixed cvc5 Alethe refutation for a fixed UNSAT SMT-LIB theorem | cvc5 no-sharing Alethe (`dag-thresh=0`); cvc5 CPC/Ethos; Alethe named annotations and veriT `--proof-with-sharing`; Carcara | cvc5-native proof-DAG occurrence → scope-safe named-term mapping under rule/scope/cost constraints | `FINITE_FIDELITY_GAP`: Alethe standard supports sharing, but native cvc5 emission and same-theorem Carcara witness remain to be closed in a finite 10-instance plan | **One `PROPOSE_STAGE0`, Tier B.** |
| Generic Alethe term sharing | Any Alethe proof text | Alethe specification and veriT sharing support | “Add `:named`” | `DIRECT_ABSORPTION` | Drop as contribution; retained only as subtractor. |
| cvc5 Alethe postprocessor plus companion checker | cvc5 proof → transformed external format | cvc5/Carcara native contract | Text compression/checker wrapper | `CHANGED_COMPARATOR_WRAPPER` | Drop. |
| CPC proof printer rename/flag change | cvc5 CPC output | Current CPC default/Ethos checker | Parameter/output mode only | `ROUTINE_CONFIGURATION` | Drop. |

## Why this is admissible under v8.6

The candidate is not declared ready or successful. Its action gap is a sourced structural hypothesis: cvc5's Alethe emitter currently disables sharing, while the standard permits it. The brief registers a bounded `FIDELITY_CLOSURE_PLAN` that may terminate as `STRUCTURALLY_UNCLOSABLE`; this finite gap is admissible at Discovery under the v8.6 calibrated policy. A direct cvc5 equivalent or a failure to achieve native checker/theorem closure remains a drop/stop condition.
