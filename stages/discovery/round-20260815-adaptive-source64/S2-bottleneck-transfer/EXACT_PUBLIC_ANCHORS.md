# Exact public anchors — Source64

| RQ | exact public anchor | fixed object/endpoint | role |
|---|---|---|---|
| RQ-S64-01 | LLVM OpenMP `Runtimes` and current `OMPIRBuilder.h` on llvm-project `main` | one OpenMP target program, target mapping and task-dependence semantics; same target execution | official current runtime and source locus |
| RQ-S64-02 | OpenXLA `From HLO to Thunks` (published 2026-03) | one HLO module, input/output semantics, target executable | official compiler-pipeline locus |
| RQ-S64-03 | LLVM `ORC Design and Implementation`, LLVM 24.0.0git documentation | one module set, target triple, JITDylib lookup/materialization and native executable behavior | official current ORC semantics |

These anchors only identify a stable public object and source route.  They are not evidence of novelty, a current absence, or Q2 readiness.
