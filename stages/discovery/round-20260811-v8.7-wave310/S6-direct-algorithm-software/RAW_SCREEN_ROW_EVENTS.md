# Raw screen events

| family | bounded subproblem / pathology seed | stock oracle | funnel |
|---|---|---|---|
| egg e-graph extraction | local e-class choices can conflict with global DAG sharing | evaluator/equality checks | deep |
| CBMC unwind/slice equation construction | local unwinding/slicing decisions can affect equation size | CBMC verdict/replay | deep |
| KLEE state-merge/test construction | locally feasible merge choices can change path explosion | native test replay | deep |
| Ceres Schur/elimination construction | local block eliminations can couple global fill/work | residual/cost evaluator | deep |
| SWI-Prolog tabling | answer-subgoal local choices can alter recursive materialisation | query answer set | raw |
| LLVM alias-analysis summary | local summary joins can expand downstream facts | analysis result checks | raw |
| HiGHS simplex basis construction | local pivot candidates can affect global basis path | primal/dual feasibility | raw |
| GEGL tile graph evaluation | local tile cache/evaluation choices can create long tails | pixel equality | raw |

Seeds are hypotheses only; no pathology was measured in this assignment.

