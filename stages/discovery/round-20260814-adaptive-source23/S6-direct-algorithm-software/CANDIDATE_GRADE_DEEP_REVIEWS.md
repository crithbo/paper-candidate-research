# Candidate-grade deep reviews

No candidate-grade review was opened.  The four exact public carriers passed raw admission but failed their contribution-type-specific C0 before D1:

- MLPerf GPT-J and R-GAT require target-specific cross-layer actions; only generic batching, cache/feature placement, or scheduling was available.
- MLPerf Tiny v1.1 permits a reproducible quality oracle, but the residual is generic tensor-arena allocation.
- SuiteSparse supplies a natural numerical oracle, but the residual is generic sparse partition/preconditioner selection.

Consequently no V7 local survival trace was warranted and no brief was created.
