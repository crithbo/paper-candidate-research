# Candidate-grade deep reviews — Wave74

| family | whole action/current union | N2 candidate / witness / full cost / 72h killer | decision |
|---|---|---|---|
| Dafny VC | fixed verified program to verifier result; current VC generator union | Global assertion/task construction; small verified program witness, charge generation/solver/check. Killer: verifier result differs or action is task split. | DROP: compiler/proof-task union; no atomic residual. |
| Boogie VC | fixed Boogie program to identical VC validity | Shared VC DAG construction; small assertion witness, full generation/solver/check cost. Killer: validity mismatch. | DROP: generic sharing/postprocess or current generator. |
| Why3 task | fixed goal to proof semantics | Global task partition; small goal witness, transform/solver/check cost. Killer: proof semantics changes. | DROP: task-split controller/current transformation union. |
| WAM bytecode | fixed Prolog program to VM behavior | Global instruction layout; small program witness, compile bytes/VM cost. Killer: native result mismatch. | DROP: emitter-local patch/current compiler union. |

All have finite CPU reader/verifier closure, but no union-external nontrivial N2 or guarantee survives. No readiness/resource/result factor is used.
